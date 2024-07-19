import ArgumentParser
import Foundation
import ObjcSyntax
import ObjcTranslator
import SwiftParser
import SwiftSyntax
import SwiftSyntaxBuilder
import Antlr4
import SharedUtilities
import CustomDump

struct MigrateObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "migrate-objc",
        abstract: """
        Migrate Objective-C code into Swift code.
        """,
        discussion: """
        **Features**
        - Fully supports const declarations, protocols, methods, properties and limitedly supports classes.
        - Full fledged nullability translation.
        - Preserves imports and comments.
        - Simulates C-preprocessor for source expansion.
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var prefixStrippingArguments: PrefixStrippingArguments
    
    @Option(
        name: [.long],
        help: "Access level for translated protocols, enums and option sets; available options are public or internal; default to public."
    )
    var access: String = "public"
    
    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "A list of file paths in which #define macros are defined; used for preprocessing sources."
    )
    var macroDefinitionPaths: [String] = []
    
    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "A list of defined symbols to pass in preprocessor"
    )
    var preprocessorDefines: [String] = []
    
    @Flag(
        name: .customLong("silent"),
        help: "Disable outputs. Useful for evaluating performance."
    )
    var isSilentMode: Bool = false
    
    @Flag(
        name: .customLong("keep-going"),
        help: "Keep processing even encountered error."
    )
    var keepGoingOnError: Bool = false
    
    @Option(
        name: [.long],
        help: """
        A jsonified dictionary containing the Swift type mappings,
        The dictionary is in shape of
        {
            "swiftTypeMappings": {"PFFoo", "Foo", "PFValue": "Value"},
            "swiftValueTypes" : ["Value"]
        }
        """
    )
    var typeMappings: String = ""
    
    func run() throws {
        let charStreams = try macroDefinitionPaths.map {
            try ANTLRFileStream($0)
        }
        
        let sourcePreprocessor = ObjcPreprocessor(
            macroSources: try charStreams.map {
                let preprocessorParser = try ObjectiveCPreprocessorParser(
                    CommonTokenStream(ObjectiveCPreprocessorLexer($0))
                )
                return try preprocessorParser.objectiveCDocument()
            },
            definedSymbols: preprocessorDefines
        )
        
        if fileArguments.sourcePaths.isEmpty && fileArguments.inputFileListPath == nil {
            // Read from stdin
            try translateAndWrite(inputPath: nil, sourcePreprocessor: sourcePreprocessor) {
                ANTLRInputStream(
                    String(
                        data: FileHandle.standardInput.readDataToEndOfFile(),
                        encoding: .unicode
                    )!
                )
            }
        } else {
            var sourceFilesIterator = SourceFileIterator(
                sourcePaths: Set(fileArguments.sourcePaths),
                inputFileListPath: fileArguments.inputFileListPath,
                filteringExtension: {
                    ["h"].contains($0.lowercased())
                }
            )
            
            while let sourceFile = sourceFilesIterator.next() {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(sourceFile.path))")
                }
            
                do {
                    if isSilentMode {
                        let _ = try makeTranslator(
                            sourcePreprocessor: sourcePreprocessor
                        ) {
                            try ANTLRFileStream(sourceFile.path)
                        }
                        .translate()
                        .formatted()
                    } else {
                        try translateAndWrite(inputPath: sourceFile, sourcePreprocessor: sourcePreprocessor) {
                            try ANTLRFileStream(sourceFile.path)
                        }
                    }
                } catch {
                    if keepGoingOnError {
                        print("Error processing \(sourceFile.path): \(error)")
                    } else {
                        throw error
                    }
                }
            }
        }
    }
    
    private func translateAndWrite(
        inputPath: IteratedPath?,
        sourcePreprocessor: ObjcPreprocessor,
        _ charStream: () throws -> CharStream
    ) throws {
        try withFileHandler(
            inputPath: inputPath,
            fileNameTransform: { $0 },
            extensionTransform: { _ in "swift" }
        ) { sink in
            try sink.stream(
                try makeTranslator(
                    sourcePreprocessor: sourcePreprocessor,
                    charStream
                )
                .translate()
                .formatted()
            )
        }
    }
    
    private func makeTranslator(
        sourcePreprocessor: ObjcPreprocessor,
        _ charStream: () throws -> CharStream
    ) throws -> ObjcTranslator {
        let preprocessedSourceText = try sourcePreprocessor.preprocess(try charStream())
        
        let preprocessorSource = ANTLRInputStream(preprocessedSourceText)
        let preprocessorLexer = ObjectiveCPreprocessorLexer(preprocessorSource)
        
        let preprocessorParser = try ObjectiveCPreprocessorParser(
            CommonTokenStream(preprocessorLexer)
        )
        let document = try preprocessorParser.objectiveCDocument()
        
        let directives = document.text().compactMap { text in
            if let directive = text.directive() {
                return directive
            } else {
                return nil
            }
        }
        
        let parserSource = ANTLRInputStream(preprocessedSourceText)
        let collector = CollectorTokenSource(
            source: ObjectiveCLexer(parserSource)
        )

        let parser = try ObjectiveCParser(
            CommonTokenStream(
                collector
            )
        )
        
        let translationUnit = try parser.translationUnit()
        
        return ObjcTranslator(
            preprocessorSource: preprocessorSource,
            collector: collector,
            directives: directives,
            translationUnit: translationUnit,
            existingPrefix: prefixStrippingArguments.existingPrefix,
            typeRegexesExcludedFromPrefixStripping: try prefixStrippingArguments.typePatternsExcludedFromPrefixStripping.map(Regex.init),
            access: ObjcTranslator.Access(stringLiteral: access),
            otherTypeMappings: try JSONDecoder().decode(TypeMappings.self, from: typeMappings.data(using: .utf8)!)
        )
    }
}

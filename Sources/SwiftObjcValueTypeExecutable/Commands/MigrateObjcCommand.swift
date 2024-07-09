import ArgumentParser
import Foundation
import ObjcSyntax
import ObjcTranslator
import SwiftParser
import SwiftSyntax
import SwiftSyntaxBuilder
import Antlr4
import CustomDump

struct MigrateObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "migrate-objc",
        abstract: """
        Migrate Objective-C code into Swift code.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments
    
    @Option(
        name: [.long],
        help: "An existing prefix to remove if exists."
    )
    var existingPrefix: String = ""
    
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
    
    @Flag(
        name: .customLong("silent"),
        help: "Disable outputs."
    )
    var isSilentMode: Bool = false
    
    @Flag(
        name: .customLong("keep-going")
    )
    var keepGoingOnError: Bool = false
    
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
            definedSymbols: []
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
                        let _ = try translate(sourcePreprocessor: sourcePreprocessor) {
                            try ANTLRFileStream(sourceFile.path)
                        }
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
                try translate(
                    sourcePreprocessor: sourcePreprocessor,
                    charStream
                ).formatted()
            )
        }
    }
    
    private func translate(
        sourcePreprocessor: ObjcPreprocessor,
        _ charStream: () throws -> CharStream
    ) throws -> CodeBlockItemListSyntax {
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
        
        let translator = ObjcTranslator(
            preprocessorSource: preprocessorSource,
            collector: collector,
            directives: directives,
            translationUnit: translationUnit,
            existingPrefix: existingPrefix,
            access: ObjcTranslator.Access(stringLiteral: access)
        )

        return try translator.translate()
    }
}

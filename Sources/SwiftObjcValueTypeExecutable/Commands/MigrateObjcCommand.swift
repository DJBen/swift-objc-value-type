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
    
    func run() throws {
        if fileArguments.sourcePaths.isEmpty {
            // Read from stdin
            try translateAndWrite(inputPath: nil) {
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
                filteringExtension: {
                    ["h"].contains($0.lowercased())
                }
            )
            while let sourceFile = sourceFilesIterator.next() {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(sourceFile.path))")
                }
            
                try translateAndWrite(inputPath: sourceFile) {
                    try ANTLRFileStream(sourceFile.path)
                }
            }
        }
    }
    
    private func translateAndWrite(
        inputPath: IteratedPath?,
        _ charStream: () throws -> CharStream
    ) throws {
        try withFileHandler(
            inputPath: inputPath,
            fileNameTransform: { $0 },
            extensionTransform: { _ in "swift" }
        ) { sink in
            try sink.stream(
                try translate(charStream).formatted()
            )
        }
    }
    
    private func translate(
        _ charStream: () throws -> CharStream
    ) throws -> CodeBlockItemListSyntax {
        let charStreams = try macroDefinitionPaths.map {
            try ANTLRFileStream($0)
        }
        
        let sourcePreprocessor = ObjcPreprocessor(
            macroSources: try charStreams.map {
                let preprocessorParser = try ObjectiveCPreprocessorParser(
                    CommonTokenStream(ObjectiveCPreprocessorLexer($0))
                )
                return try preprocessorParser.objectiveCDocument()
            }
        )
        
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

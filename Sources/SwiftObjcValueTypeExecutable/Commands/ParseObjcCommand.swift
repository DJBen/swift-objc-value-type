import ArgumentParser
import Foundation
import ObjcGrammar
import ObjcTranslator
import SwiftParser
import SwiftSyntax
import SwiftSyntaxBuilder
import Antlr4
import CustomDump

struct ParseObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "translate-objc",
        abstract: """
        Translate Objective-C code into Swift code.
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
        let lexer = ObjectiveCLexer(try charStream())
        
        let preprocessor = try ObjectiveCPreprocessorParser(
            CommonTokenStream(lexer, 3) // DIRECTIVE_CHANNEL
        )
                
        let collector = CollectorTokenSource(
            source: ObjectiveCLexer(try charStream())
        )

        let parser = try ObjectiveCParser(
            CommonTokenStream(
                collector
            )
        )
        
        let translationUnit = try parser.translationUnit()
        // Silent 'no viable alternative at <EOF>'
        preprocessor.removeErrorListeners()
        preprocessor.setErrorHandler(BailErrorStrategy())
        
        var directives = [ObjectiveCPreprocessorParser.DirectiveContext]()
        while true {
            do {
                directives.append(try preprocessor.directive())
            } catch {
                break
            }
        }
        
        let translator = ObjcTranslator(
            directives: directives,
            translationUnit: translationUnit,
            commentTokens: collector.commentTokens,
            ignoredTokens: collector.ignoredTokens,
            existingPrefix: existingPrefix,
            access: ObjcTranslator.Access(stringLiteral: access)
        )

        return try translator.translate()
    }
}

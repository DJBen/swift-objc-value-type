import ArgumentParser
import Foundation
import ObjcGrammar
import ObjcTranslator
import SwiftParser
import SwiftSyntax
import Antlr4
import CustomDump

struct ParseObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "parse-objc",
        abstract: """
        Prase Objective-C code into syntax tree.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments
    
    @Flag
    var noOutput: Bool = false

    func run() throws {
        if fileArguments.sourcePaths.isEmpty {
            // Read from stdin
            try parse {
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
            
                try parse {
                    try ANTLRFileStream(sourceFile.path)
                }
            }
        }
    }
    
    private func parse(_ charStream: () throws -> CharStream) throws {
        let lexer = ObjectiveCLexer(try charStream())
        
        // Channels: ["DEFAULT_TOKEN_CHANNEL", "HIDDEN", "COMMENTS_CHANNEL", "DIRECTIVE_CHANNEL", "IGNORED_MACROS"]
        
        let preprocessor = try ObjectiveCPreprocessorParser(
            CommonTokenStream(lexer, 3) // DIRECTIVE_CHANNEL
        )
        
        print(try preprocessor.directive().toStringTree())
        
        let collector = CollectorTokenSource(
            source: ObjectiveCLexer(try charStream())
        )

        let parser = try ObjectiveCParser(
            CommonTokenStream(
                collector
            )
        )
        
        let translationUnit = try parser.translationUnit()
        
        print(collector.directiveTokens)
        print(collector.commentTokens)
        print(collector.ignoredTokens)
    }
}

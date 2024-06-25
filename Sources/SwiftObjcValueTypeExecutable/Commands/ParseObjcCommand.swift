import ArgumentParser
import Foundation
import ObjcGrammar
import Covfefe
import SwiftParser
import SwiftSyntax
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

    @Option
    var start: String = "code_block_list"

    func run() throws {
        var sourceFilesIterator = makeSourceFileIterator {
            ["h"].contains($0.lowercased())
        }
        
        let objcParser = try ObjcParser(
            startingNonTerminal: start
        )

        while let sourceFile = sourceFilesIterator.next() {
            if let fileName = sourceFile.iteratedPath?.path {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(fileName))")
                }
            }

            let input = String(bytes: sourceFile.content, encoding: .utf8) ?? ""
            
            let ast = try objcParser.parser.syntaxTree(
                for: input
            )

            if !noOutput {
                ast.iterate { indexPath, currentItem, shouldEnterSubtree in
                    let indentation = (0..<indexPath.count).map { _ in "  " }.reduce("", +)
                    print(indentation, currentItem.root ?? "\"\(input[currentItem.leaf!])\"")
                } nodeIterarionComplete: { indexPath, key, continueIterating in
                }
            }
        }
    }
}

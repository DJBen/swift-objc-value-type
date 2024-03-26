import ArgumentParser
import SwiftParser
import SwiftSyntax

struct GenerateValueTypeCommand: ParsableCommand, FileHandlingCommand {
    static var generate = CommandConfiguration(
        commandName: "gen",
        abstract: """
        Generate objc compatible value type interfaces for Swift structs and enums.
        """
    )

    @OptionGroup
    var arguments: FileHandlingArguments

    func run() throws {
        var sourceFiles = sourceFiles()
        while let sourceFile = sourceFiles.next() {
            try sourceFile.content.withUnsafeBufferPointer { sourceBuffer in
                let tree = Parser.parse(source: sourceBuffer)
                for codeBlockItemSyntax in tree.statements {
                    // let mockClass = try SourceFactory().classDecl(
                    //     protocolDecl: protocolDecl,
                    //     surroundWithPoundIfDebug: surroundWithPoundIfDebug
                    // )
                    // try withFileHandler(sourceFile.fileName) { sink in
                    //     try sink.stream(mockClass.formatted())
                    // }
                }
            }
        }
    }
}

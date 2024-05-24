import ArgumentParser
import Foundation
import ObjcSupport
import SwiftParser
import SwiftSyntax
import CustomDump

struct MigrateObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "migrate-objc",
        abstract: """
        Migrate NS_ENUM or NS_OPTION from objc headers to Swift enums and option sets.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    func run() throws {
        var sourceFilesIterator = makeSourceFileIterator {
            ["h"].contains($0.lowercased())
        }
        let enumOptionConverter = EnumOptionConverter()

        while let sourceFile = sourceFilesIterator.next() {
            if let fileName = sourceFile.iteratedPath?.path {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(fileName))")
                }
            }

            guard let ast = try enumOptionConverter.parse(
                source: String(bytes: sourceFile.content, encoding: .utf8) ?? ""
            ) else {
                if fileArguments.verbose {
                    print("swift-objc-value-type: fail to find NS_ENUM or NS_OPTION in (\(sourceFile.iteratedPath?.path ?? "stdin")), skipping")
                }
                continue
            }

            do {
                try withFileHandler(
                    inputPath: sourceFile.iteratedPath,
                    fileNameTransform: { $0 },
                    extensionTransform: { _ in "swift" }
                ) { sink in
                    try sink.stream(
                        try enumOptionConverter.convert(ast).formatted()
                    )
                }
            } catch let error as EnumOptionConverter.ParseError {
                switch error {
                case .unfinishedParsing:
                    print("Could not parse \(sourceFile.iteratedPath?.path ?? "stdin"); skipping")
                default:
                    throw error
                }
            }
        }
    }
}

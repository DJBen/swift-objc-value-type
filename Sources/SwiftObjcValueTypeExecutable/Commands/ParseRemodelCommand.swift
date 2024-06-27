import ArgumentParser
import Foundation
import Remodel
import SwiftParser
import SwiftSyntax
import CustomDump

struct ParseRemodelCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "parse-remodel",
        abstract: """
        Parse remodel value files into syntax representation.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var parseRemodelArguments: RemodelArguments

    func run() throws {
        var sourceFilesIterator = makeSourceContentIterator()
        let remodelParser = RemodelValueObjectParser()

        while let sourceFile = sourceFilesIterator.next() {
            let remodelType: RemodelType
            if let fileName = sourceFile.iteratedPath?.path {
                if (fileName as NSString).pathExtension.lowercased() == "value" {
                    remodelType = .value
                } else if (fileName as NSString).pathExtension.lowercased() == "adtvalue" {
                    remodelType = .adtValue
                } else {
                    throw RemodelError.unableToInferRemodelType
                }
            } else if let type = parseRemodelArguments.type {
                remodelType = type
            } else {
                throw RemodelError.unableToInferRemodelType
            }
            customDump(
                try remodelParser.parse(
                    type: remodelType,
                    source: String(bytes: sourceFile.content, encoding: .utf8) ?? ""
                )
            )
        }
    }
}

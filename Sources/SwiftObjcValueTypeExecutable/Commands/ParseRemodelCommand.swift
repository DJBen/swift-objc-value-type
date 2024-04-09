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
    var parseRemodelArguments: ParseRemodelArguments

    func run() throws {
        var sourceFilesIterator = sourceFiles()
        let remodelParser = RemodelValueObjectParser()

        while let sourceFile = sourceFilesIterator.next() {
            let remodelType: RemodelType
            if let fileName = sourceFile.fileName {
                if (fileName as NSString).pathExtension.lowercased() == "value" {
                    remodelType = .value
                } else if (fileName as NSString).pathExtension.lowercased() == "adtvalue" {
                    remodelType = .adtValue
                } else {
                    throw ParseRemodelError.unableToInferRemodelType
                }
            } else if let type = parseRemodelArguments.type {
                remodelType = type
            } else {
                throw ParseRemodelError.unableToInferRemodelType
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
enum ParseRemodelError: Error {
    case typeArgumentError
    case unableToInferRemodelType
}

struct ParseRemodelArguments: ParsableArguments {
    @Option(
        help: "Supply the type of remodel (value or adtValue) if not already inferrable from file name. Required if source is from stdin",
        transform: {
            switch $0 {
            case "value":
                return .value
            case "adtValue", "adtvalue":
                return .adtValue
            default:
                throw ParseRemodelError.typeArgumentError
            }
        }
    )
    var type: RemodelType?
}

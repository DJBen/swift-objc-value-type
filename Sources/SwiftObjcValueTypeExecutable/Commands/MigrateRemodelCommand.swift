import ArgumentParser
import Foundation
import Remodel
import SwiftParser
import SwiftSyntax
import CustomDump

struct MigrateRemodelCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "migrate-remodel",
        abstract: """
        Migrate remodel value files (.value, .adtValue) into structs and enums
        respectively.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var RemodelArguments: RemodelArguments

    func run() throws {
        var sourceFilesIterator = sourceFiles()
        let remodelParser = RemodelValueObjectParser()
        let remodelSwiftFactory = RemodelSwiftFactory()

        while let sourceFile = sourceFilesIterator.next() {
            let remodelType: RemodelType
            if let fileName = sourceFile.fileName {
                if (fileName as NSString).pathExtension.lowercased() == "value" {
                    remodelType = .value
                } else if (fileName as NSString).pathExtension.lowercased() == "adtvalue" {
                    remodelType = .adtValue
                } else {
                    throw RemodelError.unableToInferRemodelType
                }
            } else if let type = RemodelArguments.type {
                remodelType = type
            } else {
                throw RemodelError.unableToInferRemodelType
            }
            let ast = try remodelParser.parse(
                type: remodelType,
                source: String(bytes: sourceFile.content, encoding: .utf8) ?? ""
            )
            try withFileHandler(sourceFile.fileName) { sink in
                try sink.stream(try remodelSwiftFactory.generate(ast).formatted())
            }
        }
    }
}

enum RemodelError: Error {
    case typeArgumentError
    case unableToInferRemodelType
}

struct RemodelArguments: ParsableArguments {
    @Option(
        help: "Supply the type of remodel (value or adtValue) if not already inferrable from file name. Required if source is from stdin",
        transform: {
            switch $0 {
            case "value":
                return .value
            case "adtValue", "adtvalue":
                return .adtValue
            default:
                throw RemodelError.typeArgumentError
            }
        }
    )
    var type: RemodelType?
}

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
        Migrate remodel value files (.value, .adtValue) into structs and enums respectively.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var remodelArguments: RemodelArguments

    @Flag(
        name: [.long],
        help: """
        If false, processing legacy .value type with `interface` declarations
        will throw an error; set this to true to skip those files.
        """
    )
    var skipLegacyInterfaceValueType: Bool = false

    func run() throws {
        var sourceFilesIterator = makeSourceFileIterator {
            ["adtvalue", "value"].contains($0.lowercased())
        }
        let remodelParser = RemodelValueObjectParser()
        let remodelSwiftFactory = RemodelSwiftFactory()

        while let sourceFile = sourceFilesIterator.next() {
            let remodelType: RemodelType
            if let fileName = sourceFile.fileName {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(fileName))")
                }
                if (fileName as NSString).pathExtension.lowercased() == "value" {
                    remodelType = .value
                } else if (fileName as NSString).pathExtension.lowercased() == "adtvalue" {
                    remodelType = .adtValue
                } else {
                    throw RemodelError.unableToInferRemodelType
                }
            } else if let type = remodelArguments.type {
                remodelType = type
            } else {
                throw RemodelError.unableToInferRemodelType
            }
            guard let ast = try remodelParser.parse(
                type: remodelType,
                source: String(bytes: sourceFile.content, encoding: .utf8) ?? ""
            ) else {
                if fileArguments.verbose {
                    print("swift-objc-value-type: skip processing (\(sourceFile.fileName ?? "stdin"))")
                }
                return
            }
            do {
                try withFileHandler(
                    sourceFile.fileName,
                    fileNameTransform: { $0 },
                    extensionTransform: { _ in "swift" }
                ) { sink in
                    try sink.stream(
                        try remodelSwiftFactory.generate(
                            ast,
                            imports: remodelArguments.imports,
                            existingPrefix: remodelArguments.existingPrefix
                        ).formatted()
                    )
                }
            } catch let error as RemodelValueObjectParser.ParseError {
                switch error {
                case .unsupportedLegacyInterfaceValueType:
                    if !skipLegacyInterfaceValueType {
                        throw error
                    }
                default:
                    throw error
                }
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

    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "Additional modules to import"
    )
    var imports: [String] = []

    @Option(
        name: [.long],
        help: "An existing prefix to remove if exists."
    )
    var existingPrefix: String = ""
}

import ArgumentParser
import Foundation
import Remodel
import SwiftParser
import SwiftSyntax
import SharedUtilities
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

    @Option(
        name: [.long],
        help: "A jsonified dictionary containing the Swift type mappings"
    )
    var typeMappings: String = #"{"swiftValueTypes":[],"swiftTypeMappings":{}}"#
    
    func run() throws {
        var sourceFilesIterator = makeSourceContentIterator {
            ["adtvalue", "value"].contains($0.lowercased())
        }
        let remodelParser = RemodelValueObjectParser()

        while let sourceFile = sourceFilesIterator.next() {
            let remodelType: RemodelType
            if let fileName = sourceFile.iteratedPath?.path {
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
                    print("swift-objc-value-type: skip processing (\(sourceFile.iteratedPath?.path ?? "stdin"))")
                }
                return
            }
            
            var typeMappings = TypeMappings()
            let resultRemodelName = ast.name.removingPrefix(
                remodelArguments.prefixStrippingArguments.existingPrefix,
                typeRegexesExcludedFromPrefixStripping: []
            )
            typeMappings.swiftValueTypes.append(resultRemodelName)
            typeMappings.swiftTypeMappings[ast.name] = resultRemodelName
            
            typeMappings.merge(with: try JSONDecoder().decode(TypeMappings.self, from: self.typeMappings.data(using: .utf8)!))
                
            let remodelSwiftFactory = RemodelSwiftFactory(
                typeMappings: typeMappings
            )

            do {
                try withFileHandler(
                    inputPath: sourceFile.iteratedPath,
                    fileNameTransform: { $0 },
                    extensionTransform: { _ in "swift" }
                ) { sink in
                    try sink.stream(
                        try remodelSwiftFactory.generate(
                            ast,
                            imports: remodelArguments.imports
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

    @OptionGroup
    var prefixStrippingArguments: PrefixStrippingArguments
}

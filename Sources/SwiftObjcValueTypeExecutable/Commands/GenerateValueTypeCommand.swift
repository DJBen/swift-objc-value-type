import ArgumentParser
import Foundation
import SwiftObjcValueType
import SwiftParser
import SwiftSyntax

struct GenerateValueTypeCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "gen",
        abstract: """
        Generate objc compatible value type interfaces for Swift structs and enums.
        """,
        discussion: """
        A list of gen options available for struct-configs are as followed:
        - PLACEHOLDER
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var genArguments: GenerateValueTypeArguments

    func run() throws {
        var sourceFiles = sourceFiles()
        while let sourceFile = sourceFiles.next() {
            try sourceFile.content.withUnsafeBufferPointer { sourceBuffer in
                let tree = Parser.parse(source: sourceBuffer)
                let generatedCodeBlocks = try SwiftObjcValueTypeFactory().wrappingClassDecl(
                    codeBlocks: tree.statements,
                    shouldSynthesizeNSCopying: genArguments.shouldSynthesizeNSCopying,
                    shouldSynthesizeObjCBuilder: genArguments.shouldSynthesizeObjCBuilder
                )

                try withFileHandler(sourceFile.fileName) { sink in
                    try sink.stream(generatedCodeBlocks.formatted())
                }
            }
        }
    }
}

enum JSONParsingError: Error {
    case invalidEncoding
    case unexpectedType
}

struct GenerateValueTypeArguments: ParsableArguments {
    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "Additional modules to import; useful if you are compiling the generated files into a separate module, and thus needing to import the API module in which the protocols reside."
    )
    var imports: [String] = []

    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "An list of structs that are excluded from the @objc value object wrapper generation."
    )
    var excludeStructs: [String] = []

    @Option(
        name: .customLong("nscopying"),
        help: "Synthesize NSCopying conformances for wrapper class of each struct if enabled."
    )
    var shouldSynthesizeNSCopying: Bool = true

    @Option(
        name: .customLong("objc-builder"),
        help: "Synthesize @objc compatible builder for each struct if enabled."
    )
    var shouldSynthesizeObjCBuilder: Bool = true

    @Option(
        name: [.long],
        help: """
        A JSON formatted config to finetune generation behavior per struct.

        The mapping is in format of
        `{"<struct-name>": "{"gen-options": <value>}"}`.

        A list of control options are available by `gen list-options` command.
        """
    )
    var structConfigs: String = "{}"

    var structConfigsMap: [String: String] {
        get throws {
            guard let data = structConfigs.data(using: .utf8) else {
                throw JSONParsingError.invalidEncoding
            }

            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            guard let dictionary = jsonObject as? [String: String] else {
                throw JSONParsingError.unexpectedType
            }

            return dictionary
        }
    }
}

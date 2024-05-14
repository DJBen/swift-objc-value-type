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
        var sourceFilesIterator = sourceFiles()
        var sourceFiles = [(String?, SourceFileSyntax)]()
        let preprocessor = SourcePreprocessor()
        while let sourceFile = sourceFilesIterator.next() {
            sourceFile.content.withUnsafeBufferPointer { sourceBuffer in
                let tree = Parser.parse(source: sourceBuffer)
                sourceFiles.append((sourceFile.fileName, tree))
                preprocessor.addSource(sourceFileSyntax: tree)
            }
        }

        for (filePath, tree) in sourceFiles {
            let generatedCodeBlocks = try SwiftObjcValueTypeFactory().wrappingClassDecl(
                codeBlocks: tree.statements,
                referencedSwiftTypes: preprocessor.referencedSwiftTypes, 
                prefix: genArguments.prefix,
                imports: genArguments.imports,
                externalHashSettings: genArguments.externalHashFunc.map { externalHashFunc in
                    ExternalHashSettings(
                        libary: genArguments.externalHashLibrary,
                        hashFunc: externalHashFunc,
                        hashFloatFunc: genArguments.externalHashFloatFunc,
                        hashDoubleFunc: genArguments.externalHashDoubleFunc
                   )
                },
                shouldSynthesizeNSCopying: genArguments.shouldSynthesizeNSCopying,
                shouldSynthesizeObjCBuilder: genArguments.shouldSynthesizeObjCBuilder
            )

            try withFileHandler(
                filePath,
                fileNameTransform: { "\($0)Wrapper" },
                extensionTransform: { _ in "swift" }
            ) { sink in
                try sink.stream(generatedCodeBlocks.formatted())
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
        help: "A prefix for the generated objc type; defaults to empty."
    )
    var prefix: String = ""

    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "Additional modules to import"
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
        help: "Synthesize NSCopying conformances for the type and its wrapper class if enabled."
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

    @Option(
        name: [.long],
        help: """
        If provided, an import statement will be added to import the library
        that contains the hash implementation functions.
        """
    )
    var externalHashLibrary: String?

    @Option(
        name: [.long],
        help: """
        If provided, objc -hash function will invoke this function as implementation.
        Otherwise, a standard hashImpl function will be provided.
        """
    )
    var externalHashFunc: String?

    @Option(
        name: [.long],
        help: """
        If provided, if the object needs to hash a float value, this method
        will be called.
        Otherwise, a standard hashFloat function will be provided.
        """
    )
    var externalHashFloatFunc: String?

    @Option(
        name: [.long],
        help: """
        If provided, if the object needs to hash a double value, this method
        will be called.
        Otherwise, a standard hashDouble function will be provided.
        """
    )
    var externalHashDoubleFunc: String?
}

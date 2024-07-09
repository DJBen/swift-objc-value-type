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

    private func makeReferenceFileIterator(
        filteringExtension: ((String) -> Bool)? = { _ in true }
    ) -> any IteratorProtocol<File> {
        let referencePaths = Set(genArguments.referencedSourcesForObjcAliasing).subtracting(Set(fileArguments.sourcePaths))
        return SourceFileContentIterator(
            sourcePaths: referencePaths, 
            inputFileListPath: nil,
            filteringExtension: filteringExtension
        )
    }

    func run() throws {
        var sourceFilesIterator = makeSourceContentIterator {
            $0.lowercased() == "swift"
        }
        var sourceFiles = [(IteratedPath?, SourceFileSyntax)]()
        let preprocessor = SourcePreprocessor()
        while let sourceFile = sourceFilesIterator.next() {
            [UInt8](sourceFile.content).withUnsafeBufferPointer { sourceBuffer in
                let tree = Parser.parse(source: sourceBuffer)
                sourceFiles.append((sourceFile.iteratedPath, tree))
                preprocessor.addSource(sourceFileSyntax: tree)
            }
        }

        // Add reference files into preprocessor, so that it can correctly
        // consider the objc wrapper aliases.
        var referenceFilesIterator = makeReferenceFileIterator {
            $0.lowercased() == "swift"
        }
        while let referenceFile = referenceFilesIterator.next() {
            [UInt8](referenceFile.content).withUnsafeBufferPointer { referenceBuffer in
                let tree = Parser.parse(source: referenceBuffer)
                preprocessor.addSource(sourceFileSyntax: tree)
            }
        }

        for (iteratedPath, tree) in sourceFiles {
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
                        hashDoubleFunc: genArguments.externalHashDoubleFunc,
                        isUnsafePointer: genArguments.exernalHashFuncIsUnsafePointer
                   )
                },
                shouldSynthesizeNSCopying: genArguments.shouldSynthesizeNSCopying,
                shouldSynthesizeObjCBuilder: genArguments.shouldSynthesizeObjCBuilder
            )

            try withFileHandler(
                inputPath: iteratedPath,
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

    @Flag(
        name: .customLong("nscopying"),
        help: "Synthesize NSCopying conformances for the type and its wrapper class if enabled."
    )
    var shouldSynthesizeNSCopying: Bool = false

    @Flag(
        name: .customLong("objc-builder"),
        help: "Synthesize @objc compatible builder for each struct if enabled."
    )
    var shouldSynthesizeObjCBuilder: Bool = false

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

    @Flag(
        name: [.long],
        help: """
        If true, it means that the external hash func is an objc implementation
        that resembles `extern NSUInteger HashFn(NSUInteger subhashes[], int length);`. As a result, the implementation will be wrapped with
        ```
        hashes.withUnsafeBufferPointer { bufferPointer in
            HashFn(bufferPointer.baseAddress, <count>)
        }
        ```
        """
    )
    var exernalHashFuncIsUnsafePointer: Bool = false

    @Option(
        name: [.customLong("referenced-srcs")],
        parsing: .upToNextOption,
        help: """
        A list of files to reference, but not for objc wrapper generation.
        If the swift sources to generate wrappers references those, the name
        in objc wrapper will be aliased by -Objc accordingly.
        """
    )
    var referencedSourcesForObjcAliasing: [String] = []
}

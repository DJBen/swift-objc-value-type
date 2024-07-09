//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import ArgumentParser
import Foundation

struct FileHandlingArguments: ParsableArguments {
    @Argument(
        help: "The source file path or a directory; use stdin if omitted",
        completion: .file()
    )
    var sourcePaths: [String] = []

    @Option(
        name: [.long, .short],
        help: "If provided, writes generated files to the output directory in lieu of stdout.",
        completion: .directory
    )
    var outputDir: String?
    
    @Option(
        name: [.long],
        help: """
        A file containing a list of line separated paths of input files.
        """
    )
    var inputFileListPath: String?

    @Flag(
        name: [.long],
        help: """
        If outputDir is unset, this parameter has no effect.
        Consider the input dir is foo/bar and there are foo/bar/baz/1 and foo/bar/baq/2 files.
        - If false, output files will be written to outputDir/baz/1 and outputDir/baz/2.
        - If true, all output files will be written to the outputDir/1 and outputDir/2.
        """
    )
    var ignoresFolderStructure: Bool = false

    @Flag(
        name: [.short],
        help: "Enables verbose debug outputs"
    )
    var verbose: Bool = false
}

/// A command that has arguments to parse source code
protocol FileHandlingCommand {
    var fileArguments: FileHandlingArguments { get }
}

protocol TextOutputStreamableSink {
    func stream(_ content: any TextOutputStreamable) throws
}

final class FileStreamSink: TextOutputStreamableSink {
    private(set) var stream: FileHandlerOutputStream

    init(stream: FileHandlerOutputStream) {
        self.stream = stream
    }

    func stream(_ content: TextOutputStreamable) throws {
        content.write(to: &stream)
    }
}

extension FileHandlingCommand {
    /// The contents of the source files or stdin that should be parsed, each in UTF-8 bytes.
    func makeSourceContentIterator(
        filteringExtension: ((String) -> Bool)? = { _ in true }
    ) -> any IteratorProtocol<File> {
        if fileArguments.sourcePaths.isEmpty && fileArguments.inputFileListPath == nil {
            return StdinIterator()
        } else {
            return SourceFileContentIterator(
                sourcePaths: Set(fileArguments.sourcePaths),
                inputFileListPath: fileArguments.inputFileListPath,
                filteringExtension: filteringExtension
            )
        }
    }

    /// Writes a `TextOutputStreamable` content to the designated sink.
    ///
    /// This method reads from arguments and checks `outputDir` property. If exists, it will output
    /// to the directory as files. Otherwise it outputs to stdout.
    /// - Parameters:
    ///   - inputPath: The input file path to derive the resulting file name from. If missing, it the default output file name "Wrapper.swift".
    ///   - writeBlock: A closure in which the first argument is a sink object providing an interface to stream content.
    func withFileHandler(
        inputPath: IteratedPath?,
        fileNameTransform: (String) -> String,
        extensionTransform: (String) -> String,
        writeBlock: (TextOutputStreamableSink) throws -> Void
    ) throws -> Void {
        guard let outputDir = fileArguments.outputDir else {
            try writeBlock(
                FileStreamSink(stream: FileHandlerOutputStream(.standardOutput))
            )
            return
        }

        // Ensure the output directory exists, otherwise create dirs along the way
        try FileManager.default.createDirectory(at: URL(fileURLWithPath: outputDir), withIntermediateDirectories: true, attributes: nil)

        let outputFileName: String
        if let inputPath = inputPath {
            // This file name is a relative path that gets passed in.
            let url = URL(fileURLWithPath: inputPath.path)
            let fileBaseName = url.deletingPathExtension().lastPathComponent

            // Apply file transform to the file name
            outputFileName = "\(fileNameTransform(fileBaseName)).\(extensionTransform(url.pathExtension))"
        } else {
            // Default file name with -Wrapper appended
            outputFileName = "Wrapper.swift"
        }

        let outputUrl: URL

        if let inputPath = inputPath, !fileArguments.ignoresFolderStructure {
            let outputDirUrl = URL(fileURLWithPath: outputDir).appendingPathComponent(inputPath.relativeFolderPath)
            try FileManager.default.createDirectory(at: outputDirUrl, withIntermediateDirectories: true, attributes: nil)

            outputUrl = outputDirUrl.appendingPathComponent(outputFileName)
        } else {
            outputUrl = URL(fileURLWithPath: outputDir).appendingPathComponent(outputFileName)
        }

        if fileArguments.verbose {
            print("swift-objc-value-type: writing to \(outputUrl)")
        }

        if !FileManager.default.fileExists(atPath: outputUrl.path) {
            FileManager.default.createFile(atPath: outputUrl.path, contents: nil, attributes: nil)
        }

        let fileHandle = try FileHandle(forWritingTo: outputUrl)

        try writeBlock(FileStreamSink(stream: FileHandlerOutputStream(fileHandle)))

        fileHandle.closeFile()
    }
}

extension URL {
    /// If the current URL overlaps another URL, this function will trim the overlapping portion and concatenate
    /// - Parameter url: The other url to concatenate to the current URL.
    /// - Returns: The concatenated, deduplicated URL.
    func concatenating(url: URL) -> URL {
        let pathA = standardized.path
        let pathB = url.standardized.path

        let components = pathA.components(separatedBy: "/")
        let componentCount = components.count

        for i in (0..<componentCount).reversed() {
            let prefix = components[0...i].joined(separator: "/")
            if pathB.hasPrefix(prefix) {
                let newPath = pathA + pathB.dropFirst(prefix.count)
                return URL(fileURLWithPath: newPath)
            }
        }

        return appendingPathComponent(pathB)
    }
}

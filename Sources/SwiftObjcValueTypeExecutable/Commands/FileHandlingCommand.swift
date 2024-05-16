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
import PathKit

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

    @Flag(
        name: [.long],
        help: """
        If outputDir is unset, this parameter has no effect. Otherwise:
        - If false, and if outputDir is a *relative* path, output files will be written to outputDir/path/to/fileName.
        - If true, all output files will be written directly to the outputDir/fileName.
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
    /// The contents of the source files that should be parsed, each in UTF-8 bytes.
    func makeSourceFileIterator(
        filteringExtension: ((String) -> Bool)? = { _ in true }
    ) -> any IteratorProtocol<File> {
        if fileArguments.sourcePaths.isEmpty {
            return StdinIterator()
        } else {
            let dedupedSourcePaths = Set(fileArguments.sourcePaths)
            return SourceFileContentIterator(
                sourcePaths: dedupedSourcePaths, filteringExtension: filteringExtension
            )
        }
    }

    /// Writes a `TextOutputStreamable` content to the designated sink.
    ///
    /// This method reads from arguments and checks `outputDir` property. If exists, it will output
    /// to the directory as files. Otherwise it outputs to stdout.
    /// - Parameters:
    ///   - filePath: The input file path to derive the resulting file name from. If missing, it the default output file name "Wrapper.swift".
    ///   - writeBlock: A closure in which the first argument is a sink object providing an interface to stream content.
    func withFileHandler(
        _ filePath: String?,
        fileNameTransform: (String) -> String,
        extensionTransform: (String) -> String,
        writeBlock: (TextOutputStreamableSink) throws -> Void
    ) throws -> Void {
        guard let outputDir = fileArguments.outputDir.map({ Path($0) }) else {
            try writeBlock(
                FileStreamSink(stream: FileHandlerOutputStream(.standardOutput))
            )
            return
        }

        // Ensure the output directory exists, otherwise create dirs along the way
        if !outputDir.exists {
            try FileManager.default.createDirectory(at: outputDir.url, withIntermediateDirectories: true, attributes: nil)
        }

        let outputFileName: String
        if let filePath = filePath {
            // This file name is a relative path that gets passed in.
            let url = URL(fileURLWithPath: filePath)
            let fileBaseName = url.deletingPathExtension().lastPathComponent

            // Apply file transform to the file name
            outputFileName = "\(fileNameTransform(fileBaseName)).\(extensionTransform(url.pathExtension))"
        } else {
            // Default file name with -Wrapper appended
            outputFileName = "Wrapper.swift"
        }

        let outputUrl: URL

        if let filePath = filePath.map({ Path($0) }), filePath.isRelative, !fileArguments.ignoresFolderStructure {
            // If outputDir and filePath shares some path components, strip the shared path from outputDir
            let outputDirUrl = outputDir.url.concatenating(url: filePath.url.deletingLastPathComponent())
            if !Path(outputDirUrl.absoluteString).exists {
                try FileManager.default.createDirectory(at: outputDirUrl, withIntermediateDirectories: true, attributes: nil)
            }

            outputUrl = outputDirUrl.appendingPathComponent(outputFileName)
        } else {
            outputUrl = outputDir.url.appendingPathComponent(outputFileName)
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

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
        help: "The source files and/or directories that should be parsed; use stdin if omitted",
        completion: .file()
    )
    var sourcePaths: [String] = []

    @Option(name: [.long], help: "If provided, parse the source text instead of reading source file")
    var source: String?

    @Option(
        name: [.long, .short],
        help: "If provided, writes generated files to the output directory in lieu of stdout.",
        completion: .directory
    )
    var outputDir: String?

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
    func sourceFiles() -> any IteratorProtocol<File> {
        if let source = fileArguments.source {
            return SourceFileContentIterator(fileNames: [source], directories: [])
        } else if fileArguments.sourcePaths.isEmpty {
            return StdinIterator()
        } else {
            let dedupedSourcePaths = Set(fileArguments.sourcePaths)
            return SourceFileContentIterator(sourcePaths: dedupedSourcePaths)
        }
    }

    /// Writes a `TextOutputStreamable` content to the designated sink.
    ///
    /// This method reads from arguments and checks `outputDir` property. If exists, it will output
    /// to the directory as files. Otherwise it outputs to stdout.
    /// - Parameters:
    ///   - fileName: The file name. If missing, it assumes "Wrapper.swift".
    ///   - writeBlock: A closure in which the first argument is a sink object providing an interface to stream content.
    func withFileHandler(
        _ filePath: String?,
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

        // Ensure the output directory exists
        let outputDirURL = URL(fileURLWithPath: outputDir)
        if !FileManager.default.fileExists(atPath: outputDirURL.path) {
            try FileManager.default.createDirectory(at: outputDirURL, withIntermediateDirectories: true, attributes: nil)
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

        let outputUrl = URL(fileURLWithPath: outputDir).appendingPathComponent(outputFileName)

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

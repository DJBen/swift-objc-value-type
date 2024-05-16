import Foundation
import PathKit

public struct File {
    /// If missing, it means the content comes from stdin.
    public let fileName: String?
    public let content: [UInt8]

    public init(
        fileName: String? = nil,
        content: [UInt8]
    ) {
        self.fileName = fileName
        self.content = content
    }
}

/// An efficient file iterator that lazily iterates over files in directories.
public struct SourceFileContentIterator: IteratorProtocol {
    private let paths: [Path]
    private var fileIndex = 0
    private let fileManager = FileManager.default

    public init(
        sourcePaths: any Sequence<String>,
        filteringExtension: ((String) -> Bool)?
    ) {
        var files = Set<String>()
        let fileManager = FileManager.default

        func iterateFiles(at path: String) {
            var isDirectory: ObjCBool = false
            if fileManager.fileExists(atPath: path, isDirectory: &isDirectory) {
                if isDirectory.boolValue {
                    // Iterate directory recursively
                    if let contents = try? fileManager.contentsOfDirectory(atPath: path) {
                        for item in contents {
                            let subPath = (path as NSString).appendingPathComponent(item)
                            iterateFiles(at: subPath)
                        }
                    }
                } else {
                    // Filter by extension if provided
                    if let filteringExtension = filteringExtension {
                        let pathExtension = path.split(separator: ".").last.map(String.init) ?? ""
                        if filteringExtension(pathExtension) {
                            files.insert(path)
                        }
                    } else {
                        files.insert(path)
                    }
                }
            }
        }

        for path in sourcePaths {
            iterateFiles(at: path)
        }

        self.init(paths: Array(files))
    }
    
    public init(
        paths: [Path]
    ) {
        self.paths = paths
    }

    public init(
        paths: [String]
    ) {
        self.paths = paths.map { Path($0) }
    }

    public mutating func next() -> File? {
        // First try to get the next file from the fileNames array
        if fileIndex < paths.count {
            let fileName = paths[fileIndex]
            fileIndex += 1
            return file(withPath: fileName)
        }

        return nil
    }

    private func file(withPath path: Path) -> File? {
        do {
            let data = try Data(contentsOf: path.url)
            return File(fileName: path.string, content: [UInt8](data))
        } catch {
            return nil
        }
    }
}

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

    public init(sourcePaths: any Sequence<String>) {
        let filePaths: Set<Path> = sourcePaths.map { sourcePath in
            Path.glob(sourcePath)
        }.reduce(into: Set<Path>(), { $0.formUnion($1) })
        self.init(paths: Array(filePaths))
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

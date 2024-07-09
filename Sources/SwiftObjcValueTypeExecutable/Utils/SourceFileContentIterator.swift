import Foundation

public struct IteratedPath: Hashable {
    let path: String
    let sourcePath: String

    var relativeFolderPath: String {
        let pathComponents = path.components(separatedBy: "/")
        let sourceComponents = sourcePath.components(separatedBy: "/")

        var commonPrefix = [String]()
        for (pathComponent, sourceComponent) in zip(pathComponents, sourceComponents) {
            if pathComponent == sourceComponent {
                commonPrefix.append(pathComponent)
            } else {
                break
            }
        }

        let relativeComponents = pathComponents[commonPrefix.count...]

        // Check if the relative path points to a file in the same directory as the source path
        if relativeComponents.count == 1 {
            return ""
        }

        return relativeComponents.dropLast().joined(separator: "/")
    }
}

public struct File {
    /// If missing, it means the content comes from stdin.
    public let iteratedPath: IteratedPath?
    public let content: Data

    public init(
        iteratedPath: IteratedPath?,
        content: Data
    ) {
        self.iteratedPath = iteratedPath
        self.content = content
    }
    
    public init(
        iteratedPath: IteratedPath
    ) throws {
        let data = try Data(contentsOf: URL(fileURLWithPath: iteratedPath.path))
        self.init(iteratedPath: iteratedPath, content: data)
    }
}

public struct SourceFileContentIterator: IteratorProtocol {
    var sourceFileIterator: SourceFileIterator
    
    public init(
        sourcePaths: any Sequence<String>,
        inputFileListPath: String?,
        filteringExtension: ((String) -> Bool)?
    ) {
        sourceFileIterator = SourceFileIterator(
            sourcePaths: sourcePaths,
            inputFileListPath: inputFileListPath,
            filteringExtension: filteringExtension
        )
    }
    
    public mutating func next() -> File? {
        sourceFileIterator.next().flatMap {
            do {
                return try File(iteratedPath: $0)
            } catch {
                return nil
            }
        }
    }
}

/// An efficient file iterator that lazily iterates over files in directories.
public struct SourceFileIterator: IteratorProtocol {
    private let paths: [IteratedPath]
    private var fileIndex = 0
    private let fileManager = FileManager.default

    public init(
        sourcePaths: any Sequence<String>,
        inputFileListPath: String?,
        filteringExtension: ((String) -> Bool)?
    ) {
        var files = Set<IteratedPath>()
        let fileManager = FileManager.default
        
        func iterateFiles(at path: String, sourcePath: String) {
            var isDirectory: ObjCBool = false
            if fileManager.fileExists(atPath: path, isDirectory: &isDirectory) {
                if isDirectory.boolValue {
                    // Iterate directory recursively
                    if let contents = try? fileManager.contentsOfDirectory(atPath: path) {
                        for item in contents {
                            let subPath = (path as NSString).appendingPathComponent(item)
                            iterateFiles(at: subPath, sourcePath: sourcePath)
                        }
                    }
                } else {
                    // Filter by extension if provided
                    if let filteringExtension = filteringExtension {
                        let pathExtension = path.split(separator: ".").last.map(String.init) ?? ""
                        if filteringExtension(pathExtension) {
                            files.insert(IteratedPath(path: path, sourcePath: sourcePath))
                        }
                    } else {
                        files.insert(IteratedPath(path: path, sourcePath: sourcePath))
                    }
                }
            }
        }
        
        if let inputFileListPath, let list = try? String(contentsOfFile: inputFileListPath) {
            for filePath in list.components(separatedBy: .newlines) {
                files.insert(IteratedPath(path: filePath, sourcePath: filePath))
            }
        }

        for path in sourcePaths {
            iterateFiles(at: path, sourcePath: path)
        }

        self.init(paths: Array(files))
    }
    
    private init(
        paths: [IteratedPath]
    ) {
        self.paths = paths
    }

    public mutating func next() -> IteratedPath? {
        // First try to get the next file from the paths array
        if fileIndex < paths.count {
            let iteratedPath = paths[fileIndex]
            fileIndex += 1
            return iteratedPath
        }

        return nil
    }
}

public struct RMModelSyntax: Equatable {
    public let comments: [String]
    public let typeDecls: [RMTypeDeclSyntax]
    public let name: String
    public let includes: [String]
    public let excludes: [String]
    public let properties: [RMPropertySyntax]

    public init(comments: [String] = [], typeDecls: [RMTypeDeclSyntax], name: String, includes: [String], excludes: [String], properties: [RMPropertySyntax]) {
        self.comments = comments
        self.typeDecls = typeDecls
        self.name = name
        self.includes = includes
        self.excludes = excludes
        self.properties = properties
    }
}

public struct RMTypeDeclSyntax: Equatable {
    public let name: String
    public let library: String?
    public let file: String?
    public let canForwardDeclare: Bool?

    public init(name: String, library: String? = nil, file: String? = nil, canForwardDeclare: Bool? = nil) {
        self.name = name
        self.library = library
        self.file = file
        self.canForwardDeclare = canForwardDeclare
    }
}

public struct RMPropertySyntax: Equatable {
    public let comments: [String]
    public let declaresIsNullable: Bool
    public let type: String
    public let name: String

    public init(comments: [String] = [], declaresIsNullable: Bool = false, type: String, name: String) {
        self.comments = comments
        self.declaresIsNullable = declaresIsNullable
        self.type = type
        self.name = name
    }
}

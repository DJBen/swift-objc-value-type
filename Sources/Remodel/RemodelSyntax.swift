// https://engineering.fb.com/2016/04/13/ios/building-and-managing-ios-model-objects-with-remodel/
public enum RemodelType: Equatable, Hashable, Codable {
    /**
     MessageContent {
      ContentType(NSUInteger) type
      # Set if the type is ContentTypePhoto
      Photo *photo;
      # Set if the type is ContentTypeSticker
      NSInteger stickerId
      # Set if the type is ContentTypeText
      NSString *text
         }
     */
    case value

    /**
     MessageContent includes(RMCoding) {
       image {
         Photo *photo
       }
       sticker {
         NSInteger stickerId
       }
       text {
          NSString *body
       }
     }
     */
    case adtValue
}

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

    public var type: RemodelType {
        if let property = properties.first {
            switch property.value {
            case .value(_):
                return .value
            case .adt(_):
                return .adtValue
            }
        } else {
            return .value
        }
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
public enum RMPropertyNullability {
    case nonnull
    case null
}

public struct RMPropertySyntax: Equatable {
    public struct StructValue: Equatable {
        public let comments: [String]
        public let nullability: RMPropertyNullability?
        public let type: String
        public let name: String

        public init(comments: [String] = [], nullability: RMPropertyNullability? = nil, type: String, name: String) {
            self.comments = comments
            self.nullability = nullability
            self.type = type
            self.name = name
        }
    }

    public struct AdtValue: Equatable {
        public let comments: [String]
        public let name: String
        public let innerValues: [StructValue]

        public init(comments: [String] = [], name: String, innerValues: [StructValue] = []) {
            self.comments = comments
            self.name = name
            self.innerValues = innerValues
        }
    }

    public enum Value: Equatable {
        case value(StructValue)
        case adt(AdtValue)
    }

    public let value: Value

    public init(_ value: Value) {
        self.value = value
    }

    public init(comments: [String] = [], nullability: RMPropertyNullability? = nil, type: String, name: String) {
        self.init(.value(StructValue(comments: comments, nullability: nullability, type: type, name: name)))
    }
}

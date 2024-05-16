
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

    /**
     #import <Foo/Bar.h>
     #import <Foo/Baz.h>

     interface Weather
         float celsius
         float fahrenheit
         NSString *locationName
         NSArray<SOJUHourlyForecast *> *hourlyForecasts
         NSArray<SOJUDailyForecast *> *dailyForecasts
         enum WeatherFilterType weatherFilterViewType
     end
     */
    case interface
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
    
    public class Builder {
        private enum Error: Swift.Error {
            case missingValue(property: String)
        }
        public var comments: [String]?
        public var typeDecls: [RMTypeDeclSyntax]?
        public var name: String?
        public var includes: [String]?
        public var excludes: [String]?
        public var properties: [RMPropertySyntax]?
        public init() {
        }
        
        public convenience init(_ item: RMModelSyntax?) {
            self.init()
            fill(with: item)
        }
        
        public func fill(with item: RMModelSyntax?) {
            comments = item?.comments
            typeDecls = item?.typeDecls
            name = item?.name
            includes = item?.includes
            excludes = item?.excludes
            properties = item?.properties
        }
        
        public func build() throws -> RMModelSyntax {
            guard let comments else {
                throw Error.missingValue(property: "comments")
            }
            guard let typeDecls else {
                throw Error.missingValue(property: "typeDecls")
            }
            guard let name else {
                throw Error.missingValue(property: "name")
            }
            guard let includes else {
                throw Error.missingValue(property: "includes")
            }
            guard let excludes else {
                throw Error.missingValue(property: "excludes")
            }
            guard let properties else {
                throw Error.missingValue(property: "properties")
            }
            return RMModelSyntax(
                comments: comments,
                typeDecls: typeDecls,
                name: name,
                includes: includes,
                excludes: excludes,
                properties: properties
            )
        }
    }
    
    public static func makeBuilder() -> Builder {
        Builder()
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
        
        
        public class Builder {
            private enum Error: Swift.Error {
                case missingValue(property: String)
            }
            public var comments: [String]?
            public var nullability: RMPropertyNullability?
            public var type: String?
            public var name: String?
            public init() {
            }
            
            public convenience init(_ item: StructValue?) {
                self.init()
                fill(with: item)
            }
            
            public func fill(with item: StructValue?) {
                comments = item?.comments
                nullability = item?.nullability
                type = item?.type
                name = item?.name
            }
            
            public func build() throws -> StructValue {
                guard let comments else {
                    throw Error.missingValue(property: "comments")
                }
                guard let type else {
                    throw Error.missingValue(property: "type")
                }
                guard let name else {
                    throw Error.missingValue(property: "name")
                }
                return StructValue(
                    comments: comments,
                    nullability: nullability,
                    type: type,
                    name: name
                )
            }
        }
        
        public static func makeBuilder() -> Builder {
            Builder()
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
        
        
        public class Builder {
            private enum Error: Swift.Error {
                case missingValue(property: String)
            }
            public var comments: [String]?
            public var name: String?
            public var innerValues: [StructValue]?
            public init() {
            }
            
            public convenience init(_ item: AdtValue?) {
                self.init()
                fill(with: item)
            }
            
            public func fill(with item: AdtValue?) {
                comments = item?.comments
                name = item?.name
                innerValues = item?.innerValues
            }
            
            public func build() throws -> AdtValue {
                guard let comments else {
                    throw Error.missingValue(property: "comments")
                }
                guard let name else {
                    throw Error.missingValue(property: "name")
                }
                guard let innerValues else {
                    throw Error.missingValue(property: "innerValues")
                }
                return AdtValue(
                    comments: comments,
                    name: name,
                    innerValues: innerValues
                )
            }
        }
        
        public static func makeBuilder() -> Builder {
            Builder()
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

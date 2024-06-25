
public enum EnumOrOptionType {
    case nsEnum
    case nsOption
}

public struct ObjcEnumOrOption: Equatable {
    public enum Trivia: Equatable {
        /// // comments
        case doubleSlashLine(String)
        /// /// comments
        case tripleSlashLine(String)
        /// /* ... */ multiline block comments
        case blockComment([String])
        case newlines(Int)

        static func newline() -> Trivia {
            .newlines(1)
        }
    }

    public struct Case: Equatable {
        public enum Value: Equatable {
            case numeric(Int)
            case bitShift(base: Int, shift: Int)
            case bitOr([String])
        }

        public let beforeTrivia: [Trivia]
        public let name: String
        public let value: Value?
        public let afterTrivia: [Trivia]

        public init(beforeTrivia: [Trivia] = [], name: String, value: Value?, afterTrivia: [Trivia] = []) {
            self.beforeTrivia = beforeTrivia
            self.name = name
            self.value = value
            self.afterTrivia = afterTrivia
        }
        
        public class Builder {
            private enum Error: Swift.Error {
                case missingValue(property: String)
            }
            public var beforeTrivia: [Trivia]?
            public var name: String?
            public var value: Value?
            public var afterTrivia: [Trivia]?
            public init() {
            }
            
            public convenience init(_ item: Case?) {
                self.init()
                fill(with: item)
            }
            
            public func fill(with item: Case?) {
                beforeTrivia = item?.beforeTrivia
                name = item?.name
                value = item?.value
                afterTrivia = item?.afterTrivia
            }
            
            public func build() throws -> Case {
                guard let beforeTrivia else {
                    throw Error.missingValue(property: "beforeTrivia")
                }
                guard let name else {
                    throw Error.missingValue(property: "name")
                }
                guard let afterTrivia else {
                    throw Error.missingValue(property: "afterTrivia")
                }
                return Case(
                    beforeTrivia: beforeTrivia,
                    name: name,
                    value: value,
                    afterTrivia: afterTrivia
                )
            }
        }
        
        public static func makeBuilder() -> Builder {
            Builder()
        }
    }

    public let trivia: [Trivia]

    public let type: EnumOrOptionType

    /// e.g. NSUInteger, NSInteger
    public let underlyingType: String
    public let name: String
    public let cases: [Case]

    public init(
        trivia: [Trivia] = [],
        type: EnumOrOptionType,
        underlyingType: String,
        name: String,
        cases: [Case]
    ) {
        self.trivia = trivia
        self.type = type
        self.underlyingType = underlyingType
        self.name = name
        self.cases = cases
    }
    
    public class Builder {
        private enum Error: Swift.Error {
            case missingValue(property: String)
        }
        public var trivia: [Trivia]?
        public var type: EnumOrOptionType?
        public var underlyingType: String?
        public var name: String?
        public var cases: [Case]?
        public init() {
        }
        
        public convenience init(_ item: ObjcEnumOrOption?) {
            self.init()
            fill(with: item)
        }
        
        public func fill(with item: ObjcEnumOrOption?) {
            trivia = item?.trivia
            type = item?.type
            underlyingType = item?.underlyingType
            name = item?.name
            cases = item?.cases
        }
        
        public func build() throws -> ObjcEnumOrOption {
            guard let trivia else {
                throw Error.missingValue(property: "trivia")
            }
            guard let type else {
                throw Error.missingValue(property: "type")
            }
            guard let underlyingType else {
                throw Error.missingValue(property: "underlyingType")
            }
            guard let name else {
                throw Error.missingValue(property: "name")
            }
            guard let cases else {
                throw Error.missingValue(property: "cases")
            }
            return ObjcEnumOrOption(
                trivia: trivia,
                type: type,
                underlyingType: underlyingType,
                name: name,
                cases: cases
            )
        }
    }
    
    public static func makeBuilder() -> Builder {
        Builder()
    }
}

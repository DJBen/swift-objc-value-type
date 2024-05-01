import BuilderMacro

public enum EnumOrOptionType {
    case nsEnum
    case nsOption
}

@ThrowingBuilder
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

    @ThrowingBuilder
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
}

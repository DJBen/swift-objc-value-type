@testable import Remodel
import XCTest
import TestingSupport

final class RemodelSwiftFactoryTests: XCTestCase {
    func testFactory_structValue() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        # Some comments
        # comment line 2

        TrackV2ConfigValue includes(RMEquality) {
            BOOL enableAttachment
            NSArray<NSNumber *> *supportedTypes

            # A comment about this property
            NSDictionary<NSNumber *, NSString *> *parserRegexes
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)
        )

        assertBuildResult(
            result,
            """


            /// Some comments
            /// comment line 2
            public struct TrackV2ConfigValue: Equatable, Hashable {

                public let enableAttachment: Bool

                public let supportedTypes: [NSNumber]?

                /// A comment about this property
                public let parserRegexes: [NSNumber: String]?

                public init(enableAttachment: Bool, supportedTypes: [NSNumber]?, parserRegexes: [NSNumber: String]?) {
                    self.enableAttachment = enableAttachment
                    self.supportedTypes = supportedTypes
                    self.parserRegexes = parserRegexes
                }
            }

            """
        )
    }

    func testFactory_structValue_nullable() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        %type name=Action file=ActionFile library=ActionLib
        %type name=Icon file="Icon"
        %type name=MediaType file=MediaType library=MediaModels
        # Some comments
        Config includes(RMAssumeNonnull) {
          # id comment
          NSString *id
          # title comment
          %nullable NSString *title
          # subtitle comment
          %nullable
          NSString *subtitle
          # The type of media represented.
          MediaType(NSInteger) type
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)
        )

        assertBuildResult(
            result,
            """
            import ActionLib
            import MediaModels

            /// Some comments
            public struct Config {

                /// id comment
                public let id: String

                /// title comment
                public let title: String?

                /// subtitle comment
                public let subtitle: String?

                /// The type of media represented.
                public let type: MediaType

                public init(id: String, title: String?, subtitle: String?, type: MediaType) {
                    self.id = id
                    self.title = title
                    self.subtitle = subtitle
                    self.type = type
                }
            }

            """
        )
    }

    func testFactory_adtValue() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        # An Example Algebraic data type (akin to swift enum associated value)
        # multiline comment

        AdtValue includes(RMEquality) {
            # case 1 comment
            case1 {
                NSString *string

                # some non-pointer integer
                # someInt multiline
                int32_t someInt
            }

            # second case
            case2 {
                BOOL hello
            }
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .adtValue, source: source)
        )

        assertBuildResult(
            result,
            """


            /// An Example Algebraic data type (akin to swift enum associated value)
            /// multiline comment
            public enum AdtValue: Equatable, Hashable {

                /// case 1 comment
                /// - someInt: some non-pointer integer
                ///   someInt multiline
                case case1(string: String?, someInt: Int32)

                /// second case
                case case2(hello: Bool)
            }

            """
        )
    }

    func testFactory_adtValue_withoutArgs() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        # Defines the updates

        Updates includes(UseForwardDeclarations, SkipAttributePrivateImports, RMAssumeNonnull) {
        identifiers
        info
        }

        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .adtValue, source: source)
        )

        assertBuildResult(
            result,
            """


            /// Defines the updates
            public enum Updates {
            
                case identifiers

                case info
            }

            """
        )
    }

}

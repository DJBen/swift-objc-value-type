@testable import Remodel
import XCTest
import TestingSupport

final class RemodelSwiftFactoryTests: XCTestCase {
    func testFactory_structValue_empty() throws {
        let factory = RemodelSwiftFactory()
        let source = """
        EmptyValue {

        }


        """

        let parser = RemodelValueObjectParser()
        let result = try factory.generate(
            try parser.parse(type: .value, source: source)!
        )
        assertBuildResult(
            result,
            """


            public struct EmptyValue {

                public init() {
                }
            }

            """
        )
    }

    func testFactory_adtValue_colonNumbered() throws {
        let factory = RemodelSwiftFactory()
        let source = """
        %type name=FooA file=FooFileA library=FooServices
        %type name=FooB file=FooFileB library=FooServices
        %type name=FooC file=FooFileC library=FooServices

        DataRequest includes(SkipAttributePrivateImports) {
          # Case foo documentations
          handleCaseFoo:1 {

          }
          handleCaseBar:2 {
            # ClientId some documentations
            %nonnull NSString *clientId
          }
        }
        """

        let parser = RemodelValueObjectParser()
        let ast = try parser.parse(type: .adtValue, source: source)!
        let result = try factory.generate(ast)
        assertBuildResult(
            result,
            """
            import FooServices

            public enum DataRequest {
                
                /// Case foo documentations
                case handleCaseFoo

                /// - clientId: ClientId some documentations
                case handleCaseBar(clientId: String)
            }

            """
        )

    }

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
            try parser.parse(type: .value, source: source)!
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

    func testFactory_structValue_nonnull() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        Foo includes(RMAssumeNonnull) {
          %nonnull NSString *bar
          %nonnull NSDate *baz
          %nullable NSString *baq
          %nonnull SomeCustomType *customType
          %nullable NSDate *bab
          NSInteger cellIndex
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)!
        )

        assertBuildResult(
            result,
            """

            
            public struct Foo {

                public let bar: String

                public let baz: Date

                public let baq: String?

                public let customType: SomeCustomType

                public let bab: Date?

                public let cellIndex: Int

                public init(bar: String, baz: Date, baq: String?, customType: SomeCustomType, bab: Date?, cellIndex: Int) {
                    self.bar = bar
                    self.baz = baz
                    self.baq = baq
                    self.customType = customType
                    self.bab = bab
                    self.cellIndex = cellIndex
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

          NSNumber *number
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)!
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

                public let number: NSNumber

                public init(id: String, title: String?, subtitle: String?, type: MediaType, number: NSNumber) {
                    self.id = id
                    self.title = title
                    self.subtitle = subtitle
                    self.type = type
                    self.number = number
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
                NSNumber *number
            }
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .adtValue, source: source)!,
            existingPrefix: "SC"
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
                case case2(hello: Bool, number: NSNumber?)
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
            try parser.parse(type: .adtValue, source: source)!
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

    func testFactory_structValue_adverse1() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        %type library=UIKit file=UIKit

        ModelWithCTA {
            NSString *ctaTitleString
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)!
        )

        assertBuildResult(
            result,
            """
            import UIKit

            public struct ModelWithCTA {

                public let ctaTitleString: String?

                public init(ctaTitleString: String?) {
                    self.ctaTitleString = ctaTitleString
                }
            }

            """
        )
    }

    func testFactory_value_existingPrefix() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        NestedValue {
            NSArray<PYQHello *> *arr
            NSDictionary<PYQYes *, PYQBar *> *dict
        }
        """

        let parser = RemodelValueObjectParser()

        let result = try factory.generate(
            try parser.parse(type: .value, source: source)!,
            existingPrefix: "PYQ"
        )

        assertBuildResult(
            result,
            """

            
            public struct NestedValue {

                public let arr: [Hello]?

                public let dict: [Yes: Bar]?

                public init(arr: [Hello]?, dict: [Yes: Bar]?) {
                    self.arr = arr
                    self.dict = dict
                }
            }

            """
        )
    }
}

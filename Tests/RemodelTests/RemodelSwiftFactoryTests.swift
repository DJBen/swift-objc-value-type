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
            public struct TrackV2ConfigValue: Equatable {

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

    func testFactory_nullable() throws {
        let factory = RemodelSwiftFactory()

        let source = """
        %type name=Action file=ActionFile library=ActionLib
        %type name=Icon file="Icon"
        # Some comments
        Config includes(RMAssumeNonnull) {
          # id comment
          NSString *id
          # title comment
          %nullable NSString *title
          # subtitle comment
          %nullable
          NSString *subtitle
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

            /// Some comments
            public struct Config {

                /// id comment
                public let id: String

                /// title comment
                public let title: String?

                /// subtitle comment
                public let subtitle: String?

                public init(id: String, title: String?, subtitle: String?) {
                    self.id = id
                    self.title = title
                    self.subtitle = subtitle
                }
            }

            """
        )
    }
}

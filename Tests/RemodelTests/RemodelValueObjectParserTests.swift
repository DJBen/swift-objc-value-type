import XCTest
@testable import Remodel
import CustomDump

final class SourcePreprocessorTests: XCTestCase {
    func testParser_baseCase() throws {
        let source = """
        # Some comments
        # comment line 2

        TrackV2ConfigValue includes(RMAssumeNonnull, RMEquality) {
            BOOL enableAttachment
            NSArray<NSNumber *> *supportedTypes

            # A comment about this property
            NSDictionary<NSNumber *, NSString *> *parserRegexes
        }
        """

        let parser = RemodelValueObjectParser()
        XCTAssertNoDifference(
            try parser.parse(source),
            RMModelSyntax(
                comments: ["Some comments", "comment line 2"],
                typeDecls: [],
                name: "TrackV2ConfigValue",
                includes: ["RMAssumeNonnull", "RMEquality"],
                excludes: [],
                properties: [
                    RMPropertySyntax(
                        type: "BOOL", 
                        name: "enableAttachment"
                    ),
                    RMPropertySyntax(
                        type: "NSArray<NSNumber *> *",
                        name: "supportedTypes"
                    ),
                    RMPropertySyntax(
                        comments: ["A comment about this property"],
                        type: "NSDictionary<NSNumber *, NSString *> *",
                        name: "parserRegexes"
                    )
                ]
            )
        )
    }

    func testParser_baseCase2() throws {
        let source = """
        # Configuration for CTA

        %type name=CGFloat file=UIKit library=UIKit

        CTAConfigValue includes(RMAssumeNonnull, RMEquality) excludes(RMDescription) {

            # Enable config for a given CTA
            BOOL enable

            # Additional tap area above the CTA that allows to trigger an attachment
            CGFloat interactivePaddingHeight

            # The animation duration length in ms
            NSTimeInterval animationTimeMs

            # The animation delay in ms
            NSTimeInterval animationDelayMs
        }
        """

        let parser = RemodelValueObjectParser()
        XCTAssertNoDifference(
            try parser.parse(source),
            RMModelSyntax(
                comments: ["Configuration for CTA"],
                typeDecls: [
                    RMTypeDeclSyntax(name: "CGFloat", library: "UIKit", file: "UIKit")
                ],
                name: "CTAConfigValue",
                includes: ["RMAssumeNonnull", "RMEquality"],
                excludes: ["RMDescription"],
                properties: [
                    RMPropertySyntax(
                        comments: ["Enable config for a given CTA"],
                        type: "BOOL",
                        name: "enable"
                    ),
                    RMPropertySyntax(
                        comments: ["Additional tap area above the CTA that allows to trigger an attachment"],
                        type: "CGFloat",
                        name: "interactivePaddingHeight"
                    ),
                    RMPropertySyntax(
                        comments: ["The animation duration length in ms"],
                        type: "NSTimeInterval",
                        name: "animationTimeMs"
                    ),
                    RMPropertySyntax(
                        comments: ["The animation delay in ms"],
                        type: "NSTimeInterval",
                        name: "animationDelayMs"
                    )
                ]
            )
        )
    }
}

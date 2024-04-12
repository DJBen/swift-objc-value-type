import XCTest
@testable import Remodel
import CustomDump

final class SourcePreprocessorTests: XCTestCase {
    func testParser_value_baseCase() throws {
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
            try parser.parse(type: .value, source: source),
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

    func testParser_value_withTypes() throws {
        let source = """
        # Configuration for CTA

        %type name=CGFloat file=UIKit library=UIKit
        %type name=MediaType file=MediaType library=MediaModels

        CTAConfigValue includes(RMAssumeNonnull, RMEquality) excludes(RMDescription) {

            # Enable config for a given CTA
            BOOL enable

            # Additional tap area above the CTA that allows to trigger an attachment
            CGFloat interactivePaddingHeight

            # The animation duration length in ms
            NSTimeInterval animationTimeMs

            # The animation delay in ms
            NSTimeInterval animationDelayMs

            # The type of media represented.
            MediaType(NSInteger) type
        }
        """

        let parser = RemodelValueObjectParser()
        XCTAssertNoDifference(
            try parser.parse(type: .value, source: source),
            RMModelSyntax(
                comments: ["Configuration for CTA"],
                typeDecls: [
                    RMTypeDeclSyntax(name: "CGFloat", library: "UIKit", file: "UIKit"),
                    RMTypeDeclSyntax(name: "MediaType", library: "MediaModels", file: "MediaType")
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
                    ),
                    RMPropertySyntax(
                        comments: ["The type of media represented."],
                        type: "MediaType(NSInteger)",
                        name: "type"
                    )
                ]
            )
        )
    }

    func testParser_value_nullables() throws {
        let source = """
        %type name=CGFloat file=UIKit library=UIKit

        CTAConfigValue includes(RMAssumeNonnull, RMEquality) excludes(RMDescription) {

            # Enable config for a given CTA
            BOOL enable

            %nullable NSString *lollol

            # rofl
            %nullable
            NSArray<NSString *> *rofl

            # The animation duration length in ms
            NSTimeInterval animationTimeMs
        }
        """

        let parser = RemodelValueObjectParser()
        XCTAssertNoDifference(
            try parser.parse(type: .value, source: source),
            RMModelSyntax(
                comments: [],
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
                        comments: [],
                        declaresIsNullable: true,
                        type: "NSString *",
                        name: "lollol"
                    ),
                    RMPropertySyntax(
                        comments: ["rofl"],
                        declaresIsNullable: true,
                        type: "NSArray<NSString *> *",
                        name: "rofl"
                    ),
                    RMPropertySyntax(
                        comments: ["The animation duration length in ms"],
                        type: "NSTimeInterval",
                        name: "animationTimeMs"
                    )
                ]
            )
        )
    }

    func testParser_adtValue_noTypes() {
        let source = """
        # Defines the updates

        Updates includes(UseForwardDeclarations, SkipAttributePrivateImports, RMAssumeNonnull) {
        identifiers
        info
        }

        """

        let parser = RemodelValueObjectParser()

        XCTAssertNoDifference(
            try parser.parse(type: .adtValue, source: source),
            RMModelSyntax(
                comments: ["Defines the updates"],
                typeDecls: [],
                name: "Updates",
                includes: ["UseForwardDeclarations", "SkipAttributePrivateImports", "RMAssumeNonnull"],
                excludes: [],
                properties: [
                    RMPropertySyntax(
                        .adt(
                            RMPropertySyntax.AdtValue(
                                name: "identifiers"
                            )
                        )
                    ),
                    RMPropertySyntax(
                        .adt(
                            RMPropertySyntax.AdtValue(
                                name: "info"
                            )
                        )
                    )
                ]
            )
        )
    }

    func testParser_adtValue_withTypes() throws {
        let source = """
        # An Example Algebraic data type (akin to swift enum associated value)
        
        AdtValue includes(RMEquality) {
            case1 {
                NSString *string
        
                # some non-pointer integer
                int32_t someInt
            }
        
            # second case
            case2 {
                BOOL hello
            }
        }
        """
        
        let parser = RemodelValueObjectParser()
        XCTAssertNoDifference(
            try parser.parse(type: .adtValue, source: source),
            RMModelSyntax(
                comments: ["An Example Algebraic data type (akin to swift enum associated value)"],
                typeDecls: [],
                name: "AdtValue",
                includes: ["RMEquality"],
                excludes: [],
                properties: [
                    RMPropertySyntax(
                        .adt(
                            RMPropertySyntax.AdtValue(
                                comments: [],
                                name: "case1",
                                innerValues: [
                                    RMPropertySyntax.StructValue(type: "NSString *", name: "string"),
                                    RMPropertySyntax.StructValue(comments: ["some non-pointer integer"], type: "int32_t", name: "someInt"),
                                ]
                            )
                        )
                    ),
                    RMPropertySyntax(
                        .adt(
                            RMPropertySyntax.AdtValue(
                                comments: ["second case"],
                                name: "case2",
                                innerValues: [
                                    RMPropertySyntax.StructValue(type: "BOOL", name: "hello")
                                ]
                            )
                        )
                    )
                ]
            )
        )
    }
}

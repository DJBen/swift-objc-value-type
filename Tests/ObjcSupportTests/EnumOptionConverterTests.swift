import XCTest
@testable import ObjcSupport
import CustomDump

final class EnumOptionConverterTests: XCTestCase {
    func testParser_nsOption_baseCase() throws {
        let source = """
        /**
         * Hello block comments
         * Block comment line 2
         */
        typedef NS_OPTIONS(NSInteger,UpdateOption) {
           UpdateDisplayName = 1 << 0,

           UpdatePostA = 1 << 1, // Trailing comment
           UpdateViewB = 1 << 2,
           UpdateListC = 1 << 3,
           UpdateAll =UpdateDisplayName |UpdatePostA |
                                            UpdateViewB |UpdateListC,

           // The options below are for local changes
           UpdateReactivate = 1 << 4,
        };

        """

        let converter = EnumOptionConverter()
        XCTAssertNoDifference(
            try converter.parse(source: source),
            ObjcEnumOrOption(
                trivia: [
                    .blockComment([
                        "Hello block comments",
                        "Block comment line 2"
                    ])
                ],
                type: .nsOption,
                underlyingType: "NSInteger",
                name: "UpdateOption",
                cases: [
                    ObjcEnumOrOption.Case(
                        name: "UpdateDisplayName",
                        value: .bitShift(base: 1, shift: 0)
                    ),
                    ObjcEnumOrOption.Case(
                        name: "UpdatePostA",
                        value: .bitShift(base: 1, shift: 1),
                        afterTrivia: [
                            .doubleSlashLine("Trailing comment")
                        ]
                    ),
                    ObjcEnumOrOption.Case(
                        name: "UpdateViewB",
                        value: .bitShift(base: 1, shift: 2)
                    ),
                    ObjcEnumOrOption.Case(
                        name: "UpdateListC",
                        value: .bitShift(base: 1, shift: 3)
                    ),
                    ObjcEnumOrOption.Case(
                        name: "UpdateAll",
                        value: .bitOr(["UpdateDisplayName", "UpdatePostA", "UpdateViewB", "UpdateListC"])
                    ),
                    ObjcEnumOrOption.Case(
                        beforeTrivia: [
                            .doubleSlashLine("The options below are for local changes")
                        ],
                        name: "UpdateReactivate",
                        value: .bitShift(base: 1, shift: 4)
                    ),
                ]
            )
        )
    }

    func testParser_nsOption_baseCase2() throws {
        let converter = EnumOptionConverter()

        let source2 = """
        typedef NS_OPTIONS(NSUInteger, Restriction) {
            // No restriction
            RestrictionNone = 0,
            // Comment
            RestrictionNotInPlaceA = 1 << 0,
            // Comment B
            RestrictionAlreadyDone = 1 << 1,
            // Comment C
            RestrictionError = 1 << 2,
        };
        """

        XCTAssertNoDifference(
            try converter.parse(source: source2),
            ObjcEnumOrOption(
                type: .nsOption,
                underlyingType: "NSUInteger",
                name: "Restriction",
                cases: [
                    ObjcEnumOrOption.Case(
                        beforeTrivia: [
                            .doubleSlashLine("No restriction")
                        ],
                        name: "RestrictionNone",
                        value: .numeric(0)
                    ),
                    ObjcEnumOrOption.Case(
                        beforeTrivia: [
                            .doubleSlashLine("Comment")
                        ],
                        name: "RestrictionNotInPlaceA",
                        value: .bitShift(base: 1, shift: 0)
                    ),
                    ObjcEnumOrOption.Case(
                        beforeTrivia: [
                            .doubleSlashLine("Comment B")
                        ],
                        name: "RestrictionAlreadyDone",
                        value: .bitShift(base: 1, shift: 1)
                    ),
                    ObjcEnumOrOption.Case(
                        beforeTrivia: [
                            .doubleSlashLine("Comment C")
                        ],
                        name: "RestrictionError",
                        value: .bitShift(base: 1, shift: 2)
                    ),
                ]
            )
        )

    }
}

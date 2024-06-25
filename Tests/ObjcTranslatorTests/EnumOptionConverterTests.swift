import XCTest
import TestingSupport
@testable import ObjcTranslator
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

    func testConvert_nsOption_baseCase() throws {
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
        let tree = try XCTUnwrap(try converter.parse(source: source))

        assertBuildResult(
            try converter.convert(tree),
            """
            /// Hello block comments
            /// Block comment line 2
            public struct UpdateOption: OptionSet {
                public let rawValue: Int

                public static let updateDisplayName: UpdateOption = UpdateOption(rawValue: 1 << 0)
                public static let updatePostA: UpdateOption = UpdateOption(rawValue: 1 << 1) // Trailing comment
                public static let updateViewB: UpdateOption = UpdateOption(rawValue: 1 << 2)
                public static let updateListC: UpdateOption = UpdateOption(rawValue: 1 << 3)
                public static let updateAll: UpdateOption = [.updateDisplayName, .updatePostA, .updateViewB, .updateListC]
                // The options below are for local changes
                public static let updateReactivate: UpdateOption = UpdateOption(rawValue: 1 << 4)

                public init(rawValue: Int) {
                    self.rawValue = rawValue
                }
            }
            """
        )
    }

    func testCovert_nsEnum_baseCase() throws {
        let source = """
        /**
         * State for Local media uploaded that requires time for client
         * to process into Ephemeral media.
         **/
        typedef NS_ENUM(NSInteger, LocalMediaUploadingState) {
            LocalMediaUploadingStateUploading = -2,
            LocalMediaUploadingStateFailed = -1,
            LocalMediaUploadingStateDefault = 0,
            LocalMediaUploadingStateUploaded = 1,
        };
        """

        let converter = EnumOptionConverter()
        let tree = try XCTUnwrap(try converter.parse(source: source))

        assertBuildResult(
            try converter.convert(tree),
            """
            /// State for Local media uploaded that requires time for client
            /// to process into Ephemeral media.
            @objc public enum LocalMediaUploadingState: Int {
                case uploading = -2
                case failed = -1
                case default = 0
                case uploaded = 1
            }
            """
        )
    }
}

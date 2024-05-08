import XCTest
import SwiftSyntax
import TestingSupport
@testable import SwiftObjcValueType

final class SourcePreprocessorTests: XCTestCase {
    func testValueObjc_baseCase() throws {

        let sourcePreprocessor = SourcePreprocessor()
        sourcePreprocessor.addSource(
            sourceFileSyntax: SourceFileSyntax(statementsBuilder: {
                #"""
                public struct Value: Equatable, Codable {
                    public let doubleValue: Double

                    public let optInt: Int64?

                    public let stringArray: [String]

                    public let map: [String: [String: Double]]

                    public let value2: Value2
                }

                """#
            })
        )

        sourcePreprocessor.addSource(
            sourceFileSyntax: SourceFileSyntax(statementsBuilder: {
                #"""
                public struct Value2: Equatable, Codable {
                    public let someArg: Arg
                    public let value3: Value3
                }

                """#
            })
        )

        sourcePreprocessor.addSource(
            sourceFileSyntax: SourceFileSyntax(statementsBuilder: {
                #"""
                public struct Value3: Equatable, Codable {
                    public let someArg2: Arg2
                }

                """#
            })
        )

        XCTAssertEqual(
            Set(sourcePreprocessor.referencedSiblingTypes),
            Set(["Value2", "Value3"])
        )
    }
}

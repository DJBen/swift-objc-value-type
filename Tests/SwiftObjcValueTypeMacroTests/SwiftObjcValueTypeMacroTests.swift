import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
@testable import SwiftObjcValueTypeMacro
import SwiftObjcValueType

final class SwiftObjcValueTypeMacroTests: XCTestCase {
    private let macros = ["ObjcValueWrapper": SwiftObjcValueTypeMacro.self]

    func testMacro() {
        assertMacroExpansion(
            """
            @ObjcValueWrapper
            public struct Value: Equatable, Codable {
                public let doubleValue: Double

                public let optInt: Int64?

                public let stringArray: [String]

                public let map: [String: [String: Double]]
            }
            """,
            expandedSource:#"""
            public struct Value: Equatable, Codable {
                public let doubleValue: Double

                public let optInt: Int64?

                public let stringArray: [String]

                public let map: [String: [String: Double]]
            }

            private let kDoubleValueKey = "DOUBLE_VALUE"
            
            private let kOptIntKey = "OPT_INT"
            
            private let kStringArrayKey = "STRING_ARRAY"
            
            private let kMapKey = "MAP"
            
            @objc(Value)
            public class ValueClass: NSObject, NSCopying {

                @objc public var doubleValue: Double {
                    wrapped.doubleValue
                }

                @objc public var optInt: NSNumber? {
                    wrapped.optInt.map(NSNumber.init)
                }

                @objc public var stringArray: [String] {
                    wrapped.stringArray
                }

                @objc public var map: [String: [String: Double]] {
                    wrapped.map
                }

                public let wrapped: Value

                @objc
                public init(doubleValue: Double, optInt: NSNumber?, stringArray: [String], map: [String: [String: Double]]) {
                    self.wrapped = Value(doubleValue: doubleValue, optInt: optInt.map(\.int64Value), stringArray: stringArray, map: map)
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    if let other = object as? ValueClass {
                        return wrapped == other.wrapped
                    }
                    return false
                }

                private init(wrapped: Value) {
                    self.wrapped = wrapped
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return ValueClass(wrapped: wrapped)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: kDoubleValueKey)
                    coder.encodeConditionalObject(optInt, forKey: kOptIntKey)
                    coder.encode(stringArray, forKey: kStringArrayKey)
                    coder.encode(map, forKey: kMapKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: kDoubleValueKey)
                    let optInt = coder.decodeObject(forKey: kOptIntKey) as? NSNumber
                    guard let stringArray = coder.decodeObject(forKey: kStringArrayKey) as? [String] else {
                        return nil
                    }
                    guard let map = coder.decodeObject(forKey: kMapKey) as? [String: [String: Double]] else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension ValueClass {
                @objc
                public class ValueBuilder: NSObject {

                    @objc public var doubleValue: NSNumber?

                    @objc public var optInt: NSNumber?

                    @objc public var stringArray: [String]?

                    @objc public var map: [String: [String: Double]]?

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc
                    public func build() throws -> ValueClass {
                        guard let doubleValue = doubleValue else {
                            throw error(field: "doubleValue")
                        }
                        guard let stringArray = stringArray else {
                            throw error(field: "stringArray")
                        }
                        guard let map = map else {
                            throw error(field: "map")
                        }

                        return ValueClass(doubleValue: doubleValue.doubleValue, optInt: optInt, stringArray: stringArray, map: map)
                    }
                }
            }

            """#,
            macros: macros
        )
    }
}


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
            public class ValueObjc: NSObject, NSCopying, NSCoding {

                @objc public let doubleValue: Double

                @objc public let optInt: NSNumber?

                @objc public let stringArray: [String]

                @objc public let map: [String: [String: Double]]

                @objc
                public init(doubleValue: Double, optInt: NSNumber?, stringArray: [String], map: [String: [String: Double]]) {
                    self.doubleValue = doubleValue
                    self.optInt = optInt
                    self.stringArray = stringArray
                    self.map = map
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.optInt = original.optInt.map(NSNumber.init)
                    self.stringArray = original.stringArray
                    self.map = original.map
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ValueObjc else {
                        return false
                    }
                    return doubleValue == other.doubleValue && optInt?.isEqual(other.optInt) == true && stringArray.isEqual(other.stringArray) && map.isEqual(other.map)
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    ValueObjc(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
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

            extension ValueObjc {
                @objc
                public class ValueBuilder: NSObject {
                    @objc public class func value() -> ValueBuilder {
                        ValueBuilder()
                    }

                    @objc public class func value(existingValue: ValueObjc) -> ValueObjc {
                        ValueBuilder.value().withDoubleValue(existingValue.doubleValue).withOptInt(existingValue.optInt).withStringArray(existingValue.stringArray).withMap(existingValue.map).build()
                    }

                    private var doubleValue: Double?

                    @objc @discardableResult public func withDoubleValue(_ doubleValue: Double) -> ValueBuilder {
                        self.doubleValue = doubleValue
                        return self
                    }

                    private var optInt: NSNumber?

                    @objc @discardableResult public func withOptInt(_ optInt: NSNumber?) -> ValueBuilder {
                        self.optInt = optInt
                        return self
                    }

                    private var stringArray: [String]?

                    @objc @discardableResult public func withStringArray(_ stringArray: [String]) -> ValueBuilder {
                        self.stringArray = stringArray
                        return self
                    }

                    private var map: [String: [String: Double]]?

                    @objc @discardableResult public func withMap(_ map: [String: [String: Double]]) -> ValueBuilder {
                        self.map = map
                        return self
                    }

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc public func build() -> ValueObjc {
                        try! safeBuild()
                    }

                    @objc
                    public func safeBuild() throws -> ValueObjc {
                        guard let doubleValue = doubleValue else {
                            throw error(field: "doubleValue")
                        }
                        guard let stringArray = stringArray else {
                            throw error(field: "stringArray")
                        }
                        guard let map = map else {
                            throw error(field: "map")
                        }

                        return ValueObjc(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
                    }
                }
            }

            """#,
            macros: macros
        )
    }
}


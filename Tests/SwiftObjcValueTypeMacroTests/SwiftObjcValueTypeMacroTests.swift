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
                    if let other = object as? ValueObjc {
                        return wrapped == other.wrapped
                    }
                    return false
                }

                public init(wrapped: Value) {
                    self.wrapped = wrapped
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return ValueObjc(wrapped: wrapped)
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


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
            @ObjcValueWrapper(
                nsCopying: true,
                nsCoding: true,
                objcBuilder: true
            )
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

            @objc(Value)
            public class ValueObjc: NSObject, NSCopying, NSCoding {
            
                private static let kDoubleValueKey = "DOUBLE_VALUE"

                private static let kOptIntKey = "OPT_INT"

                private static let kStringArrayKey = "STRING_ARRAY"

                private static let kMapKey = "MAP"
            
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

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.optInt = original.optInt.map(NSNumber.init)
                    self.stringArray = original.stringArray
                    self.map = original.map

                    super.init()
                }

                public override var hash: Int {
                    var hasher = Hasher()
                    hasher.combine(doubleValue)
                    hasher.combine(optInt)
                    hasher.combine((stringArray as NSArray).hash)
                    hasher.combine((map as NSDictionary).hash)
                    return hasher.finalize()
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ValueObjc else {
                        return false
                    }
                    return doubleValue == other.doubleValue && optInt == other.optInt && stringArray == other.stringArray && map == other.map
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    ValueObjc(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: Self.kDoubleValueKey)
                    coder.encode(optInt, forKey: Self.kOptIntKey)
                    coder.encode(stringArray, forKey: Self.kStringArrayKey)
                    coder.encode(map, forKey: Self.kMapKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: Self.kDoubleValueKey)
                    let optInt = coder.decodeObject(forKey: Self.kOptIntKey) as? NSNumber
                    guard let stringArray = coder.decodeObject(forKey: Self.kStringArrayKey) as? [String] else {
                        return nil
                    }
                    guard let map = coder.decodeObject(forKey: Self.kMapKey) as? [String: [String: Double]] else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }

                @objc
                public class ValueBuilder: NSObject {
                    @objc public class func value() -> ValueBuilder {
                        ValueBuilder()
                    }

                    @objc public class func value(existingValue: ValueObjc) -> ValueBuilder {
                        ValueBuilder.value().withDoubleValue(existingValue.doubleValue).withOptInt(existingValue.optInt).withStringArray(existingValue.stringArray).withMap(existingValue.map)
                    }

                    private var doubleValue: Double?

                    @objc @discardableResult
                    public func withDoubleValue(_ doubleValue: Double) -> ValueBuilder {
                        self.doubleValue = doubleValue
                        return self
                    }

                    private var optInt: NSNumber?

                    @objc @discardableResult
                    public func withOptInt(_ optInt: NSNumber?) -> ValueBuilder {
                        self.optInt = optInt
                        return self
                    }

                    private var stringArray: [String]?

                    @objc @discardableResult
                    public func withStringArray(_ stringArray: [String]) -> ValueBuilder {
                        self.stringArray = stringArray
                        return self
                    }

                    private var map: [String: [String: Double]]?

                    @objc @discardableResult
                    public func withMap(_ map: [String: [String: Double]]) -> ValueBuilder {
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
            
            extension Value {
                public init(_ wrapper: ValueObjc) {
                    self.doubleValue = wrapper.doubleValue
                    self.optInt = wrapper.optInt.map(\.int64Value)
                    self.stringArray = wrapper.stringArray
                    self.map = wrapper.map
                }
            }
            """#,
            macros: macros
        )
    }
}


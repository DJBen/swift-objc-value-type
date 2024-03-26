import XCTest
import SwiftSyntax
import TestingSupport
@testable import SwiftObjcValueType

final class SwiftObjcValueTypeTests: XCTestCase {
    private let expectedWrapperClass = #"""
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

        private let wrapped: Value

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
            guard let encodedData = try? JSONEncoder().encode(wrapped) else {
                return
            }
            coder.encode(encodedData)
        }

        public required init?(coder: NSCoder) {
            guard let data = coder.decodeData() else {
                return nil
            }

            guard let wrapped = try? JSONDecoder().decode(Value.self, from: data) else {
                return nil
            }

            self.wrapped = wrapped
            super.init()
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

    """#

    func testValueClass_baseCase() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value: Equatable, Codable {
                    public let doubleValue: Double

                    public let optInt: Int64?

                    public let stringArray: [String]

                    public let map: [String: [String: Double]]
                }

                """#
            }
        )

        assertBuildResult(
            result,
            expectedWrapperClass
        )
    }

    func testValueClass_conformancesInExtension() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value {
                    public let doubleValue: Double

                    public let optInt: Int64?

                    public let stringArray: [String]

                    public let map: [String: [String: Double]]
                }
                """#

                #"""
                extension Value: Equatable, Codable {
                }

                """#
            }
        )

        assertBuildResult(
            result,
            expectedWrapperClass
        )
    }
}

public struct Value: Equatable, Codable {
    public let doubleValue: Double

    public let optInt: Int64?

    public let stringArray: [String]

    public let map: [String: [String: Double]]
}

// Auto generated:
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

    private let wrapped: Value

    @objc
    public init(doubleValue: Double, optInt: NSNumber?, stringArray: [String], map: [String: [String : Double]]) {
        self.wrapped = Value(
            doubleValue: doubleValue,
            optInt: optInt.map(\.int64Value),
            stringArray: stringArray,
            map: map
        )
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
        guard let encodedData = try? JSONEncoder().encode(wrapped) else {
            return
        }
        coder.encode(encodedData)
    }

    public required init?(coder: NSCoder) {
        guard let data = coder.decodeData() else {
            return nil
        }

        guard let wrapped = try? JSONDecoder().decode(Value.self, from: data) else {
            return nil
        }

        self.wrapped = wrapped
        super.init()
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

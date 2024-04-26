import XCTest
import SwiftSyntax
import TestingSupport
@testable import SwiftObjcValueType

final class SwiftObjcValueTypeTests: XCTestCase {
    private let expectedWrapperClass = #"""
    private let kDoubleValueKey = "DOUBLE_VALUE"
    private let kOptIntKey = "OPT_INT"
    private let kStringArrayKey = "STRING_ARRAY"
    private let kMapKey = "MAP"

    @objc(Value)
    public class ValueClass: NSObject, NSCopying, NSCoding {

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

    """#

    func testValueClass_hashable() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value: Hashable, Equatable {
                    public let doubleValue: Double

                    public let optInt: Int64?
                }
                """#
            },
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeObjCBuilder: false
        )

        assertBuildResult(
            result,
            #"""


            @objc(Value)
            public class ValueClass: NSObject, NSCopying {

                @objc public var doubleValue: Double {
                    wrapped.doubleValue
                }

                @objc public var optInt: NSNumber? {
                    wrapped.optInt.map(NSNumber.init)
                }

                public let wrapped: Value

                @objc
                public init(doubleValue: Double, optInt: NSNumber?) {
                    self.wrapped = Value(doubleValue: doubleValue, optInt: optInt.map(\.int64Value))
                }

                public override var hash: Int {
                    var hasher = Hasher()
                    hasher.combine(wrapped)
                    return hasher.finalize()
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

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }
            """#
        )
    }

    func testValueClass_customStringConvertible() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value: CustomStringConvertible {
                    public let doubleValue: Double

                    public var description: String {
                        "placeholder"
                    }
                }

                """#
            },
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeNSCopying: false,
            shouldSynthesizeObjCBuilder: false
        )

        assertBuildResult(
            result,
            """


            @objc(Value)
            public class ValueClass: NSObject {

                @objc public var doubleValue: Double {
                    wrapped.doubleValue
                }

                public let wrapped: Value

                @objc
                public init(doubleValue: Double) {
                    self.wrapped = Value(doubleValue: doubleValue)
                }

                public override var description: String {
                    return wrapped.description
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }
            """
        )
    }

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

    func testAdtClass_baseCase() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                """
                public enum SaveUpdates {

                    case saveBegan(savingToAlpha: Bool, savingToBeta: Bool, savingGamma: Bool)

                    case saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, savedGamma: Bool, displayName: String?)

                    case saveFailed(error: Error?)
                }
                """
            }
        )

        assertBuildResult(
            result,
            #"""


            public typealias SaveUpdatesSaveBeganMatchHandler = (_ savingToAlpha: Bool, _ savingToBeta: Bool, _ savingGamma: Bool) -> Void

            public typealias SaveUpdatesSaveSucceededMatchHandler = (_ savedToAlpha: Bool, _ savedToBeta: Bool, _ savedGamma: Bool, _ displayName: String?) -> Void

            public typealias SaveUpdatesSaveFailedMatchHandler = (_ error: Error?) -> Void

            @objc(SaveUpdates)
            public class SaveUpdatesClass: NSObject, NSCopying {
                
                public let wrapped: SaveUpdates

                @available(*, unavailable) 
                public override init() {
                    fatalError()
                }

                private init(wrapped: SaveUpdates) {
                    self.wrapped = wrapped
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return SaveUpdatesClass(wrapped: wrapped)
                }

                @objc
                public class func saveBegan(savingToAlpha: Bool, savingToBeta: Bool, savingGamma: Bool) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveBegan(savingToAlpha: savingToAlpha, savingToBeta: savingToBeta, savingGamma: savingGamma))
                }

                @objc
                public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, savedGamma: Bool, displayName: String?) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, savedGamma: savedGamma, displayName: displayName))
                }

                @objc
                public class func saveFailed(error: Error?) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveFailed(error: error))
                }

                @objc
                public func match(saveBegan: SaveUpdatesSaveBeganMatchHandler?, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler?, saveFailed: SaveUpdatesSaveFailedMatchHandler?) {
                    switch wrapped {
                    case .saveBegan(let savingToAlpha, let savingToBeta, let savingGamma):
                        saveBegan?(savingToAlpha, savingToBeta, savingGamma)
                    case .saveSucceeded(let savedToAlpha, let savedToBeta, let savedGamma, let displayName):
                        saveSucceeded?(savedToAlpha, savedToBeta, savedGamma, displayName)
                    case .saveFailed(let error):
                        saveFailed?(error)
                    }
                }
            }
            """#
        )
    }
}

public enum SaveUpdates {

    case saveBegan(savingToAlpha: Bool, savingToBeta: Bool, savingGamma: Bool)

    case saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, savedGamma: Bool, displayName: String?)

    case saveFailed(error: Error?)
}

public typealias SaveUpdatesSaveBeganMatchHandler = (_ savingToAlpha: Bool, _ savingToBeta: Bool, _ savingGamma: Bool) -> Void

public typealias SaveUpdatesSaveSucceededMatchHandler = (_ savedToAlpha: Bool, _ savedToBeta: Bool, _ savedGamma: Bool, _ displayName: String?) -> Void

public typealias SaveUpdatesSaveFailedMatchHandler = (_ error: Error?) -> Void

@objc(SaveUpdates)
public class SaveUpdatesClass: NSObject, NSCopying {

    public let wrapped: SaveUpdates

    @available(*, unavailable)
    public override init() {
        fatalError()
    }

    private init(wrapped: SaveUpdates) {
        self.wrapped = wrapped
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        return SaveUpdatesClass(wrapped: wrapped)
    }

    @objc
    public class func saveBegan(savingToAlpha: Bool, savingToBeta: Bool, savingGamma: Bool) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveBegan(savingToAlpha: savingToAlpha, savingToBeta: savingToBeta, savingGamma: savingGamma))
    }

    @objc
    public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, savedGamma: Bool, displayName: String?) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, savedGamma: savedGamma, displayName: displayName))
    }

    @objc
    public class func saveFailed(error: Error?) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveFailed(error: error))
    }

    @objc
    public func match(saveBegan: SaveUpdatesSaveBeganMatchHandler?, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler?, saveFailed: SaveUpdatesSaveFailedMatchHandler?) {
        switch wrapped {
        case .saveBegan(let savingToAlpha, let savingToBeta, let savingGamma):
            saveBegan?(savingToAlpha, savingToBeta, savingGamma)
        case .saveSucceeded(let savedToAlpha, let savedToBeta, let savedGamma, let displayName):
            saveSucceeded?(savedToAlpha, savedToBeta, savedGamma, displayName)
        case .saveFailed(let error):
            saveFailed?(error)
        }
    }
}

public struct Value: Hashable, Equatable, Codable, CustomStringConvertible {
    public let doubleValue: Double

    public let optInt: Int64?

    public let stringArray: [String]

    public let map: [String: [String: Double]]

    public var description: String {
        "placeholder"
    }
}

private let kDoubleValueKey = "DOUBLE_VALUE"
private let kOptIntKey = "OPT_INT"
private let kStringArrayKey = "STRING_ARRAY"
private let kMapKey = "MAP"

// Auto generated:
@objc(Value)
public class ValueClass: NSObject, NSCopying, NSCoding {
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
    public init(doubleValue: Double, optInt: NSNumber?, stringArray: [String], map: [String: [String : Double]]) {
        self.wrapped = Value(
            doubleValue: doubleValue,
            optInt: optInt.map(\.int64Value),
            stringArray: stringArray,
            map: map
        )
    }

    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(wrapped)
        return hasher.finalize()
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

    public override var description: String {
        return wrapped.description
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

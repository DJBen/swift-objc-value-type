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

    func testsValueClass_ignoreDerivedProperties() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                "import Foundation"

                "import CoreGraphics"

                #"""
                public struct Foo: Equatable {
                    // public let rect: CGRect

                    public let str: String
                    public let optDouble: Double?
                    public let isValid: Bool

                    public var isNotValid: Bool {
                        return !isValid
                    }
                }
                """#
            },
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeNSCopying: false,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            #"""
            import Foundation
            import CoreGraphics

            @objc(Foo)
            public class FooClass: NSObject {

                @objc public var str: String {
                    wrapped.str
                }

                @objc public var optDouble: NSNumber? {
                    wrapped.optDouble.map(NSNumber.init)
                }

                @objc public var isValid: Bool {
                    wrapped.isValid
                }

                public let wrapped: Foo

                @objc
                public init(str: String, optDouble: NSNumber?, isValid: Bool) {
                    self.wrapped = Foo(str: str, optDouble: optDouble.map(\.doubleValue), isValid: isValid)
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    if let other = object as? FooClass {
                        return wrapped == other.wrapped
                    }
                    return false
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension FooClass {
                @objc
                public class FooBuilder: NSObject {

                    @objc public var str: String?

                    @objc public var optDouble: NSNumber?

                    @objc public var isValid: NSNumber?

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc
                    public func build() throws -> FooClass {
                        guard let str = str else {
                            throw error(field: "str")
                        }
                        guard let isValid = isValid else {
                            throw error(field: "isValid")
                        }

                        return FooClass(str: str, optDouble: optDouble, isValid: isValid.boolValue)
                    }
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

                    case saveBegan(savingToAlpha: Bool)

                    case saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: Float?, displayName: String?)

                    case saveFailed(error: Error?)
                }
                """
            }
        )

        assertBuildResult(
            result,
            #"""
            private let kCodedSubtypeKey = "CODED_SUBTYPE"
            private let kSaveBeganSavingToAlphaKey = "SAVE_BEGAN_SAVING_TO_ALPHA"
            private let kSaveSucceededSavedToAlphaKey = "SAVE_SUCCEEDED_SAVED_TO_ALPHA"
            private let kSaveSucceededSavedToBetaKey = "SAVE_SUCCEEDED_SAVED_TO_BETA"
            private let kSaveSucceededOptFloatKey = "SAVE_SUCCEEDED_OPT_FLOAT"
            private let kSaveSucceededDisplayNameKey = "SAVE_SUCCEEDED_DISPLAY_NAME"
            private let kSaveFailedErrorKey = "SAVE_FAILED_ERROR"

            public typealias SaveUpdatesSaveBeganMatchHandler = (_ savingToAlpha: Bool) -> Void

            public typealias SaveUpdatesSaveSucceededMatchHandler = (_ savedToAlpha: Bool, _ savedToBeta: Bool, _ optFloat: NSNumber?, _ displayName: String?) -> Void

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

                public func encode(with coder: NSCoder) {
                    switch wrapped {
                    case .saveBegan(let savingToAlpha):
                        coder.encode(savingToAlpha, forKey: kSaveBeganSavingToAlphaKey)
                        coder.encode("SUBTYPE_SAVE_BEGAN", forKey: kCodedSubtypeKey)
                    case .saveSucceeded(let savedToAlpha, let savedToBeta, let optFloat, let displayName):
                        coder.encode(savedToAlpha, forKey: kSaveSucceededSavedToAlphaKey)
                        coder.encode(savedToBeta, forKey: kSaveSucceededSavedToBetaKey)
                        coder.encodeConditionalObject(optFloat, forKey: kSaveSucceededOptFloatKey)
                        coder.encodeConditionalObject(displayName, forKey: kSaveSucceededDisplayNameKey)
                        coder.encode("SUBTYPE_SAVE_SUCCEEDED", forKey: kCodedSubtypeKey)
                    case .saveFailed(let error):
                        coder.encodeConditionalObject(error, forKey: kSaveFailedErrorKey)
                        coder.encode("SUBTYPE_SAVE_FAILED", forKey: kCodedSubtypeKey)
                    }
                }

                public required init?(coder: NSCoder) {
                    guard let codedSubtype = coder.decodeObject(forKey: kCodedSubtypeKey) as? String else {
                        return nil
                    }
                    switch codedSubtype {
                    case "SUBTYPE_SAVE_BEGAN":
                        let savingToAlpha = coder.decodeBool(forKey: kSaveBeganSavingToAlphaKey)
                        self.wrapped = .saveBegan(savingToAlpha: savingToAlpha)
                    case "SUBTYPE_SAVE_SUCCEEDED":
                        let savedToAlpha = coder.decodeBool(forKey: kSaveSucceededSavedToAlphaKey)
                        let savedToBeta = coder.decodeBool(forKey: kSaveSucceededSavedToBetaKey)
                        let optFloat = coder.decodeObject(forKey: kSaveSucceededOptFloatKey) as? NSNumber
                        let displayName = coder.decodeObject(forKey: kSaveSucceededDisplayNameKey) as? String
                        self.wrapped = .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName)
                    case "SUBTYPE_SAVE_FAILED":
                        let error = coder.decodeObject(forKey: kSaveFailedErrorKey) as? Error
                        self.wrapped = .saveFailed(error: error)
                    default:
                        return nil
                    }
                }

                @objc
                public class func saveBegan(savingToAlpha: Bool) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveBegan(savingToAlpha: savingToAlpha))
                }

                @objc
                public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: NSNumber?, displayName: String?) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName))
                }

                @objc
                public class func saveFailed(error: Error?) -> SaveUpdatesClass {
                    return SaveUpdatesClass(wrapped: .saveFailed(error: error))
                }

                @objc
                public func match(saveBegan: SaveUpdatesSaveBeganMatchHandler?, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler?, saveFailed: SaveUpdatesSaveFailedMatchHandler?) {
                    switch wrapped {
                    case .saveBegan(let savingToAlpha):
                        saveBegan?(savingToAlpha)
                    case .saveSucceeded(let savedToAlpha, let savedToBeta, let optFloat, let displayName):
                        saveSucceeded?(savedToAlpha, savedToBeta, optFloat.map(NSNumber.init), displayName)
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

    case saveBegan(savingToAlpha: Bool)

    case saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: Float?, displayName: String?)

    case saveFailed(error: Error?)
}

public typealias SaveUpdatesSaveBeganMatchHandler = (_ savingToAlpha: Bool) -> Void

public typealias SaveUpdatesSaveSucceededMatchHandler = (_ savedToAlpha: Bool, _ savedToBeta: Bool, _ optFloat: NSNumber?, _ displayName: String?) -> Void

public typealias SaveUpdatesSaveFailedMatchHandler = (_ error: Error?) -> Void

private let kCodedSubtypeKey = "CODED_SUBTYPE"
private let kSaveBeganSavingToAlphaKey = "SAVE_BEGAN_SAVING_TO_ALPHA"
private let kSaveSucceededSavedToAlphaKey = "SAVE_SUCCEEDED_SAVED_TO_ALPHA"
private let kSaveSucceededSavedToBetaKey = "SAVE_SUCCEEDED_SAVED_TO_BETA"
private let kSaveSucceededOptFloatKey = "SAVE_SUCCEEDED_OPT_FLOAT"
private let kSaveSucceededDisplayNameKey = "SAVE_SUCCEEDED_DISPLAY_NAME"
private let kSaveFailedErrorKey = "SAVE_FAILED_ERROR"

@objc(SaveUpdates)
public class SaveUpdatesClass: NSObject, NSCopying, NSCoding {

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

    public func encode(with coder: NSCoder) {
        switch wrapped {
        case .saveBegan(let savingToAlpha):
            coder.encode(savingToAlpha, forKey: kSaveBeganSavingToAlphaKey)
            coder.encode("SUBTYPE_SAVE_BEGAN", forKey: kCodedSubtypeKey)
        case .saveSucceeded(let savedToAlpha, let savedToBeta, let optFloat, let displayName):
            coder.encode(savedToAlpha, forKey: kSaveSucceededSavedToAlphaKey)
            coder.encode(savedToBeta, forKey: kSaveSucceededSavedToBetaKey)
            coder.encodeConditionalObject(optFloat, forKey: kSaveSucceededOptFloatKey)
            coder.encodeConditionalObject(displayName, forKey: kSaveSucceededDisplayNameKey)
            coder.encode("SUBTYPE_SAVE_SUCCEEDED", forKey: kCodedSubtypeKey)
        case .saveFailed(let error):
            coder.encodeConditionalObject(error, forKey: kSaveFailedErrorKey)
            coder.encode("SUBTYPE_SAVE_FAILED", forKey: kCodedSubtypeKey)
        }
    }

    public required init?(coder: NSCoder) {
        guard let codedSubtype = coder.decodeObject(forKey: kCodedSubtypeKey) as? String else {
            return nil
        }
        switch codedSubtype {
        case "SUBTYPE_SAVE_BEGAN":
            let savingToAlpha = coder.decodeBool(forKey: kSaveBeganSavingToAlphaKey)
            self.wrapped = .saveBegan(savingToAlpha: savingToAlpha)
        case "SUBTYPE_SAVE_SUCCEEDED":
            let savedToAlpha = coder.decodeBool(forKey: kSaveSucceededSavedToAlphaKey)
            let savedToBeta = coder.decodeBool(forKey: kSaveSucceededSavedToBetaKey)
            let optFloat = coder.decodeObject(forKey: kSaveSucceededOptFloatKey) as? NSNumber
            let displayName = coder.decodeObject(forKey: kSaveSucceededDisplayNameKey) as? String
            self.wrapped = .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName)
        case "SUBTYPE_SAVE_FAILED":
            let error = coder.decodeObject(forKey: kSaveFailedErrorKey) as? Error
            self.wrapped = .saveFailed(error: error)
        default:
            return nil
        }
    }

    @objc
    public class func saveBegan(savingToAlpha: Bool) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveBegan(savingToAlpha: savingToAlpha))
    }

    @objc
    public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: NSNumber?, displayName: String?) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName))
    }

    @objc
    public class func saveFailed(error: Error?) -> SaveUpdatesClass {
        return SaveUpdatesClass(wrapped: .saveFailed(error: error))
    }

    @objc
    public func match(saveBegan: SaveUpdatesSaveBeganMatchHandler?, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler?, saveFailed: SaveUpdatesSaveFailedMatchHandler?) {
        switch wrapped {
        case .saveBegan(let savingToAlpha):
            saveBegan?(savingToAlpha)
        case .saveSucceeded(let savedToAlpha, let savedToBeta, let optFloat, let displayName):
            saveSucceeded?(savedToAlpha, savedToBeta, optFloat.map(NSNumber.init), displayName)
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

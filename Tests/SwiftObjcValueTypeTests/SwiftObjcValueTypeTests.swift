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

    """#

    func testValueObjc_hashable() throws {
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
            public class ValueObjc: NSObject, NSCopying {

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

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }
            """#
        )
    }

    func testsValueObjc_ignoreDerivedProperties() throws {
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
            public class FooObjc: NSObject {

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
                    if let other = object as? FooObjc {
                        return wrapped == other.wrapped
                    }
                    return false
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension FooObjc {
                @objc
                public class FooBuilder: NSObject {
                    @objc public class func foo() -> FooBuilder {
                        FooBuilder()
                    }

                    @objc public class func foo(existingFoo: FooObjc) -> FooObjc {
                        FooBuilder.foo().withStr(existingFoo.str).withOptDouble(existingFoo.optDouble).withIsValid(existingFoo.isValid).build()
                    }

                    private var str: String?

                    @objc @discardableResult public func withStr(_ str: String) -> FooBuilder {
                        self.str = str
                        return self
                    }

                    private var optDouble: NSNumber?

                    @objc @discardableResult public func withOptDouble(_ optDouble: NSNumber?) -> FooBuilder {
                        self.optDouble = optDouble
                        return self
                    }

                    private var isValid: Bool?

                    @objc @discardableResult public func withIsValid(_ isValid: Bool) -> FooBuilder {
                        self.isValid = isValid
                        return self
                    }

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc public func build() -> FooObjc {
                        try! safeBuild()
                    }

                    @objc
                    public func safeBuild() throws -> FooObjc {
                        guard let str = str else {
                            throw error(field: "str")
                        }
                        guard let isValid = isValid else {
                            throw error(field: "isValid")
                        }

                        return FooObjc(str: str, optDouble: optDouble, isValid: isValid)
                    }
                }
            }

            """#
        )
    }

    // If referencing any Swift types that also has objc wrapper, the generated
    // objc wrapper should use the aliased -Objc type in references.
    func testValueObjc_aliasedSwiftTypes() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value: CustomStringConvertible {
                    public let doubleValue: Double

                    public let ref: Value2
                }

                """#
            },
            referencedSwiftTypes: ["Value2"],
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            #"""
            private let kDoubleValueKey = "DOUBLE_VALUE"
            private let kRefKey = "REF"

            @objc(Value)
            public class ValueObjc: NSObject, NSCopying, NSCoding {

                @objc public var doubleValue: Double {
                    wrapped.doubleValue
                }

                @objc public var ref: Value2Objc {
                    Value2Objc(wrapped: wrapped.ref)
                }

                public let wrapped: Value

                @objc
                public init(doubleValue: Double, ref: Value2Objc) {
                    self.wrapped = Value(doubleValue: doubleValue, ref: ref.wrapped)
                }

                public init(wrapped: Value) {
                    self.wrapped = wrapped
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return ValueObjc(wrapped: wrapped)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: kDoubleValueKey)
                    coder.encode(ref, forKey: kRefKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: kDoubleValueKey)
                    guard let ref = coder.decodeObject(forKey: kRefKey) as? Value2Objc else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, ref: ref)
                }

                public override var description: String {
                    return wrapped.description
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
                        ValueBuilder.value().withDoubleValue(existingValue.doubleValue).withRef(existingValue.ref).build()
                    }

                    private var doubleValue: Double?

                    @objc @discardableResult public func withDoubleValue(_ doubleValue: Double) -> ValueBuilder {
                        self.doubleValue = doubleValue
                        return self
                    }

                    private var ref: Value2Objc?

                    @objc @discardableResult public func withRef(_ ref: Value2Objc) -> ValueBuilder {
                        self.ref = ref
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
                        guard let ref = ref else {
                            throw error(field: "ref")
                        }

                        return ValueObjc(doubleValue: doubleValue, ref: ref)
                    }
                }
            }

            """#
        )
    }

    func testValueObjc_customStringConvertible() throws {
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
            public class ValueObjc: NSObject {

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

    func testValueObjc_baseCase() throws {
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

    func testValueObjc_prefix() throws {
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
            },
            prefix: "XY"
        )

        assertBuildResult(
            result,
            #"""
            private let kDoubleValueKey = "DOUBLE_VALUE"
            private let kOptIntKey = "OPT_INT"
            private let kStringArrayKey = "STRING_ARRAY"
            private let kMapKey = "MAP"

            @objc(XYValue)
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
                @objc(XYValueBuilder)
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

            """#
        )
    }

    func testValueObjc_conformancesInExtension() throws {
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
            public class SaveUpdatesObjc: NSObject, NSCopying {
                
                public let wrapped: SaveUpdates

                @available(*, unavailable) 
                public override init() {
                    fatalError()
                }

                public init(wrapped: SaveUpdates) {
                    self.wrapped = wrapped
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return SaveUpdatesObjc(wrapped: wrapped)
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
                public class func saveBegan(savingToAlpha: Bool) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(wrapped: .saveBegan(savingToAlpha: savingToAlpha))
                }

                @objc
                public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: NSNumber?, displayName: String?) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName))
                }

                @objc
                public class func saveFailed(error: Error?) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(wrapped: .saveFailed(error: error))
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
public class SaveUpdatesObjc: NSObject, NSCopying, NSCoding {

    public let wrapped: SaveUpdates

    @available(*, unavailable)
    public override init() {
        fatalError()
    }

    public init(wrapped: SaveUpdates) {
        self.wrapped = wrapped
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        return SaveUpdatesObjc(wrapped: wrapped)
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
    public class func saveBegan(savingToAlpha: Bool) -> SaveUpdatesObjc {
        return SaveUpdatesObjc(wrapped: .saveBegan(savingToAlpha: savingToAlpha))
    }

    @objc
    public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: NSNumber?, displayName: String?) -> SaveUpdatesObjc {
        return SaveUpdatesObjc(wrapped: .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName))
    }

    @objc
    public class func saveFailed(error: Error?) -> SaveUpdatesObjc {
        return SaveUpdatesObjc(wrapped: .saveFailed(error: error))
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

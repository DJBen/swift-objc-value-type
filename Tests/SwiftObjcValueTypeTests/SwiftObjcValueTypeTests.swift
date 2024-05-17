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
            let hashes: [UInt] = [hashDouble(doubleValue), UInt(bitPattern: abs(optInt ?? 0)), UInt(bitPattern: (stringArray as NSArray).hash), UInt(bitPattern: map.hash)]
            return Int(hashImpl(hashes, 4))
        }

        private func hashDouble(_ givenDouble: Double) -> UInt {
            var value = givenDouble
            var bits: UInt64 = 0
            withUnsafeBytes(of: &value) { bytes in
                bits = bytes.load(as: UInt64.self)
            }
            var p = UInt(bits)
            p = (~p) &+ (p << 18)
            p ^= (p >> 31)
            p &*= 21
            p ^= (p >> 11)
            p &+= (p << 6)
            p ^= (p >> 22)
            return p
        }

        private func hashImpl(_ subhashes: UnsafePointer<UInt>, _ length: Int) -> UInt {
            var result = subhashes[0]
            for i in 1 ..< length {
                var base = (UInt64(result) << 32) | UInt64(subhashes[i])
                base = (~base) &+ (base << 18)
                base ^= (base >> 31)
                base &*= 21
                base ^= (base >> 11)
                base &+= (base << 6)
                base ^= (base >> 22)
                result = UInt(base)
            }
            return result
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
            public class ValueObjc: NSObject {
                @objc public let doubleValue: Double

                @objc public let optInt: NSNumber?

                @objc
                public init(doubleValue: Double, optInt: NSNumber?) {
                    self.doubleValue = doubleValue
                    self.optInt = optInt

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.optInt = original.optInt.map(NSNumber.init)

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [hashDouble(doubleValue), UInt(bitPattern: abs(optInt ?? 0))]
                    return Int(hashImpl(hashes, 2))
                }

                private func hashDouble(_ givenDouble: Double) -> UInt {
                    var value = givenDouble
                    var bits: UInt64 = 0
                    withUnsafeBytes(of: &value) { bytes in
                        bits = bytes.load(as: UInt64.self)
                    }
                    var p = UInt(bits)
                    p = (~p) &+ (p << 18)
                    p ^= (p >> 31)
                    p &*= 21
                    p ^= (p >> 11)
                    p &+= (p << 6)
                    p ^= (p >> 22)
                    return p
                }

                private func hashImpl(_ subhashes: UnsafePointer<UInt>, _ length: Int) -> UInt {
                    var result = subhashes[0]
                    for i in 1 ..< length {
                        var base = (UInt64(result) << 32) | UInt64(subhashes[i])
                        base = (~base) &+ (base << 18)
                        base ^= (base >> 31)
                        base &*= 21
                        base ^= (base >> 11)
                        base &+= (base << 6)
                        base ^= (base >> 22)
                        result = UInt(base)
                    }
                    return result
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ValueObjc else {
                        return false
                    }
                    return doubleValue == other.doubleValue && optInt == other.optInt
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
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl"),
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
                // public let rect: CGRect

                @objc public let str: String
                @objc public let optDouble: NSNumber?
                @objc public let isValid: Bool

                @objc
                public init(str: String, optDouble: NSNumber?, isValid: Bool) {
                    self.str = str
                    self.optDouble = optDouble
                    self.isValid = isValid

                    super.init()
                }

                public init(_ original: Foo) {
                    self.str = original.str
                    self.optDouble = original.optDouble.map(NSNumber.init)
                    self.isValid = original.isValid

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [UInt(bitPattern: (str as NSString).hash), hashDouble(optDouble), (isValid ? 1 : 0)]
                    return Int(HashImpl(hashes, 3))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? FooObjc else {
                        return false
                    }
                    return str == other.str && optDouble == other.optDouble && isValid == other.isValid
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

                    @objc @discardableResult 
                    public func withStr(_ str: String) -> FooBuilder {
                        self.str = str
                        return self
                    }

                    private var optDouble: NSNumber?

                    @objc @discardableResult 
                    public func withOptDouble(_ optDouble: NSNumber?) -> FooBuilder {
                        self.optDouble = optDouble
                        return self
                    }

                    private var isValid: Bool?

                    @objc @discardableResult 
                    public func withIsValid(_ isValid: Bool) -> FooBuilder {
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
                // Some other comments
                // @value_object swift_types_with_wrapper ["Foo"] // TODO: remove
                public struct Value: CustomStringConvertible {
                    public let doubleValue: Double

                    public let ref: Value2

                    public let ref2: [Int: [Bar]]

                    public let ref3: [Bar]?

                    public let foo: Foo
                }

                """#
            },
            referencedSwiftTypes: ["Value2", "Bar"],
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            #"""


            private let kDoubleValueKey = "DOUBLE_VALUE"
            private let kRefKey = "REF"
            private let kRef2Key = "REF2"
            private let kRef3Key = "REF3"
            private let kFooKey = "FOO"

            @objc(Value)
            public class ValueObjc: NSObject, NSCopying, NSCoding {
                @objc public let doubleValue: Double

                @objc public let ref: Value2Objc

                @objc public let ref2: [Int: [BarObjc]]

                @objc public let ref3: [BarObjc]?

                @objc public let foo: FooObjc

                @objc
                public init(doubleValue: Double, ref: Value2Objc, ref2: [Int: [BarObjc]], ref3: [BarObjc]?, foo: FooObjc) {
                    self.doubleValue = doubleValue
                    self.ref = ref
                    self.ref2 = ref2
                    self.ref3 = ref3
                    self.foo = foo

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.ref = Value2Objc(original.ref)
                    self.ref2 = original.ref2.mapValues({ a0 in
                            a0.map({ a1 in
                                    BarObjc(a1)
                                })
                        })
                    self.ref3 = original.ref3?.map({ a0 in
                            BarObjc(a0)
                        })
                    self.foo = FooObjc(original.foo)

                    super.init()
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    ValueObjc(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: kDoubleValueKey)
                    coder.encode(ref, forKey: kRefKey)
                    coder.encode(ref2, forKey: kRef2Key)
                    coder.encodeConditionalObject(ref3, forKey: kRef3Key)
                    coder.encode(foo, forKey: kFooKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: kDoubleValueKey)
                    guard let ref = coder.decodeObject(forKey: kRefKey) as? Value2Objc else {
                        return nil
                    }
                    guard let ref2 = coder.decodeObject(forKey: kRef2Key) as? [Int: [BarObjc]] else {
                        return nil
                    }
                    let ref3 = coder.decodeObject(forKey: kRef3Key) as? [BarObjc]
                    guard let foo = coder.decodeObject(forKey: kFooKey) as? FooObjc else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo)
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
                        ValueBuilder.value().withDoubleValue(existingValue.doubleValue).withRef(existingValue.ref).withRef2(existingValue.ref2).withRef3(existingValue.ref3).withFoo(existingValue.foo).build()
                    }

                    private var doubleValue: Double?

                    @objc @discardableResult 
                    public func withDoubleValue(_ doubleValue: Double) -> ValueBuilder {
                        self.doubleValue = doubleValue
                        return self
                    }

                    private var ref: Value2Objc?

                    @objc @discardableResult 
                    public func withRef(_ ref: Value2Objc) -> ValueBuilder {
                        self.ref = ref
                        return self
                    }

                    private var ref2: [Int: [BarObjc]]?

                    @objc @discardableResult 
                    public func withRef2(_ ref2: [Int: [BarObjc]]) -> ValueBuilder {
                        self.ref2 = ref2
                        return self
                    }

                    private var ref3: [BarObjc]?

                    @objc @discardableResult 
                    public func withRef3(_ ref3: [BarObjc]?) -> ValueBuilder {
                        self.ref3 = ref3
                        return self
                    }

                    private var foo: FooObjc?

                    @objc @discardableResult
                    public func withFoo(_ foo: FooObjc) -> ValueBuilder {
                        self.foo = foo
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
                        guard let ref2 = ref2 else {
                            throw error(field: "ref2")
                        }
                        guard let foo = foo else {
                            throw error(field: "foo")
                        }

                        return ValueObjc(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo)
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
                @objc public let doubleValue: Double

                @objc
                public init(doubleValue: Double) {
                    self.doubleValue = doubleValue

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue

                    super.init()
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
                // @value_object NSCoding Builder
                // @value_object NSCoding NSCopying
                public struct Value: Equatable {
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
                public struct Value: Equatable {
                    public let doubleValue: Double

                    public let optInt: Int64?

                    public let stringArray: [String]

                    public let map: [String: [String: Double]]
                }

                """#
            },
            prefix: "XY",
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashFloatFunc: "HashFloat", hashDoubleFunc: "HashDouble"),
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
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
                    let hashes: [UInt] = [HashDouble(doubleValue), UInt(bitPattern: abs(optInt ?? 0)), UInt(bitPattern: (stringArray as NSArray).hash), UInt(bitPattern: map.hash)]
                    return Int(HashImpl(hashes, 4))
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
            },
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            expectedWrapperClass
        )
    }

    func testValueObjc_cgTypes() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                "import Foundation"

                "import UIKit"

                #"""
                /// Another value type
                public struct StoriesOther: Equatable {

                    /// The original size of the product image
                    public let productImageSize: CGSize

                    /// The frame of the custom image within the original product image
                    public let frame: CGRect

                    /// The rotation angle in degrees (clockwise) of the custom image
                    public let rotationAngle: CGFloat

                    public init(productImageSize: CGSize, frame: CGRect, rotationAngle: CGFloat) {
                        self.productImageSize = productImageSize
                        self.frame = frame
                        self.rotationAngle = rotationAngle
                    }
                }
                """#
            },
            prefix: "SC",
            externalHashSettings: ExternalHashSettings(libary: "HashUtils", hashFunc: "ObjcHash", hashFloatFunc: "ObjcHashFloat", hashDoubleFunc: "ObjcHashDouble"),
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            #"""
            import Foundation
            import UIKit
            import HashUtils

            private let kProductImageSizeKey = "PRODUCT_IMAGE_SIZE"
            private let kFrameKey = "FRAME"
            private let kRotationAngleKey = "ROTATION_ANGLE"

            @objc(SCStoriesOther)
            public class StoriesOtherObjc: NSObject, NSCopying, NSCoding {

                /// The original size of the product image
                @objc public let productImageSize: CGSize

                /// The frame of the custom image within the original product image
                @objc public let frame: CGRect

                /// The rotation angle in degrees (clockwise) of the custom image
                @objc public let rotationAngle: CGFloat

                @objc
                public init(productImageSize: CGSize, frame: CGRect, rotationAngle: CGFloat) {
                    self.productImageSize = productImageSize
                    self.frame = frame
                    self.rotationAngle = rotationAngle

                    super.init()
                }

                public init(_ original: StoriesOther) {
                    self.productImageSize = original.productImageSize
                    self.frame = original.frame
                    self.rotationAngle = original.rotationAngle

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [ObjcHashDouble(productImageSize.width), ObjcHashDouble(productImageSize.height), ObjcHashDouble(frame.origin.x), ObjcHashDouble(frame.origin.y), ObjcHashDouble(frame.size.width), ObjcHashDouble(frame.size.height), ObjcHashDouble(rotationAngle)]
                    return Int(ObjcHash(hashes, 3))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? StoriesOtherObjc else {
                        return false
                    }
                    return productImageSize == other.productImageSize && frame == other.frame && rotationAngle == other.rotationAngle
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    StoriesOtherObjc(productImageSize: productImageSize, frame: frame, rotationAngle: rotationAngle)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(productImageSize, forKey: kProductImageSizeKey)
                    coder.encode(frame, forKey: kFrameKey)
                    coder.encode(Double(rotationAngle), forKey: kRotationAngleKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let productImageSize = coder.decodeCGSize(forKey: kProductImageSizeKey)
                    let frame = coder.decodeCGRect(forKey: kFrameKey)
                    let rotationAngle = CGFloat(coder.decodeDouble(forKey: kRotationAngleKey))
                    self.init(productImageSize: productImageSize, frame: frame, rotationAngle: rotationAngle)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension StoriesOtherObjc {
                @objc(SCStoriesOtherBuilder)
                public class StoriesOtherBuilder: NSObject {
                    @objc public class func storiesOther() -> StoriesOtherBuilder {
                        StoriesOtherBuilder()
                    }

                    @objc public class func storiesOther(existingStoriesOther: StoriesOtherObjc) -> StoriesOtherObjc {
                        StoriesOtherBuilder.storiesOther().withProductImageSize(existingStoriesOther.productImageSize).withFrame(existingStoriesOther.frame).withRotationAngle(existingStoriesOther.rotationAngle).build()
                    }

                    private var productImageSize: CGSize?

                    @objc @discardableResult 
                    public func withProductImageSize(_ productImageSize: CGSize) -> StoriesOtherBuilder {
                        self.productImageSize = productImageSize
                        return self
                    }

                    private var frame: CGRect?

                    @objc @discardableResult 
                    public func withFrame(_ frame: CGRect) -> StoriesOtherBuilder {
                        self.frame = frame
                        return self
                    }

                    private var rotationAngle: CGFloat?

                    @objc @discardableResult 
                    public func withRotationAngle(_ rotationAngle: CGFloat) -> StoriesOtherBuilder {
                        self.rotationAngle = rotationAngle
                        return self
                    }

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc public func build() -> StoriesOtherObjc {
                        try! safeBuild()
                    }

                    @objc
                    public func safeBuild() throws -> StoriesOtherObjc {
                        guard let productImageSize = productImageSize else {
                            throw error(field: "productImageSize")
                        }
                        guard let frame = frame else {
                            throw error(field: "frame")
                        }
                        guard let rotationAngle = rotationAngle else {
                            throw error(field: "rotationAngle")
                        }

                        return StoriesOtherObjc(productImageSize: productImageSize, frame: frame, rotationAngle: rotationAngle)
                    }
                }
            }

            """#
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
            },
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true
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

            private enum SaveUpdatesSubtype: Int, Equatable {
                case saveBegan
                case saveSucceeded
                case saveFailed
            }

            public typealias SaveUpdatesSaveBeganMatchHandler = (_ savingToAlpha: Bool) -> Void

            public typealias SaveUpdatesSaveSucceededMatchHandler = (_ savedToAlpha: Bool, _ savedToBeta: Bool, _ optFloat: NSNumber?, _ displayName: String?) -> Void

            public typealias SaveUpdatesSaveFailedMatchHandler = (_ error: Error?) -> Void

            @objc(SaveUpdates)
            public class SaveUpdatesObjc: NSObject, NSCopying {
                private let subtype: SaveUpdatesSubtype
                private let saveBeganSavingToAlpha: Bool?
                private let saveSucceededSavedToAlpha: Bool?
                private let saveSucceededSavedToBeta: Bool?
                private let saveSucceededOptFloat: NSNumber?
                private let saveSucceededDisplayName: String?
                private let saveFailedError: Error?

                private init(subtype: SaveUpdatesSubtype, saveBeganSavingToAlpha: Bool? = nil, saveSucceededSavedToAlpha: Bool? = nil, saveSucceededSavedToBeta: Bool? = nil, saveSucceededOptFloat: NSNumber? = nil, saveSucceededDisplayName: String? = nil, saveFailedError: Error? = nil) {
                    self.subtype = subtype
                    self.saveBeganSavingToAlpha = saveBeganSavingToAlpha
                    self.saveSucceededSavedToAlpha = saveSucceededSavedToAlpha
                    self.saveSucceededSavedToBeta = saveSucceededSavedToBeta
                    self.saveSucceededOptFloat = saveSucceededOptFloat
                    self.saveSucceededDisplayName = saveSucceededDisplayName
                    self.saveFailedError = saveFailedError

                    super.init()
                }

                public convenience init(_ original: SaveUpdates) {
                    switch original {
                    case .saveBegan(let savingToAlpha):
                        self.init(subtype: .saveBegan, saveBeganSavingToAlpha: savingToAlpha)
                    case .saveSucceeded(let savedToAlpha, let savedToBeta, let optFloat, let displayName):
                        self.init(subtype: .saveSucceeded, saveSucceededSavedToAlpha: savedToAlpha, saveSucceededSavedToBeta: savedToBeta, saveSucceededOptFloat: optFloat.map(NSNumber.init), saveSucceededDisplayName: displayName)
                    case .saveFailed(let error):
                        self.init(subtype: .saveFailed, saveFailedError: error)
                    }
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    return self
                }

                public func encode(with coder: NSCoder) {
                    switch subtype {
                    case .saveBegan:
                        coder.encode(saveBeganSavingToAlpha, forKey: kSaveBeganSavingToAlphaKey)
                        coder.encode("SUBTYPE_SAVE_BEGAN", forKey: kCodedSubtypeKey)
                    case .saveSucceeded:
                        coder.encode(saveSucceededSavedToAlpha, forKey: kSaveSucceededSavedToAlphaKey)
                        coder.encode(saveSucceededSavedToBeta, forKey: kSaveSucceededSavedToBetaKey)
                        coder.encodeConditionalObject(saveSucceededOptFloat, forKey: kSaveSucceededOptFloatKey)
                        coder.encodeConditionalObject(saveSucceededDisplayName, forKey: kSaveSucceededDisplayNameKey)
                        coder.encode("SUBTYPE_SAVE_SUCCEEDED", forKey: kCodedSubtypeKey)
                    case .saveFailed:
                        coder.encodeConditionalObject(saveFailedError, forKey: kSaveFailedErrorKey)
                        coder.encode("SUBTYPE_SAVE_FAILED", forKey: kCodedSubtypeKey)
                    }
                }

                public required convenience init?(coder: NSCoder) {
                    guard let codedSubtype = coder.decodeObject(forKey: kCodedSubtypeKey) as? String else {
                        return nil
                    }
                    switch codedSubtype {
                    case "SUBTYPE_SAVE_BEGAN":
                        let savingToAlpha = coder.decodeBool(forKey: kSaveBeganSavingToAlphaKey)
                        self.init(subtype: .saveBegan, saveBeganSavingToAlpha: savingToAlpha)
                    case "SUBTYPE_SAVE_SUCCEEDED":
                        let savedToAlpha = coder.decodeBool(forKey: kSaveSucceededSavedToAlphaKey)
                        let savedToBeta = coder.decodeBool(forKey: kSaveSucceededSavedToBetaKey)
                        let optFloat = coder.decodeObject(forKey: kSaveSucceededOptFloatKey) as? NSNumber
                        let displayName = coder.decodeObject(forKey: kSaveSucceededDisplayNameKey) as? String
                        self.init(subtype: .saveSucceeded, saveSucceededSavedToAlpha: savedToAlpha, saveSucceededSavedToBeta: savedToBeta, saveSucceededOptFloat: optFloat.map(\.floatValue), saveSucceededDisplayName: displayName)
                    case "SUBTYPE_SAVE_FAILED":
                        let error = coder.decodeObject(forKey: kSaveFailedErrorKey) as? Error
                        self.init(subtype: .saveFailed, saveFailedError: error)
                    default:
                        return nil
                    }
                }

                @objc
                public class func saveBegan(savingToAlpha: Bool) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(subtype: .saveBegan, saveBeganSavingToAlpha: savingToAlpha)
                }

                @objc
                public class func saveSucceeded(savedToAlpha: Bool, savedToBeta: Bool, optFloat: NSNumber?, displayName: String?) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(subtype: .saveSucceeded, saveSucceededSavedToAlpha: savedToAlpha, saveSucceededSavedToBeta: savedToBeta, saveSucceededOptFloat: optFloat, saveSucceededDisplayName: displayName)
                }

                @objc
                public class func saveFailed(error: Error?) -> SaveUpdatesObjc {
                    return SaveUpdatesObjc(subtype: .saveFailed, saveFailedError: error)
                }

                @objc
                public func matchSaveBegan(_ saveBegan: SaveUpdatesSaveBeganMatchHandler?, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler?, saveFailed: SaveUpdatesSaveFailedMatchHandler?) {
                    switch subtype {
                    case .saveBegan:
                        saveBegan?(saveBeganSavingToAlpha!)
                    case .saveSucceeded:
                        saveSucceeded?(saveSucceededSavedToAlpha!, saveSucceededSavedToBeta!, saveSucceededOptFloat.map(NSNumber.init), saveSucceededDisplayName)
                    case .saveFailed:
                        saveFailed?(saveFailedError)
                    }
                }
            }
            """#
        )
    }
}

import XCTest
import SwiftSyntax
import TestingSupport
@testable import SwiftObjcValueType

final class SwiftObjcValueTypeTests: XCTestCase {
    private let expectedWrapperClass = #"""

    
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
            let hashes: [UInt] = [hashDouble(doubleValue), UInt(bitPattern: optInt?.hash ?? 0), UInt(bitPattern: (stringArray as NSArray).hash), UInt(bitPattern: (map as NSDictionary).hash)]
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
            return doubleValue == other.doubleValue && optInt?.isEqual(other.optInt) == true && stringArray == other.stringArray && map == other.map
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
    """#

    func testValueObjc_hashable() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct Value: Hashable, Equatable {
                    public let doubleValue: Double

                    public let optInt: Int64?

                    public let optDouble: TimeInterval?
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

                @objc public let optDouble: NSNumber?

                @objc
                public init(doubleValue: Double, optInt: NSNumber?, optDouble: NSNumber?) {
                    self.doubleValue = doubleValue
                    self.optInt = optInt
                    self.optDouble = optDouble

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.optInt = original.optInt.map(NSNumber.init)
                    self.optDouble = original.optDouble.map(NSNumber.init)

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [hashDouble(doubleValue), UInt(bitPattern: optInt?.hash ?? 0), UInt(bitPattern: optDouble?.hash ?? 0)]
                    return Int(hashImpl(hashes, 3))
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
                    return doubleValue == other.doubleValue && optInt?.isEqual(other.optInt) == true && optDouble?.isEqual(other.optDouble) == true
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension Value {
                public init(_ wrapper: ValueObjc) {
                    self.doubleValue = wrapper.doubleValue
                    self.optInt = wrapper.optInt.map(\.int64Value)
                    self.optDouble = wrapper.optDouble.map(\.doubleValue)
                }
            }
            """#
        )
    }

    func testValueObjc_ignoreDerivedProperties() throws {
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
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashDoubleFunc: "HashDouble"),
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
                    let hashes: [UInt] = [UInt(bitPattern: (str as NSString).hash), UInt(bitPattern: optDouble?.hash ?? 0), (isValid ? 1 : 0)]
                    return Int(HashImpl(hashes, 3))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? FooObjc else {
                        return false
                    }
                    return str == other.str && optDouble?.isEqual(other.optDouble) == true && isValid == other.isValid
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }

                @objc
                public class FooBuilder: NSObject {
                    @objc public class func foo() -> FooBuilder {
                        FooBuilder()
                    }

                    @objc public class func foo(existingFoo: FooObjc) -> FooBuilder {
                        FooBuilder.foo().withStr(existingFoo.str).withOptDouble(existingFoo.optDouble).withIsValid(existingFoo.isValid)
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

            extension Foo {
                public init(_ wrapper: FooObjc) {
                    self.str = wrapper.str
                    self.optDouble = wrapper.optDouble.map(\.doubleValue)
                    self.isValid = wrapper.isValid
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
                """
                import ABC
                """

                #"""

                /// Some other comments
                /// @value_object swift_types_with_wrapper ["Foo", "Bab"] // TODO: remove
                public struct Value: CustomStringConvertible {
                    public let doubleValue: Double

                    public let ref: Value2

                    public let ref2: [Int: [Bar]]

                    public let ref3: [Bar]?

                    public let foo: [Foo]

                    public let ref4: Set<Bar>
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
            import ABC

            @objc(Value)
            public class ValueObjc: NSObject, NSCopying, NSCoding {
                
                private static let kDoubleValueKey = "DOUBLE_VALUE"
            
                private static let kRefKey = "REF"
            
                private static let kRef2Key = "REF2"
            
                private static let kRef3Key = "REF3"
            
                private static let kFooKey = "FOO"
            
                private static let kRef4Key = "REF4"

                @objc public let doubleValue: Double

                @objc public let ref: Value2Objc

                @objc public let ref2: [Int: [BarObjc]]

                @objc public let ref3: [BarObjc]?

                @objc public let foo: [FooObjc]

                @objc public let ref4: Set<BarObjc>

                @objc
                public init(doubleValue: Double, ref: Value2Objc, ref2: [Int: [BarObjc]], ref3: [BarObjc]?, foo: [FooObjc], ref4: Set<BarObjc>) {
                    self.doubleValue = doubleValue
                    self.ref = ref
                    self.ref2 = ref2
                    self.ref3 = ref3
                    self.foo = foo
                    self.ref4 = ref4

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
                    self.foo = original.foo.map({ a0 in
                            FooObjc(a0)
                        })
                    self.ref4 = Set(original.ref4.map({ a0 in
                                BarObjc(a0)
                            }))

                    super.init()
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    ValueObjc(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo, ref4: ref4)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: Self.kDoubleValueKey)
                    coder.encode(ref, forKey: Self.kRefKey)
                    coder.encode(ref2, forKey: Self.kRef2Key)
                    coder.encode(ref3, forKey: Self.kRef3Key)
                    coder.encode(foo, forKey: Self.kFooKey)
                    coder.encode(ref4, forKey: Self.kRef4Key)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: Self.kDoubleValueKey)
                    guard let ref = coder.decodeObject(forKey: Self.kRefKey) as? Value2Objc else {
                        return nil
                    }
                    guard let ref2 = coder.decodeObject(forKey: Self.kRef2Key) as? [Int: [BarObjc]] else {
                        return nil
                    }
                    let ref3 = coder.decodeObject(forKey: Self.kRef3Key) as? [BarObjc]
                    guard let foo = coder.decodeObject(forKey: Self.kFooKey) as? [FooObjc] else {
                        return nil
                    }
                    guard let ref4 = coder.decodeObject(forKey: Self.kRef4Key) as? Set<BarObjc> else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo, ref4: ref4)
                }

                public override var description: String {
                    return wrapped.description
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
                        ValueBuilder.value().withDoubleValue(existingValue.doubleValue).withRef(existingValue.ref).withRef2(existingValue.ref2).withRef3(existingValue.ref3).withFoo(existingValue.foo).withRef4(existingValue.ref4)
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

                    private var foo: [FooObjc]?

                    @objc @discardableResult
                    public func withFoo(_ foo: [FooObjc]) -> ValueBuilder {
                        self.foo = foo
                        return self
                    }

                    private var ref4: Set<BarObjc>?

                    @objc @discardableResult
                    public func withRef4(_ ref4: Set<BarObjc>) -> ValueBuilder {
                        self.ref4 = ref4
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
                        guard let ref4 = ref4 else {
                            throw error(field: "ref4")
                        }

                        return ValueObjc(doubleValue: doubleValue, ref: ref, ref2: ref2, ref3: ref3, foo: foo, ref4: ref4)
                    }
                }
            }
            
            extension Value {
                public init(_ wrapper: ValueObjc) {
                    self.doubleValue = wrapper.doubleValue
                    self.ref = Value2(wrapper.ref)
                    self.ref2 = wrapper.ref2.mapValues({ a0 in
                            a0.map({ a1 in
                                    Bar(a1)
                                })
                        })
                    self.ref3 = wrapper.ref3?.map({ a0 in
                            Bar(a0)
                        })
                    self.foo = wrapper.foo.map({ a0 in
                            Foo(a0)
                        })
                    self.ref4 = Set(wrapper.ref4.map({ a0 in
                                Bar(a0)
                            }))
                }
            }
            """#
        )
    }

    func testValueObjc_nsEnumTypes() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                """
                import ABC
                """

                #"""

                /// Some other comments
                /// @value_object ns_enum_types {"EnumType": "UInt"}
                /// @value_object NSCoding
                public struct Value: Equatable {
                    public let doubleValue: Double

                    public let enumType: EnumType
                }

                """#
            },
            externalHashSettings: ExternalHashSettings(
                hashFunc: "HashImpl",
                hashFloatFunc: "HashFloat",
                hashDoubleFunc: "HashDouble",
                isUnsafePointer: true
            )
        )

        assertBuildResult(
            result,
            #"""
            import ABC

            @objc(Value)
            public class ValueObjc: NSObject, NSCoding {
            
                private static let kDoubleValueKey = "DOUBLE_VALUE"
            
                private static let kEnumTypeKey = "ENUM_TYPE"
            
                @objc public let doubleValue: Double

                @objc public let enumType: EnumType

                @objc
                public init(doubleValue: Double, enumType: EnumType) {
                    self.doubleValue = doubleValue
                    self.enumType = enumType

                    super.init()
                }

                public init(_ original: Value) {
                    self.doubleValue = original.doubleValue
                    self.enumType = original.enumType

                    super.init()
                }

                public override var hash: Int {
                    var hashes: [UInt] = [HashDouble(doubleValue), UInt(bitPattern: enumType.rawValue)]
                    return Int(hashes.withUnsafeMutableBufferPointer { p in
                        HashImpl(p.baseAddress, 2)
                        })
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ValueObjc else {
                        return false
                    }
                    return doubleValue == other.doubleValue && enumType == other.enumType
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(doubleValue, forKey: Self.kDoubleValueKey)
                    coder.encode(enumType.rawValue, forKey: Self.kEnumTypeKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let doubleValue = coder.decodeDouble(forKey: Self.kDoubleValueKey)
                    guard let enumType = EnumType(rawValue: coder.decodeInteger(forKey: Self.kEnumTypeKey)) else {
                        return nil
                    }
                    self.init(doubleValue: doubleValue, enumType: enumType)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension Value {
                public init(_ wrapper: ValueObjc) {
                    self.doubleValue = wrapper.doubleValue
                    self.enumType = wrapper.enumType
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

            extension Value {
                public init(_ wrapper: ValueObjc) {
                    self.doubleValue = wrapper.doubleValue
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

    func testValueObjc_duplicatePrefix() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                #"""
                public struct ABValue: Equatable {
                    public let value: String
                }

                """#
            },
            prefix: "AB",
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashFloatFunc: "HashFloat", hashDoubleFunc: "HashDouble"),
            shouldSynthesizeNSCoding: true,
            shouldSynthesizeNSCopying: true,
            shouldSynthesizeObjCBuilder: true
        )

        assertBuildResult(
            result,
            #"""


            @objc(ABValue)
            public class ABValueObjc: NSObject, NSCopying, NSCoding {
            
                private static let kValueKey = "VALUE"

                @objc public let value: String

                @objc
                public init(value: String) {
                    self.value = value

                    super.init()
                }

                public init(_ original: ABValue) {
                    self.value = original.value

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [UInt(bitPattern: (value as NSString).hash)]
                    return Int(HashImpl(hashes, 1))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ABValueObjc else {
                        return false
                    }
                    return value == other.value
                }

                public func copy(with zone: NSZone? = nil) -> Any {
                    ABValueObjc(value: value)
                }

                public func encode(with coder: NSCoder) {
                    coder.encode(value, forKey: Self.kValueKey)
                }

                public required convenience init?(coder: NSCoder) {
                    guard let value = coder.decodeObject(forKey: Self.kValueKey) as? String else {
                        return nil
                    }
                    self.init(value: value)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }

                @objc(ABValueBuilder)
                public class ABValueBuilder: NSObject {
                    @objc public class func aBValue() -> ABValueBuilder {
                        ABValueBuilder()
                    }

                    @objc public class func aBValue(existingABValue: ABValueObjc) -> ABValueBuilder {
                        ABValueBuilder.aBValue().withValue(existingABValue.value)
                    }

                    private var value: String?

                    @objc @discardableResult
                    public func withValue(_ value: String) -> ABValueBuilder {
                        self.value = value
                        return self
                    }

                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }

                    @objc public func build() -> ABValueObjc {
                        try! safeBuild()
                    }

                    @objc
                    public func safeBuild() throws -> ABValueObjc {
                        guard let value = value else {
                            throw error(field: "value")
                        }

                        return ABValueObjc(value: value)
                    }
                }
            }

            extension ABValue {
                public init(_ wrapper: ABValueObjc) {
                    self.value = wrapper.value
                }
            }
            """#
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


            @objc(XYValue)
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
                    let hashes: [UInt] = [HashDouble(doubleValue), UInt(bitPattern: optInt?.hash ?? 0), UInt(bitPattern: (stringArray as NSArray).hash), UInt(bitPattern: (map as NSDictionary).hash)]
                    return Int(HashImpl(hashes, 4))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? ValueObjc else {
                        return false
                    }
                    return doubleValue == other.doubleValue && optInt?.isEqual(other.optInt) == true && stringArray == other.stringArray && map == other.map
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

                @objc(XYValueBuilder)
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

            @objc(SCStoriesOther)
            public class StoriesOtherObjc: NSObject, NSCopying, NSCoding {
            
                private static let kProductImageSizeKey = "PRODUCT_IMAGE_SIZE"
                
                private static let kFrameKey = "FRAME"
                
                private static let kRotationAngleKey = "ROTATION_ANGLE"
            
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
                    return Int(ObjcHash(hashes, 7))
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
                    coder.encode(productImageSize, forKey: Self.kProductImageSizeKey)
                    coder.encode(frame, forKey: Self.kFrameKey)
                    coder.encode(Double(rotationAngle), forKey: Self.kRotationAngleKey)
                }

                public required convenience init?(coder: NSCoder) {
                    let productImageSize = coder.decodeCGSize(forKey: Self.kProductImageSizeKey)
                    let frame = coder.decodeCGRect(forKey: Self.kFrameKey)
                    let rotationAngle = CGFloat(coder.decodeDouble(forKey: Self.kRotationAngleKey))
                    self.init(productImageSize: productImageSize, frame: frame, rotationAngle: rotationAngle)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            
                @objc(SCStoriesOtherBuilder)
                public class StoriesOtherBuilder: NSObject {
                    @objc public class func storiesOther() -> StoriesOtherBuilder {
                        StoriesOtherBuilder()
                    }

                    @objc public class func storiesOther(existingStoriesOther: StoriesOtherObjc) -> StoriesOtherBuilder {
                        StoriesOtherBuilder.storiesOther().withProductImageSize(existingStoriesOther.productImageSize).withFrame(existingStoriesOther.frame).withRotationAngle(existingStoriesOther.rotationAngle)
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
            
            extension StoriesOther {
                public init(_ wrapper: StoriesOtherObjc) {
                    self.productImageSize = wrapper.productImageSize
                    self.frame = wrapper.frame
                    self.rotationAngle = wrapper.rotationAngle
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
            
                private static let kCodedSubtypeKey = "CODED_SUBTYPE"
                
                private static let kSaveBeganSavingToAlphaKey = "SAVE_BEGAN_SAVING_TO_ALPHA"
                
                private static let kSaveSucceededSavedToAlphaKey = "SAVE_SUCCEEDED_SAVED_TO_ALPHA"
                
                private static let kSaveSucceededSavedToBetaKey = "SAVE_SUCCEEDED_SAVED_TO_BETA"
                
                private static let kSaveSucceededOptFloatKey = "SAVE_SUCCEEDED_OPT_FLOAT"
                
                private static let kSaveSucceededDisplayNameKey = "SAVE_SUCCEEDED_DISPLAY_NAME"
                
                private static let kSaveFailedErrorKey = "SAVE_FAILED_ERROR"

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
                        coder.encode(saveBeganSavingToAlpha, forKey: Self.kSaveBeganSavingToAlphaKey)
                        coder.encode("SUBTYPE_SAVE_BEGAN", forKey: Self.kCodedSubtypeKey)
                    case .saveSucceeded:
                        coder.encode(saveSucceededSavedToAlpha, forKey: Self.kSaveSucceededSavedToAlphaKey)
                        coder.encode(saveSucceededSavedToBeta, forKey: Self.kSaveSucceededSavedToBetaKey)
                        coder.encode(saveSucceededOptFloat, forKey: Self.kSaveSucceededOptFloatKey)
                        coder.encode(saveSucceededDisplayName, forKey: Self.kSaveSucceededDisplayNameKey)
                        coder.encode("SUBTYPE_SAVE_SUCCEEDED", forKey: Self.kCodedSubtypeKey)
                    case .saveFailed:
                        coder.encode(saveFailedError, forKey: Self.kSaveFailedErrorKey)
                        coder.encode("SUBTYPE_SAVE_FAILED", forKey: Self.kCodedSubtypeKey)
                    }
                }

                public required convenience init?(coder: NSCoder) {
                    guard let codedSubtype = coder.decodeObject(forKey: Self.kCodedSubtypeKey) as? String else {
                        return nil
                    }
                    switch codedSubtype {
                    case "SUBTYPE_SAVE_BEGAN":
                        let savingToAlpha = coder.decodeBool(forKey: Self.kSaveBeganSavingToAlphaKey)
                        self.init(subtype: .saveBegan, saveBeganSavingToAlpha: savingToAlpha)
                    case "SUBTYPE_SAVE_SUCCEEDED":
                        let savedToAlpha = coder.decodeBool(forKey: Self.kSaveSucceededSavedToAlphaKey)
                        let savedToBeta = coder.decodeBool(forKey: Self.kSaveSucceededSavedToBetaKey)
                        let optFloat = coder.decodeObject(forKey: Self.kSaveSucceededOptFloatKey) as? NSNumber
                        let displayName = coder.decodeObject(forKey: Self.kSaveSucceededDisplayNameKey) as? String
                        self.init(subtype: .saveSucceeded, saveSucceededSavedToAlpha: savedToAlpha, saveSucceededSavedToBeta: savedToBeta, saveSucceededOptFloat: optFloat.map(\.floatValue), saveSucceededDisplayName: displayName)
                    case "SUBTYPE_SAVE_FAILED":
                        let error = coder.decodeObject(forKey: Self.kSaveFailedErrorKey) as? Error
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
                public func matchSaveBegan(_ saveBegan: SaveUpdatesSaveBeganMatchHandler, saveSucceeded: SaveUpdatesSaveSucceededMatchHandler, saveFailed: SaveUpdatesSaveFailedMatchHandler) {
                    switch subtype {
                    case .saveBegan:
                        saveBegan(saveBeganSavingToAlpha!)
                    case .saveSucceeded:
                        saveSucceeded(saveSucceededSavedToAlpha!, saveSucceededSavedToBeta!, saveSucceededOptFloat.map(NSNumber.init), saveSucceededDisplayName)
                    case .saveFailed:
                        saveFailed(saveFailedError)
                    }
                }
            }

            extension SaveUpdates {
                public init(_ wrapper: SaveUpdatesObjc) {
                    var original: SaveUpdates!
                    wrapper.matchSaveBegan({ savingToAlpha in
                            original = .saveBegan(savingToAlpha: savingToAlpha)
                        }, saveSucceeded: { savedToAlpha, savedToBeta, optFloat, displayName in
                            original = .saveSucceeded(savedToAlpha: savedToAlpha, savedToBeta: savedToBeta, optFloat: optFloat.map(\.floatValue), displayName: displayName)
                        }, saveFailed: { error in
                            original = .saveFailed(error: error)
                        })
                    self = original
                }
            }
            """#
        )
    }
    
    func testEnum_objcEnum_shouldNotGenerate() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                """
                @objc enum Foo: Int {
                    case foo = 123
                    case bar
                }
                """
            },
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashDoubleFunc: "HashDouble"),
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeNSCopying: false
        )

        assertBuildResult(
            result,
            """
            """
        )
    }
    
    func testStruct_isEqual() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                """
                public struct AttributedFeature: Equatable, Sendable {
                    public init(featureName: String, jiraProject: JiraProject) {
                        self.featureName = featureName
                        self.jiraProject = jiraProject
                    }
                
                    public let featureName: String
                    public let jiraProject: JiraProject
                }
                """
                """
                public struct JiraProject: Equatable, Sendable {
                    public let projectName: String
                    public let label: String
                }
                """
            },
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashDoubleFunc: "HashDouble"),
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeNSCopying: false
        )
        
        assertBuildResult(
            result,
            #"""

            
            @objc(AttributedFeature)
            public class AttributedFeatureObjc: NSObject {

                @objc public let featureName: String

                @objc public let jiraProject: JiraProject

                @objc
                public init(featureName: String, jiraProject: JiraProject) {
                    self.featureName = featureName
                    self.jiraProject = jiraProject

                    super.init()
                }

                public init(_ original: AttributedFeature) {
                    self.featureName = original.featureName
                    self.jiraProject = original.jiraProject

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [UInt(bitPattern: (featureName as NSString).hash), UInt(bitPattern: jiraProject.hash)]
                    return Int(HashImpl(hashes, 2))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? AttributedFeatureObjc else {
                        return false
                    }
                    return featureName == other.featureName && jiraProject.isEqual(other.jiraProject)
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension AttributedFeature {
                public init(_ wrapper: AttributedFeatureObjc) {
                    self.featureName = wrapper.featureName
                    self.jiraProject = wrapper.jiraProject
                }
            }
            
            @objc(JiraProject)
            public class JiraProjectObjc: NSObject {

                @objc public let projectName: String

                @objc public let label: String

                @objc
                public init(projectName: String, label: String) {
                    self.projectName = projectName
                    self.label = label

                    super.init()
                }

                public init(_ original: JiraProject) {
                    self.projectName = original.projectName
                    self.label = original.label

                    super.init()
                }

                public override var hash: Int {
                    let hashes: [UInt] = [UInt(bitPattern: (projectName as NSString).hash), UInt(bitPattern: (label as NSString).hash)]
                    return Int(HashImpl(hashes, 2))
                }

                public override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? JiraProjectObjc else {
                        return false
                    }
                    return projectName == other.projectName && label == other.label
                }

                @available(*, unavailable)
                public override init() {
                    fatalError()
                }
            }

            extension JiraProject {
                public init(_ wrapper: JiraProjectObjc) {
                    self.projectName = wrapper.projectName
                    self.label = wrapper.label
                }
            }
            """#
        )
    }

    func testEnum_caseWithoutArgs() throws {
        let result = try SwiftObjcValueTypeFactory().wrappingClassDecl(
            codeBlocks: CodeBlockItemListSyntax {
                """
                enum EncryptionType: Equatable, Hashable {
                    case unencrypted
                    case encrypted(String, key: String?)
                }
                """
            },
            externalHashSettings: ExternalHashSettings(hashFunc: "HashImpl", hashDoubleFunc: "HashDouble"),
            shouldSynthesizeNSCoding: false,
            shouldSynthesizeNSCopying: false
        )

        assertBuildResult(
            result,
            #"""


            private enum EncryptionTypeSubtype: Int, Equatable {
                case unencrypted
                case encrypted
            }

            typealias EncryptionTypeUnencryptedMatchHandler = () -> Void

            typealias EncryptionTypeEncryptedMatchHandler = (_ param0: String, _ key: String?) -> Void

            @objc(EncryptionType)
            class EncryptionTypeObjc: NSObject {
            
                private let subtype: EncryptionTypeSubtype
                private let encryptedParam0: String?
                private let encryptedKey: String?

                private init(subtype: EncryptionTypeSubtype, encryptedParam0: String? = nil, encryptedKey: String? = nil) {
                    self.subtype = subtype
                    self.encryptedParam0 = encryptedParam0
                    self.encryptedKey = encryptedKey

                    super.init()
                }

                convenience init(_ original: EncryptionType) {
                    switch original {
                    case .unencrypted:
                        self.init(subtype: .unencrypted)
                    case .encrypted(let param0, let key):
                        self.init(subtype: .encrypted, encryptedParam0: param0, encryptedKey: key)
                    }
                }

                @available(*, unavailable)
                override init() {
                    fatalError()
                }

                override var hash: Int {
                    let hashes: [UInt] = [UInt(bitPattern: subtype.rawValue), UInt(bitPattern: (encryptedParam0 as? NSString)?.hash ?? 0), UInt(bitPattern: (encryptedKey as? NSString)?.hash ?? 0)]
                    return Int(HashImpl(hashes, 3))
                }

                override func isEqual(_ object: Any?) -> Bool {
                    guard let other = object as? EncryptionTypeObjc else {
                        return false
                    }
                    return subtype == other.subtype && encryptedParam0 == other.encryptedParam0 && encryptedKey == other.encryptedKey
                }

                @objc
                class func unencrypted() -> EncryptionTypeObjc {
                    return EncryptionTypeObjc(subtype: .unencrypted)
                }

                @objc
                class func encrypted(_ param0: String, key: String?) -> EncryptionTypeObjc {
                    return EncryptionTypeObjc(subtype: .encrypted, encryptedParam0: param0, encryptedKey: key)
                }

                @objc
                func matchUnencrypted(_ unencrypted: EncryptionTypeUnencryptedMatchHandler, encrypted: EncryptionTypeEncryptedMatchHandler) {
                    switch subtype {
                    case .unencrypted:
                        unencrypted()
                    case .encrypted:
                        encrypted(encryptedParam0!, encryptedKey)
                    }
                }
            }

            extension EncryptionType {
                init(_ wrapper: EncryptionTypeObjc) {
                    var original: EncryptionType!
                    wrapper.matchUnencrypted({
                            original = .unencrypted
                        }, encrypted: { param0, key in
                            original = .encrypted(param0, key: key)
                        })
                    self = original
                }
            }
            """#
        )
    }
}

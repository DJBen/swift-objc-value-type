# SwiftObjcValueType

Generate @objc value types for existing Swift structs and enums; migrate [Remodel](https://github.com/facebookarchive/remodel) domain specific language based value objects to Swift.

- Write Swift structs and enums as source-of-truth value types.
- This tool will synthesize objc-compatible wrapper seamlessly.
- Strictly correct `hash`, `isEqual`, `NSCopying`, `NSCoding` implementations.
- Optionally generate objective-C builders.

## Usage
```
> swift run swift-objc-value-type --help

OVERVIEW: Generate objc compatible value types for Swift structs and enums

USAGE: swift-objc-value-type <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  gen                     Generate objc compatible value type interfaces for Swift structs and enums.
  parse-remodel           Parse remodel value files into syntax representation.
  migrate-remodel         Migrate remodel value files (.value, .adtValue) into structs and enums
                          respectively.

```
You may also invoke `--help` in any of the subcommands, like `swift run swift-objc-value-type gen --help`

## Quick start

Clone the repo and run `swift run swift-objc-value-type gen`

Copy the struct for which you want to generate @objc value type wrappers to the command line, for example,

```swift
public struct Value: Equatable, Codable {
    public let doubleValue: Double

    public let optInt: Int64?

    public let stringArray: [String]

    public let map: [String: [String: Double]]
}

```

Press `Ctrl+D` to signal end-of-file, and value class should be generated!
- For each property, it synthesizes an objc getter.
- Primitive-C types and NS-types are automatically bridged - e.g. `Int?` -> `NSNumber?`, `NSString` -> `String`.
- Equality, NSCopying, hashing, NSCoding are synthesized.
- Builder can be synthesized on demand.

```swift
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

    public override var hash: Int {
        let hashes: [UInt] = [hashDouble(doubleValue), UInt(bitPattern: abs(optInt ?? 0)), UInt(bitPattern: (stringArray as NSArray).hash), UInt(bitPattern: map.hash)]
        return Int(hashImpl(hashes, 4))
    }

    // Hash impl omitted...

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

// Builder omitted...

```

## Swift Macros

# SwiftObjcValueType

Generate @objc value types for existing Swift structs and enums; migrate [Remodel](https://github.com/facebookarchive/remodel) domain specific language based value objects to Swift.

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
@objc(Value)
public class ValueObjc: NSObject, NSCopying {

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

    private init(wrapped: Value) {
        self.wrapped = wrapped
    }
}

extension ValueObjc {
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
        public func build() throws -> ValueObjc {
            guard let doubleValue = doubleValue else {
                throw error(field: "doubleValue")
            }
            guard let stringArray = stringArray else {
                throw error(field: "stringArray")
            }
            guard let map = map else {
                throw error(field: "map")
            }

            return ValueObjc(doubleValue: doubleValue.doubleValue, optInt: optInt, stringArray: stringArray, map: map)
        }
    }
}
```

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

## How can I...?

TBD

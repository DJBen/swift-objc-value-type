
public enum ObjcSwiftUtils {
    /// https://developer.apple.com/documentation/swift/working-with-foundation-types
    public static let objcToSwiftFoundationTypeMap = [
        "NSAffineTransform": "AffineTransform",
        "NSArray": "Array",
        "NSCalendar": "Calendar",
        "NSCharacterSet": "CharacterSet",
        "NSData": "Data",
        "NSDateComponents": "DateComponents",
        "NSDateInterval": "DateInterval",
        "NSDate": "Date",
        "NSDecimalNumber": "Decimal",
        "NSDictionary": "Dictionary",
        "NSIndexPath": "IndexPath",
        "NSIndexSet": "IndexSet",
        "NSLocale": "Locale",
        "NSMeasurement": "Measurement",
        "NSNotification": "Notification",
        "NSPersonNameComponents": "PersonNameComponents",
        "NSSet": "Set",
        "NSString": "String",
        "NSTimeZone": "TimeZone",
        "NSURL": "URL",
        "NSURLComponents": "URLComponents",
        "NSURLQueryItem": "URLQueryItem",
        "NSURLRequest": "URLRequest",
        "NSUUID": "UUID",
        "NSError": "Error",
    ]

    public static let swiftToObjcFoundationTypeMap = {
        objcToSwiftFoundationTypeMap.reduce(into: [String: String](), { $0[$1.1] = $1.0 })
    }()
    
    public static func removingTypePrefix(prefix: String, name: String) -> String {
        if name.hasPrefix(prefix) {
            return String(name.dropFirst(prefix.count))
        } else {
            return name
        }
    }

    private static let primitiveCIntTRegex = /(?:(u)?int(\d+)_t)/
    private static let primitiveCIntRegex = /(?:unsigned\s+)?(?:(?:short|(?:long)(?: long)?)\s+)?int/

    public static func mappingObjcTypeToSwift(
        _ remodelType: String,
        existingPrefix: String
    ) -> String {
        if let match = remodelType.firstMatch(of: /NS(?:Mutable)?Dictionary<([\w\* <>]+),\s*([\w\* <>]+)>\s*\*/) {
            return "[\(mappingObjcTypeToSwift(String(match.1), existingPrefix: existingPrefix)): \(mappingObjcTypeToSwift(String(match.2), existingPrefix: existingPrefix))]"
        } else if let match = remodelType.firstMatch(of: /NS(?:Mutable)?(Set|Array)<([\w\* <>]+)>\s*\*/) {
            if match.1 == "Set" {
                return "Set<\(mappingObjcTypeToSwift(String(match.2), existingPrefix: existingPrefix))>"
            } else {
                return "[\(mappingObjcTypeToSwift(String(match.2), existingPrefix: existingPrefix))]"
            }
        } else if let match = remodelType.firstMatch(of: /id<(.*?)>/) {
            // Convert objc `id<Type>` into `Type`
            return mappingObjcTypeToSwift(String(match.1), existingPrefix: existingPrefix)
        } else if let match = remodelType.firstMatch(of: /(\w+)<([\w\* <>]+)>\s\*/) {
            return "\(String(match.1))<\(mappingObjcTypeToSwift(String(match.2), existingPrefix: existingPrefix))>"
        } else if remodelType.hasSuffix("*") {
            var result = remodelType
            result.removeLast()
            return mappingObjcTypeToSwift(result.trimmingCharacters(in: .whitespacesAndNewlines), existingPrefix: existingPrefix)
        } else if remodelType.lowercased() == "bool" {
            return "Bool"
        } else if remodelType == "char" {
            return "UInt8"
        } else if let match = remodelType.firstMatch(of: Self.primitiveCIntTRegex) {
            let u = String(match.1 ?? "").uppercased()
            return "\(u)Int\(String(match.2))"
        } else if remodelType.contains(Self.primitiveCIntRegex) {
            return "Int"
        } else if remodelType == "float" {
            return "Float"
        } else if remodelType == "double" {
            return "Double"
        } else if remodelType == "NSInteger" {
            return "Int"
        } else if remodelType == "NSUInteger" {
            return "UInt"
        } else if remodelType == "Class" {
            return "AnyClass"
        } else if remodelType == "NSTimeInterval" {
            return "TimeInterval"
        } else if let mappedSwiftType = objcToSwiftFoundationTypeMap[remodelType] {
            return mappedSwiftType
        } else {
            return removingTypePrefix(prefix: existingPrefix, name: remodelType)
        }
    }

    public static func isObjcPrimitive(_ remodelType: String) -> Bool {
        if remodelType == "char" {
            return true
        } else if remodelType.lowercased() == "bool" {
            return true
        } else if remodelType == "float" || remodelType == "double" {
            return true
        } else if ["NSInteger", "NSUInteger", "NSTimeInterval"].contains(remodelType) {
            return true
        } else if ["CGPoint", "CGFloat", "CGSize", "CGRect", "CGVector", "CGAffineTransform"].contains(remodelType) {
            return true
        } else {
            return remodelType.contains(Self.primitiveCIntRegex) || remodelType.contains(Self.primitiveCIntTRegex)
        }
    }

}

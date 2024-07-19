
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
    
    private static let primitiveCIntTRegex = /(?:(u)?int(\d+)_t)/
    private static let primitiveCIntRegex = /(?:unsigned\s+)?(?:(?:short|(?:long)(?: long)?)\s+)?int/

    public static func mappingObjcTypeToSwift(
        _ objcType: String,
        mapSwiftType: (String) -> String
    ) -> String {
        if let match = objcType.firstMatch(of: /NS(?:Mutable)?Dictionary<([\w\* <>]+),\s*([\w\* <>]+)>\s*\*/) {
            return "[\(mappingObjcTypeToSwift(String(match.1), mapSwiftType: mapSwiftType)): \(mappingObjcTypeToSwift(String(match.2), mapSwiftType: mapSwiftType))]"
        } else if let match = objcType.firstMatch(of: /NS(?:Mutable)?(Set|Array)<([\w\* <>]+)>\s*\*/) {
            if match.1 == "Set" {
                return "Set<\(mappingObjcTypeToSwift(String(match.2), mapSwiftType: mapSwiftType))>"
            } else {
                return "[\(mappingObjcTypeToSwift(String(match.2), mapSwiftType: mapSwiftType))]"
            }
        } else if let match = objcType.firstMatch(of: /id<(.*?)>/) {
            // Convert objc `id<Type>` into `Type`
            return mappingObjcTypeToSwift(String(match.1), mapSwiftType: mapSwiftType)
        } else if let match = objcType.firstMatch(of: /(\w+)<([\w\* <>]+)>\s\*/) {
            return "\(String(match.1))<\(mappingObjcTypeToSwift(String(match.2), mapSwiftType: mapSwiftType))>"
        } else if objcType.hasSuffix("*") {
            var result = objcType
            result.removeLast()
            return mappingObjcTypeToSwift(result.trimmingCharacters(in: .whitespacesAndNewlines), mapSwiftType: mapSwiftType)
        } else if objcType.lowercased() == "bool" {
            return "Bool"
        } else if objcType == "char" {
            return "UInt8"
        } else if let match = objcType.firstMatch(of: Self.primitiveCIntTRegex) {
            let u = String(match.1 ?? "").uppercased()
            return "\(u)Int\(String(match.2))"
        } else if objcType.contains(Self.primitiveCIntRegex) {
            return "Int"
        } else if objcType == "float" {
            return "Float"
        } else if objcType == "double" {
            return "Double"
        } else if objcType == "NSInteger" {
            return "Int"
        } else if objcType == "NSUInteger" {
            return "UInt"
        } else if objcType == "Class" {
            return "AnyClass"
        } else if objcType == "NSTimeInterval" {
            return "TimeInterval"
        } else if objcType == "void" {
            return "Void"
        } else if objcType == "id" {
            return "Any"
        } else if let mappedSwiftType = objcToSwiftFoundationTypeMap[objcType] {
            return mappedSwiftType
        } else {
            return mapSwiftType(objcType)
        }
    }

    public static func isObjcPrimitive(_ objcType: String) -> Bool {
        if objcType == "char" {
            return true
        } else if objcType.lowercased() == "bool" {
            return true
        } else if objcType == "float" || objcType == "double" {
            return true
        } else if ["NSInteger", "NSUInteger", "NSTimeInterval"].contains(objcType) {
            return true
        } else if ["CGPoint", "CGFloat", "CGSize", "CGRect", "CGVector", "CGAffineTransform"].contains(objcType) {
            return true
        } else if ["dispatch_queue_t"].contains(objcType) {
            return true
        } else {
            return objcType.contains(Self.primitiveCIntRegex) || objcType.contains(Self.primitiveCIntTRegex)
        }
    }

    public static func mappingObjcProtocolConformances(
        protocolName: String
    ) -> String {
        if protocolName == "NSObject" {
            return "NSObjectProtocol"
        }
        return protocolName
    }
}

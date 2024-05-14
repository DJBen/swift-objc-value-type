import SwiftSyntax
import SwiftSyntaxBuilder

/// https://developer.apple.com/documentation/swift/working-with-foundation-types
public let objcToSwiftFoundationTypeMap = [
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

public let swiftToObjcFoundationTypeMap = {
    objcToSwiftFoundationTypeMap.reduce(into: [String: String](), { $0[$1.1] = $1.0 })
}()

extension TypeSyntaxProtocol {
    public func enumerateTypeName(_ block: (String) -> Void) {
        _ = mapTypeName { typeName in
            block(typeName)
            return typeName
        }
    }

    public func conainsTypeName(_ block: (String) -> Bool) -> Bool {
        var contains: Bool = false
        _ = mapTypeName { typeName in
            if block(typeName) {
                // We are not yet able to stop in between though
                contains = true
            }
            return typeName
        }
        return contains
    }

    public func mapTypeName(_ transform: (String) -> String) -> any TypeSyntaxProtocol {
        if var identifierType = self.as(IdentifierTypeSyntax.self) {
            identifierType.name = .identifier(transform(identifierType.trimmed.name.text))
            identifierType.genericArgumentClause = identifierType.genericArgumentClause.map { clause in
                var newClause = clause
                newClause.arguments = GenericArgumentListSyntax(clause.arguments.map { arg in
                    var newArg = arg
                    newArg.argument = TypeSyntax(arg.argument.mapTypeName(transform))
                    return newArg
                })
                return newClause
            }
            return identifierType
        } else if let optionalTypeSyntax = self.as(OptionalTypeSyntax.self) {
            return OptionalTypeSyntax(wrappedType: optionalTypeSyntax.wrappedType.mapTypeName(transform))
        } else if let arrayTypeSyntax = self.as(ArrayTypeSyntax.self) {
            return ArrayTypeSyntax(element: arrayTypeSyntax.element.mapTypeName(transform))
        } else if let tupleTypeSyntax = self.as(TupleTypeSyntax.self) {
            return TupleTypeSyntax(elements: TupleTypeElementListSyntax(tupleTypeSyntax.elements.map { element in
                var newElement = element
                newElement.type = TypeSyntax(element.type.mapTypeName(transform))
                return newElement
            }))
        } else if var dictTypeSyntax = self.as(DictionaryTypeSyntax.self) {
            dictTypeSyntax.key = TypeSyntax(dictTypeSyntax.key.mapTypeName(transform))
            dictTypeSyntax.value = TypeSyntax(dictTypeSyntax.value.mapTypeName(transform))
            return dictTypeSyntax
        } else if var funcTypeSyntax = self.as(FunctionTypeSyntax.self) {
            funcTypeSyntax.parameters = TupleTypeElementListSyntax(funcTypeSyntax.parameters.map { element in
                var newElement = element
                newElement.type = TypeSyntax(element.type.mapTypeName(transform))
                return newElement
            })
            funcTypeSyntax.returnClause = ReturnClauseSyntax(type: funcTypeSyntax.returnClause.type.mapTypeName(transform))
            return funcTypeSyntax
        } else {
            return self
        }
    }
}

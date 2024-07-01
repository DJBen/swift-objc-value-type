import Foundation
import SharedUtilities
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    func swiftType(
        from typeSpecifiers: [P.TypeSpecifierContext],
        isNullable: Bool,
        hasUnsignedPrefix: Bool = false,
        hasLongPrefix: Bool = false,
        isMutableContainerType: Bool = false
    ) throws -> any TypeSyntaxProtocol {
        // typeSpecifier
        //    : 'void'
        //    | 'char'
        //    | 'short'
        //    | 'int'
        //    | 'long'
        //    | 'float'
        //    | 'double'
        //    | 'signed'
        //    | 'unsigned'
        //    | typeofExpression
        //    | genericTypeSpecifier
        //    | structOrUnionSpecifier
        //    | enumSpecifier
        //    | identifier pointer?
        //    ;
        guard let typeSpecifier = typeSpecifiers.first else {
            fatalError("Empty type specifiers")
        }
        
        if typeSpecifier.VOID() != nil {
            return IdentifierTypeSyntax(name: .identifier("Void"))
        } else if typeSpecifier.CHAR() != nil {
            if hasUnsignedPrefix {
                return IdentifierTypeSyntax(name: .identifier("UInt8"))
            } else {
                return IdentifierTypeSyntax(name: .identifier("Int8"))
            }
        } else if typeSpecifier.SHORT() != nil {
            if hasUnsignedPrefix {
                return IdentifierTypeSyntax(name: .identifier("UInt16"))
            } else {
                return IdentifierTypeSyntax(name: .identifier("Int16"))
            }
        } else if typeSpecifier.INT() != nil {
            if hasUnsignedPrefix {
                return IdentifierTypeSyntax(name: .identifier("UInt32"))
            } else {
                return IdentifierTypeSyntax(name: .identifier("Int32"))
            }
        } else if typeSpecifier.LONG() != nil {
            if hasLongPrefix {
                if hasUnsignedPrefix {
                    return IdentifierTypeSyntax(name: .identifier("UInt64"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int64"))
                }
            } else if typeSpecifiers.count > 1 {
                return try swiftType(
                    from: Array(typeSpecifiers.dropFirst()),
                    isNullable: isNullable,
                    hasLongPrefix: true
                )
            } else {
                if hasUnsignedPrefix {
                    return IdentifierTypeSyntax(name: .identifier("UInt"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int"))
                }
            }
        } else if typeSpecifier.FLOAT() != nil {
            return IdentifierTypeSyntax(name: .identifier("Float"))
        } else if typeSpecifier.DOUBLE() != nil {
            return IdentifierTypeSyntax(name: .identifier("Double"))
        } else if typeSpecifier.SIGNED() != nil {
            return try swiftType(
                from: Array(typeSpecifiers.dropFirst()),
                isNullable: isNullable
            )
        } else if typeSpecifier.UNSIGNED() != nil {
            return try swiftType(
                from: Array(typeSpecifiers.dropFirst()),
                isNullable: isNullable,
                hasUnsignedPrefix: true
            )
        } else if let _ = typeSpecifier.typeofExpression() {
            // typeofExpression
            //    : TYPEOF (LP expression RP)
            //    ;
            throw ObjcTranslatorError.unsupported("typeofExpression", parseTreeType: String(describing: type(of: typeSpecifier)))
        } else if let genericTypeSpecifier = typeSpecifier.genericTypeSpecifier() {
            // genericTypeSpecifier
            //    : identifier ((LT protocolList GT) | genericsSpecifier)?
            //    ;
            
            // genericsSpecifier
            //    : LT (typeSpecifierWithPrefixes (',' typeSpecifierWithPrefixes)*)? GT
            //    ;
            
            let typeName = genericTypeSpecifier.identifier()!.getText()
            let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                typeName,
                existingPrefix: existingPrefix
            )
            
            if let protocolList = genericTypeSpecifier.protocolList() {
                // e.g. id<AAA, BBB>
                if protocolList.protocolName().count > 1 {
                    return CompositionTypeSyntax(
                        elements: CompositionTypeElementListSyntax {
                            for protocolName in protocolList.protocolName() {
                                CompositionTypeElementSyntax(
                                    type: IdentifierTypeSyntax(name: .identifier(protocolName.getText()))
                                )
                            }
                        }
                    )
                } else {
                    return IdentifierTypeSyntax(name: .identifier(protocolList.protocolName().first!.getText()))
                }
            } else if let genericsSpecifier = genericTypeSpecifier.genericsSpecifier() {
                // e.g. NSDictionary<NSString *, id<AA>> *
                
                // Handle special cases for NSArray, NSDictionary
                if typeName == "NSArray" || typeName == "NSMutableArray" {
                    // Array at most only have one generic arg
                    if let typeSpecifier = genericsSpecifier.typeSpecifierWithPrefixes().first {
                        return ArrayTypeSyntax(
                            element: try swiftType(
                                // TODO: Handle the case where it only has typeName
                                from: [typeSpecifier.typeSpecifier()!],
                                isNullable: isNullable,
                                isMutableContainerType: typeName.contains("Mutable")
                            )
                        )
                    }
                } else if typeName == "NSDictionary" || typeName == "NSMutableDictionary" {
                    let keyType = genericsSpecifier.typeSpecifierWithPrefixes()[0]
                    let valueType = genericsSpecifier.typeSpecifierWithPrefixes()[1]
                    return DictionaryTypeSyntax(
                        key: try swiftType(
                            // TODO: Handle the case where it only has typeName
                            from: [keyType.typeSpecifier()!],
                            isNullable: isNullable,
                            isMutableContainerType: typeName.contains("Mutable")
                        ),
                        value: try swiftType(
                            // TODO: Handle the case where it only has typeName
                            from: [valueType.typeSpecifier()!],
                            isNullable: isNullable,
                            isMutableContainerType: typeName.contains("Mutable")
                        )
                    )
                } else {
                    return IdentifierTypeSyntax(
                        name: .identifier(mappedTypeName),
                        genericArgumentClause: try GenericArgumentClauseSyntax {
                            try GenericArgumentListSyntax {
                                for typeSpecifierWithPrefixes in genericsSpecifier.typeSpecifierWithPrefixes() {
                                    GenericArgumentSyntax(
                                        argument: try swiftType(
                                            // TODO: Handle the case where it only has typeName
                                            from: [typeSpecifierWithPrefixes.typeSpecifier()!],
                                            isNullable: isNullable,
                                            isMutableContainerType: typeName.contains("Mutable")
                                        )
                                    )
                                }
                            }
                        }
                    )
                }
            } else {
                if typeName == "NSArray" || typeName == "NSMutableArray" {
                    return TypeSyntax("[Any]")
                } else if typeName == "NSDictionary" || typeName == "NSMutableDictionary" {
                    return TypeSyntax("[AnyHashable: Any]")
                } else {
                    let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                        typeName,
                        existingPrefix: existingPrefix
                    )
                    
                    return IdentifierTypeSyntax(
                        name: .identifier(mappedTypeName)
                    )
                }
            }
        } else if let _ = typeSpecifier.structOrUnionSpecifier() {
            // Ignore struct or union
            throw ObjcTranslatorError.unsupported(
                "structOrUnionSpecifier",
                parseTreeType: String(describing: type(of: typeSpecifier))
            )
        } else if let _ = typeSpecifier.enumSpecifier() {
            // Ignore explicit enum type declaration
            throw ObjcTranslatorError.unsupported(
                "enumSpecifier",
                parseTreeType: String(describing: type(of: typeSpecifier))
            )
        } else if let identifier = typeSpecifier.identifier()?.getText() {
            if identifier == "NSArray" || identifier == "NSMutableArray" {
                return TypeSyntax("[Any]")
            } else if identifier == "NSDictionary" || identifier == "NSMutableDictionary" {
                return TypeSyntax("[AnyHashable: Any]")
            } else {
                let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                    identifier,
                    existingPrefix: existingPrefix
                )
                
                return IdentifierTypeSyntax(
                    name: .identifier(mappedTypeName)
                )
            }
        }
            
        fatalError("Unknown typeSpecifier")
    }
}

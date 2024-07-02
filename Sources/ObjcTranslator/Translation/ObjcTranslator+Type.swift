import Foundation
import SharedUtilities
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    enum TypeDeclarationContext {
        case property
        case methodArgument
    }
    
    func swiftType(
        typeSpecifiers: [P.TypeSpecifierContext],
        declarator: P.DeclaratorContext?,
        isNullable: Bool,
        context: TypeDeclarationContext
    ) throws -> any TypeSyntaxProtocol {
        try swiftType(
            typeSpecifiers: typeSpecifiers,
            directDeclarator: declarator?.directDeclarator(),
            isNullable: isNullable,
            context: context,
            pointerCount: declarator?.pointerCount ?? 0
        )
    }
    
    func swiftType(
        typeSpecifiers: [P.TypeSpecifierContext],
        directDeclarator: P.DirectDeclaratorContext?,
        isNullable: Bool,
        context: TypeDeclarationContext,
        pointerCount: Int,
        hasUnsignedPrefix: Bool = false,
        hasLongPrefix: Bool = false,
        isMutableContainerType: Bool = false,
        isContainedByPointer: Bool = false
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
        
        // fieldDeclarator
        //    : declarator
        //    | declarator? ':' constant
        //    ;

        // declarator
        //    : pointer? directDeclarator
        //    ;
        
        // directDeclarator
        //    : (identifier | LP declarator RP) declaratorSuffix*
        //    | LP '^' nullabilitySpecifier? identifier? RP blockParameters
        //    ;
        
        guard let typeSpecifier = typeSpecifiers.first else {
            fatalError("Empty type specifiers")
        }

        if let blockParam = directDeclarator?.blockParameters() {
            // BOOL (^enumerateProviders)(id<ABProviderProtocol> provider, BOOL *stop)
            // becomes
            // var enumerateProviders: (provider: ABProviderProtocol, stop: UnsafeMutablePointer<ObjcBool>) -> Bool
            return FunctionTypeSyntax(
                parameters: try TupleTypeElementListSyntax {
                    for typeVariableDeclOrName in blockParam.typeVariableDeclaratorOrName() {
                        if let typeVariableDecl = typeVariableDeclOrName.typeVariableDeclarator() {
                            TupleTypeElementSyntax(
                                firstName: .identifier(
                                    typeVariableDecl.declarator()!.directDeclarator()!.identifier()!.getText()
                                ),
                                colon: .colonToken(),
                                type: try swiftType(
                                    typeSpecifiers: typeVariableDecl.declarationSpecifiers()!.typeSpecifier(),
                                    declarator: typeVariableDecl.declarator()!,
                                    isNullable: isNullable,
                                    context: context
                                )
                            )
                        } else if let typeName = typeVariableDeclOrName.typeName() {
                            TupleTypeElementSyntax(
                                type: try swiftType(
                                    typeSpecifiers: typeName.specifierQualifierList()!.typeSpecifier(),
                                    declarator: nil,
                                    isNullable: isNullable,
                                    context: context
                                )
                            )
                        }
                    }
                },
                returnClause: ReturnClauseSyntax(
                    type: IdentifierTypeSyntax(
                        name: .identifier(
                            ObjcSwiftUtils.mappingObjcTypeToSwift(
                                typeSpecifier.getText()
                            )
                        )
                    )
                )
            )
        }
        
        if pointerCount > 0 {
            if ObjcSwiftUtils.isObjcPrimitive(typeSpecifier.getText()) || isContainedByPointer {
                return try IdentifierTypeSyntax(
                    name: .identifier("UnsafeMutablePointer"),
                    genericArgumentClause: GenericArgumentClauseSyntax {
                        try GenericArgumentListSyntax {
                            GenericArgumentSyntax(
                                argument: try swiftType(
                                    typeSpecifiers: typeSpecifiers,
                                    directDeclarator: directDeclarator,
                                    isNullable: isNullable,
                                    context: context,
                                    pointerCount: pointerCount - 1,
                                    isContainedByPointer: true
                                )
                            )
                        }
                    }
                )
            } else {
                // `NSString *` types tolerate at most one pointer
                return try swiftType(
                    typeSpecifiers: typeSpecifiers,
                    directDeclarator: directDeclarator,
                    isNullable: isNullable,
                    context: context,
                    pointerCount: pointerCount - 1,
                    isContainedByPointer: true
                )
            }
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
                    typeSpecifiers: Array(typeSpecifiers.dropFirst()),
                    directDeclarator: directDeclarator,
                    isNullable: isNullable,
                    context: context,
                    pointerCount: pointerCount,
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
                typeSpecifiers: Array(typeSpecifiers.dropFirst()),
                directDeclarator: directDeclarator,
                isNullable: isNullable,
                context: context,
                pointerCount: pointerCount
            )
        } else if typeSpecifier.UNSIGNED() != nil {
            return try swiftType(
                typeSpecifiers: Array(typeSpecifiers.dropFirst()),
                directDeclarator: directDeclarator,
                isNullable: isNullable,
                context: context,
                pointerCount: pointerCount,
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
                typeName
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
                                typeSpecifiers: [typeSpecifier.typeSpecifier()!],
                                directDeclarator: directDeclarator,
                                isNullable: isNullable,
                                context: context,
                                pointerCount: pointerCount,
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
                            typeSpecifiers: [keyType.typeSpecifier()!],
                            directDeclarator: directDeclarator,
                            isNullable: isNullable,
                            context: context,
                            pointerCount: pointerCount,
                            isMutableContainerType: typeName.contains("Mutable")
                        ),
                        value: try swiftType(
                            // TODO: Handle the case where it only has typeName
                            typeSpecifiers: [valueType.typeSpecifier()!],
                            directDeclarator: directDeclarator,
                            isNullable: isNullable,
                            context: context,
                            pointerCount: pointerCount,
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
                                            typeSpecifiers: [typeSpecifierWithPrefixes.typeSpecifier()!],
                                            directDeclarator: directDeclarator,
                                            isNullable: isNullable,
                                            context: context,
                                            pointerCount: pointerCount,
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
                } else if typeName == "BOOL" && isContainedByPointer {
                    return IdentifierTypeSyntax(name: .identifier("ObjCBool"))
                } else {
                    let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                        typeName
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
        } else if let _ = typeSpecifier.identifier()?.getText() {
            throw ObjcTranslatorError.unsupported(
                "identifier",
                parseTreeType: String(describing: type(of: typeSpecifier))
            )
        }
            
        fatalError("Unknown typeSpecifier")
    }
}

import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    enum TypeDeclarationContext {
        case propertyOrMethodReturnType
        case methodArgument
    }
    
    struct TypeNullability {
        enum PropertyNullability {
            case nullable
            case nonnull
        }
        
        let propertyNullability: PropertyNullability?
        let isNSAssumeNonnull: Bool
        let isGenericType: Bool
        
        init(
            propertyNullability: PropertyNullability? = nil,
            isNSAssumeNonnull: Bool,
            isGenericType: Bool
        ) {
            self.propertyNullability = propertyNullability
            self.isNSAssumeNonnull = isNSAssumeNonnull
            self.isGenericType = isGenericType
        }
        
        init(
            typeName: P.TypeNameContext? = nil,
            isNSAssumeNonnull: Bool,
            isGenericType: Bool
        ) {
            // typeName
            //    : declarationSpecifiers abstractDeclarator?
            //    | blockType
            //    ;
            self.init(
                propertyNullability: {
                    // Prefix `nonnull Type` and postfix `Type *_Nullable`
                    if let nullabilitySpecifiers = typeName?.declarationSpecifiers()?.nullabilitySpecifier() {
                        if nullabilitySpecifiers.contains(where: { $0.NULLABLE() != nil }) {
                            return .nullable
                        } else if nullabilitySpecifiers.contains(where: { $0.NONNULL() != nil }) {
                            return .nonnull
                        }
                    }
                    
                    return nil
                }(),
                isNSAssumeNonnull: isNSAssumeNonnull,
                isGenericType: isGenericType
            )
        }
        
        var isExplicitlyNonnull: Bool {
            if isGenericType {
                return true
            }
            if propertyNullability == .nonnull || (isNSAssumeNonnull && propertyNullability != .nullable) {
                return true
            }
            return false
        }
        
        func with(isGenericType: Bool) -> TypeNullability {
            return TypeNullability(
                propertyNullability: propertyNullability,
                isNSAssumeNonnull: isNSAssumeNonnull,
                isGenericType: isGenericType
            )
        }
        
        func with(propertyNullability: PropertyNullability?) -> TypeNullability {
            return TypeNullability(
                propertyNullability: propertyNullability,
                isNSAssumeNonnull: isNSAssumeNonnull,
                isGenericType: isGenericType
            )
        }
        
        func with(nullabilitySpecifier: [P.NullabilitySpecifierContext]?) -> TypeNullability {
            guard let nullabilitySpecifier else {
                return self
            }
            return TypeNullability(
                propertyNullability: {
                    if nullabilitySpecifier.contains(where: { $0.NONNULL() != nil }) {
                        return .nonnull
                    } else if nullabilitySpecifier.contains(where: { $0.NULLABLE() != nil }) {
                        return .nullable
                    }
                    return nil
                }(),
                isNSAssumeNonnull: isNSAssumeNonnull,
                isGenericType: isGenericType
            )
        }
    }
    
    func swiftType(
        typeName: P.TypeNameContext?,
        nullability: TypeNullability,
        context: TypeDeclarationContext
    ) throws -> any TypeSyntaxProtocol {
        guard let typeName else {
            return IdentifierTypeSyntax(
                name: .identifier("Any")
            )
            .optionalized(nullability, isObjcPrimitiveType: false)
        }
        
        // typeName
        //    : declarationSpecifiers abstractDeclarator?
        //    | blockType
        //    ;
        
        if let blockType = typeName.blockType() {
            return try swiftType(
                typeSpecifier: blockType.typeSpecifier()!,
                blockParam: blockType.blockParameters(),
                nullability: nullability
                    .with(nullabilitySpecifier: blockType.nullabilitySpecifier()),
                context: context
            )
        } else {
            return try swiftType(
                typeSpecifier: typeName.declarationSpecifiers()!.typeSpecifier()!,
                blockParam: nil,
                nullability: nullability.with(nullabilitySpecifier: typeName.declarationSpecifiers()!.nullabilitySpecifier()),
                context: context
            )
        }
    }
    
    func swiftType(
        typeSpecifierWithPrefixes: P.TypeSpecifierWithPrefixesContext,
        nullability: TypeNullability,
        context: TypeDeclarationContext
    ) throws -> any TypeSyntaxProtocol {
        // typeSpecifierWithPrefixes
        //    : typePrefix* typeSpecifier
        //    | typeName
        //    ;

        if let typeName = typeSpecifierWithPrefixes.typeName() {
            return try swiftType(
                typeName: typeName,
                nullability: nullability,
                context: context
            )
        } else {
            return try swiftType(
                typeSpecifier: typeSpecifierWithPrefixes.typeSpecifier()!,
                blockParam: nil,
                nullability: nullability,
                context: context
            )
        }
    }
    
    func swiftType(
        typeVariableDecl: P.TypeVariableDeclaratorContext,
        nullability: TypeNullability,
        context: TypeDeclarationContext
    ) throws -> any TypeSyntaxProtocol {
        try swiftType(
            typeSpecifier: typeVariableDecl.declarationSpecifiers()!.typeSpecifier()!,
            blockParam: typeVariableDecl.declarator()?.blockParameters(),
            nullability: nullability,
            context: context
        )
    }
    
    func swiftType(
        typedefDecl: P.TypedefDeclarationContext,
        nullability: TypeNullability
    ) throws -> any TypeSyntaxProtocol {
        // When defined in typedef, the return type is nonnull.
        try swiftType(
            typeSpecifier: typedefDecl.declarationSpecifiers()!.typeSpecifier()!,
            blockParam: typedefDecl.typeDeclaratorList()?.declarator().first?.blockParameters(),
            nullability: nullability,
            context: .propertyOrMethodReturnType,
            isTypedef: true
        )
    }
    
    func swiftType(
        propertyDecl: P.PropertyDeclarationContext,
        nullability: TypeNullability
    ) throws -> any TypeSyntaxProtocol {
        try swiftType(
            typeSpecifier: propertyDecl.fieldDeclaration()!.declarationSpecifiers()!.typeSpecifier()!,
            // Only read the first item, assume there isn't multiple decls in the same line e.g. `BOOL a, b, c`;
            blockParam: propertyDecl.fieldDeclaration()?.fieldDeclaratorList()?.fieldDeclarator(0)?.declarator()?.blockParameters(),
            nullability: nullability,
            context: .propertyOrMethodReturnType
        )
    }
    
    func swiftType(
        typeSpecifier: P.TypeSpecifierContext,
        blockParam: P.BlockParametersContext?,
        nullability: TypeNullability,
        context: TypeDeclarationContext,
        isContainedByPointer: Bool = false,
        isTypedef: Bool = false
    ) throws -> any TypeSyntaxProtocol {
        if let blockParam {
            // BOOL (^enumerateProviders)(id<ABProviderProtocol> provider, BOOL *stop)
            // becomes
            // var enumerateProviders: (provider: ABProviderProtocol, stop: UnsafeMutablePointer<ObjcBool>) -> Bool
            return FunctionTypeSyntax(
                parameters: try TupleTypeElementListSyntax {
                    for typeVariableDeclOrName in blockParam.typeVariableDeclaratorOrName() {
                        if let typeVariableDecl = typeVariableDeclOrName.typeVariableDeclarator() {
                            TupleTypeElementSyntax(
                                firstName: .identifier(
                                    typeVariableDecl.declarator()!.identifier()!.getText()
                                ),
                                colon: .colonToken(),
                                type: try swiftType(
                                    typeVariableDecl: typeVariableDecl,
                                    nullability: nullability,
                                    context: context
                                )
                            )
                        } else if let typeName = typeVariableDeclOrName.typeName() {
                            TupleTypeElementSyntax(
                                type: try swiftType(
                                    typeName: typeName,
                                    nullability: nullability,
                                    context: context
                                )
                            )
                        }
                    }
                },
                returnClause: ReturnClauseSyntax(
                    type: try swiftType(
                        typeSpecifier: typeSpecifier,
                        blockParam: nil,
                        nullability: nullability,
                        context: .propertyOrMethodReturnType
                    )
                )
            )
            .optionalized(
                isTypedef ? TypeNullability(propertyNullability: .nonnull, isNSAssumeNonnull: false, isGenericType: false) : nullability,
                isObjcPrimitiveType: false
            )
        }
        
        if typeSpecifier.MUL() != nil /* pointer */, let subTypeSpecifier = typeSpecifier.typeSpecifier() {
            if ObjcSwiftUtils.isObjcPrimitive(subTypeSpecifier.getText()) || isContainedByPointer {
                return try IdentifierTypeSyntax(
                    name: .identifier("UnsafeMutablePointer"),
                    genericArgumentClause: GenericArgumentClauseSyntax {
                        try GenericArgumentListSyntax {
                            GenericArgumentSyntax(
                                argument: try swiftType(
                                    typeSpecifier: subTypeSpecifier,
                                    blockParam: blockParam,
                                    nullability: nullability.with(
                                        isGenericType: true
                                    ),
                                    context: context,
                                    isContainedByPointer: true
                                )
                            )
                        }
                    }
                )
            } else {
                // `NSString *` types tolerate at most one pointer
                return try swiftType(
                    typeSpecifier: subTypeSpecifier,
                    blockParam: blockParam,
                    nullability: nullability,
                    context: context,
                    isContainedByPointer: true
                )
            }
        }
        
        if typeSpecifier.VOID() != nil {
            return IdentifierTypeSyntax(name: .identifier("Void"))
        } else if typeSpecifier.CHAR() != nil {
            if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                return IdentifierTypeSyntax(name: .identifier("UInt8"))
            } else {
                return IdentifierTypeSyntax(name: .identifier("Int8"))
            }
        } else if typeSpecifier.SHORT() != nil {
            if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                return IdentifierTypeSyntax(name: .identifier("UInt16"))
            } else {
                return IdentifierTypeSyntax(name: .identifier("Int16"))
            }
        } else if typeSpecifier.INT() != nil {
            if typeSpecifier.typeSpecifierModifier().contains(where: { $0.SHORT() != nil }) {
                if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                    return IdentifierTypeSyntax(name: .identifier("UInt16"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int16"))
                }
            } else {
                if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                    return IdentifierTypeSyntax(name: .identifier("UInt32"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int32"))
                }
            }
        } else if typeSpecifier.LONG() != nil {
            if typeSpecifier.typeSpecifierModifier().contains(where: { $0.LONG() != nil }) {
                if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                    return IdentifierTypeSyntax(name: .identifier("UInt64"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int64"))
                }
            } else {
                if typeSpecifier.typeSpecifierModifier().contains(where: { $0.UNSIGNED() != nil }) {
                    return IdentifierTypeSyntax(name: .identifier("UInt"))
                } else {
                    return IdentifierTypeSyntax(name: .identifier("Int"))
                }
            }
        } else if typeSpecifier.FLOAT() != nil {
            return IdentifierTypeSyntax(name: .identifier("Float"))
        } else if typeSpecifier.DOUBLE() != nil {
            return IdentifierTypeSyntax(name: .identifier("Double"))
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
                            for (index, protocolName) in protocolList.protocolName().enumerated() {
                                CompositionTypeElementSyntax(
                                    type: IdentifierTypeSyntax(name: .identifier(protocolName.getText())),
                                    ampersand: index + 1 < protocolList.protocolName().count ? .binaryOperator("&") : nil
                                )
                            }
                        }
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: false
                    )
                } else {
                    return IdentifierTypeSyntax(
                        name: .identifier(protocolList.protocolName().first!.getText())
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: false
                    )
                }
            } else if let genericsSpecifier = genericTypeSpecifier.genericsSpecifier() {
                // Has generic specifiers
                // e.g. NSDictionary<NSString *, id<AA>> *
                
                // Handle special cases for NSArray, NSDictionary
                if typeName == "NSArray" || typeName == "NSMutableArray" {
                    // Array at most only have one generic arg
                    if let typeSpecifierWithPrefixes = genericsSpecifier.typeSpecifierWithPrefixes().first {
                        return ArrayTypeSyntax(
                            element: try swiftType(
                                typeSpecifierWithPrefixes: typeSpecifierWithPrefixes,
                                nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                                context: context
                            )
                        )
                        .optionalized(
                            nullability,
                            isObjcPrimitiveType: false
                        )
                    }
                } else if typeName == "NSDictionary" || typeName == "NSMutableDictionary" {
                    let keyType = genericsSpecifier.typeSpecifierWithPrefixes()[0]
                    let valueType = genericsSpecifier.typeSpecifierWithPrefixes()[1]
                    return DictionaryTypeSyntax(
                        key: try swiftType(
                            typeSpecifierWithPrefixes: keyType,
                            nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                            context: context
                        ),
                        value: try swiftType(
                            typeSpecifierWithPrefixes: valueType,
                            nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                            context: context
                        )
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: false
                    )
                } else {
                    return IdentifierTypeSyntax(
                        name: .identifier(mappedTypeName),
                        genericArgumentClause: try GenericArgumentClauseSyntax {
                            try GenericArgumentListSyntax {
                                for typeSpecifierWithPrefixes in genericsSpecifier.typeSpecifierWithPrefixes() {
                                    GenericArgumentSyntax(
                                        argument: try swiftType(
                                            typeSpecifierWithPrefixes: typeSpecifierWithPrefixes,
                                            nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                                            context: context
                                        )
                                    )
                                }
                            }
                        }
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: false
                    )
                }
            } else {
                if typeName == "NSArray" || typeName == "NSMutableArray" {
                    return TypeSyntax(
                        "[Any]"
                    ).optionalized(
                        nullability,
                        isObjcPrimitiveType: false
                    )
                } else if typeName == "NSDictionary" || typeName == "NSMutableDictionary" {
                    return TypeSyntax(
                        "[AnyHashable: Any]"
                    )
                    .optionalized(nullability, isObjcPrimitiveType: false)
                } else if typeName == "BOOL" && isContainedByPointer {
                    return IdentifierTypeSyntax(name: .identifier("ObjCBool"))
                } else {
                    let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                        typeName
                    )
                    
                    return IdentifierTypeSyntax(
                        name: .identifier(mappedTypeName)
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: ObjcSwiftUtils.isObjcPrimitive(typeName)
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
        } else if let identifier = typeSpecifier.identifier() {
            // This happens to `NSNumber *` within `NSDictionary<NSNumber *, NSString *>`
            let mappedTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(
                identifier.getText()
            )
            
            return IdentifierTypeSyntax(
                name: .identifier(mappedTypeName)
            )
            .optionalized(
                nullability,
                isObjcPrimitiveType: ObjcSwiftUtils.isObjcPrimitive(identifier.getText())
            )
        }
            
        fatalError("Unknown typeSpecifier")
    }
}

private extension TypeSyntaxProtocol {
    func optionalized<UpstreamTokenSource: TokenSource>(
        _ nullability: ObjcTranslator<UpstreamTokenSource>.TypeNullability,
        isObjcPrimitiveType: Bool
    ) -> any TypeSyntaxProtocol {
        guard !isObjcPrimitiveType else {
            return self
        }
        return optionalized(!nullability.isExplicitlyNonnull)
    }
}

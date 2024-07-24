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
        
        func with(declarationSpecifiers: P.DeclarationSpecifiersContext?) -> TypeNullability {
            guard let declarationSpecifiers else {
                return self
            }
            // Prefix `nonnull Type` and postfix `Type *_Nullable`
            let nullabilitySpecifiers = declarationSpecifiers.nullabilitySpecifier() +  (declarationSpecifiers.typeSpecifier()?.nullabilitySpecifier() ?? [])
            if nullabilitySpecifiers.contains(where: { $0.NULLABLE() != nil }) {
                return with(propertyNullability: .nullable)
            } else if nullabilitySpecifiers.contains(where: { $0.NONNULL() != nil }) {
                return with(propertyNullability: .nonnull)
            }
            
            return self
        }
        
        func with(typeName: P.TypeNameContext?) -> TypeNullability {
            return with(declarationSpecifiers: typeName?.declarationSpecifiers())
        }
        
        func with(nullabilitySpecifier: P.NullabilitySpecifierContext?) -> TypeNullability {
            nullabilitySpecifier.map { with(nullabilitySpecifier: [$0]) } ?? self
        }
        
        func with(nullabilitySpecifier: [P.NullabilitySpecifierContext]?) -> TypeNullability {
            guard let nullabilitySpecifier else {
                return self
            }
            if nullabilitySpecifier.contains(where: { $0.NONNULL() != nil }) {
                return with(propertyNullability: .nonnull)
            } else if nullabilitySpecifier.contains(where: { $0.NULLABLE() != nil }) {
                return with(propertyNullability: .nullable)
            }
            
            return self
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
                context: context,
                isEscaping: blockType.NS_NOESCAPE().isEmpty
            )
        } else if let identifier = typeName.declarationSpecifiers()?.typeSpecifier()?.genericTypeSpecifier()?.identifier()?.getText(), typeMappings.typedefBlockNames.contains(identifier) {
            // If the type is a known typedef block
            return try swiftType(
                typeSpecifier: typeName.declarationSpecifiers()!.typeSpecifier()!,
                blockParam: nil,
                nullability: nullability,
                context: context,
                isEscaping: typeName.declarationSpecifiers()?.NS_NOESCAPE().isEmpty ?? true
            )
        } else {
            return try swiftType(
                typeSpecifier: typeName.declarationSpecifiers()!.typeSpecifier()!,
                blockParam: nil,
                nullability: nullability, // nullability specified in parent
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
        protocolList: P.ProtocolListContext,
        nullability: TypeNullability
    ) -> any TypeSyntaxProtocol {
        // e.g. id or id<AAA, BBB>
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
                name: .identifier(
                    mapSwiftType(protocolList.protocolName().first!.getText())
                )
            )
            .optionalized(
                nullability,
                isObjcPrimitiveType: false
            )
        }
    }
    
    func swiftType(
        typeSpecifier: P.TypeSpecifierContext,
        blockParam: P.BlockParametersContext?,
        nullability: TypeNullability,
        context: TypeDeclarationContext,
        isContainedByPointer: Bool = false,
        isTypedef: Bool = false,
        isEscaping: Bool = false
    ) throws -> any TypeSyntaxProtocol {
        if let blockParam {
            // BOOL (^enumerateProviders)(id<ABProviderProtocol> provider, BOOL *stop)
            // becomes
            // var enumerateProviders: (provider: ABProviderProtocol, stop: UnsafeMutablePointer<ObjcBool>) -> Bool
            return FunctionTypeSyntax(
                parameters: try TupleTypeElementListSyntax {
                    for typeVariableDeclOrName in blockParam.typeVariableDeclaratorOrName() {
                        if let typeVariableDecl = typeVariableDeclOrName.typeVariableDeclarator() {
                            let identifier = typeVariableDecl.declarator()!.identifier()
                            let firstName: TokenSyntax? = isTypedef ? .wildcardToken() : identifier.map {
                                .identifier(
                                    $0.getText()
                                )
                            }
                            let secondName: TokenSyntax? = isTypedef ? identifier.map {
                                .identifier(
                                    $0.getText()
                                )
                            } : nil
                            
                            TupleTypeElementSyntax(
                                firstName: firstName,
                                secondName: secondName,
                                colon: identifier != nil ? .colonToken() : nil,
                                type: try swiftType(
                                    typeVariableDecl: typeVariableDecl,
                                    nullability: nullability
                                        .with(propertyNullability: nil)
                                        .with(declarationSpecifiers: typeVariableDecl.declarationSpecifiers()),
                                    context: context
                                )
                            )
                        } else if let typeName = typeVariableDeclOrName.typeName() {
                            TupleTypeElementSyntax(
                                type: try swiftType(
                                    typeName: typeName,
                                    nullability: nullability
                                        .with(propertyNullability: nil)
                                        .with(typeName: typeName),
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
            .escaping(isEscaping)
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
                                    nullability: nullability.with(nullabilitySpecifier: subTypeSpecifier.nullabilitySpecifier()),
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
        } else if typeSpecifier.ID() != nil {
            if let protocolList = typeSpecifier.protocolList() {
                return swiftType(
                    protocolList: protocolList,
                    nullability: nullability
                )
            } else {
               return IdentifierTypeSyntax(
                   name: .identifier("Any")
               )
               .optionalized(nullability, isObjcPrimitiveType: false)
           }
        } else if let genericTypeSpecifier = typeSpecifier.genericTypeSpecifier() {
            // genericTypeSpecifier
            //    : identifier ((LT protocolList GT) | genericsSpecifier)?
            //    ;
            
            // genericsSpecifier
            //    : LT (typeSpecifierWithPrefixes (',' typeSpecifierWithPrefixes)*)? GT
            //    ;
            
            let typeName = genericTypeSpecifier.identifier()!.getText()
            let mappedTypeName = mappingObjcTypeToSwift(typeName)
            
            if let protocolConformances = genericTypeSpecifier.protocolList()?.protocolName() {
                return IdentifierTypeSyntax(
                    name: .identifier(mappedTypeName),
                    genericArgumentClause: GenericArgumentClauseSyntax {
                        GenericArgumentListSyntax {
                            for protocolConformance in protocolConformances {
                                GenericArgumentSyntax(
                                    argument: IdentifierTypeSyntax(
                                        name: .identifier(protocolConformance.getText())
                                    )
                                    .optionalized(
                                        nullability.with(isGenericType: true),
                                        isObjcPrimitiveType: false
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
            } else if let genericConformances = genericTypeSpecifier.genericConformanceList()?.genericConformance() {
                // Has generic specifiers
                // e.g. NSDictionary<NSString *, id<AA>> *
                
                // Handle special cases for NSArray, NSDictionary
                if typeName == "NSArray" || typeName == "NSMutableArray" {
                    // Array at most only have one generic arg
                    if let genericsType = genericConformances.first?.genericsType {
                        return ArrayTypeSyntax(
                            element: try swiftType(
                                typeSpecifier: genericsType.typeSpecifier()!,
                                blockParam: nil,
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
                    let keyType = genericConformances[0].genericsType!
                    let valueType = genericConformances[1].genericsType!
                    return DictionaryTypeSyntax(
                        key: try swiftType(
                            typeSpecifier: keyType.typeSpecifier()!,
                            blockParam: nil,
                            nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                            context: context
                        ),
                        value: try swiftType(
                            typeSpecifier: valueType.typeSpecifier()!,
                            blockParam: nil,
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
                                for genericConformance in genericConformances {
                                    if let genericsType = genericConformance.genericsType {
                                        GenericArgumentSyntax(
                                            argument: try swiftType(
                                                typeSpecifier: genericsType.typeSpecifier()!,
                                                blockParam: nil,
                                                nullability: nullability.with(isGenericType: true), // Objc generics are considered nonnull
                                                context: context
                                            )
                                        )
                                    }
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
                    let mappedTypeName = mappingObjcTypeToSwift(typeName)
                    
                    return IdentifierTypeSyntax(
                        name: .identifier(mappedTypeName)
                    )
                    .optionalized(
                        nullability,
                        isObjcPrimitiveType: ObjcSwiftUtils.isObjcPrimitive(typeName)
                    )
                    .escaping(isEscaping)
                }
            }
        } else if let structOrUnion = typeSpecifier.structOrUnionSpecifier() {
            if structOrUnion.UNION() != nil {
                // Ignore struct or union
                throw ObjcTranslatorError.unsupported(
                    "union",
                    parseTreeType: String(describing: type(of: typeSpecifier))
                )
            } else if structOrUnion.STRUCT() != nil {
                guard let structIdentifier = structOrUnion.identifier()?.getText() else {
                    throw ObjcTranslatorError.unsupported(
                        "typedef struct",
                        parseTreeType: String(describing: type(of: typeSpecifier))
                    )
                }
                return IdentifierTypeSyntax(
                    name: .identifier(
                        structIdentifier
                    )
                )
            }
        } else if let _ = typeSpecifier.enumSpecifier() {
            // Ignore explicit enum type declaration
            throw ObjcTranslatorError.unsupported(
                "enumSpecifier",
                parseTreeType: String(describing: type(of: typeSpecifier))
            )
        } else if let identifier = typeSpecifier.identifier() {
            return swiftType(
                identifier: identifier,
                nullability: nullability
            )
        }
            
        fatalError("Unknown typeSpecifier")
    }
    
    func swiftType(
        identifier: P.IdentifierContext,
        nullability: TypeNullability
    ) -> any TypeSyntaxProtocol {
        let mappedTypeName = mappingObjcTypeToSwift(identifier.getText())
        
        return IdentifierTypeSyntax(
            name: .identifier(mappedTypeName)
        )
        .optionalized(
            nullability,
            isObjcPrimitiveType: ObjcSwiftUtils.isObjcPrimitive(identifier.getText())
        )
    }
}

private extension TypeSyntaxProtocol {
    func optionalized(
        _ nullability: ObjcTranslator.TypeNullability,
        isObjcPrimitiveType: Bool
    ) -> any TypeSyntaxProtocol {
        guard !isObjcPrimitiveType else {
            return self
        }
        return optionalized(!nullability.isExplicitlyNonnull)
    }
}

extension TypeSyntaxProtocol {
    func escaping(_ shouldEscape: Bool) -> any TypeSyntaxProtocol {
        guard shouldEscape else {
            return self
        }
        
        if self.is(OptionalTypeSyntax.self) {
            // Optional closure is always escaping
            return self
        }
        
        return AttributedTypeSyntax(
            attributes: AttributeListSyntax {
                AttributeSyntax(
                    atSign: .atSignToken(),
                    attributeName: IdentifierTypeSyntax(
                        name: .identifier("escaping")
                    )
                    .with(\.trailingTrivia, .space)
                )
            },
            baseType: self
        )
    }
}

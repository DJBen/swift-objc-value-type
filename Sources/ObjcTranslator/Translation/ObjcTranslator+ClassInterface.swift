import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        classInterfaceDecl: P.ClassInterfaceContext
    ) throws -> CodeBlockItemListSyntax {
        let className = classInterfaceDecl.className.getText()
        
        try ClassDeclSyntax(
            leadingTrivia: .newlines(2) + beforeTrivia(for: classInterfaceDecl),
            attributes: AttributeListSyntax {
                if mapSwiftType(className) == className {
                    "@objc"
                } else {
                    "@objc(\(raw: className))"
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                mapSwiftType(className)
            ),
            inheritanceClause: InheritanceClauseSyntax(
                inheritedTypes: InheritedTypeListSyntax {
                    InheritedTypeSyntax(
                        type: IdentifierTypeSyntax(
                            name: .identifier(classInterfaceDecl.superclassName.getText())
                        )
                    )
                    // A classInterface may maximumly have two triangular bracketed lists.
                    // e.g. Subclass specifying the generic type and conforming to NSCopying
                    // @interface MySpecificClass : MyGenericClass<NSString *> <NSCopying>
                    // @end
                    for protocolItem in (classInterfaceDecl.protocolList().first?.protocolName() ?? []) {
                        InheritedTypeSyntax(
                            type: IdentifierTypeSyntax(
                                name: .identifier(ObjcSwiftUtils.mappingObjcProtocolConformances(protocolName: protocolItem.getText()))
                            )
                        )
                    }
                }
            ),
            memberBlockBuilder: {
                if let interfaceDeclList = classInterfaceDecl.interfaceDeclarationList() {
                    
                    for propertyDecl in interfaceDeclList.propertyDeclaration() {
                        let interfaceDeclListTrivia = propertyDecl === interfaceDeclList.children?.first ? beforeTrivia(for: interfaceDeclList) : Trivia()
                        
                        let attributes = propertyDecl.propertyAttributesList()?.propertyAttribute() ?? []
                        
                        try VariableDeclSyntax(
                            leadingTrivia: .newlines(2) + interfaceDeclListTrivia + beforeTrivia(for: propertyDecl),
                            attributes: AttributeListSyntax {
                                "@objc"
                            }
                            .with(\.trailingTrivia, .newline),
                            modifiers: DeclModifierListSyntax {
                                if access == .public {
                                    DeclModifierSyntax(name: .keyword(.public))
                                }
                                if attributes.contains(where: { $0.WEAK() != nil }) {
                                    DeclModifierSyntax(name: .keyword(.weak))
                                }
                            },
                            bindingSpecifier: {
                                if attributes.contains(where: { $0.WEAK() != nil }) {
                                    return .keyword(.var)
                                }
                                return .keyword(.let)
                            }(),
                            bindingsBuilder: {
                                let identifier = swiftIdentifier(
                                    declarator: propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!.declarator()!
                                )
                                
                                let type = try swiftType(
                                    propertyDecl: propertyDecl,
                                    nullability: TypeNullability(
                                        propertyNullability: {
                                            if attributes.contains(where: { $0.nullabilitySpecifier()?.NULLABLE() != nil }) {
                                                return .nullable
                                            } else if attributes.contains(where: { $0.nullabilitySpecifier()?.NONNULL() != nil }) {
                                                return .nonnull
                                            }
                                            return nil
                                        }(),
                                        isNSAssumeNonnull: isNSAssumeNonnull(propertyDecl),
                                        isGenericType: false
                                    )
                                )
                                PatternBindingSyntax(
                                    pattern: IdentifierPatternSyntax(
                                        identifier: identifier
                                    ),
                                    typeAnnotation: TypeAnnotationSyntax(
                                        type: type
                                    )
                                )
                            },
                            trailingTrivia: afterTrivia(for: propertyDecl)
                        )
                    }
                    
                    for instanceMethodDecl in interfaceDeclList.instanceMethodDeclaration() {
                        let interfaceDeclListTrivia = instanceMethodDecl === interfaceDeclList.children?.first ? beforeTrivia(for: interfaceDeclList) : Trivia()

                        let methodDecl = instanceMethodDecl.methodDeclaration()!
                        
                        let returnType = try methodDecl.methodType().map {
                            try swiftType(
                                typeName: $0.typeName()!,
                                nullability: TypeNullability(
                                    propertyNullability: nil,
                                    isNSAssumeNonnull: isNSAssumeNonnull(instanceMethodDecl),
                                    isGenericType: false
                                )
                                .with(typeName: $0.typeName()),
                                context: .propertyOrMethodReturnType
                            )
                        }
                        
                        // methodSelector
                        //    : selector
                        //    | keywordDeclarator+ (',' '...')?
                        //    ;

                        let (_, firstArgFirstName, firstArgSecondName) = methodDecl.funcNameAndFirstParam
                        
                        let funcSignature = FunctionSignatureSyntax(
                            parameterClause: FunctionParameterClauseSyntax(
                                parameters: try FunctionParameterListSyntax {
                                    for (funcParamIndex, keywordDecl) in methodDecl.methodSelector()!.keywordDeclarator().enumerated() {
                                        let varName = keywordDecl.identifier()!.getText()
                                        let firstName: TokenSyntax = {
                                            if funcParamIndex == 0 {
                                                return firstArgFirstName
                                            } else if let selectorName = keywordDecl.selector()?.getText(), selectorName.lowercased() != varName.lowercased() {
                                                return .identifier(selectorName)
                                            } else {
                                                return .identifier(varName)
                                            }
                                        }()
                                        let secondName: TokenSyntax? = {
                                            if funcParamIndex == 0 {
                                                return firstArgSecondName
                                            } else if let selectorName = keywordDecl.selector()?.getText(), selectorName.lowercased() != varName.lowercased() {
                                                return .identifier(keywordDecl.identifier()!.getText())
                                            } else {
                                                return nil
                                            }
                                        }()
                                        FunctionParameterSyntax(
                                            firstName: firstName,
                                            secondName: secondName,
                                            type: try swiftType(
                                                typeName: keywordDecl.methodType().first?.typeName(),
                                                nullability: TypeNullability(
                                                    propertyNullability: nil,
                                                    isNSAssumeNonnull: isNSAssumeNonnull(methodDecl),
                                                    isGenericType: false
                                                )
                                                .with(typeName: keywordDecl.methodType().first?.typeName()),
                                                context: .methodArgument
                                            )
                                        )
                                    }
                                }
                            ),
                            returnClause: {
                                // Omit for initializers
                                if methodDecl.isInitializer {
                                    return nil
                                }
                                // Omit for void return types
                                if methodDecl.methodType()?.typeName()?.getText() == "void" {
                                    return nil
                                }
                                return returnType.map {
                                    ReturnClauseSyntax(type: $0)
                                }
                            }()
                        )
                                                
                        if !methodDecl.hasUnavailableAttribute {
                            if methodDecl.isInitializer {
                                InitializerDeclSyntax(
                                    leadingTrivia: .newlines(2) + interfaceDeclListTrivia + beforeTrivia(for: instanceMethodDecl) + beforeTrivia(for: methodDecl),
                                    attributes: AttributeListSyntax {
                                        methodDecl.availabilityAttributes
                                        "@objc"
                                    }
                                    .with(\.trailingTrivia, .newline),
                                    modifiers: DeclModifierListSyntax {
                                        if access == .public {
                                            DeclModifierSyntax(name: .keyword(.public))
                                        }
                                    },
                                    signature: funcSignature,
                                    bodyBuilder: {
                                        for propertyDecl in interfaceDeclList.propertyDeclaration() {
                                            let identifier = swiftIdentifier(
                                                declarator: propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!.declarator()!
                                            )
                                            "self.\(raw: identifier) = \(raw: identifier)"
                                        }
                                        "super.init()"
                                    },
                                    trailingTrivia: afterTrivia(for: instanceMethodDecl) + afterTrivia(for: methodDecl)
                                )
                            }
                        }
                    }
                }
            }
        )
    }
}

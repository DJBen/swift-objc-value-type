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
        try ClassDeclSyntax(
            leadingTrivia: .newlines(2) + beforeTrivia(for: classInterfaceDecl),
            attributes: AttributeListSyntax {
                if existingPrefix.isEmpty {
                    "@objc"
                } else {
                    "@objc(\(raw: classInterfaceDecl.className.getText()))"
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                classInterfaceDecl.className.getText().removingPrefix(existingPrefix)
            ),
            inheritanceClause: InheritanceClauseSyntax(
                inheritedTypes: InheritedTypeListSyntax {
                    InheritedTypeSyntax(
                        type: IdentifierTypeSyntax(
                            name: .identifier(classInterfaceDecl.superclassName.getText())
                        )
                    )
                    for protocolItem in (classInterfaceDecl.protocolList()?.protocolName() ?? []) {
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
                        let attributes = propertyDecl.propertyAttributesList()?.propertyAttribute() ?? []
                        
                        try VariableDeclSyntax(
                            leadingTrivia: .newlines(2) + beforeTrivia(for: propertyDecl),
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

                        let rawFunctionName: String = {
                            if let selector = methodDecl.methodSelector()!.selector() {
                                // Method without args
                                return selector.getText()
                            } else {
                                // Method with at least one args
                                let keywordDecls = methodDecl.methodSelector()!.keywordDeclarator()
                                return keywordDecls.first!.selector()!.getText()
                            }
                        }()

                        let (functionName, firstParam): (String, String?) = {
                            // Objective-C with `With` in method signature produces different Swift functions
                            // `-initWithValue:(SomeType *)value` becomes `func init(value: SomeType)`
                            // `-methodWithArg:(Arg *)diffArgName` becomes `func method(arg diffArgName: Arg)`
                            let fragments = rawFunctionName.split(separator: "With")
                            if fragments.count == 1 {
                                return (String(fragments[0]), nil)
                            } else {
                                return (String(fragments[0]), String(fragments[1...].joined()).lowercasingFirst)
                            }
                        }()
                        
                        let funcSignature = FunctionSignatureSyntax(
                            parameterClause: FunctionParameterClauseSyntax(
                                parameters: try FunctionParameterListSyntax {
                                    for (funcParamIndex, keywordDecl) in methodDecl.methodSelector()!.keywordDeclarator().enumerated() {
                                        let firstName: String? = {
                                            if funcParamIndex == 0, let firstParam {
                                                return firstParam
                                            } else if functionName.lowercased().hasSuffix(keywordDecl.identifier()!.getText().lowercased()) {
                                                return nil
                                            } else {
                                                return keywordDecl.identifier()!.getText()
                                            }
                                        }()
                                        let secondName: String? = {
                                            if funcParamIndex == 0 {
                                                if let firstParam, firstParam.lowercased() != keywordDecl.identifier()!.getText().lowercased() {
                                                    return keywordDecl.identifier()!.getText()
                                                } else if firstName == nil {
                                                    return keywordDecl.identifier()!.getText()
                                                }
                                            }
                                            return nil
                                        }()
                                        FunctionParameterSyntax(
                                            firstName: firstName.map { .identifier($0) } ?? .wildcardToken(),
                                            secondName: secondName.map { .identifier($0) },
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
                                    leadingTrivia: .newlines(2) + beforeTrivia(for: instanceMethodDecl) + beforeTrivia(for: methodDecl),
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

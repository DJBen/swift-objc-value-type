import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @MemberBlockItemListBuilder
    func translate(
        instanceMethodDeclaration methodDecl: P.InstanceMethodDeclarationContext
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: false,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    func translate(
        classMethodDeclaration methodDecl: P.ClassMethodDeclarationContext
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: true,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func swiftMethodDecl(
        parentLeadingTrivia: Trivia,
        methodDecl: P.MethodDeclarationContext,
        isClassMethod: Bool,
        parentTrailingTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        let returnType = try methodDecl.methodType().map {
            try swiftType(
                typeName: $0.typeName()!,
                nullability: TypeNullability(
                    propertyNullability: nil,
                    isNSAssumeNonnull: isNSAssumeNonnull(methodDecl),
                    isGenericType: false
                ),
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
        
        // keywordDeclarator
        //    : selector? ':' methodType* arcBehaviourSpecifier? identifier
        //    ;
        
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
                                typeName: keywordDecl.methodType().first!.typeName()!,
                                nullability: TypeNullability(
                                    propertyNullability: nil,
                                    isNSAssumeNonnull: isNSAssumeNonnull(methodDecl),
                                    isGenericType: false
                                ),
                                context: .methodArgument
                            )
                        )
                    }
                }
            ),
            returnClause: {
                // Omit for initializers
                if methodDecl.methodType()?.typeName()?.getText() == "instancetype" {
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
        
        if methodDecl.methodType()?.typeName()?.getText() == "instancetype" {
            InitializerDeclSyntax(
                leadingTrivia: .newlines(2) + parentLeadingTrivia + beforeTrivia(for: methodDecl),
                signature: funcSignature,
                trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
            )
        } else {
            FunctionDeclSyntax(
                leadingTrivia: .newlines(2) + parentLeadingTrivia + beforeTrivia(for: methodDecl),
                modifiers: DeclModifierListSyntax {
                    if isClassMethod {
                        DeclModifierSyntax(name: .keyword(.class))
                    }
                },
                name: .identifier(functionName),
                signature: funcSignature,
                trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
            )
        }
    }
}

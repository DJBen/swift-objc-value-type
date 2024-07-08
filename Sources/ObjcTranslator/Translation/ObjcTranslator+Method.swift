import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import OrderedCollections
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @MemberBlockItemListBuilder
    func translate(
        instanceMethodDeclaration methodDecl: P.InstanceMethodDeclarationContext,
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            sectionBeforeTrivia: sectionBeforeTrivia,
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: false,
            isOptionalConformance: isOptionalConformance,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    func translate(
        classMethodDeclaration methodDecl: P.ClassMethodDeclarationContext,
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            sectionBeforeTrivia: sectionBeforeTrivia,
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: true,
            isOptionalConformance: isOptionalConformance,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func swiftMethodDecl(
        sectionBeforeTrivia: Trivia,
        parentLeadingTrivia: Trivia,
        methodDecl: P.MethodDeclarationContext,
        isClassMethod: Bool,
        isOptionalConformance: Bool,
        parentTrailingTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        let returnType = try methodDecl.methodType().map {
            try swiftType(
                typeName: $0.typeName()!,
                nullability: TypeNullability(
                    typeName: $0.typeName()!,
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
                                    typeName: keywordDecl.methodType().first!.typeName()!,
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
        
        if !methodDecl.hasUnavailableAttribute {
            if methodDecl.methodType()?.typeName()?.getText() == "instancetype" {
                InitializerDeclSyntax(
                    leadingTrivia: .newlines(2) + sectionBeforeTrivia + parentLeadingTrivia + beforeTrivia(for: methodDecl),
                    attributes: AttributeListSyntax {
                        methodDecl.availabilityAttributes
                        "@objc"
                    }
                        .with(\.trailingTrivia, .newline),
                    signature: funcSignature,
                    trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
                )
            } else {
                FunctionDeclSyntax(
                    leadingTrivia: .newlines(2) + sectionBeforeTrivia + parentLeadingTrivia + beforeTrivia(for: methodDecl),
                    attributes: AttributeListSyntax {
                        methodDecl.availabilityAttributes
                        "@objc"
                    }
                        .with(\.trailingTrivia, .newline),
                    modifiers: DeclModifierListSyntax {
                        if isClassMethod {
                            DeclModifierSyntax(name: .keyword(.class))
                        }
                        if isOptionalConformance {
                            DeclModifierSyntax(name: .keyword(.optional))
                        }
                    },
                    name: .identifier(functionName),
                    signature: funcSignature,
                    trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
                )
            }
        }
    }
}

extension P.MethodDeclarationContext {
    // https://clang.llvm.org/docs/AttributeReference.html#availability
    @AttributeListBuilder
    var availabilityAttributes: AttributeListSyntax {
        // macro
        //    : identifier (LP primaryExpression (',' primaryExpression)* RP)?
        //    | NS_SWIFT_NAME LP swiftSelectorExpression RP
        //    | API_AVAILABLE LP apiAvailableOsVersion (',' apiAvailableOsVersion)* RP
        //    | API_UNAVAILABLE LP identifier (',' identifier)* RP
        //    | NS_SWIFT_UNAVAILABLE LP stringLiteral RP
        //    ;
        
        for `macro` in self.macro() {
            if `macro`.API_AVAILABLE() != nil {
                for osVersion in `macro`.apiAvailableOsVersion() {
                    let osVersionString = "\(swiftOS(osVersion.identifier()!.getText())) \(osVersion.version()!.getText())"
                     AttributeSyntax(
                         "@available(\(raw: osVersionString), *)"
                     )
                     .with(\.trailingTrivia, .newline)
                }
            }
            if `macro`.API_UNAVAILABLE() != nil {
                for identifier in `macro`.identifier() {
                    AttributeSyntax(
                        "@available(\(raw: swiftOS(identifier.getText())), unavailable)"
                    )
                    .with(\.trailingTrivia, .newline)
                }
            }
            if `macro`.ATTRIBUTE() != nil {
                for clangAttr in `macro`.clangAttribute() {
                    // __attribute__((availability(macos,introduced=10.4,deprecated=10.6,obsoleted=10.7)))
                    if clangAttr.identifier()?.getText() == "availability" {
                        let os = swiftOS(clangAttr.clangAttributeArgument(0)!.getText())
                        let isUnavailble = clangAttr.clangAttributeArgument().contains(where: { $0.identifier()?.getText() == "unavailable" })
                        let message = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "message" }).map {
                            "message: \($0.stringLiteral()!.getText())"
                        }
                        if isUnavailble {
                            if let message {
                                AttributeSyntax(
                                    "@available(\(raw: os), unavailable, \(raw: message))"
                                )
                                .with(\.trailingTrivia, .newline)
                            } else {
                                AttributeSyntax(
                                    "@available(\(raw: os), unavailable)"
                                )
                                .with(\.trailingTrivia, .newline)
                            }
                        } else {
                            let introduced = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "introduced" }).map {
                                "introduced: \($0.version()!.getText())"
                            }
                            let deprecated = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "deprecated" }).map {
                                "deprecated: \($0.version()!.getText())"
                            }
                            let obsoleted = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "obsoleted" }).map {
                                "obsoleted: \($0.version()!.getText())"
                            }
                            
                            let args = [introduced, deprecated, obsoleted, message].compactMap({ $0 }).joined(separator: ", ")
                                                    
                            AttributeSyntax(
                                "@available(\(raw: os), \(raw: args))"
                            )
                            .with(\.trailingTrivia, .newline)
                        }
                    }
                }
            }
        }
    }
    
    var hasUnavailableAttribute: Bool {
        for `macro` in self.macro() {
            if `macro`.identifier().contains(where: { $0.getText() == "NS_UNAVAILABLE" }) {
                return true
            }
            if `macro`.NS_SWIFT_UNAVAILABLE() != nil {
                return true
            }
            if `macro`.clangAttribute().contains(where: { clangAttr in
                clangAttr.identifier()!.getText() == "unavailable"
            }) {
                return true
            }
        }
        return false
    }
}

private func swiftOS(_ os: String) -> String {
    if os.lowercased() == "ios" {
        return "iOS"
    } else if os.lowercased() == "macos" {
        return "macOS"
    } else if os.lowercased() == "tvos" {
        return "tvOS"
    } else if os.lowercased() == "watchos" {
        return "watchOS"
    } else if os.lowercased() == "visionos" {
        return "visionOS"
    } else if os.lowercased() == "driverkit" {
        return "driverKit"
    }
    return os
}

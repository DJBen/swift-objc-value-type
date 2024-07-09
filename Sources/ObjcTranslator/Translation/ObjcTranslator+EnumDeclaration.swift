import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        enumDecl: P.EnumDeclarationContext,
        declLeadingTrivia: Trivia
    ) throws -> CodeBlockItemListSyntax {
        if let enumSpecifier = enumDecl.enumSpecifier(), let typedefEnumIdentifier = enumDecl.identifier() {
            // typedef enum {...} Iden
            let typeName = enumSpecifier.typeName()?.getText() ?? "int"
            try buildEnumDecl(
                enumDecl: enumDecl,
                enumeratorList: enumSpecifier.enumeratorList()!,
                declLeadingTrivia: declLeadingTrivia,
                name: typedefEnumIdentifier.getText(),
                objcTypeName: typeName
            )
        } else if let nsEnumOrOptionSpecifier = enumDecl.nsEnumOrOptionSpecifier() {
            if nsEnumOrOptionSpecifier.NS_ENUM() != nil || nsEnumOrOptionSpecifier.NS_CLOSED_ENUM() != nil || nsEnumOrOptionSpecifier.NS_ERROR_ENUM() != nil, let identifier = nsEnumOrOptionSpecifier.identifier(), let typeName = nsEnumOrOptionSpecifier.typeName() {
                // typedef NS_ENUM(Iden, type)
                
                if let enumeratorList = nsEnumOrOptionSpecifier.enumeratorList() {
                    try buildEnumDecl(
                        enumDecl: enumDecl,
                        enumeratorList: enumeratorList,
                        declLeadingTrivia: declLeadingTrivia,
                        name: identifier.getText(),
                        objcTypeName: typeName.getText()
                    )
                } else {
                    // Treat definition without an enumerator list as typedef
                    TypeAliasDeclSyntax(
                        leadingTrivia: .newlines(2) + beforeTrivia(for: enumDecl),
                        name: .identifier(identifier.getText()),
                        initializer: TypeInitializerClauseSyntax(
                            value: try swiftType(
                                typeName: typeName,
                                nullability: TypeNullability(
                                    propertyNullability: nil,
                                    isNSAssumeNonnull: true,
                                    isGenericType: false
                                ),
                                context: .propertyOrMethodReturnType
                            )
                        ),
                        trailingTrivia: afterTrivia(for: enumDecl)
                    )
                }
            } else if nsEnumOrOptionSpecifier.NS_OPTIONS() != nil, let identifier = nsEnumOrOptionSpecifier.identifier(), let typeName = nsEnumOrOptionSpecifier.typeName()?.getText() {
                // Note that Swift OptionSet is not backward compatible with Objective-C consumers.
                
                try buildOptionSetDecl(
                    enumDecl: enumDecl,
                    enumeratorList: nsEnumOrOptionSpecifier.enumeratorList()!,
                    declLeadingTrivia: declLeadingTrivia,
                    name: identifier.getText(),
                    objcTypeName: typeName
                )
            }
        }
    }
    
    @CodeBlockItemListBuilder
    private func buildOptionSetDecl(
        enumDecl: P.EnumDeclarationContext,
        enumeratorList: P.EnumeratorListContext,
        declLeadingTrivia: Trivia,
        name: String,
        objcTypeName: String
    ) throws -> CodeBlockItemListSyntax {
        StructDeclSyntax(
            leadingTrivia: .newlines(2) + declLeadingTrivia + beforeTrivia(for: enumDecl),
            attributes: AttributeListSyntax {
            }
            .with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                name.removingPrefix(existingPrefix)
            ),
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeListSyntax {
                    InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier("OptionSet")))
                }
            },
            memberBlockBuilder: {
                if access == .public {
                    "public let rawValue: UInt"
                } else {
                    "let rawValue: UInt"
                }
                
                for (index, enumerator) in enumeratorList.enumerator().enumerated() {
                    VariableDeclSyntax(
                        leadingTrivia: .newlines(2) + (index == 0 ? beforeTrivia(for: enumeratorList) : []) + beforeTrivia(for: enumerator),
                        modifiers: DeclModifierListSyntax {
                            if access == .public {
                                DeclModifierSyntax(name: .keyword(.public))
                            }
                        },
                        bindingSpecifier: .keyword(.let),
                        bindings: PatternBindingListSyntax {
                            PatternBindingSyntax(
                                pattern: IdentifierPatternSyntax(
                                    identifier: .identifier(
                                        enumerator.enumeratorIdentifier()!.getText().removingPrefix(name).lowercasingFirst
                                    )
                                ),
                                initializer: InitializerClauseSyntax(
                                    value: FunctionCallExprSyntax(
                                        calledExpression: DeclReferenceExprSyntax(
                                            baseName: .identifier(name.removingPrefix(existingPrefix))
                                        ),
                                        leftParen: .leftParenToken(),
                                        arguments: LabeledExprListSyntax {
                                            LabeledExprSyntax(
                                                label: "rawValue",
                                                expression: ExprSyntax(stringLiteral: enumerator.expression()!.getText())
                                            )
                                        },
                                        rightParen: .rightParenToken()
                                    )
                                )
                            )
                        },
                        trailingTrivia: afterTrivia(for: enumerator) + (index == enumeratorList.enumerator().count - 1 ? afterTrivia(for: enumeratorList) : [])
                    )
                }
                
                if access == .public {
                    DeclSyntax(
                        """
                        public init(rawValue: UInt) {
                            self.rawValue = rawValue
                        }
                        """
                    )
                    .with(\.leadingTrivia, .newlines(2))
                }
            },
            trailingTrivia: afterTrivia(for: enumDecl)
        )
    }
    
    @CodeBlockItemListBuilder
    private func buildEnumDecl(
        enumDecl: P.EnumDeclarationContext,
        enumeratorList: P.EnumeratorListContext,
        declLeadingTrivia: Trivia,
        name: String,
        objcTypeName: String
    ) throws -> CodeBlockItemListSyntax {
        // enumeratorList
        //    : enumerator (',' enumerator)* ','?
        //    ;
        //
        // enumerator
        //    : enumeratorIdentifier ('=' expression)?
        //    ;
        //
        // enumeratorIdentifier
        //    : identifier
        //    | 'default'
        //    ;
        
        EnumDeclSyntax(
            leadingTrivia: .newlines(2) + declLeadingTrivia + beforeTrivia(for: enumDecl),
            attributes: AttributeListSyntax {
                if existingPrefix.isEmpty {
                    "@objc"
                } else {
                    "@objc(\(raw: name))"
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                name.removingPrefix(existingPrefix)
            ),
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeListSyntax {
                    InheritedTypeSyntax(
                        type: IdentifierTypeSyntax(
                            name: .identifier(ObjcSwiftUtils.mappingObjcTypeToSwift(
                                objcTypeName, existingPrefix: existingPrefix
                            ))
                        )
                    )
                }
            },
            memberBlockBuilder: {
                for (index, enumerator) in enumeratorList.enumerator().enumerated() {
                    EnumCaseDeclSyntax(
                        leadingTrivia: (index == 0 ? beforeTrivia(for: enumeratorList) : []) + beforeTrivia(for: enumerator),
                        elementsBuilder:  {
                            EnumCaseElementSyntax(
                                name: .identifier(
                                    enumerator.enumeratorIdentifier()!.getText().removingPrefix(name).lowercasingFirst
                                ),
                                rawValue: enumerator.expression().map { expr in
                                    InitializerClauseSyntax(
                                        value: ExprSyntax(stringLiteral: expr.getText())
                                    )
                                }
                            )
                        }, 
                        trailingTrivia: afterTrivia(for: enumerator) + (index == enumeratorList.enumerator().count - 1 ? afterTrivia(for: enumeratorList) : [])
                    )
                }
            },
            trailingTrivia: afterTrivia(for: enumDecl)
        )
    }
}

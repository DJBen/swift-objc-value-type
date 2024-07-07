import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        enumDecl: P.EnumDeclarationContext
    ) throws -> CodeBlockItemListSyntax {
        // enumDeclaration
        //    : attributeSpecifier? TYPEDEF? enumSpecifier identifier? ';'
        //    ;
        // enumSpecifier  
        //    : 'enum' (identifier? ':' typeName)? (
        //        identifier ('{' enumeratorList '}')?
        //        | '{' enumeratorList '}'
        //    )
        //    | ('NS_OPTIONS' | 'NS_ENUM') LP typeName ',' identifier RP '{' enumeratorList '}'
        //    ;
        let enumSpecifier = enumDecl.enumSpecifier()!
        
        if enumSpecifier.ENUM() != nil, let typedefEnumIdentifier = enumDecl.identifier() {
            // typedef enum {...} Iden
            let typeName = enumSpecifier.typeName()?.getText() ?? "int"
            try buildEnumDecl(
                enumDecl: enumDecl,
                enumeratorList: enumSpecifier.enumeratorList()!,
                name: typedefEnumIdentifier.getText(),
                objcTypeName: typeName
            )
        } else if enumSpecifier.NS_ENUM() != nil, let identifier = enumSpecifier.identifier().first, let typeName = enumSpecifier.typeName()?.getText() {
            // typedef NS_ENUM(Iden, type)
            
            try buildEnumDecl(
                enumDecl: enumDecl,
                enumeratorList: enumSpecifier.enumeratorList()!,
                name: identifier.getText(),
                objcTypeName: typeName
            )
        } else if enumSpecifier.NS_OPTIONS() != nil, let identifier = enumSpecifier.identifier().first, let typeName = enumSpecifier.typeName()?.getText() {
            // Note that Swift OptionSet is not backward compatible with Objective-C consumers.
            
            try buildOptionSetDecl(
                enumDecl: enumDecl,
                enumeratorList: enumSpecifier.enumeratorList()!,
                name: identifier.getText(),
                objcTypeName: typeName
            )
        }
    }
    
    @CodeBlockItemListBuilder
    private func buildOptionSetDecl(
        enumDecl: P.EnumDeclarationContext,
        enumeratorList: P.EnumeratorListContext,
        name: String,
        objcTypeName: String
    ) throws -> CodeBlockItemListSyntax {
        StructDeclSyntax(
            leadingTrivia: .newlines(2) + beforeTrivia(for: enumDecl),
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
            leadingTrivia: .newlines(2) + beforeTrivia(for: enumDecl),
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

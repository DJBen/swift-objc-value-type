import Foundation
import SharedUtilities
import ObjcGrammar
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
        } else if enumSpecifier.NS_OPTIONS() != nil {
            // Because Swift OptionSet is not backward compatible with Objective-C consumers, we want to present a warning 
        }
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

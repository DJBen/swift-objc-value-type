import Foundation
import SharedUtilities
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        protocolDecl: P.ProtocolDeclarationContext,
        existingPrefix: String
    ) throws -> CodeBlockItemListSyntax {
        if let macro = protocolDecl.macro() {
            // TODO: handle NS_SWIFT_NAME
        }
        
        try ProtocolDeclSyntax(
            leadingTrivia: .newlines(2) + beforeTrivia(for: protocolDecl),
            attributes: AttributeListSyntax {
                if existingPrefix.isEmpty {
                    "@objc"
                } else {
                    "@objc(\(raw: protocolDecl.protocolName()!.getText()))"
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                protocolDecl.protocolName()!.getText().removingPrefix(existingPrefix)
            ),
            inheritanceClause: protocolDecl.protocolList().map { protocolList in
                InheritanceClauseSyntax {
                    InheritedTypeListSyntax {
                        for protocolItem in protocolList.protocolName() {
                            InheritedTypeSyntax(
                                type: IdentifierTypeSyntax(
                                    name: .identifier(ObjcSwiftUtils.mappingObjcProtocolConformances(protocolName: protocolItem.getText()))
                                )
                            )
                        }
                    }
                }
            },
            memberBlockBuilder: {
                for section in protocolDecl.protocolDeclarationSection() {
                    try interfaceDeclList(
                        section.interfaceDeclarationList(),
                        isOptional: section.OPTIONAL() != nil
                    )
                }
            },
            trailingTrivia: afterTrivia(for: protocolDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func interfaceDeclList(
        _ interfaceDeclLists: [P.InterfaceDeclarationListContext],
        isOptional: Bool
    ) throws -> MemberBlockItemListSyntax {
        // interfaceDeclarationList
        //    : (
        //        declaration
        //        | classMethodDeclaration
        //        | instanceMethodDeclaration
        //        | propertyDeclaration
        //        | functionDeclaration
        //    )+
        //    ;

        for interfaceDeclList in interfaceDeclLists {
            for classMethodDecl in interfaceDeclList.classMethodDeclaration() {
                
            }
            
            for instanceMethodDecl in interfaceDeclList.instanceMethodDeclaration() {
                
            }
            
            for propertyDecl in interfaceDeclList.propertyDeclaration() {
                try translate(
                    propertyDecl: propertyDecl,
                    existingPrefix: existingPrefix
                )
            }
            
            for functionDecl in interfaceDeclList.functionDeclaration() {
                
            }
        }
    }
}

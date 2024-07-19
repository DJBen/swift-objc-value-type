import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        protocolDecl: P.ProtocolDeclarationContext
    ) throws -> CodeBlockItemListSyntax {
        let protocolName = protocolDecl.protocolName()!.getText()
        
        try ProtocolDeclSyntax(
            leadingTrivia: .newlines(2) + beforeTrivia(for: protocolDecl),
            attributes: AttributeListSyntax {
                if mapSwiftType(protocolName, macro: protocolDecl.macro()) == protocolName {
                    "@objc"
                } else {
                    "@objc(\(raw: protocolName))"
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(
                mapSwiftType(protocolName, macro: protocolDecl.macro())
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
                        isOptionalConformance: section.OPTIONAL() != nil,
                        sectionBeforeTrivia: beforeTrivia(for: section)
                    )
                }
            },
            trailingTrivia: afterTrivia(for: protocolDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func interfaceDeclList(
        _ interfaceDeclLists: [P.InterfaceDeclarationListContext],
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia
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

        for (index, interfaceDeclList) in interfaceDeclLists.enumerated() {
            
            let firstChild = index == 0 ? interfaceDeclList.children!.first! : nil
            
            for propertyDecl in interfaceDeclList.propertyDeclaration() {
                try translate(
                    propertyDecl: propertyDecl, 
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: firstChild === propertyDecl ? sectionBeforeTrivia : Trivia(),
                    existingPrefix: existingPrefix
                )
            }
            
            for classMethodDecl in interfaceDeclList.classMethodDeclaration() {
                try translate(
                    classMethodDeclaration: classMethodDecl,
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: firstChild === classMethodDecl ? sectionBeforeTrivia : Trivia()
                )
            }
            
            for instanceMethodDecl in interfaceDeclList.instanceMethodDeclaration() {
                try translate(
                    instanceMethodDeclaration: instanceMethodDecl,
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: firstChild === instanceMethodDecl ? sectionBeforeTrivia: Trivia()
                )
            }
        }
    }
}

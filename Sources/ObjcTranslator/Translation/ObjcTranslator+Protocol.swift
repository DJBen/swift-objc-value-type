import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        protocolDecl: P.ProtocolDeclarationContext,
        existingPrefix: String
    ) throws -> CodeBlockItemListSyntax {
        
        
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
            name: {
                if let macro = protocolDecl.macro(), macro.identifier()?.NS_SWIFT_NAME() != nil, let swiftName = macro.primaryExpression().first?.getText() {
                    return .identifier(swiftName)
                } else {
                    return .identifier(
                        protocolDecl.protocolName()!.getText().removingPrefix(existingPrefix)
                    )
                }
            }(),
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

        for interfaceDeclList in interfaceDeclLists {
            for (index, propertyDecl) in interfaceDeclList.propertyDeclaration().enumerated() {
                try translate(
                    propertyDecl: propertyDecl, 
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: index == 0 ? sectionBeforeTrivia : Trivia(),
                    existingPrefix: existingPrefix
                )
            }
            
            for (index, classMethodDecl) in interfaceDeclList.classMethodDeclaration().enumerated() {
                try translate(
                    classMethodDeclaration: classMethodDecl,
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: index == 0 ? sectionBeforeTrivia : Trivia()
                )
            }
            
            for (index, instanceMethodDecl) in interfaceDeclList.instanceMethodDeclaration().enumerated() {
                try translate(
                    instanceMethodDeclaration: instanceMethodDecl,
                    isOptionalConformance: isOptionalConformance,
                    sectionBeforeTrivia: index == 0 ? sectionBeforeTrivia: Trivia()
                )
            }
            
            for functionDecl in interfaceDeclList.functionDeclaration() {
                
            }
        }
    }
}

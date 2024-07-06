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
                        isOptionalConformance: section.OPTIONAL() != nil
                    )
                }
            },
            trailingTrivia: afterTrivia(for: protocolDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func interfaceDeclList(
        _ interfaceDeclLists: [P.InterfaceDeclarationListContext],
        isOptionalConformance: Bool
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
            for propertyDecl in interfaceDeclList.propertyDeclaration() {
                try translate(
                    propertyDecl: propertyDecl, 
                    isOptionalConformance: isOptionalConformance,
                    existingPrefix: existingPrefix
                )
            }
            
            for classMethodDecl in interfaceDeclList.classMethodDeclaration() {
                try translate(
                    classMethodDeclaration: classMethodDecl,
                    isOptionalConformance: isOptionalConformance
                )
            }
            
            for instanceMethodDecl in interfaceDeclList.instanceMethodDeclaration() {
                try translate(
                    instanceMethodDeclaration: instanceMethodDecl,
                    isOptionalConformance: isOptionalConformance
                )
            }
            
            for functionDecl in interfaceDeclList.functionDeclaration() {
                
            }
        }
    }
}

import Foundation
import SharedUtilities
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @MemberBlockItemListBuilder
    func translate(
        propertyDecl: P.PropertyDeclarationContext,
        existingPrefix: String
    ) throws -> MemberBlockItemListSyntax {
        // propertyDeclaration
        //    : '@property' (LP propertyAttributesList RP)? ibOutletQualifier? IB_INSPECTABLE? fieldDeclaration
        //    ;
        
        let attributes = propertyDecl.propertyAttributesList()?.propertyAttribute() ?? []
        
        try VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                if attributes.contains(where: { $0.WEAK() != nil }) {
                    DeclModifierSyntax(name: .keyword(.weak))
                }
            },
            bindingSpecifier: .keyword(.var),
            bindingsBuilder: {
                // fieldDeclaration
                //    : specifierQualifierList fieldDeclaratorList macro? ';'
                //    ;

                let typeSpecifiers = propertyDecl.fieldDeclaration()!.specifierQualifierList()!.typeSpecifier()
                let identifier = try swiftIdentifier(fieldDeclarator: propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!)
                
                let type = try swiftType(
                    from: typeSpecifiers,
                    isNullable: attributes.contains(where: { $0.nullabilitySpecifier()?.NULLABLE() != nil })
                )
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(
                        identifier: identifier
                    ),
                    typeAnnotation: TypeAnnotationSyntax(
                        type: type
                    ),
                    accessorBlock: AccessorBlockSyntax(
                        leftBrace: .leftBraceToken(),
                        accessors: .accessors(
                            AccessorDeclListSyntax {
                                AccessorDeclSyntax(accessorSpecifier: .keyword(.get))
                                if attributes.contains(where: { $0.READONLY() != nil && ($0.READWRITE() == nil) }) {
                                    // Readonly
                                } else {
                                    AccessorDeclSyntax(accessorSpecifier: .keyword(.set))
                                }
                            }
                        ),
                        rightBrace: .rightBraceToken()
                    )
                )
            }
        )
    }
}

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
            leadingTrivia: .newlines(2) + beforeTrivia(for: propertyDecl),
            modifiers: DeclModifierListSyntax {
                if access == .public {
                    DeclModifierSyntax(name: .keyword(.public))
                }
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
                // Only read the first item, assume there isn't multiple decls in the same line e.g. `BOOL a, b, c`;
                let fieldDeclarator = propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!
                let identifier = swiftIdentifier(
                    directDeclarator: propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!.declarator()!.directDeclarator()!
                )
                
                let type = try swiftType(
                    typeSpecifiers: typeSpecifiers,
                    declarator: fieldDeclarator.declarator()!,
                    isNullable: attributes.contains(where: { $0.nullabilitySpecifier()?.NULLABLE() != nil }),
                    context: .property
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
            },
            trailingTrivia: afterTrivia(for: propertyDecl)
        )
    }
}

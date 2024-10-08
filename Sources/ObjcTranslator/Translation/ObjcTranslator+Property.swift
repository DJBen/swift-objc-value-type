import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @MemberBlockItemListBuilder
    func translate(
        propertyDecl: P.PropertyDeclarationContext,
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia,
        existingPrefix: String
    ) throws -> MemberBlockItemListSyntax {
        // propertyDeclaration
        //    : '@property' (LP propertyAttributesList RP)? ibOutletQualifier? IB_INSPECTABLE? fieldDeclaration
        //    ;
        
        let attributes = propertyDecl.propertyAttributesList()?.propertyAttribute() ?? []
        
        try VariableDeclSyntax(
            leadingTrivia: .newlines(2) + sectionBeforeTrivia + beforeTrivia(for: propertyDecl),
            modifiers: DeclModifierListSyntax {
                if attributes.contains(where: { $0.WEAK() != nil }) {
                    DeclModifierSyntax(name: .keyword(.weak))
                }
                if isOptionalConformance {
                    DeclModifierSyntax(name: .keyword(.optional))
                }
            },
            bindingSpecifier: .keyword(.var),
            bindingsBuilder: {
                // fieldDeclaration
                //    : declarationSpecifiers fieldDeclaratorList macro? ';'
                //    ;

                let identifier = swiftIdentifier(
                    declarator: propertyDecl.fieldDeclaration()!.fieldDeclaratorList()!.fieldDeclarator(0)!.declarator()!
                )
                
                let type = try swiftType(
                    propertyDecl: propertyDecl,
                    nullability: {
                        var nullability = TypeNullability(isNSAssumeNonnull: isNSAssumeNonnull(propertyDecl), isGenericType: false)
                        if attributes.contains(where: { $0.nullabilitySpecifier()?.NULLABLE() != nil }) {
                            nullability = nullability.with(propertyNullability: .nullable)
                        } else if attributes.contains(where: { $0.nullabilitySpecifier()?.NONNULL() != nil }) {
                            nullability = nullability.with(propertyNullability: .nonnull)
                        }
                        return nullability
                    }()
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

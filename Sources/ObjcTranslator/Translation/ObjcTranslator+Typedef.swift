import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        typedefDecl: P.TypedefDeclarationContext,
        declLeadingTrivia: Trivia
    ) throws -> CodeBlockItemListSyntax {
        if let typeDeclarator = typedefDecl.typeDeclaratorList()?.declarator().first {
            TypeAliasDeclSyntax(
                leadingTrivia: .newlines(2) + declLeadingTrivia + beforeTrivia(for: typedefDecl),
                modifiers: DeclModifierListSyntax {
                    if access == .public {
                        DeclModifierSyntax(name: .keyword(.public))
                    }
                },
                name: swiftIdentifier(
                    declarator: typeDeclarator
                ),
                initializer: TypeInitializerClauseSyntax(
                    value: try swiftType(
                        typedefDecl: typedefDecl,
                        nullability: TypeNullability(
                            propertyNullability: nil,
                            isNSAssumeNonnull: false,
                            isGenericType: false
                        )
                    )
                ),
                trailingTrivia: afterTrivia(for: typedefDecl)
            )
        }
    }
}

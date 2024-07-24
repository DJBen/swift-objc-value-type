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

extension P.TranslationUnitContext {
    /// Get a list of names of the blocks defined by typedef.
    /// - Returns: A list of names of blocks defined via typedef
    var typedefBlockNames: Set<String> {
        var blockNames = Set<String>()
        for topLevelDecl in topLevelDeclaration() {
            if let decl = topLevelDecl.declaration(), let typedefDecl = decl.typedefDeclaration(), let declarator = typedefDecl.typeDeclaratorList()?.declarator().first {
                if let blockName = declarator.identifier()?.getText(), declarator.blockParameters() != nil {
                    blockNames.insert(blockName)
                }
            }
        }
        return blockNames
    }
}

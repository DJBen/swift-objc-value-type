import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        typedefDecl: P.TypedefDeclarationContext
    ) throws -> CodeBlockItemListSyntax {
        // typedefDeclaration
        //    : attributeSpecifier? TYPEDEF (
        //        declarationSpecifiers typeDeclaratorList
        //        | declarationSpecifiers
        //    ) ';'
        //    ;
        
        if let typeDeclarator = typedefDecl.typeDeclaratorList()?.typeDeclarator().first {
            TypeAliasDeclSyntax(
                leadingTrivia: .newlines(2) + beforeTrivia(for: typedefDecl),
                name: swiftIdentifier(
                    directDeclarator: typeDeclarator.directDeclarator()!
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

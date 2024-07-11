import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @CodeBlockItemListBuilder
    func translate(
        varDecl: P.VarDeclarationContext,
        translationUnitTrivia: Trivia,
        declLeadingTrivia: Trivia
    ) throws -> CodeBlockItemListSyntax {
        if let _ = varDecl.declarationSpecifiers()?.typeSpecifier()?.structOrUnionSpecifier(), let initDeclList = varDecl.initDeclaratorList() {
            // For constant holder structs,
            // port to a @objc class that exposes static constants
            
            for initDecl in initDeclList.initDeclarator() {
                let identifier = initDecl.declarator()!.identifier()!.getText()
                if let initializer = initDecl.initializer(), let structInitializer = initializer.structInitializer() {
                    ClassDeclSyntax(
                        leadingTrivia: .newlines(2) + translationUnitTrivia + declLeadingTrivia,
                        attributes: AttributeListSyntax {
                            if existingPrefix.isEmpty {
                                "@objc"
                            } else {
                                "@objc(\(raw: identifier))"
                            }
                        }.with(\.trailingTrivia, .newline),
                        modifiers: DeclModifierListSyntax {
                            if access == .public {
                                DeclModifierSyntax(name: .keyword(.public))
                            }
                        },
                        name: .identifier(identifier.removingPrefix(existingPrefix)),
                        inheritanceClause: InheritanceClauseSyntax {
                            InheritedTypeListSyntax {
                                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier("NSObject")))
                            }
                        },
                        memberBlockBuilder: {
                            // .landingPage = @"landing_page",
                            for expression in structInitializer.expression() {
                                let constName = expression.unaryExpression()!.getText()
                                
                                VariableDeclSyntax(
                                    leadingTrivia: .newlines(2) + beforeTrivia(for: expression),
                                    attributes: AttributeListSyntax {
                                        "@objc"
                                    }.with(\.trailingTrivia, .newline),
                                    modifiers: DeclModifierListSyntax {
                                        if access == .public {
                                            DeclModifierSyntax(name: .keyword(.public))
                                        }
                                        DeclModifierSyntax(name: .keyword(.static))
                                    },
                                    bindingSpecifier: .keyword(.let),
                                    bindingsBuilder: {
                                        PatternBindingSyntax(
                                            pattern: IdentifierPatternSyntax(identifier: .identifier(constName.lowercasingFirst)),
                                            initializer: InitializerClauseSyntax(
                                                equal: .equalToken(),
                                                value: swiftExpr(expression.expression(0)!)
                                            )
                                        )
                                    },
                                    trailingTrivia: afterTrivia(for: expression)
                                )
                            }
                        }
                    )
                }
            }
        } else if let initDeclList = varDecl.initDeclaratorList() {
            for initDecl in initDeclList.initDeclarator() {
                let identifier = initDecl.declarator()!.identifier()!.getText()
                if let initializer = initDecl.initializer() {
                    try VariableDeclSyntax(
                        leadingTrivia: .newlines(2) + translationUnitTrivia + declLeadingTrivia + beforeTrivia(for: varDecl) + .lineComment("// WARNING: this const declaration is not accessible from ObjC; consider wrap it with a @objc class.") + .newline,
                        modifiers: DeclModifierListSyntax {
                            if access == .public {
                                DeclModifierSyntax(name: .keyword(.public))
                            }
                            DeclModifierSyntax(name: .keyword(.static))
                        },
                        bindingSpecifier: .keyword(.let),
                        bindingsBuilder: {
                            PatternBindingSyntax(
                                pattern: IdentifierPatternSyntax(identifier: .identifier(identifier)),
                                initializer: InitializerClauseSyntax(
                                    equal: .equalToken(),
                                    value: try { () -> ExprSyntax in
                                        if let expression = initializer.expression() {
                                            return ExprSyntax(swiftExpr(expression))
                                        } else if let arrayInitializer = initializer.arrayInitializer(), let typeName = varDecl.declarationSpecifiers()?.typeSpecifier()?.genericTypeSpecifier()?.getText() {
                                            let swiftTypeName = ObjcSwiftUtils.mappingObjcTypeToSwift(typeName)

                                            // e.g. static CGSize const kButtonSize = {50, 50};
                                            let str = (arrayInitializer.expressions()?.expression() ?? [])
                                                .map({ String(describing: swiftExpr($0)) })
                                                .joined(separator: ", ")
                                            return ExprSyntax("\(raw: swiftTypeName)(\(raw: str))")
                                        } else {
                                            throw ObjcTranslatorError.unsupported("initializer", parseTreeType: "expression")
                                        }
                                    }()
                                )
                            )
                        },
                        trailingTrivia: afterTrivia(for: varDecl)
                    )
                }
            }
        }
    }
}

extension P.TopLevelDeclarationContext {
    // Returns whether it is a top-level const var declaration.
    // If so, we may consider to group them up under a `@objc class TypeNameConst {}`, so that it can be accessed by objc,
    var isConstVarDecl: Bool {
        declaration()?.varDeclaration()?.declarationSpecifiers()?.typeSpecifier()?.genericTypeSpecifier() != nil
    }
}

import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

extension SwiftObjcValueTypeFactory {
    @MemberBlockItemListBuilder
    func nsCopyingConformances(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                structDecl.modifiers.trimmed
            },
            name: .identifier("copy"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterListSyntax {
                        FunctionParameterSyntax(
                            firstName: .identifier("with"),
                            secondName: .identifier("zone"),
                            type: TypeSyntax("NSZone?"),
                            defaultValue: InitializerClauseSyntax(value: ExprSyntax("nil"))
                        )
                    }
                },
                returnClause: ReturnClauseSyntax(
                    type: TypeSyntax("Any")
                )
            )
        ) {
            FunctionCallExprSyntax(
                calledExpression: DeclReferenceExprSyntax(baseName: "\(structDecl.name.trimmed)Objc"),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprListSyntax {
                    structDecl.forEachBinding { binding in
                        if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                            LabeledExprSyntax(
                                label: identifierPattern.identifier,
                                colon: .colonToken(),
                                expression: DeclReferenceExprSyntax(
                                    baseName: identifierPattern.identifier
                                )
                            )
                        }
                    }
                }
            }
        }
        .with(\.leadingTrivia, .newlines(2))
    }

    // Remodel implementation simply return self
    @MemberBlockItemListBuilder
    func nsCopyingConformances(
        enumDecl: EnumDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                enumDecl.modifiersExcludingIndirect.trimmed
            },
            name: .identifier("copy"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterListSyntax {
                        FunctionParameterSyntax(
                            firstName: .identifier("with"),
                            secondName: .identifier("zone"),
                            type: TypeSyntax("NSZone?"),
                            defaultValue: InitializerClauseSyntax(value: ExprSyntax("nil"))
                        )
                    }
                },
                returnClause: ReturnClauseSyntax(
                    type: TypeSyntax("Any")
                )
            )
        ) {
            "return self"
        }
        .with(\.leadingTrivia, .newlines(2))
    }
}

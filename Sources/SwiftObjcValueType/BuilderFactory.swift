import SwiftSyntax
import SwiftSyntaxBuilder

public struct BuilderFactory {
    public init() {}

    public func objcBuilderExtensionDecl(
        structDecl: StructDeclSyntax
    ) throws -> ExtensionDeclSyntax {
        let structName = structDecl.name.trimmed.text

        return try ExtensionDeclSyntax(
            extendedType: IdentifierTypeSyntax(
                name: .identifier("\(structName)Class")
            )
        ) {
            try objcBuilderDecl(structDecl: structDecl)
        }
    }

    @MemberBlockItemListBuilder public func objcBuilderDecl(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let structName = structDecl.name.trimmed.text

        try ClassDeclSyntax(
            attributes: AttributeListSyntax {
                .attribute("@objc")
            }.with(\.trailingTrivia, .newline),
            modifiers: structDecl.modifiers.trimmed,
            name: "\(raw: structName)Builder",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeListSyntax {
                    InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSObject"))
                }
            },
            memberBlockBuilder: {
                for member in structDecl.memberBlock.members {
                    if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                        try objcVariableDecl(
                            variableTypeDecl: variableTypeDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }
                }

                DeclSyntax(
                    #"""
                    private func error(field: String) -> Error {
                        NSError(
                            domain: "ValueType.Builder.NonnullFieldUnset",
                            code: 1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to build because nonnull field '\(field)' is unset"]
                        )
                    }
                    """#
                )
                .with(\.leadingTrivia, .newlines(2))

                FunctionDeclSyntax(
                    attributes: AttributeListSyntax {
                        .attribute("@objc")
                    }.with(\.trailingTrivia, .newline),
                    modifiers: structDecl.modifiers.trimmed,
                    name: "build",
                    signature: FunctionSignatureSyntax(
                        parameterClause: FunctionParameterClauseSyntax {},
                        effectSpecifiers: FunctionEffectSpecifiersSyntax(throwsSpecifier: .keyword(.throws)),
                        returnClause: ReturnClauseSyntax(
                            type: IdentifierTypeSyntax(name: "\(raw: structName)Class")
                        )
                    )
                ) {
                    for member in structDecl.memberBlock.members {
                        if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                            for binding in variableTypeDecl.bindings {
                                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation, !typeAnnotation.type.is(OptionalTypeSyntax.self) {
                                    let variableName = identifierPattern.identifier.trimmed.text
                                    StmtSyntax(
                                        """
                                        guard let \(raw: variableName) = \(raw: variableName) else {
                                            throw error(field: "\(raw: variableName)")
                                        }
                                        """
                                    )
                                }
                            }
                        }
                    }

                    ReturnStmtSyntax(
                        expression: FunctionCallExprSyntax(
                            calledExpression: DeclReferenceExprSyntax(
                                baseName: .identifier("\(structName)Class")
                            ),
                            leftParen: .leftParenToken(),
                            arguments: LabeledExprListSyntax {
                                for member in structDecl.memberBlock.members {
                                    if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                                        for binding in variableTypeDecl.bindings {
                                            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                                let variableName = identifierPattern.identifier.trimmed.text

                                                LabeledExprSyntax(
                                                    label: variableName,
                                                    expression: typeAnnotation.unwrapedNSNumberForNonNullVariables(
                                                        variableName: variableName
                                                    )
                                                )
                                            }
                                        }
                                    }
                                }
                            },
                            rightParen: .rightParenToken()
                        )
                    )
                    .with(\.leadingTrivia, .newlines(2))
                }
                .with(\.leadingTrivia, .newlines(2))
            }
        )
    }

    @MemberBlockItemListBuilder
    private func objcVariableDecl(
        variableTypeDecl: VariableDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            attributes: AttributeListSyntax {
                .attribute("@objc")
            },
            modifiers: variableTypeDecl.modifiers.trimmed,
            bindingSpecifier: .keyword(.var)
        ) {
            for binding in variableTypeDecl.bindings {
                if let typeAnnotation = binding.typeAnnotation {

                    PatternBindingSyntax(
                        pattern: binding.pattern,
                        typeAnnotation: {
                            if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self) {
                                if optional.wrappedType.isNSNumberBridged {
                                    return TypeAnnotationSyntax(
                                        type: OptionalTypeSyntax(
                                            wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                        )
                                    )
                                } else {
                                    return TypeAnnotationSyntax(
                                        type: optional
                                    )
                                }
                            } else {
                                if typeAnnotation.type.isNSNumberBridged {
                                    return TypeAnnotationSyntax(
                                        type: OptionalTypeSyntax(
                                            wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                        )
                                    )
                                } else {
                                    return TypeAnnotationSyntax(
                                        type: OptionalTypeSyntax(
                                            wrappedType: typeAnnotation.type
                                        )
                                    )
                                }
                            }
                        }()
                    )
                }
            }
        }
    }
}

extension TypeAnnotationSyntax {
    func unwrapedNSNumberForNonNullVariables(
        variableName: String
    ) -> ExprSyntax {
        if type.is(OptionalTypeSyntax.self) {
            return DeclReferenceExprSyntax(
                baseName: .identifier(variableName)
            )
            .cast(ExprSyntax.self)
        } else {
            if let identifierSyntax = type.asNSNumberBridged() {
                return MemberAccessExprSyntax(
                    base: DeclReferenceExprSyntax(
                        baseName: .identifier(variableName)
                    ),
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(
                        baseName: .identifier(identifierSyntax.name.trimmed.text.camelCased + "Value")
                    )
                )
                .cast(ExprSyntax.self)
            } else {
                return DeclReferenceExprSyntax(
                    baseName: .identifier(variableName)
                )
                .cast(ExprSyntax.self)
            }
        }
    }
}

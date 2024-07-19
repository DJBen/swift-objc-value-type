import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    @MemberBlockItemListBuilder 
    public func objcBuilderDecl(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>,
        prefix: String
    ) throws -> MemberBlockItemListSyntax {
        let structName = structDecl.name.trimmed.text

        ClassDeclSyntax(
            attributes: AttributeListSyntax {
                if prefix.isEmpty {
                    .attribute("@objc")
                } else {
                    .attribute("@objc(\(raw: prefix + structName.trimmingPrefix(prefix))Builder)")
                }
            }.with(\.trailingTrivia, .newline),
            modifiers: structDecl.modifiers.trimmed,
            name: "\(raw: structName)Builder",
            inheritanceClause: InheritanceClauseSyntax {
                InheritedTypeListSyntax {
                    InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSObject"))
                }
            },
            memberBlockBuilder: {

                // @objc
                // public class func foo() -> FooBuilder {
                //     FooBuilder()
                // }
                FunctionDeclSyntax(
                    attributes: AttributeListSyntax {
                        "@objc"
                    },
                    modifiers: DeclModifierListSyntax {
                        DeclModifierSyntax(name: .keyword(.public))
                        DeclModifierSyntax(name: .keyword(.class))
                    },
                    name: .identifier(structName.lowercasingFirst),
                    signature: FunctionSignatureSyntax(
                        parameterClause: FunctionParameterClauseSyntax(
                            leftParen: .leftParenToken(),
                            parameters: FunctionParameterListSyntax {},
                            rightParen: .rightParenToken()
                        ),
                        returnClause: ReturnClauseSyntax(
                            arrow: .arrowToken(),
                            type: IdentifierTypeSyntax(
                                name: .identifier("\(structName)Builder")
                            )
                        )
                    )
                ) {
                    FunctionCallExprSyntax(
                        calledExpression: DeclReferenceExprSyntax(
                            baseName: .identifier("\(structName)Builder")
                        ),
                        leftParen: .leftParenToken(),
                        arguments: LabeledExprListSyntax {},
                        rightParen: .rightParenToken()
                    )
                }

                // @objc class func value(existingValue: ValueObjc) -> ValueBuilder {
                //     ValueBuilder.value().withDoubleValue(...).with...()
                // }
                FunctionDeclSyntax(
                    attributes: AttributeListSyntax {
                        "@objc"
                    },
                    modifiers: DeclModifierListSyntax {
                        DeclModifierSyntax(name: .keyword(.public))
                        DeclModifierSyntax(name: .keyword(.class))
                    },
                    name: .identifier("\(structName.lowercasingFirst)"),
                    signature: FunctionSignatureSyntax(
                        parameterClause: FunctionParameterClauseSyntax(
                            leftParen: .leftParenToken(),
                            parameters: FunctionParameterListSyntax {
                                FunctionParameterSyntax(
                                    firstName: .identifier("existing\(structName)"),
                                    type: IdentifierTypeSyntax(name: "\(raw: structName)Objc")
                                )
                            },
                            rightParen: .rightParenToken()
                        ),
                        returnClause: ReturnClauseSyntax(
                            arrow: .arrowToken(),
                            type: IdentifierTypeSyntax(
                                name: .identifier("\(structName)Builder")
                            )
                        )
                    )
                ) {
                    FunctionCallExprSyntax(
                        calledExpression: MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(
                                baseName: .identifier("\(structName)Builder")
                            ),
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(
                                baseName: .identifier(structName.lowercasingFirst)
                            )
                        ),
                        leftParen: .leftParenToken(),
                        arguments: LabeledExprListSyntax {},
                        rightParen: .rightParenToken()
                    )
                    .withExistingParams(structDecl: structDecl)
                }
                .with(\.leadingTrivia, .newlines(2))

                structDecl.forEachBinding { binding in
                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {

                        // private var str: String?
                        VariableDeclSyntax(
                            modifiers: DeclModifierListSyntax {
                                DeclModifierSyntax(name: .keyword(.private))
                            },
                            bindingSpecifier: .keyword(.var)
                        ) {
                            if let typeAnnotation = binding.typeAnnotation {
                                PatternBindingSyntax(
                                    pattern: binding.pattern,
                                    typeAnnotation: TypeAnnotationSyntax(type: typeAnnotation.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes).optionalized)
                                )
                            }
                        }
                        .with(\.leadingTrivia, .newlines(2))

                        // @objc @discardableResult
                        // public func withStr(_ str: String?) {
                        //     self.str = str
                        //     return self
                        // }
                        FunctionDeclSyntax(
                            attributes: AttributeListSyntax {
                                "@objc"
                                AttributeSyntax(
                                    atSign: .atSignToken(),
                                    attributeName: IdentifierTypeSyntax(
                                        name: .identifier("discardableResult")
                                    )
                                )
                                .with(\.trailingTrivia, .newline)
                            },
                            modifiers: DeclModifierListSyntax {
                                DeclModifierSyntax(name: .keyword(.public))
                            },
                            name: .identifier("with\(identifierPattern.identifier.trimmed.text.uppercasingFirst)"),
                            signature: FunctionSignatureSyntax(
                                parameterClause: FunctionParameterClauseSyntax(
                                    leftParen: .leftParenToken(),
                                    parameters: FunctionParameterListSyntax {
                                        FunctionParameterSyntax(
                                            firstName: .wildcardToken(),
                                            secondName: identifierPattern.identifier.trimmed,
                                            type: typeAnnotation.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes)
                                        )
                                    },
                                    rightParen: .rightParenToken()
                                ),
                                returnClause: ReturnClauseSyntax(
                                    arrow: .arrowToken(),
                                    type: IdentifierTypeSyntax(
                                        name: .identifier("\(structName)Builder")
                                    )
                                )
                            )
                        ) {
                            "self.\(raw: identifierPattern.identifier.trimmed.text) = \(raw: identifierPattern.identifier.trimmed.text)"

                            "return self"
                        }
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

                DeclSyntax(
                    """
                    @objc \(raw: structDecl.modifiers.isPublic ? "public " : "")func build() -> \(raw: structName)Objc {
                        try! safeBuild()
                    }
                    """
                )
                .with(\.leadingTrivia, .newlines(2))

                FunctionDeclSyntax(
                    attributes: AttributeListSyntax {
                        .attribute("@objc")
                    }.with(\.trailingTrivia, .newline),
                    modifiers: structDecl.modifiers.trimmed,
                    name: "safeBuild",
                    signature: FunctionSignatureSyntax(
                        parameterClause: FunctionParameterClauseSyntax {},
                        effectSpecifiers: FunctionEffectSpecifiersSyntax(throwsSpecifier: .keyword(.throws)),
                        returnClause: ReturnClauseSyntax(
                            type: IdentifierTypeSyntax(name: "\(raw: structName)Objc")
                        )
                    )
                ) {
                    structDecl.forEachBinding { binding in
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

                    ReturnStmtSyntax(
                        expression: FunctionCallExprSyntax(
                            calledExpression: DeclReferenceExprSyntax(
                                baseName: .identifier("\(structName)Objc")
                            ),
                            leftParen: .leftParenToken(),
                            arguments: LabeledExprListSyntax {
                                structDecl.forEachBinding { binding in
                                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                                        let variableName = identifierPattern.identifier.trimmed.text

                                        LabeledExprSyntax(
                                            label: variableName,
                                            expression: DeclReferenceExprSyntax(
                                                baseName: .identifier(variableName)
                                            )
                                        )
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
}

extension FunctionCallExprSyntax {
    func withExistingParams(structDecl: StructDeclSyntax) -> FunctionCallExprSyntax {
        let structName = structDecl.name.trimmed.text

        var expr = self
        structDecl.forEachBinding { binding in
            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                let variableName = identifierPattern.identifier.trimmed.text
                expr = expr.withExistingParams(variableName, structName: structName)
            }
        }
        return expr
    }

    // .withOptInt(existingValue.optInt
    private func withExistingParams(_ param: String, structName: String) -> FunctionCallExprSyntax {
        FunctionCallExprSyntax(
            calledExpression: MemberAccessExprSyntax(
                base: self,
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(
                    baseName: .identifier("with\(param.uppercasingFirst)")
                )
            ),
            leftParen: .leftParenToken(),
            arguments: LabeledExprListSyntax {
                LabeledExprSyntax(
                    expression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .identifier("existing\(structName)")),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(baseName: .identifier(param))
                    )
                )
            },
            rightParen: .rightParenToken()
        )
    }
}

extension TypeAnnotationSyntax {
    func unwrapedNSNumberForNonNullVariables(
        variableName: String
    ) -> any ExprSyntaxProtocol {
        if type.is(OptionalTypeSyntax.self) {
            return DeclReferenceExprSyntax(
                baseName: .identifier(variableName)
            )
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
            } else {
                return DeclReferenceExprSyntax(
                    baseName: .identifier(variableName)
                )
            }
        }
    }
}

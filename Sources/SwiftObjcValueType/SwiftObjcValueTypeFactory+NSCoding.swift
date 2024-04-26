import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    func nsCodingConstants(
        structDecl: StructDeclSyntax
    ) -> [VariableDeclSyntax] {
        var decls = [VariableDeclSyntax]()

        structDecl.enumerateBindings { binding in
            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                decls.append(
                    VariableDeclSyntax(
                        modifiers: DeclModifierListSyntax {
                            DeclModifierSyntax(name: .keyword(.private))
                        },
                        bindingSpecifier: .keyword(.let)
                    ) {
                        PatternBindingListSyntax {
                            PatternBindingSyntax(
                                pattern: IdentifierPatternSyntax(identifier: .identifier("k\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key")),
                                initializer: InitializerClauseSyntax(
                                    equal: .equalToken(),
                                    value: StringLiteralExprSyntax(
                                        openingQuote: .stringQuoteToken(),
                                        segments: StringLiteralSegmentListSyntax {
                                            StringSegmentSyntax(
                                                content: .stringSegment(identifierPattern.identifier.trimmed.text.upperSnakeCased)
                                            )
                                        },
                                        closingQuote: .stringQuoteToken()
                                    )
                                )
                            )
                        }
                    }
                )
            }
        }

        return decls
    }

    // coder.decodeObject(forKey: kOptIntKey) as? NSNumber
    private func nsCodingDecodeCall(
        type: TypeSyntax,
        identifier: TokenSyntax,
        castToType: Bool
    ) -> InitializerClauseSyntax {
        InitializerClauseSyntax(
            value: SequenceExprSyntax {
                FunctionCallExprSyntax(
                    calledExpression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .identifier("coder")),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(
                            baseName: type.nsCodableDecodingFunction
                        )
                    ),
                    leftParen: .leftParenToken(),
                    arguments: LabeledExprListSyntax {
                        LabeledExprSyntax(
                            label: .identifier("forKey"),
                            colon: .colonToken(),
                            expression: DeclReferenceExprSyntax(
                                baseName: .identifier("k\(identifier.trimmed.text.uppercasingFirst)Key")
                            )
                        )
                    },
                    rightParen: .rightParenToken()
                )

                if let optionalType = type.as(OptionalTypeSyntax.self), optionalType.wrappedType.isNSNumberBridged {
                    UnresolvedAsExprSyntax(
                        questionOrExclamationMark: .postfixQuestionMarkToken()
                    )

                    TypeExprSyntax(
                        type: IdentifierTypeSyntax(
                            name: .identifier("NSNumber")
                        )
                    )
                } else if castToType {
                    UnresolvedAsExprSyntax(
                        questionOrExclamationMark: .postfixQuestionMarkToken()
                    )

                    TypeExprSyntax(
                        type: type
                    )
                }
            }
        )
    }

    @MemberBlockItemListBuilder
    func nsCodingConformances(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                structDecl.modifiers.trimmed
            },
            name: .identifier("encode"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterListSyntax {
                        FunctionParameterSyntax(
                            firstName: .identifier("with"),
                            secondName: .identifier("coder"),
                            type: TypeSyntax("NSCoder")
                        )
                    }
                }
            )
        ) {
            structDecl.enumerateBindings { binding in
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                    FunctionCallExprSyntax(
                        calledExpression: MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(baseName: .identifier("coder")),
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(baseName: {
                                if typeAnnotation.type.is(OptionalTypeSyntax.self) {
                                    return .identifier("encodeConditionalObject")
                                } else {
                                    return .identifier("encode")
                                }
                            }())
                        ),
                        leftParen: .leftParenToken(),
                        arguments: LabeledExprListSyntax {
                            LabeledExprSyntax(
                                expression: DeclReferenceExprSyntax(baseName: identifierPattern.identifier)
                            )

                            LabeledExprSyntax(
                                label: .identifier("forKey"),
                                colon: .colonToken(),
                                expression: DeclReferenceExprSyntax(baseName: .identifier("k\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key"))
                            )
                        },
                        rightParen: .rightParenToken()
                    )
                }

            }
        }
        .with(\.leadingTrivia, .newlines(2))

        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(Keyword.public))
                DeclModifierSyntax(name: .keyword(Keyword.required))
                DeclModifierSyntax(name: .keyword(.convenience))
            },
            optionalMark: .postfixQuestionMarkToken(),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterListSyntax {
                        FunctionParameterSyntax(
                            firstName: .identifier("coder"),
                            type: IdentifierTypeSyntax(name: .identifier("NSCoder"))
                        )
                    }
                }
            )
        ) {
            /*
                let doubleValue = coder.decodeDouble(forKey: kDoubleValueKey)
                let optInt = coder.decodeObject(forKey: kOptIntKey) as? NSNumber
                guard let stringArray = coder.decodeObject(forKey: kStringArrayKey) as? [String] else {
                    return nil
                }
            */
            structDecl.enumerateBindings { binding in
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {

                    // Declare decoded variable as one of them based on whether it
                    // is a primitive type or optional
                    // - let <variable> = coder.decode<Object|Bool|...>(forKey: <key>)
                    // - guard let <variable> = coder.decode<...>(forKey: <key>) as? <type> else { return nil }
                    if typeAnnotation.type.is(OptionalTypeSyntax.self) || typeAnnotation.type.isNSNumberBridged {
                        VariableDeclSyntax(
                            bindingSpecifier: .keyword(SwiftSyntax.Keyword.let),
                            bindings: PatternBindingListSyntax {
                                PatternBindingSyntax(
                                    pattern: IdentifierPatternSyntax(
                                        identifier: identifierPattern.identifier
                                    ),
                                    initializer: nsCodingDecodeCall(
                                        type: typeAnnotation.type,
                                        identifier: identifierPattern.identifier,
                                        castToType: false
                                    )
                                )
                            }
                        )
                    } else {
                        GuardStmtSyntax(
                            guardKeyword: .keyword(.guard),
                            conditions: ConditionElementListSyntax {
                                ConditionElementSyntax(
                                    condition: .optionalBinding(
                                        OptionalBindingConditionSyntax(
                                            bindingSpecifier: .keyword(.let),
                                            pattern: identifierPattern,
                                            initializer: nsCodingDecodeCall(
                                                type: typeAnnotation.type,
                                                identifier: identifierPattern.identifier,
                                                castToType: true
                                            )
                                        )
                                    )
                                )
                            }
                        ) {
                            "return nil"
                        }
                    }
                }
            }

            // self.init(doubleValue: doubleValue, optInt: optInt, stringArray: stringArray, map: map)
            FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: DeclReferenceExprSyntax(
                        baseName: .keyword(.self)
                    ),
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(
                        baseName: .keyword(.`init`)
                    )
                ),
                leftParen: .leftParenToken(),
                arguments: LabeledExprListSyntax {
                    structDecl.enumerateBindings { binding in
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
                },
                rightParen: .rightParenToken()
            )
        }
        .with(\.leadingTrivia, .newlines(2))
    }

}

import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

extension SwiftObjcValueTypeFactory {
    
    /// Turn a pattern binding `let fooBar: MyType` in a struct into a NSCoding constant decl `let kFooKey = "FOO"`.
    /// - Parameter binding: The pattern binding.
    /// - Returns: A variable declaration if available.
    func nsCodingConstant(
        name: String
    ) -> VariableDeclSyntax {
        VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.private))
            },
            bindingSpecifier: .keyword(.let)
        ) {
            PatternBindingListSyntax {
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(identifier: .identifier("k\(name.uppercasingFirst)Key")),
                    initializer: InitializerClauseSyntax(
                        equal: .equalToken(),
                        value: StringLiteralExprSyntax(
                            openingQuote: .stringQuoteToken(),
                            segments: StringLiteralSegmentListSyntax {
                                StringSegmentSyntax(
                                    content: .stringSegment(name.upperSnakeCased)
                                )
                            },
                            closingQuote: .stringQuoteToken()
                        )
                    )
                )
            }
        }
    }

    func nsCodingConstants(
        structDecl: StructDeclSyntax
    ) -> [VariableDeclSyntax] {
        var decls = [VariableDeclSyntax]()

        structDecl.forEachBinding { binding in
            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                decls.append(nsCodingConstant(name: identifierPattern.identifier.trimmed.text))
            }
        }

        return decls
    }

    func nsCodingConstants(
        enumDecl: EnumDeclSyntax
    ) -> [VariableDeclSyntax] {
        var decls = [VariableDeclSyntax]()

        // let kCodedSubtypeKey = "CODED_SUBTYPE"
        // used to distinguish which case the enum type belongs to in its objc wrapper
        decls.append(
            VariableDeclSyntax(
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .keyword(.private))
                },
                bindingSpecifier: .keyword(.let)
            ) {
                PatternBindingListSyntax {
                    PatternBindingSyntax(
                        pattern: IdentifierPatternSyntax(identifier: .identifier("kCodedSubtypeKey")),
                        initializer: InitializerClauseSyntax(
                            equal: .equalToken(),
                            value: StringLiteralExprSyntax(
                                openingQuote: .stringQuoteToken(),
                                segments: StringLiteralSegmentListSyntax {
                                    StringSegmentSyntax(
                                        content: .stringSegment("CODED_SUBTYPE")
                                    )
                                },
                                closingQuote: .stringQuoteToken()
                            )
                        )
                    )
                }
            }
        )

        // For each enum parameter in each enum case,
        // generate a key of "ENUM_CASE_NAME_PARAM_NAME"
        enumDecl.forEachCaseElement { caseElement in
            let params = caseElement.parameterClause?.parameters ?? []
            for (index, caseParam) in params.enumerated() {               
                decls.append(
                    nsCodingConstant(
                        name: caseElement.name.trimmed.text + caseParam.properName(index: index).trimmed.text.uppercasingFirst
                    )
                )
            }
        }

        return decls
    }

    // let optInt = coder.decodeObject(forKey: kOptIntKey) as? NSNumber
    private func nsCodingDecodeAssignmentCall(
        type: some TypeSyntaxProtocol,
        constantName: String
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
                                baseName: .identifier(constantName)
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
                } else if !type.isNSNumberBridged {
                    UnresolvedAsExprSyntax(
                        questionOrExclamationMark: .postfixQuestionMarkToken()
                    )

                    TypeExprSyntax(
                        type: type.unwrappedIfOptional
                    )
                }
            }
        )
    }

    // coder.encode(displayName, forKey: kDisplayNameKey)
    // coder.encode("SUBTYPE_SAVE_BEGAN", forKey: kCodedSubtypeKey)
    private func coderEncodeCall(
        type: some TypeSyntaxProtocol,
        propertyExpr: some ExprSyntaxProtocol,
        constantName: String
    ) -> FunctionCallExprSyntax {
        FunctionCallExprSyntax(
            calledExpression: MemberAccessExprSyntax(
                base: DeclReferenceExprSyntax(baseName: .identifier("coder")),
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(baseName: {
                    if type.is(OptionalTypeSyntax.self) {
                        return .identifier("encodeConditionalObject")
                    } else {
                        return .identifier("encode")
                    }
                }())
            ),
            leftParen: .leftParenToken(),
            arguments: LabeledExprListSyntax {
                LabeledExprSyntax(
                    expression: propertyExpr
                )

                LabeledExprSyntax(
                    label: .identifier("forKey"),
                    colon: .colonToken(),
                    expression: DeclReferenceExprSyntax(
                        baseName: .identifier(constantName)
                    )
                )
            },
            rightParen: .rightParenToken()
        )
    }

    // coder.encode(displayName, forKey: kDisplayNameKey)
    private func coderEncodeCall(
        type: some TypeSyntaxProtocol,
        propertyName: String,
        constantName: String
    ) -> FunctionCallExprSyntax {
        coderEncodeCall(
            type: type,
            propertyExpr: DeclReferenceExprSyntax(baseName: .identifier(propertyName)),
            constantName: constantName
        )
    }

    /// Declare decoded variable as one of them based on whether it is a primitive type or optional
    /// - `let <variable> = coder.decode<Object|Bool|...>(forKey: <key>)`
    /// - `guard let <variable> = coder.decode<...>(forKey: <key>) as? <type> else { return nil }`
    @CodeBlockItemListBuilder
    private func decodeCall(
        type: some TypeSyntaxProtocol,
        identifierPattern: IdentifierPatternSyntax,
        constantEnumPrefix: String? = nil
    ) -> CodeBlockItemListSyntax {
        let constantEnumPrefix = constantEnumPrefix?.uppercasingFirst ?? ""
        let constantName = "k\(constantEnumPrefix)\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key"
        if type.is(OptionalTypeSyntax.self) || type.isNSNumberBridged {
            VariableDeclSyntax(
                bindingSpecifier: .keyword(SwiftSyntax.Keyword.let),
                bindings: PatternBindingListSyntax {
                    PatternBindingSyntax(
                        pattern: identifierPattern,
                        initializer: nsCodingDecodeAssignmentCall(
                            type: type,
                            constantName: constantName
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
                                initializer: nsCodingDecodeAssignmentCall(
                                    type: type,
                                    constantName: constantName
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

    @MemberBlockItemListBuilder
    func nsCodingConformances(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: [String]
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                enumDecl.modifiers.trimmed
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
            SwitchExprSyntax(
                subject: DeclReferenceExprSyntax(baseName: .identifier("subtype"))
            ) {
                enumDecl.forEachCaseElement { caseElement in
                    SwitchCaseSyntax(
                        label: .case(
                            SwitchCaseLabelSyntax {
                                SwitchCaseItemSyntax(
                                    pattern: ExpressionPatternSyntax(
                                        expression: MemberAccessExprSyntax(
                                            period: .periodToken(),
                                            declName: DeclReferenceExprSyntax(baseName: caseElement.name)
                                        )
                                    )
                                )
                            }
                        )
                    ) {
                        let params = caseElement.parameterClause?.parameters ?? []
                        let caseName = caseElement.name.trimmed.text.uppercasingFirst
                        for (index, caseParam) in params.enumerated() {
                            let propertyName = caseParam.properName(index: index).trimmed.text
                            coderEncodeCall(
                                type: caseParam.type,
                                propertyName: caseName.lowercasingFirst + propertyName.uppercasingFirst,
                                constantName: "k\(caseName)\(propertyName.uppercasingFirst)Key"
                            )
                        }

                        coderEncodeCall(
                            type: IdentifierTypeSyntax(name: .identifier("String")),
                            propertyExpr: StringLiteralExprSyntax(
                                openingQuote: .stringQuoteToken(),
                                segments: StringLiteralSegmentListSyntax {
                                    .stringSegment(
                                        StringSegmentSyntax(
                                            content: .stringSegment(
                                                "SUBTYPE_\(caseName.upperSnakeCased)"
                                            )
                                        )
                                    )
                                },
                                closingQuote: .stringQuoteToken()
                            ),
                            constantName: "kCodedSubtypeKey"
                        )
                    }
                }
            }
        }
        .with(\.leadingTrivia, .newlines(2))

        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(Keyword.public))
                DeclModifierSyntax(name: .keyword(Keyword.required))
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
            """
            guard let codedSubtype = coder.decodeObject(forKey: kCodedSubtypeKey) as? String else {
                return nil
            }
            """

            SwitchExprSyntax(
                subject: DeclReferenceExprSyntax(baseName: .identifier("codedSubtype"))
            ) {
                enumDecl.forEachCaseElement { caseElement in
                    let caseName = caseElement.name.trimmed.text.uppercasingFirst

                    SwitchCaseSyntax(
                        label: .case(
                            SwitchCaseLabelSyntax(
                                caseKeyword: .keyword(.case),
                                caseItems: SwitchCaseItemListSyntax {
                                    SwitchCaseItemSyntax(
                                        pattern: ExpressionPatternSyntax(
                                            expression: StringLiteralExprSyntax(
                                                openingQuote: .stringQuoteToken(),
                                                segments: StringLiteralSegmentListSyntax {
                                                    StringSegmentSyntax(
                                                        content: .stringSegment("SUBTYPE_\(caseName.upperSnakeCased)")
                                                    )
                                                },
                                                closingQuote: .stringQuoteToken()
                                            )
                                        )
                                    )
                                }
                            )
                        )
                    ) {
                        // let savingToAlpha = coder.decodeBool(forKey: kSaveBeganSavingToAlphaKey)
                        // ...
                        let params = caseElement.parameterClause?.parameters ?? []
                        for (index, caseParam) in params.enumerated() {
                            decodeCall(
                                type: caseParam.type.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes),
                                identifierPattern: IdentifierPatternSyntax(
                                    identifier: .identifier(caseParam.properName(index: index).trimmed.text)
                                ),
                                constantEnumPrefix: caseElement.name.trimmed.text
                            )
                        }

                        // self.wrapped = .saveBegan(savingToAlpha: savingToAlpha)

                        SequenceExprSyntax{
                            MemberAccessExprSyntax(
                                base: DeclReferenceExprSyntax(
                                    baseName: .keyword(.`self`)
                                ),
                                period: .periodToken(),
                                declName: DeclReferenceExprSyntax(
                                    baseName: .identifier("wrapped")
                                )
                            )

                            AssignmentExprSyntax(equal: .equalToken())

                            FunctionCallExprSyntax(
                                calledExpression: MemberAccessExprSyntax(
                                    period: .periodToken(),
                                    declName: DeclReferenceExprSyntax(
                                        baseName: caseElement.name
                                    )
                                ),
                                leftParen: .leftParenToken(),
                                arguments: LabeledExprListSyntax {
                                    let params = caseElement.parameterClause?.parameters ?? []
                                    for (index, caseParam) in params.enumerated() {
                                        LabeledExprSyntax(
                                            label: .identifier(caseParam.properName(index: index).trimmed.text),
                                            colon: .colonToken(),
                                            expression: DeclReferenceExprSyntax(
                                                baseName: .identifier(caseParam.properName(index: index).trimmed.text)
                                            )
                                            .mappingNSNumberToNumeralValue(
                                                type: caseParam.type
                                            ),
                                            trailingComma: index + 1 < params.count ? .commaToken() : nil
                                        )
                                    }
                                },
                                rightParen: .rightParenToken()
                            )
                        }
                    }
                }

                SwitchCaseSyntax(
                    label: .default(
                        SwitchDefaultLabelSyntax()
                    )
                ) {
                    "return nil"
                }
            }
        }
        .with(\.leadingTrivia, .newlines(2))
    }

    @MemberBlockItemListBuilder
    func nsCodingConformances(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: [String]
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
            structDecl.forEachBinding { binding in
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                    coderEncodeCall(
                        type: typeAnnotation.type,
                        propertyName: identifierPattern.identifier.trimmed.text,
                        constantName: "k\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key"
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
            structDecl.forEachBinding { binding in
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {

                    // Declare decoded variable as one of them based on whether it
                    // is a primitive type or optional
                    // - let <variable> = coder.decode<Object|Bool|...>(forKey: <key>)
                    // - guard let <variable> = coder.decode<...>(forKey: <key>) as? <type> else { return nil }
                    decodeCall(
                        type: typeAnnotation.type.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes),
                        identifierPattern: identifierPattern
                    )
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
                },
                rightParen: .rightParenToken()
            )
        }
        .with(\.leadingTrivia, .newlines(2))
    }

}

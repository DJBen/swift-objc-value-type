import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

extension SwiftObjcValueTypeFactory {
    public func nsCodingConstants(
        structDecl: StructDeclSyntax
    ) -> [VariableDeclSyntax] {
        var decls = [VariableDeclSyntax]()

        structDecl.forEachBinding { binding in
            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                decls.append(
                    nsCodingConstant(
                        name: identifierPattern.identifier.trimmed.text
                    )
                    .with(\.leadingTrivia, .newlines(2))
                )
            }
        }

        return decls
    }

    public func nsCodingConstants(
        enumDecl: EnumDeclSyntax
    ) -> [VariableDeclSyntax] {
        var decls = [VariableDeclSyntax]()

        // let kCodedSubtypeKey = "CODED_SUBTYPE"
        // used to distinguish which case the enum type belongs to in its objc wrapper
        decls.append(
            VariableDeclSyntax(
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .keyword(.private))
                    DeclModifierSyntax(name: .keyword(.static))
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
            .with(\.leadingTrivia, .newlines(2))
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
                    .with(\.leadingTrivia, .newlines(2))
                )
            }
        }

        return decls
    }
    
    /// Turn a pattern binding `let fooBar: MyType` in a struct into a NSCoding constant decl `let kFooKey = "FOO"`.
    /// - Parameter binding: The pattern binding.
    /// - Returns: A variable declaration if available.
    private func nsCodingConstant(
        name: String
    ) -> VariableDeclSyntax {
        VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.private))
                DeclModifierSyntax(name: .keyword(.static))
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

    // let optInt = coder.decodeObject(forKey: kOptIntKey) as? NSNumber
    private func nsCodingDecodeAssignmentCall(
        type: some TypeSyntaxProtocol,
        constantName: String,
        nsEnumTypes: [String: String]
    ) -> InitializerClauseSyntax {
        InitializerClauseSyntax(
            value: SequenceExprSyntax {
                FunctionCallExprSyntax(
                    calledExpression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .identifier("coder")),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(
                            baseName: type.nsCodableDecodingFunction(nsEnumTypes: nsEnumTypes)
                        )
                    ),
                    leftParen: .leftParenToken(),
                    arguments: LabeledExprListSyntax {
                        LabeledExprSyntax(
                            label: .identifier("forKey"),
                            colon: .colonToken(),
                            expression: MemberAccessExprSyntax(
                                base: DeclReferenceExprSyntax(baseName: .keyword(.Self)),
                                period: .periodToken(),
                                declName: DeclReferenceExprSyntax(
                                    baseName: .identifier(constantName)
                                )
                            )
                        )
                    },
                    rightParen: .rightParenToken()
                )
                .casted(
                    type: type,
                    to: "CGFloat",
                    ifEqual: "CGFloat"
                )
                .casted(
                    type: type,
                    nsEnumTypes: nsEnumTypes
                )

                if type.as(OptionalTypeSyntax.self)?.wrappedType.isNSNumberBridged ?? false || type.isUInt || (type.as(IdentifierTypeSyntax.self).flatMap { nsEnumTypes[$0.name.trimmed.text] }) == "UInt" {
                    UnresolvedAsExprSyntax(
                        questionOrExclamationMark: .postfixQuestionMarkToken()
                    )

                    TypeExprSyntax(
                        type: IdentifierTypeSyntax(
                            name: .identifier("NSNumber")
                        )
                    )
                } else if !type.isObjcPrimitive && !type.isKnownNSEnumType(nsEnumTypes: nsEnumTypes) {
                    UnresolvedAsExprSyntax(
                        questionOrExclamationMark: .postfixQuestionMarkToken()
                    )

                    TypeExprSyntax(
                        type: type.unwrappedIfOptional
                    )
                }
            }
            .unwrapDecodedUInt(
                type: type,
                nsEnumTypes: nsEnumTypes
            )
        )
    }

    // coder.encode(displayName, forKey: kDisplayNameKey)
    // coder.encode("SUBTYPE_SAVE_BEGAN", forKey: kCodedSubtypeKey)
    private func coderEncodeCall(
        type: some TypeSyntaxProtocol,
        propertyExpr: some ExprSyntaxProtocol,
        constantName: String,
        valueObjectConfig: ValueObjectConfig
    ) -> FunctionCallExprSyntax {
        FunctionCallExprSyntax(
            calledExpression: MemberAccessExprSyntax(
                base: DeclReferenceExprSyntax(baseName: .identifier("coder")),
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(baseName: .identifier("encode"))
            ),
            leftParen: .leftParenToken(),
            arguments: LabeledExprListSyntax {
                LabeledExprSyntax(
                    expression: propertyExpr.casted(
                        type: type,
                        to: "Double",
                        ifEqual: "CGFloat"
                    )
                    // There doesn't exist a method encode(_: UInt), thus it will be incorrectly encoded to Object type.
                    // To solve this, we need to wrap with NSNumber
                    .casted(
                        type: type,
                        to: "NSNumber",
                        label: "value",
                        ifEqual: "UInt"
                    )
                    .appendingRawValueIfNSEnumType(
                        nsEnumTypes: valueObjectConfig.nsEnumTypes,
                        type: type
                    )
                )

                LabeledExprSyntax(
                    label: .identifier("forKey"),
                    colon: .colonToken(),
                    expression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .keyword(.Self)),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(
                            baseName: .identifier(constantName)
                        )
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
        constantName: String,
        valueObjectConfig: ValueObjectConfig
    ) -> FunctionCallExprSyntax {
        coderEncodeCall(
            type: type,
            propertyExpr: DeclReferenceExprSyntax(baseName: .identifier(propertyName)),
            constantName: constantName,
            valueObjectConfig: valueObjectConfig
        )
    }

    /// Declare decoded variable as one of them based on whether it is a primitive type or optional
    /// - `let <variable> = coder.decode<Object|Bool|...>(forKey: <key>)`
    /// - `guard let <variable> = coder.decode<...>(forKey: <key>) as? <type> else { return nil }`
    @CodeBlockItemListBuilder
    private func decodeCall(
        type: some TypeSyntaxProtocol,
        identifierPattern: IdentifierPatternSyntax,
        valueObjectConfig: ValueObjectConfig,
        constantEnumPrefix: String? = nil
    ) -> CodeBlockItemListSyntax {
        let constantEnumPrefix = constantEnumPrefix?.uppercasingFirst ?? ""
        let constantName = "k\(constantEnumPrefix)\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key"

        // If type is one of below, directly assign, otherwise unwrap with guard stmt
        // - type is optional
        // - type is primitive objective-C types, excluding NSUInteger (NSCoding does not have non-precision-losing way of encoding unsigned ints, thus needs to encode as NSNumber)
        // - type is known to be an NS_ENUM type
        if type.is(OptionalTypeSyntax.self) || (type.isObjcPrimitive && !type.isUInt) {
            VariableDeclSyntax(
                bindingSpecifier: .keyword(SwiftSyntax.Keyword.let),
                bindings: PatternBindingListSyntax {
                    PatternBindingSyntax(
                        pattern: identifierPattern,
                        initializer: nsCodingDecodeAssignmentCall(
                            type: type,
                            constantName: constantName,
                            nsEnumTypes: valueObjectConfig.nsEnumTypes
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
                                    constantName: constantName,
                                    nsEnumTypes: valueObjectConfig.nsEnumTypes
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
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                enumDecl.modifiersExcludingIndirect.trimmed
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
                                constantName: "k\(caseName)\(propertyName.uppercasingFirst)Key",
                                valueObjectConfig: enumDecl.valueObjectConfig
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
                            constantName: "kCodedSubtypeKey",
                            valueObjectConfig: enumDecl.valueObjectConfig
                        )
                    }
                }
            }
        }
        .with(\.leadingTrivia, .newlines(2))

        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.public))
                DeclModifierSyntax(name: .keyword(.required))
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
            """
            guard let codedSubtype = coder.decodeObject(forKey: Self.kCodedSubtypeKey) as? String else {
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
                                valueObjectConfig: enumDecl.valueObjectConfig,
                                constantEnumPrefix: caseElement.name.trimmed.text
                            )
                        }

                        FunctionCallExprSyntax(
                            calledExpression: MemberAccessExprSyntax(
                                base: ExprSyntax("self"),
                                period: .periodToken(),
                                declName: DeclReferenceExprSyntax(
                                    baseName: "init"
                                )
                            ),
                            leftParen: .leftParenToken(),
                            arguments: LabeledExprListSyntax {
                                LabeledExprSyntax(
                                    label: .identifier("subtype"),
                                    colon: .colonToken(),
                                    expression: MemberAccessExprSyntax(
                                        period: .periodToken(),
                                        declName: DeclReferenceExprSyntax(
                                            baseName: .identifier(caseElement.name.trimmed.text.lowercasingFirst)
                                        )
                                    )
                                )

                                let params = caseElement.parameterClause?.parameters ?? []
                                for (index, caseParam) in params.enumerated() {
                                    LabeledExprSyntax(
                                        label: .identifier(caseElement.name.trimmed.text.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst),
                                        colon: .colonToken(),
                                        expression: DeclReferenceExprSyntax(
                                            baseName: .identifier(caseParam.properName(index: index).trimmed.text)
                                        )
                                        .mappingNSNumberToNumeralValue(
                                            type: caseParam.type
                                        )
                                    )
                                }
                            },
                            rightParen: .rightParenToken()
                        )
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
        referencedSwiftTypes: Set<String>
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
                        constantName: "k\(identifierPattern.identifier.trimmed.text.uppercasingFirst)Key",
                        valueObjectConfig: structDecl.valueObjectConfig
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
                        identifierPattern: identifierPattern,
                        valueObjectConfig: structDecl.valueObjectConfig
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

private extension ExprSyntaxProtocol {
    func unwrapDecodedUInt(
        type: some TypeSyntaxProtocol,
        nsEnumTypes: [String: String]
    ) -> ExprSyntax {
        if let identifierType = type.as(IdentifierTypeSyntax.self), identifierType.name.trimmed.text == "UInt" || nsEnumTypes[identifierType.name.trimmed.text] == "UInt" {
            return ExprSyntax(
                MemberAccessExprSyntax(
                    base: OptionalChainingExprSyntax(
                        expression: TupleExprSyntax {
                            LabeledExprListSyntax {
                                LabeledExprSyntax(expression: self)
                            }
                        }
                    ),
                    declName: DeclReferenceExprSyntax(
                        baseName: .identifier("uintValue")
                    )
                )
            )
        }
        return ExprSyntax(self)
    }
    
    func casted(
        type: some TypeSyntaxProtocol,
        to castedType: String,
        label: String? = nil,
        ifEqual equalToType: String
    ) -> any ExprSyntaxProtocol {
        if let identifierType = type.as(IdentifierTypeSyntax.self), identifierType.name.trimmed.text == equalToType {
            return FunctionCallExprSyntax(
                calledExpression: DeclReferenceExprSyntax(
                    baseName: .identifier(castedType)
                ),
                leftParen: .leftParenToken(),
                arguments: LabeledExprListSyntax {
                    LabeledExprSyntax(
                        label: label,
                        expression: self
                    )
                },
                rightParen: .rightParenToken()
            )
        } else {
            return self
        }
    }

    func casted(
        type: some TypeSyntaxProtocol,
        nsEnumTypes: [String: String]
    ) -> any ExprSyntaxProtocol {
        if let idType = type.as(IdentifierTypeSyntax.self), let _ = nsEnumTypes[idType.name.trimmed.text] {
            return FunctionCallExprSyntax(
                calledExpression: DeclReferenceExprSyntax(
                    baseName: idType.name
                ),
                leftParen: .leftParenToken(),
                arguments: LabeledExprListSyntax {
                    LabeledExprSyntax(
                        label: "rawValue",
                        expression: self
                    )
                },
                rightParen: .rightParenToken()
            )

        }
        return self
    }

    func appendingRawValueIfNSEnumType(
        nsEnumTypes: [String: String],
        type: some TypeSyntaxProtocol
    ) -> any ExprSyntaxProtocol {
        if let identifierType = type.as(IdentifierTypeSyntax.self), let _ = nsEnumTypes[identifierType.name.trimmed.text] {
            return MemberAccessExprSyntax(
                base: self,
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(baseName: .identifier("rawValue"))
            )
        }
        return self
    }
}

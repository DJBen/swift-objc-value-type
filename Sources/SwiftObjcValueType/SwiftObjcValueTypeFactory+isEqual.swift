import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

extension SwiftObjcValueTypeFactory {

    @MemberBlockItemListBuilder
    private func isEqualFunc(
        containerName: String,
        modifiers: DeclModifierListSyntax,
        @CodeBlockItemListBuilder builder: () -> CodeBlockItemListSyntax
    ) throws -> MemberBlockItemListSyntax {
        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                modifiers.trimmed

                DeclModifierSyntax(
                    name: .keyword(.override)
                )
            },
            name: .identifier("isEqual"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    FunctionParameterListSyntax {
                        FunctionParameterSyntax(
                            firstName: .wildcardToken(),
                            secondName: .identifier("object"),
                            type: TypeSyntax("Any?")
                        )
                    }
                },
                returnClause: ReturnClauseSyntax(
                    type: TypeSyntax("Bool")
                )
            )
        ) {

            StmtSyntax(
            """
            guard let other = object as? \(raw: containerName)Objc else {
                return false
            }
            """
            )

            builder()
        }
    }

    @ExprListBuilder
    private func propertyIsEqualExprs(
        identifier: TokenSyntax,
        type: some TypeSyntaxProtocol,
        valueObjectConfig: ValueObjectConfig
    ) -> ExprListSyntax {
        // Use `a == other.a` if primitive type
        // Otherwise use `a.isEqual(other.a)` if not optional
        // `a?.isEqual(other?.a) == true` if optional
        if type.asEnumTypeIfKnown(
            nsEnumTypes: valueObjectConfig.nsEnumTypes
        ).0.shouldUseEqualSignForEqualityCheck {
            DeclReferenceExprSyntax(
                baseName: identifier
            )

            BinaryOperatorExprSyntax(operator: .binaryOperator("=="))

            MemberAccessExprSyntax(
                base: DeclReferenceExprSyntax(
                    baseName: .identifier("other")
                ),
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(
                    baseName: identifier
                )
            )
        } else if type.is(OptionalTypeSyntax.self) {
            FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: OptionalChainingExprSyntax(
                        expression: DeclReferenceExprSyntax(
                            baseName: identifier
                        ),
                        questionMark: .postfixQuestionMarkToken()
                    ),
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(
                        baseName: .identifier("isEqual")
                    )
                ),
                leftParen: .leftParenToken(),
                arguments: LabeledExprListSyntax {
                    LabeledExprSyntax(
                        expression: MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(
                                baseName: .identifier("other")
                            ),
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(
                                baseName: identifier
                            )
                        )
                    )
                },
                rightParen: .rightParenToken()
            )

            BinaryOperatorExprSyntax(operator: .binaryOperator("=="))

            BooleanLiteralExprSyntax(literal: .keyword(.true))

        } else {
            FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: DeclReferenceExprSyntax(
                        baseName: identifier
                    ),
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(
                        baseName: .identifier("isEqual")
                    )
                ),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprListSyntax {
                    LabeledExprSyntax(
                        expression: MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(
                                baseName: .identifier("other")
                            ),
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(
                                baseName: identifier
                            )
                        )
                    )
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    func objcIsEqualFunc(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let bindingsCount = structDecl.bindingsCount

        try isEqualFunc(
            containerName: structDecl.name.trimmed.text,
            modifiers: structDecl.modifiers
        ) {
            ReturnStmtSyntax(
                expression: SequenceExprSyntax {
                    structDecl.enumerateBinding { index, binding in
                        if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {

                            propertyIsEqualExprs(
                                identifier: identifierPattern.identifier,
                                type: typeAnnotation.type,
                                valueObjectConfig: structDecl.valueObjectConfig
                            )

                            if index + 1 < bindingsCount {
                                BinaryOperatorExprSyntax(operator: .binaryOperator("&&"))
                            }
                        }
                    }
                }
            )
        }
    }

    @MemberBlockItemListBuilder
    func objcIsEqualFunc(
        enumDecl: EnumDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let totalEnumAssociatedValueCount: Int = {
            var count = 0
            enumDecl.enumerateCaseElement { index, caseElement in
                count += (caseElement.parameterClause?.parameters ?? []).count
            }
            return count
        }()
        
        
        try isEqualFunc(
            containerName: enumDecl.name.trimmed.text,
            modifiers: enumDecl.modifiers
        ) {
            ReturnStmtSyntax(
                expression: SequenceExprSyntax {
                    ExprSyntax("subtype == other.subtype")

                    if totalEnumAssociatedValueCount > 0 {
                        BinaryOperatorExprSyntax(operator: .binaryOperator("&&"))
                    }
                    
                    enumIsEqualExprList(
                        enumDecl: enumDecl,
                        totalEnumAssociatedValueCount: totalEnumAssociatedValueCount
                    )
                }
            )
        }
    }
    
    private func enumIsEqualExprList(
        enumDecl: EnumDeclSyntax,
        totalEnumAssociatedValueCount: Int
    ) -> ExprListSyntax {
        var enumAssociatedValueIndex = 0
        var exprList = ExprListSyntax()
        
        enumDecl.enumerateCaseElement { index, caseElement in
            let params = caseElement.parameterClause?.parameters ?? []
            let lCaseName = caseElement.name.trimmed.text
            for (paramIndex, caseParam) in params.enumerated() {
                let propertyName = "\(lCaseName)\(caseParam.properName(index: paramIndex).trimmed.text.uppercasingFirst)"

                exprList.append(
                    contentsOf: propertyIsEqualExprs(
                        identifier: .identifier(propertyName),
                        type: caseParam.type.optionalized,
                        valueObjectConfig: enumDecl.valueObjectConfig
                    )
                )

                if enumAssociatedValueIndex + 1 < totalEnumAssociatedValueCount {
                    exprList.append(
                        ExprSyntax(
                            BinaryOperatorExprSyntax(operator: .binaryOperator("&&"))
                        )
                    )
                }
                
                enumAssociatedValueIndex += 1
            }
        }
        
        return exprList
    }
}

private extension TypeSyntaxProtocol {
    var shouldUseEqualSignForEqualityCheck: Bool {
        if isObjcPrimitive {
            return true
        }

        if self.is(ArrayTypeSyntax.self) {
            return true
        }

        if self.is(DictionaryTypeSyntax.self) {
            return true
        }
        
        if let idType = self.as(IdentifierTypeSyntax.self), ObjcSwiftUtils.swiftToObjcFoundationTypeMap[idType.name.trimmed.text] != nil {
            return true
        }

        if self.isIdentifierTypeEqual("UUID") {
            return true
        }

        if self.isIdentifierTypeEqual("URL") {
            return true
        }

        if let optional = self.as(OptionalTypeSyntax.self), !optional.wrappedType.isNSNumberBridged {
            return optional.wrappedType.shouldUseEqualSignForEqualityCheck
        }

        return false
    }
}

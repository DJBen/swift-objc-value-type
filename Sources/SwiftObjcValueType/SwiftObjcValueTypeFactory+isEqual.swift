import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

extension SwiftObjcValueTypeFactory {

    @MemberBlockItemListBuilder
    private func isEqualFunc(
        containerName: String,
        modifiers: DeclModifierListSyntax,
        @CodeBlockItemListBuilder builder: () throws -> CodeBlockItemListSyntax
    ) throws -> MemberBlockItemListSyntax {
        try FunctionDeclSyntax(
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

            try builder()
        }
    }

    @ExprListBuilder
    private func propertyIsEqualExprs(
        identifier: TokenSyntax,
        type: some TypeSyntaxProtocol,
        valueObjectConfig: ValueObjectConfig
    ) -> ExprListSyntax {
        // Use `a == other.a` if primitive type or Foundation type that has been known to conform to Equatable
        // Otherwise use `a.isEqual(other.a)` if not optional
        // Use `(a == nil && other.a == nil) || (a != nil && other.a != nil && a!.isEqual(other.a!))` if optional
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
            ExprSyntax("""
            ((\(identifier) == nil && other.\(identifier) == nil) || (\(identifier) != nil && other.\(identifier) != nil && \(identifier)!.isEqual(other.\(identifier)!)))
            """)
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
        try isEqualFunc(
            containerName: enumDecl.name.trimmed.text,
            modifiers: enumDecl.modifiers
        ) {
            "guard subtype == other.subtype else { return false }"
            
            if enumDecl.caseCount > 0 {
                try SwitchExprSyntax("switch subtype") {
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
                            let lCaseName = caseElement.name.trimmed.text
                            
                            if params.isEmpty {
                                "return true"
                            } else {
                                ReturnStmtSyntax(
                                    expression: SequenceExprSyntax {
                                        for (index, caseParam) in params.enumerated() {
                                            if index > 0 {
                                                BinaryOperatorExprSyntax(operator: .binaryOperator("&&"))
                                            }
                                            
                                            let propertyName = "\(lCaseName)\(caseParam.properName(index: index).trimmed.text.uppercasingFirst)"
                                            
                                            propertyIsEqualExprs(
                                                identifier: .identifier(propertyName),
                                                type: caseParam.type.optionalized,
                                                valueObjectConfig: enumDecl.valueObjectConfig
                                            )
                                        }
                                    }
                                )
                            }
                        }
                    }
                }
            } else {
                "return true"
            }
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
        
        if let optional = self.as(OptionalTypeSyntax.self) {
            return optional.wrappedType.shouldUseEqualSignForEqualityCheck
        }

        return false
    }
}

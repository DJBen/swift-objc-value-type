import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    /*
     public init(_ original: Foo) {
         self.prop1 = original.prop1,
         self.arrayOfBar = original.array.map({ a0 in BarObjc(a0) }),
         self.optMapOfIntToBaz = original.optMap?.mapValue({ a0 in BazObjc(a0) })

         super.init()
     }
     */
    @MemberBlockItemListBuilder
    func objcInitializerFromSwiftType(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                structDecl.modifiers.trimmed
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        FunctionParameterSyntax(
                            firstName: .wildcardToken(),
                            secondName: .identifier("original"),
                            type: IdentifierTypeSyntax(
                                name: structDecl.name.trimmed
                            )
                        )
                    }
                )
            )
        ) {
            structDecl.forEachBinding { binding in
                SequenceExprSyntax {
                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(baseName: .keyword(.self)),
                            declName: DeclReferenceExprSyntax(baseName: identifierPattern.identifier)
                        )

                        AssignmentExprSyntax()

                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(
                                baseName: .identifier("original")
                            ),
                            declName: DeclReferenceExprSyntax(
                                baseName: identifierPattern.identifier
                            )
                        )
                        .mappingNumeralValueToNSNumber(
                            type: typeAnnotation.type
                        )
                        .convertingToObjcType(
                            type: typeAnnotation.type,
                            referencedSwiftTypes: referencedSwiftTypes
                        )
                    }
                }
            }

            ExprSyntax(
                "super.init()"
            )
            .with(\.leadingTrivia, .newlines(2))
        }
    }

    @MemberBlockItemListBuilder
    func objcInitializerFromSwiftType(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        try InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                enumDecl.modifiers.trimmed

                DeclModifierSyntax(name: .keyword(.convenience))
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        FunctionParameterSyntax(
                            firstName: .wildcardToken(),
                            secondName: .identifier("original"),
                            type: IdentifierTypeSyntax(
                                name: enumDecl.name.trimmed
                            )
                        )
                    }
                )
            )
        ) {
            try SwitchExprSyntax("switch original") {
                enumDecl.forEachCaseElement { caseElement in
                    let params = caseElement.parameterClause?.parameters ?? []
                    SwitchCaseSyntax(
                        label: .case(
                            SwitchCaseLabelSyntax {
                                SwitchCaseItemSyntax(
                                    pattern: ExpressionPatternSyntax(
                                        expression: FunctionCallExprSyntax(
                                            calledExpression: MemberAccessExprSyntax(
                                                period: .periodToken(),
                                                declName: DeclReferenceExprSyntax(baseName: caseElement.name)
                                            ),
                                            leftParen: params.isEmpty ? nil : .leftParenToken(),
                                            arguments: LabeledExprListSyntax {
                                                for (index, caseParam) in params.enumerated() {
                                                    LabeledExprSyntax(
                                                        expression: PatternExprSyntax(
                                                            pattern: ValueBindingPatternSyntax(
                                                                bindingSpecifier: .keyword(.let),
                                                                pattern: IdentifierPatternSyntax(identifier: caseParam.properName(index: index))
                                                            )
                                                        )
                                                    )
                                                }
                                            },
                                            rightParen: params.isEmpty ? nil : .rightParenToken()
                                        )
                                    )
                                )
                            }
                        )
                    ) {
                        FunctionCallExprSyntax(
                            calledExpression: MemberAccessExprSyntax(
                                base: DeclReferenceExprSyntax(baseName: .keyword(.`self`)),
                                period: .periodToken(),
                                declName: DeclReferenceExprSyntax(baseName: .keyword(.`init`))
                            ),
                            leftParen: .leftParenToken(),
                            rightParen: .rightParenToken()
                        ) {
                            LabeledExprListSyntax {
                                LabeledExprSyntax(
                                    label: .identifier("subtype"),
                                    colon: .colonToken(),
                                    expression: ExprSyntax(".\(raw: caseElement.name.trimmed.text.lowercasingFirst)")
                                )
                            }

                            let params = caseElement.parameterClause?.parameters ?? []
                            let caseName = caseElement.name.trimmed.text.uppercasingFirst
                            for (index, caseParam) in params.enumerated() {
                                LabeledExprSyntax(
                                    label: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst),
                                    colon: .colonToken(),
                                    expression: DeclReferenceExprSyntax(
                                        baseName: caseParam.properName(index: index)
                                    )
                                    .convertingToObjcType(
                                        type: caseParam.type,
                                        referencedSwiftTypes: referencedSwiftTypes
                                    )
                                    .mappingNumeralValueToNSNumber(type: caseParam.type)
                                )
                            }
                        }
                    }
                }
            }
        }
    }

    /*
     extension Foo {
         public init(_ wrapper: FooObjc) {
             self.prop1 = wrapper.prop1
             self.arrayOfBar = wrapper.array.map({ a0 in Bar(a0) })
             self.optMapOfIntToBaz = wrapper.optMap?.mapValue({ a0 in Baz(a0) })

             super.init()
         }
     }
     */
    @MemberBlockItemListBuilder
    func swiftInitializerFromObjcWrapper(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                structDecl.modifiers.trimmed
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        FunctionParameterSyntax(
                            firstName: .wildcardToken(),
                            secondName: .identifier("wrapper"),
                            type: IdentifierTypeSyntax(
                                name: .identifier("\(structDecl.name.trimmed.text)Objc")
                            )
                        )
                    }
                )
            )
        ) {
            structDecl.forEachBinding { binding in
                SequenceExprSyntax {
                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(baseName: .keyword(.self)),
                            declName: DeclReferenceExprSyntax(baseName: identifierPattern.identifier)
                        )

                        AssignmentExprSyntax()

                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(
                                baseName: .identifier("wrapper")
                            ),
                            declName: DeclReferenceExprSyntax(
                                baseName: identifierPattern.identifier
                            )
                        )
                        .unmappingNumeralValueFromNSNumber(
                            type: typeAnnotation.type
                        )
                        .convertingToSwiftType(
                            type: typeAnnotation.type,
                            referencedSwiftTypes: referencedSwiftTypes
                        )
                    }
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    func swiftInitializerFromObjcWrapper(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                enumDecl.modifiers.trimmed
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        FunctionParameterSyntax(
                            firstName: .wildcardToken(),
                            secondName: .identifier("wrapper"),
                            type: IdentifierTypeSyntax(
                                name: .identifier("\(enumDecl.name.trimmed.text)Objc")
                            )
                        )
                    }
                )
            )
        ) {
            if let firstCaseElement = enumDecl.firstCaseElement {
                "var original: \(raw: enumDecl.name.trimmed.text)!"

                let caseName = firstCaseElement.name.trimmed.text.uppercasingFirst
                FunctionCallExprSyntax(
                    calledExpression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .identifier("wrapper")),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(
                            baseName: .identifier("match\(caseName)")
                        )
                    ),
                    leftParen: .leftParenToken(),
                    rightParen: .rightParenToken()
                ) {
                    enumDecl.enumerateCaseElement { caseIndex, caseElement in
                        let caseName = caseElement.name.trimmed.text
                        let params = caseElement.parameterClause?.parameters ?? []

                        LabeledExprListSyntax {
                            LabeledExprSyntax(
                                label: caseIndex == 0 ? nil : .identifier(caseName.lowercasingFirst),
                                colon: caseIndex == 0 ? nil : .colonToken(),
                                expression: ClosureExprSyntax(
                                    signature: params.isEmpty ? nil : ClosureSignatureSyntax(
                                        parameterClause: .simpleInput(ClosureShorthandParameterListSyntax {
                                            for (index, caseParam) in params.enumerated() {
                                                ClosureShorthandParameterSyntax(name: caseParam.properName(index: index))
                                            }
                                        }),
                                        inKeyword: .keyword(.in)
                                    )
                                ) {
                                    SequenceExprSyntax {
                                        DeclReferenceExprSyntax(baseName: .identifier("original"))

                                        AssignmentExprSyntax()

                                        if params.isEmpty {
                                            MemberAccessExprSyntax(
                                                period: .periodToken(),
                                                declName: DeclReferenceExprSyntax(baseName: .identifier(caseName.lowercasingFirst))
                                            )
                                        } else {
                                            FunctionCallExprSyntax(
                                                calledExpression: MemberAccessExprSyntax(
                                                    period: .periodToken(),
                                                    declName: DeclReferenceExprSyntax(baseName: .identifier(caseName.lowercasingFirst))
                                                ),
                                                leftParen: .leftParenToken(),
                                                rightParen: .rightParenToken()
                                            ) {
                                                for (index, caseParam) in params.enumerated() {
                                                    // Do not include label for unlabeled case params
                                                    let label = caseParam.firstName ?? caseParam.secondName

                                                    LabeledExprSyntax(
                                                        label: label,
                                                        colon: label != nil ? .colonToken() : nil,
                                                        expression: DeclReferenceExprSyntax(
                                                            baseName: caseParam.properName(index: index)
                                                        )
                                                        .unmappingNumeralValueFromNSNumber(type: caseParam.type)
                                                        .convertingToSwiftType(
                                                            type: caseParam.type,
                                                            referencedSwiftTypes: referencedSwiftTypes
                                                        )
                                                    )
                                                }
                                            }
                                        }
                                    }
                                }
                            )
                        }
                    }
                }

                "self = original"
            }
        }
    }
}

import SwiftSyntax
import SwiftSyntaxBuilder

/// See swift foundation type mapping to objective-C here.
/// https://developer.apple.com/documentation/swift/working-with-foundation-types
public struct SwiftObjcValueTypeFactory {
    private let builderFactory: BuilderFactory

    public init(
        builderFactory: BuilderFactory = BuilderFactory()
    ) {
        self.builderFactory = builderFactory
    }

    @CodeBlockItemListBuilder
    public func wrappingClassDecl(
        codeBlocks: CodeBlockItemListSyntax,
        referencedSiblingTypes: [String] = [],
        shouldSynthesizeNSCopying: Bool = true,
        shouldSynthesizeObjCBuilder: Bool = true
    ) throws -> CodeBlockItemListSyntax {
        for codeBlockItem in codeBlocks {
            // Inherit import statements
            if let importDecl = codeBlockItem.item.as(ImportDeclSyntax.self) {
                importDecl
            }
        }

        for (_, descriptor) in descriptorMap(codeBlocks: codeBlocks) {
            try CodeBlockItemListSyntax {
                switch descriptor.decl {
                case .structDecl(let structDecl):
                    for decl in try wrappingClassDecl(
                        structDecl: structDecl,
                        referencedSiblingTypes: referencedSiblingTypes,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeHash: descriptor.inheritedTypes.contains("Hashable"),
                        shouldSynthesizeNSCodable: descriptor.inheritedTypes.contains("Codable"),
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
                        shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder,
                        shouldSynthesizeDescription: descriptor.inheritedTypes.contains("CustomStringConvertible"),
                        shouldSynthesizeDebugDescription: descriptor.inheritedTypes.contains("CustomDebugStringConvertible")
                    ) { decl }
                case .enumDecl(let enumDecl):
                    for decl in try wrappingClassDecl(
                        enumDecl: enumDecl,
                        referencedSiblingTypes: referencedSiblingTypes,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying
                    ) { decl }
                }
            }
        }
    }

    public func wrappingClassDeclInMacro(
        structDecl: StructDeclSyntax,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        try wrappingClassDecl(
            structDecl: structDecl,
            referencedSiblingTypes: [],
            shouldSynthesizeEquatable: structDecl.inheritedTypes.contains("Equatable") || structDecl.inheritedTypes.contains("Hashable") ||
            structDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeHash: structDecl.inheritedTypes.contains("Hashable"),
            shouldSynthesizeNSCodable: structDecl.inheritedTypes.contains("Codable"),
            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
            shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder,
            shouldSynthesizeDescription: structDecl.inheritedTypes.contains("CustomStringConvertible"),
            shouldSynthesizeDebugDescription: structDecl.inheritedTypes.contains("CustomDebugStringConvertible")
        )
    }

    public func wrappingClassDecl(
        structDecl: StructDeclSyntax,
        referencedSiblingTypes: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeHash: Bool,
        shouldSynthesizeNSCodable: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool,
        shouldSynthesizeDescription: Bool,
        shouldSynthesizeDebugDescription: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        let structName = structDecl.name.trimmed.text

        var decls = [any DeclSyntaxProtocol]()

        decls.append(
            try ClassDeclSyntax(
                attributes: AttributeListSyntax {
                    .attribute("@objc(\(raw: structName))")
                }.with(\.trailingTrivia, .newline),
                modifiers: structDecl.modifiers.trimmed,
                name: "\(raw: structName)Class",
                inheritanceClause: InheritanceClauseSyntax {
                    InheritedTypeListSyntax {
                        InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSObject"))

                        if shouldSynthesizeNSCopying {
                            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSCopying"))
                        }
                    }
                },
                memberBlockBuilder: {
                    try structDecl.enumerateVariableDecls { variableTypeDecl in
                        try objcVariableDecl(
                            variableTypeDecl: variableTypeDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    DeclSyntax(
                        "private let wrapped: \(raw: structName)"
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    InitializerDeclSyntax(
                        attributes: AttributeListSyntax {
                            .attribute("@objc")
                        }.with(\.trailingTrivia, .newline),
                        modifiers: structDecl.modifiers.trimmed,
                        signature: FunctionSignatureSyntax(
                            parameterClause: FunctionParameterClauseSyntax(
                                parametersBuilder: {
                                    structDecl.enumerateBindings { binding in
                                        if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                            let variableName = identifierPattern.identifier.trimmed.text
                                            let type: any TypeSyntaxProtocol = {
                                                if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
                                                    return OptionalTypeSyntax(
                                                        wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                                    )
                                                } else {
                                                    return typeAnnotation.type.trimmed
                                                }
                                            }()

                                            FunctionParameterSyntax(
                                                firstName: .identifier(variableName),
                                                type: type
                                            )
                                        }
                                    }
                                }
                            )
                        )
                    ) {
                        SequenceExprSyntax {
                            MemberAccessExprSyntax(
                                base: DeclReferenceExprSyntax(baseName: .keyword(.self)),
                                declName: DeclReferenceExprSyntax(baseName: .identifier("wrapped"))
                            )

                            AssignmentExprSyntax()

                            FunctionCallExprSyntax(
                                calledExpression: DeclReferenceExprSyntax(baseName: .identifier(structName)),
                                leftParen: .leftParenToken(),
                                rightParen: .rightParenToken()
                            ) {
                                structDecl.enumerateBindings { binding in
                                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                        let variableName = identifierPattern.identifier.trimmed.text
                                        let expr: any ExprSyntaxProtocol = {
                                            if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged, let identifierType = optional.wrappedType.as(IdentifierTypeSyntax.self) {
                                                return DeclReferenceExprSyntax(
                                                    baseName: .identifier(variableName)
                                                )
                                                .toNSNumberOptionalMapping(identifierType: identifierType)
                                            } else {
                                                return DeclReferenceExprSyntax(
                                                    baseName: .identifier(variableName)
                                                )
                                            }
                                        }()

                                        LabeledExprSyntax(
                                            label: .identifier(variableName),
                                            colon: .colonToken(),
                                            expression: expr
                                        )
                                    }
                                }
                            }
                        }
                    }
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeHash {
                        try objcHashFunc(
                            structDecl: structDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeEquatable {
                        try objcIsEqualFunc(
                            containerName: structDecl.name.trimmed.text,
                            modifiers: structDecl.modifiers
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCopying {
                        try nsCopyingConformances(
                            containerName: structDecl.name.trimmed.text,
                            modifiers: structDecl.modifiers
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCodable {
                        try nsCodingConformances(
                            structDecl: structDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeDescription {
                        try descriptionFunc(
                            modifiers: structDecl.modifiers,
                            isDebugDescription: false
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeDebugDescription {
                        try descriptionFunc(
                            modifiers: structDecl.modifiers,
                            isDebugDescription: true
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    try unavailableInit(
                        parentContainerModifiers: structDecl.modifiers
                    )
                    .with(\.leadingTrivia, .newlines(2))
                }
            )
        )

        if shouldSynthesizeObjCBuilder {
            decls.append(
                try builderFactory.objcBuilderExtensionDecl(
                    structDecl: structDecl
                )
                .with(\.leadingTrivia, .newlines(2))
                .with(\.trailingTrivia, .newline)
            )
        }

        return decls
    }

    public func wrappingClassDecl(
        enumDecl: EnumDeclSyntax,
        referencedSiblingTypes: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCopying: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        var decls = [any DeclSyntaxProtocol]()
        let enumName = enumDecl.name.trimmed.text

        for member in enumDecl.memberBlock.members {
            if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                for caseElement in caseDecl.elements {
                    decls.append(
                        TypeAliasDeclSyntax(
                            modifiers: DeclModifierListSyntax {
                                // Inherit visibility modifiers
                                enumDecl.modifiers.trimmed
                            },
                            name: .identifier("\(enumName)\(caseElement.name.trimmed.text.uppercasingFirst)MatchHandler"),
                            initializer: TypeInitializerClauseSyntax(
                                equal: .equalToken(),
                                value: FunctionTypeSyntax(
                                    parameters: TupleTypeElementListSyntax {
                                        for (index, caseParam) in (caseElement.parameterClause?.parameters ?? []).enumerated() {
                                            TupleTypeElementSyntax(
                                                firstName: .wildcardToken(),
                                                secondName: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)"),
                                                colon: .colonToken(),
                                                type: caseParam.type
                                            )
                                        }
                                    },
                                    returnClause: ReturnClauseSyntax(
                                        type: IdentifierTypeSyntax(name: .identifier("Void"))
                                    )
                                )
                            )
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    )
                }
            }
        }

        decls.append(
            try ClassDeclSyntax(
                attributes: AttributeListSyntax {
                    .attribute("@objc(\(raw: enumName))")
                }.with(\.trailingTrivia, .newline),
                modifiers: enumDecl.modifiers.trimmed,
                name: "\(raw: enumName)Class",
                inheritanceClause: InheritanceClauseSyntax {
                    InheritedTypeListSyntax {
                        InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSObject"))

                        if shouldSynthesizeNSCopying {
                            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSCopying"))
                        }
                    }
                },
                memberBlockBuilder: {
                    DeclSyntax(
                        "private let wrapped: \(raw: enumName)"
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try unavailableInit(
                        parentContainerModifiers: enumDecl.modifiers
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeEquatable {
                        try objcIsEqualFunc(
                            containerName: enumDecl.name.trimmed.text,
                            modifiers: enumDecl.modifiers
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCopying {
                        try nsCopyingConformances(
                            containerName: enumDecl.name.trimmed.text,
                            modifiers: enumDecl.modifiers
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    for member in enumDecl.memberBlock.members {
                        if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                            for caseElement in caseDecl.elements {
                                FunctionDeclSyntax(
                                    attributes: AttributeListSyntax {
                                        "@objc"
                                    }
                                    .with(\.trailingTrivia, .newline),
                                    modifiers: DeclModifierListSyntax {
                                        // Inherit visibility modifiers
                                        enumDecl.modifiers.trimmed

                                        DeclModifierSyntax(name: .keyword(.class))
                                    },
                                    name: caseElement.name,
                                    signature: FunctionSignatureSyntax(
                                        parameterClause: FunctionParameterClauseSyntax(
                                            parametersBuilder: {
                                                for (index, caseParam) in (caseElement.parameterClause?.parameters ?? []).enumerated() {
                                                    let type: any TypeSyntaxProtocol = {
                                                        if let optional = caseParam.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
                                                            return OptionalTypeSyntax(
                                                                wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                                            )
                                                        } else {
                                                            return caseParam.type.trimmed
                                                        }
                                                    }()
                                                    FunctionParameterSyntax(
                                                        firstName: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)"),
                                                        secondName: caseParam.secondName,
                                                        type: type
                                                    )
                                                }
                                            }
                                        ),
                                        returnClause: ReturnClauseSyntax(
                                            type: IdentifierTypeSyntax(name: .identifier("\(enumName)Class"))
                                        )
                                    )
                                ) {
                                    ReturnStmtSyntax(
                                        expression: FunctionCallExprSyntax(
                                            calledExpression: DeclReferenceExprSyntax(
                                                baseName: .identifier("\(enumName)Class")),
                                            leftParen: .leftParenToken(),
                                            rightParen: .rightParenToken()
                                        ) {
                                            LabeledExprSyntax(
                                                label: .identifier("wrapped"),
                                                colon: .colonToken(),
                                                expression: enumCaseInitializer(caseElement: caseElement)
                                            )
                                        }
                                    )
                                }
                                .with(\.leadingTrivia, .newlines(2))
                            }
                        }
                    }

                    try enumMatchFunc(
                        enumDecl: enumDecl
                    )
                    .with(\.leadingTrivia, .newlines(2))
                }
            )
            .with(\.leadingTrivia, .newlines(2))
        )

        return decls
    }

    private func enumCaseInitializer(
        caseElement: EnumCaseElementSyntax
    ) -> FunctionCallExprSyntax {
        FunctionCallExprSyntax(
            calledExpression: MemberAccessExprSyntax(
                period: .periodToken(),
                declName: DeclReferenceExprSyntax(
                    baseName: caseElement.name
                )
            ),
            leftParen: .leftParenToken(),
            rightParen: .rightParenToken()
        ) {
            let params = caseElement.parameterClause?.parameters ?? []
            for (index, caseParam) in params.enumerated() {
                LabeledExprSyntax(
                    label: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)"),
                    colon: .colonToken(),
                    expression: DeclReferenceExprSyntax(baseName: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)")),
                    trailingComma: index + 1 < params.count ? .commaToken() : nil
                )
            }
        }
    }

    private func enumMatchFunc(
        enumDecl: EnumDeclSyntax
    ) throws -> FunctionDeclSyntax {
        let enumName = enumDecl.name.trimmed.text

        return try FunctionDeclSyntax(
            attributes: AttributeListSyntax {
                "@objc"
            }
            .with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                enumDecl.modifiers.trimmed
            },
            name: .identifier("match"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    for member in enumDecl.memberBlock.members {
                        if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                            for caseElement in caseDecl.elements {
                                FunctionParameterSyntax(
                                    firstName: caseElement.name,
                                    type: OptionalTypeSyntax(
                                        wrappedType: IdentifierTypeSyntax(
                                            name: .identifier("\(enumName)\(caseElement.name.trimmed.text.uppercasingFirst)MatchHandler")
                                        )
                                    )
                                )
                            }
                        }
                    }
                }
            )
        ) {
            try SwitchExprSyntax("switch wrapped") {
                for member in enumDecl.memberBlock.members {
                    if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                        for caseElement in caseDecl.elements {
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
                                                    leftParen: .leftParenToken(),
                                                    rightParen: .rightParenToken()
                                                ) {
                                                    LabeledExprListSyntax {
                                                        let params = caseElement.parameterClause?.parameters ?? []
                                                        for (index, caseParam) in params.enumerated() {
                                                            LabeledExprSyntax(
                                                                expression: PatternExprSyntax(
                                                                    pattern: ValueBindingPatternSyntax(
                                                                        bindingSpecifier: .keyword(.let),
                                                                        pattern: IdentifierPatternSyntax(identifier: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)"))
                                                                    )
                                                                ),
                                                                trailingComma: index + 1 < params.count ? .commaToken() : nil
                                                            )
                                                        }
                                                    }
                                                }
                                            )
                                        )
                                    }
                                )
                            ) {
                                FunctionCallExprSyntax(
                                    calledExpression: OptionalChainingExprSyntax(
                                        expression: DeclReferenceExprSyntax(
                                            baseName: caseElement.name
                                        )
                                    ),
                                    leftParen: .leftParenToken(),
                                    rightParen: .rightParenToken()
                                ) {
                                    LabeledExprListSyntax {
                                        let params = caseElement.parameterClause?.parameters ?? []
                                        for (index, caseParam) in params.enumerated() {
                                            LabeledExprSyntax(
                                                expression: DeclReferenceExprSyntax(baseName: caseParam.firstName ?? caseParam.secondName ?? .identifier("param\(index)")),
                                                trailingComma: index + 1 < params.count ? .commaToken() : nil
                                            )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    private func unavailableInit(
        parentContainerModifiers: DeclModifierListSyntax
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            attributes: AttributeListSyntax {
                "@available(*, unavailable)"
            }.with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                parentContainerModifiers.trimmed

                DeclModifierSyntax(
                    name: .keyword(.override)
                )
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(parameters: FunctionParameterListSyntax())
            )
        ) {
            "fatalError()"
        }
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
            for binding in variableTypeDecl.bindings where !binding.isDerived {
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                    let variableName = identifierPattern.identifier.trimmed.text

                    PatternBindingSyntax(
                        pattern: binding.pattern,
                        typeAnnotation: {
                            if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
                                return TypeAnnotationSyntax(
                                    type: OptionalTypeSyntax(
                                        wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                    )
                                )
                            } else {
                                return typeAnnotation
                            }
                        }(),
                        accessorBlock: AccessorBlockSyntax(
                            accessors: .getter(
                                CodeBlockItemListSyntax {
                                    if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
                                        "wrapped.\(raw: variableName).map(NSNumber.init)"
                                    } else {
                                        "wrapped.\(raw: variableName)"
                                    }
                                }
                            )
                        )
                    )
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    private func objcHashFunc(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                structDecl.modifiers.trimmed

                DeclModifierSyntax(
                    name: .keyword(.override)
                )
            },
            bindingSpecifier: .keyword(.var)
        ) {
            PatternBindingSyntax(
                pattern: IdentifierPatternSyntax(identifier: .identifier("hash")),
                typeAnnotation: TypeAnnotationSyntax(
                    colon: .colonToken(),
                    type: IdentifierTypeSyntax(name: "Int")
                ),
                accessorBlock: AccessorBlockSyntax(
                    accessors: .getter(
                        CodeBlockItemListSyntax {
                            "var hasher = Hasher()"
                            "hasher.combine(wrapped)"
                            "return hasher.finalize()"
                        }
                    )
                )
            )
        }
    }

    @MemberBlockItemListBuilder
    private func descriptionFunc(
        modifiers: DeclModifierListSyntax,
        isDebugDescription: Bool
    ) throws -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                modifiers.trimmed

                DeclModifierSyntax(
                    name: .keyword(.override)
                )
            },
            bindingSpecifier: .keyword(.var),
            bindings: PatternBindingListSyntax {
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(
                        identifier: .identifier(isDebugDescription ? "debugDescription" : "description")
                    ),
                    typeAnnotation: TypeAnnotationSyntax(
                        colon: .colonToken(),
                        type: IdentifierTypeSyntax(name: .identifier("String"))
                    ),
                    accessorBlock: AccessorBlockSyntax(
                        accessors: .getter(
                            CodeBlockItemListSyntax {
                                if isDebugDescription {
                                    "return wrapped.debugDescription"
                                } else {
                                    "return wrapped.description"
                                }
                            }
                        )
                    )
                )
            }
        )
    }

    @MemberBlockItemListBuilder
    private func objcIsEqualFunc(
        containerName: String,
        modifiers: DeclModifierListSyntax
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
                if let other = object as? \(raw: containerName)Class {
                    return wrapped == other.wrapped
                }
                """
            )

            StmtSyntax("return false")
        }
    }

    private func internalWrappedInitializer(
        containerName: String
    ) -> DeclSyntax {
        DeclSyntax(
            """
            private init(wrapped: \(raw: containerName)) {
                self.wrapped = wrapped
            }
            """
        )
    }

    @MemberBlockItemListBuilder
    private func nsCopyingConformances(
        containerName: String,
        modifiers: DeclModifierListSyntax
    ) throws -> MemberBlockItemListSyntax {
        internalWrappedInitializer(containerName: containerName)

        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                modifiers.trimmed
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
            StmtSyntax(
                """
                return \(raw: containerName)Class(wrapped: wrapped)
                """
            )
        }
        .with(\.leadingTrivia, .newlines(2))
    }

    @MemberBlockItemListBuilder
    private func nsCodingConformances(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let structName = structDecl.name.trimmed.text

        DeclSyntax(
            """
            \(raw: structDecl.visibilityModifierString)func encode(with coder: NSCoder) {
                guard let encodedData = try? JSONEncoder().encode(wrapped) else {
                    return
                }
                coder.encode(encodedData)
            }
            """
        )

        DeclSyntax(
            """
            \(raw: structDecl.visibilityModifierString)required init?(coder: NSCoder) {
                guard let data = coder.decodeData() else {
                    return nil
                }

                guard let wrapped = try? JSONDecoder().decode(\(raw: structName).self, from: data) else {
                    return nil
                }

                self.wrapped = wrapped
                super.init()
            }
            """
        )
        .with(\.leadingTrivia, .newlines(2))
    }

    private struct DeclDescriptor {
        enum Decl {
            case structDecl(StructDeclSyntax)
            case enumDecl(EnumDeclSyntax)
        }
        var decl: Decl
        var inheritedTypes: [String]
    }

    private func descriptorMap(
        codeBlocks: CodeBlockItemListSyntax
    ) -> [String: DeclDescriptor] {
        var containerDescriptorMap = [String: DeclDescriptor]()
        var extensionInheritedTypesMap = [String: [String]]()

        for codeBlockItem in codeBlocks {
            if let structDecl = codeBlockItem.item.as(StructDeclSyntax.self) {
                let structName = structDecl.name.trimmed.text
                var inheritedTypes = Set(containerDescriptorMap[structName]?.inheritedTypes ?? [])
                inheritedTypes.formUnion(structDecl.inheritedTypes)
                containerDescriptorMap[structName] = DeclDescriptor(decl: .structDecl(structDecl), inheritedTypes: Array(inheritedTypes))
            } else if let enumDecl = codeBlockItem.item.as(EnumDeclSyntax.self) {
                let enumName = enumDecl.name.trimmed.text
                var inheritedTypes = Set(containerDescriptorMap[enumName]?.inheritedTypes ?? [])
                inheritedTypes.formUnion(enumDecl.inheritedTypes)
                containerDescriptorMap[enumName] = DeclDescriptor(decl: .enumDecl(enumDecl), inheritedTypes: Array(inheritedTypes))
            } else if let extensionDecl = codeBlockItem.item.as(ExtensionDeclSyntax.self), let extensionId = extensionDecl.extendedType.as(IdentifierTypeSyntax.self) {
                let extensionName = extensionId.trimmed.name.text
                var inheritedTypes = Set(extensionInheritedTypesMap[extensionName] ?? [])
                inheritedTypes.formUnion(extensionDecl.inheritedTypes)
                extensionInheritedTypesMap[extensionName] = Array(inheritedTypes)
            }
        }

        var descriptorMap = containerDescriptorMap

        // Iterate through extensionInheritedTypesMap and merge with descriptorMap
        for (key, values) in extensionInheritedTypesMap {
            // If the key exists in descriptorMap, merge the values
            if let existingValues = descriptorMap[key] {
                descriptorMap[key]?.inheritedTypes = Array(Set(existingValues.inheritedTypes).union(values))
            } else {
                // If the key only exists in extensionInheritedTypesMap, ignore it
            }
        }

        return descriptorMap
    }

}

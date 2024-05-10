import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities

/// See swift foundation type mapping to objective-C here.
/// https://developer.apple.com/documentation/swift/working-with-foundation-types
public struct SwiftObjcValueTypeFactory {
    public init(
    ) {
    }

    @CodeBlockItemListBuilder
    public func wrappingClassDecl(
        codeBlocks: CodeBlockItemListSyntax,
        referencedSwiftTypes: [String] = [],
        prefix: String = "",
        imports: [String] = [],
        externalHashFunc: String? = nil,
        shouldSynthesizeNSCoding: Bool = true,
        shouldSynthesizeNSCopying: Bool = true,
        shouldSynthesizeObjCBuilder: Bool = true
    ) throws -> CodeBlockItemListSyntax {
        for codeBlockItem in codeBlocks {
            // Inherit import statements, deduping with incoming ones
            if let importDecl = codeBlockItem.item.as(ImportDeclSyntax.self), !importDecl.path.contains(where: { imports.contains($0.name.trimmed.text) }) {
                importDecl
            }
        }

        for (_, descriptor) in descriptorMap(codeBlocks: codeBlocks) {
            try CodeBlockItemListSyntax {
                switch descriptor.decl {
                case .structDecl(let structDecl):
                    for decl in try wrappingClassDecl(
                        structDecl: structDecl,
                        referencedSwiftTypes: referencedSwiftTypes,
                        prefix: prefix,
                        imports: imports,
                        externalHashFunc: externalHashFunc,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeHash: descriptor.inheritedTypes.contains("Hashable"),
                        shouldSynthesizeNSCoding: shouldSynthesizeNSCoding,
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
                        shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder,
                        shouldSynthesizeDescription: descriptor.inheritedTypes.contains("CustomStringConvertible"),
                        shouldSynthesizeDebugDescription: descriptor.inheritedTypes.contains("CustomDebugStringConvertible")
                    ) { decl }
                case .enumDecl(let enumDecl):
                    for decl in try wrappingClassDecl(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeNSCoding: shouldSynthesizeNSCoding,
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying
                    ) { decl }
                }
            }
        }
    }

    public func wrappingClassDeclInMacro(
        structDecl: StructDeclSyntax,
        prefix: String,
        imports: [String],
        externalHashFunc: String?,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        try wrappingClassDecl(
            structDecl: structDecl,
            referencedSwiftTypes: [],
            prefix: prefix,
            imports: imports,
            externalHashFunc: externalHashFunc,
            shouldSynthesizeEquatable: structDecl.inheritedTypes.contains("Equatable") || structDecl.inheritedTypes.contains("Hashable") ||
            structDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeHash: structDecl.inheritedTypes.contains("Hashable"),
            shouldSynthesizeNSCoding: shouldSynthesizeNSCoding,
            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
            shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder,
            shouldSynthesizeDescription: structDecl.inheritedTypes.contains("CustomStringConvertible"),
            shouldSynthesizeDebugDescription: structDecl.inheritedTypes.contains("CustomDebugStringConvertible")
        )
    }

    public func wrappingClassDecl(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: [String],
        prefix: String,
        imports: [String],
        externalHashFunc: String?,
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeHash: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool,
        shouldSynthesizeDescription: Bool,
        shouldSynthesizeDebugDescription: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        let structName = structDecl.name.trimmed.text

        var decls = [any DeclSyntaxProtocol]()

        for (index, `import`) in imports.enumerated() {
            decls.append(
                DeclSyntax(
                    "import \(raw: `import`)"
                )
                .with(\.trailingTrivia, index + 1 >= imports.count ? .newlines(2) : [])
            )
        }

        if shouldSynthesizeNSCoding {
            decls.append(contentsOf: nsCodingConstants(structDecl: structDecl))
        }

        decls.append(
            try ClassDeclSyntax(
                attributes: AttributeListSyntax {
                    .attribute("@objc(\(raw: prefix + structName))")
                }.with(\.trailingTrivia, .newline),
                modifiers: structDecl.modifiers.trimmed,
                name: "\(raw: structName)Objc",
                inheritanceClause: InheritanceClauseSyntax {
                    InheritedTypeListSyntax {
                        InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSObject"))

                        if shouldSynthesizeNSCopying {
                            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSCopying"))
                        }

                        if shouldSynthesizeNSCoding {
                            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "NSCoding"))
                        }
                    }
                },
                memberBlockBuilder: {
                    try structDecl.forEachVariableDecl { variableTypeDecl in
                        try objcVariableDecl(
                            variableTypeDecl: variableTypeDecl,
                            referencedSwiftTypes: referencedSwiftTypes
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    try objcInitializer(
                        structDecl: structDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try objcInitializerFromSwiftType(
                        structDecl: structDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeHash {
                        objcHashFunc(
                            structDecl: structDecl, 
                            externalHashFunc: externalHashFunc
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeEquatable {
                        try objcIsEqualFunc(
                            structDecl: structDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCopying {
                        try nsCopyingConformances(
                            structDecl: structDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCoding {
                        try nsCodingConformances(
                            structDecl: structDecl,
                            referencedSwiftTypes: referencedSwiftTypes
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
            .with(\.leadingTrivia, .newlines(2))
        )

        if shouldSynthesizeObjCBuilder {
            decls.append(
                try objcBuilderExtensionDecl(
                    structDecl: structDecl,
                    referencedSwiftTypes: referencedSwiftTypes,
                    prefix: prefix
                )
                .with(\.leadingTrivia, .newlines(2))
                .with(\.trailingTrivia, .newline)
            )
        }

        return decls
    }

    public func wrappingClassDecl(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        var decls = [any DeclSyntaxProtocol]()
        let enumName = enumDecl.name.trimmed.text

        if shouldSynthesizeNSCoding {
            decls.append(contentsOf: nsCodingConstants(enumDecl: enumDecl))
        }

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
                                                secondName: caseParam.properName(index: index),
                                                colon: .colonToken(),
                                                type: caseParam.type.asNSNumberIfOptionalNumeral
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
                name: "\(raw: enumName)Objc",
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
                        "public let wrapped: \(raw: enumName)"
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try unavailableInit(
                        parentContainerModifiers: enumDecl.modifiers
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeEquatable {
                        try objcIsEqualFunc(
                            enumDecl: enumDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCopying {
                        try nsCopyingConformances(
                            enumDecl: enumDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }

                    if shouldSynthesizeNSCoding {
                        try nsCodingConformances(
                            enumDecl: enumDecl,
                            referencedSwiftTypes: referencedSwiftTypes
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
                                                        firstName: caseParam.properName(index: index),
                                                        secondName: caseParam.secondName,
                                                        type: type
                                                    )
                                                }
                                            }
                                        ),
                                        returnClause: ReturnClauseSyntax(
                                            type: IdentifierTypeSyntax(name: .identifier("\(enumName)Objc"))
                                        )
                                    )
                                ) {
                                    ReturnStmtSyntax(
                                        expression: FunctionCallExprSyntax(
                                            calledExpression: DeclReferenceExprSyntax(
                                                baseName: .identifier("\(enumName)Objc")),
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
                    label: caseParam.properName(index: index),
                    colon: .colonToken(),
                    expression: DeclReferenceExprSyntax(
                        baseName: caseParam.properName(index: index)
                    )
                    .mappingNSNumberToNumeralValue(type: caseParam.type),
                    trailingComma: index + 1 < params.count ? .commaToken() : nil
                )
            }
        }
    }

    func switchCaseLabel(caseElement: EnumCaseElementSyntax) -> SwitchCaseLabelSyntax {
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
                                            pattern: IdentifierPatternSyntax(identifier: caseParam.properName(index: index))
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
                    enumDecl.forEachCaseElement { caseElement in
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
            )
        ) {
            try SwitchExprSyntax("switch wrapped") {
                enumDecl.forEachCaseElement { caseElement in
                    SwitchCaseSyntax(
                        label: .case(switchCaseLabel(caseElement: caseElement))
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
                                        expression: DeclReferenceExprSyntax(
                                            baseName: caseParam.properName(index: index)
                                        )
                                        .mappingNumeralValueToNSNumber(type: caseParam.type),
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

    /*
     @objc
     public init(foo: [FooObjc]?, bar: Int) {
         self.foo = foo
         self.bar = bar
     }
     */
    @MemberBlockItemListBuilder
    private func objcInitializer(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: [String]
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            attributes: AttributeListSyntax {
                .attribute("@objc")
            }.with(\.trailingTrivia, .newline),
            modifiers: structDecl.modifiers.trimmed,
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        structDecl.forEachBinding { binding in
                            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                let variableName = identifierPattern.identifier.trimmed.text

                                FunctionParameterSyntax(
                                    firstName: .identifier(variableName),
                                    type: typeAnnotation.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes)
                                )
                            }
                        }
                    }
                )
            )
        ) {
            structDecl.forEachBinding { binding in
                SequenceExprSyntax {
                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(baseName: .keyword(.self)),
                            declName: DeclReferenceExprSyntax(baseName: identifierPattern.identifier)
                        )

                        AssignmentExprSyntax()

                        DeclReferenceExprSyntax(baseName: identifierPattern.identifier)
                    }
                }
            }
        }
    }


    /*
     public init(_ original: Foo) {
        self.init(
            prop1: original.prop1,
            arrayOfBar: original.array.map({ a0 in BarObjc(a0) }),
            optMapOfIntToBaz: original.optMap?.mapValue({ a0 in Baz(a0) })
        )
     }
     */
    @MemberBlockItemListBuilder
    private func objcInitializerFromSwiftType(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: [String]
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
                            type: IdentifierTypeSyntax(name: structDecl.name.trimmed)
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
                        .mappingNumeralValueToNSNumber(type: typeAnnotation.type)
                        .convertingToObjcType(
                            type: typeAnnotation.type,
                            referencedSwiftTypes: referencedSwiftTypes
                        )
                    }
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    private func objcVariableDecl(
        variableTypeDecl: VariableDeclSyntax,
        referencedSwiftTypes: [String]
    ) throws -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            attributes: AttributeListSyntax {
                .attribute("@objc")
            },
            modifiers: variableTypeDecl.modifiers.trimmed,
            bindingSpecifier: .keyword(.let)
        ) {
            for binding in variableTypeDecl.bindings where !binding.isDerived {
                if let typeAnnotation = binding.typeAnnotation {
                    PatternBindingSyntax(
                        pattern: binding.pattern,
                        typeAnnotation: TypeAnnotationSyntax(
                            type: typeAnnotation.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes)
                        )
                    )
                }
            }
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

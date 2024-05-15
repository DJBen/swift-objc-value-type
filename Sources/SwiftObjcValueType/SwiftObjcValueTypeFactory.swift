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
        referencedSwiftTypes: Set<String> = [],
        prefix: String = "",
        imports: [String] = [],
        externalHashSettings: ExternalHashSettings? = nil,
        shouldSynthesizeNSCoding: Bool = false,
        shouldSynthesizeNSCopying: Bool = false,
        shouldSynthesizeObjCBuilder: Bool = false
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
                    let configFlags = structDecl.valueObjectFlags

                    for decl in try wrappingClassDecl(
                        structDecl: structDecl,
                        referencedSwiftTypes: referencedSwiftTypes,
                        prefix: prefix,
                        imports: imports,
                        externalHashSettings: externalHashSettings,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying"),
                        shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder || configFlags.contains("builder"),
                        shouldSynthesizeDescription: descriptor.inheritedTypes.contains("CustomStringConvertible"),
                        shouldSynthesizeDebugDescription: descriptor.inheritedTypes.contains("CustomDebugStringConvertible")
                    ) { decl }
                case .enumDecl(let enumDecl):
                    let configFlags = enumDecl.valueObjectFlags

                    for decl in try wrappingClassDecl(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes,
                        prefix: prefix,
                        imports: imports,
                        externalHashSettings: externalHashSettings,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying")
                    ) { decl }
                }
            }
        }
    }

    public func wrappingClassDeclInMacro(
        structDecl: StructDeclSyntax
    ) throws -> [any DeclSyntaxProtocol] {
        let configFlags = structDecl.valueObjectFlags

        return try wrappingClassDecl(
            structDecl: structDecl,
            referencedSwiftTypes: [],
            prefix: "",
            imports: [],
            externalHashSettings: nil,
            shouldSynthesizeEquatable: structDecl.inheritedTypes.contains("Equatable") || structDecl.inheritedTypes.contains("Hashable") ||
            structDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeNSCoding: configFlags.contains("nscoding"),
            shouldSynthesizeNSCopying: configFlags.contains("nscopying"),
            shouldSynthesizeObjCBuilder: configFlags.contains("builder"),
            shouldSynthesizeDescription: structDecl.inheritedTypes.contains("CustomStringConvertible"),
            shouldSynthesizeDebugDescription: structDecl.inheritedTypes.contains("CustomDebugStringConvertible")
        )
    }

    public func wrappingClassDeclInMacro(
        enumDecl: EnumDeclSyntax
    ) throws -> [any DeclSyntaxProtocol] {
        let configFlags = enumDecl.valueObjectFlags

        return try wrappingClassDecl(
            enumDecl: enumDecl,
            referencedSwiftTypes: [],
            prefix: "",
            imports: [],
            externalHashSettings: nil,
            shouldSynthesizeEquatable: enumDecl.inheritedTypes.contains("Equatable") || enumDecl.inheritedTypes.contains("Hashable") ||
            enumDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeNSCoding: configFlags.contains("nscoding"),
            shouldSynthesizeNSCopying: configFlags.contains("nscopying")
        )
    }

    private func wrappingClassDecl(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>,
        prefix: String,
        imports: [String],
        externalHashSettings: ExternalHashSettings?,
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool,
        shouldSynthesizeDescription: Bool,
        shouldSynthesizeDebugDescription: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        let structName = structDecl.name.trimmed.text

        var decls = [any DeclSyntaxProtocol]()

        if let lib = externalHashSettings?.libary {
            decls.append(
                DeclSyntax(
                    "import \(raw: lib)"
                )
            )
        }

        for `import` in imports {
            decls.append(
                DeclSyntax(
                    "import \(raw: `import`)"
                )
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

                    if shouldSynthesizeEquatable {
                        objcHashFunc(
                            structDecl: structDecl,
                            externalHashSettings: externalHashSettings
                        )
                        .with(\.leadingTrivia, .newlines(2))

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

    private func wrappingClassDecl(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>,
        prefix: String = "",
        imports: [String],
        externalHashSettings: ExternalHashSettings?,
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        var decls = [any DeclSyntaxProtocol]()
        let enumName = enumDecl.name.trimmed.text

        if let lib = externalHashSettings?.libary {
            decls.append(
                DeclSyntax(
                    "import \(raw: lib)"
                )
            )
        }

        for `import` in imports {
            decls.append(
                DeclSyntax(
                    "import \(raw: `import`)"
                )
            )
        }

        if shouldSynthesizeNSCoding {
            decls.append(contentsOf: nsCodingConstants(enumDecl: enumDecl))
        }

        decls.append(
            EnumDeclSyntax(
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .keyword(.private))
                },
                name: .identifier("\(enumName)Subtype"),
                inheritanceClause: InheritanceClauseSyntax {
                    InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier("Int")))
                    InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier("Equatable")))
                }
            ) {
                enumDecl.forEachCaseElement { caseElement in
                    EnumCaseDeclSyntax {
                        EnumCaseElementSyntax(name: .identifier("\(caseElement.name.trimmed.text.lowercasingFirst)"))
                    }
                }
            }
            .with(\.leadingTrivia, .newlines(2))
        )

        enumDecl.forEachCaseElement { caseElement in
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
                                        type: caseParam.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes)
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

        decls.append(
            try ClassDeclSyntax(
                attributes: AttributeListSyntax {
                    .attribute("@objc(\(raw: prefix + enumName))")
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
                    DeclSyntax("private let subtype: \(raw: enumName)Subtype")

                    try objcEnumPrivateVariablesDecl(
                        enumDecl: enumDecl, referencedSwiftTypes: referencedSwiftTypes
                    )

                    try enumPrivateObjcInitializer(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try unavailableInit(
                        parentContainerModifiers: enumDecl.modifiers
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeEquatable {
                        objcHashFunc(
                            enumDecl: enumDecl,
                            externalHashSettings: externalHashSettings
                        )
                        .with(\.leadingTrivia, .newlines(2))

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

                    enumDecl.forEachCaseElement { caseElement in
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
                                            FunctionParameterSyntax(
                                                firstName: caseParam.properName(index: index),
                                                secondName: caseParam.secondName,
                                                type: caseParam.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes)
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
                                        label: .identifier("subtype"),
                                        colon: .colonToken(),
                                        expression: MemberAccessExprSyntax(
                                            period: .periodToken(),
                                            declName: DeclReferenceExprSyntax(baseName: .identifier(caseElement.name.trimmed.text.lowercasingFirst))
                                        )
                                    )

                                    let caseName = caseElement.name.trimmed.text.uppercasingFirst
                                    let params = caseElement.parameterClause?.parameters ?? []
                                    for (index, caseParam) in params.enumerated() {
                                        let propertyName = caseParam.properName(index: index).trimmed.text

                                        LabeledExprSyntax(
                                            label: .identifier(caseName.lowercasingFirst + propertyName.uppercasingFirst),
                                            colon: .colonToken(),
                                            expression: DeclReferenceExprSyntax(baseName: .identifier(propertyName))
                                        )
                                    }
                                }
                            )
                        }
                        .with(\.leadingTrivia, .newlines(2))
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

    private func enumMatchFunc(
        enumDecl: EnumDeclSyntax
    ) throws -> FunctionDeclSyntax {
        let enumName = enumDecl.name.trimmed.text

        return try FunctionDeclSyntax(
            attributes: AttributeListSyntax {
                AttributeSyntax(
                    atSign: .atSignToken(),
                    attributeName: IdentifierTypeSyntax(name: .identifier("objc")),
                    leftParen: .leftParenToken(),
                    arguments: .objCName(
                        ObjCSelectorPieceListSyntax {
                            enumDecl.enumerateCaseElement { index, caseElement in
                                ObjCSelectorPieceSyntax(
                                    name: .identifier(index == 0 ? "match\(caseElement.name.trimmed.text.uppercasingFirst)" : caseElement.name.trimmed.text.lowercasingFirst),
                                    colon: .colonToken()
                                )
                            }
                        }
                    ),
                    rightParen: .rightParenToken()
                )
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
                                let caseName = caseElement.name.trimmed.text.uppercasingFirst
                                let params = caseElement.parameterClause?.parameters ?? []
                                for (index, caseParam) in params.enumerated() {
                                    LabeledExprSyntax(
                                        expression: DeclReferenceExprSyntax(
                                            baseName: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst)
                                        )
                                        .mappingNumeralValueToNSNumber(type: caseParam.type)
                                        .forceUnwrapIfNotOptional(type: caseParam.type)
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

    @MemberBlockItemListBuilder
    private func enumPrivateObjcInitializer(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        InitializerDeclSyntax(
            modifiers: DeclModifierListSyntax {
                DeclModifierSyntax(name: .keyword(.private))
            },
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax(
                    parametersBuilder: {
                        FunctionParameterSyntax(
                            firstName: .identifier("subtype"),
                            type: IdentifierTypeSyntax(name: .identifier("\(enumDecl.name.trimmed.text)Subtype"))
                        )

                        enumDecl.forEachCaseElement { caseElement in
                            let caseName = caseElement.name.trimmed.text.uppercasingFirst
                            let params = caseElement.parameterClause?.parameters ?? []
                            for (index, caseParam) in params.enumerated() {
                                FunctionParameterSyntax(
                                    firstName: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst),
                                    type: caseParam.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes).optionalized,
                                    defaultValue: InitializerClauseSyntax(
                                        value: NilLiteralExprSyntax()
                                    )
                                )
                            }
                        }
                    }
                )
            )
        ) {
            "self.subtype = subtype"

            enumDecl.forEachCaseElement { caseElement in
                let caseName = caseElement.name.trimmed.text.uppercasingFirst
                let params = caseElement.parameterClause?.parameters ?? []

                for (index, caseParam) in params.enumerated() {
                    let propertyName = caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst

                    SequenceExprSyntax {
                        MemberAccessExprSyntax(
                            base: DeclReferenceExprSyntax(baseName: .keyword(.self)),
                            declName: DeclReferenceExprSyntax(baseName: .identifier(propertyName))
                        )

                        AssignmentExprSyntax()

                        DeclReferenceExprSyntax(baseName: .identifier(propertyName))
                    }
                }
            }

            ExprSyntax(
                "super.init()"
            )
            .with(\.leadingTrivia, .newlines(2))
        }
    }

    /*
     @objc
     public init(foo: [FooObjc]?, bar: Int) {
         self.foo = foo
         self.bar = bar

         super.init()
     }
     */
    @MemberBlockItemListBuilder
    private func objcInitializer(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>
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

            ExprSyntax(
                "super.init()"
            )
            .with(\.leadingTrivia, .newlines(2))
        }
    }


    /*
     public init(_ original: Foo) {
         self.prop1 = original.prop1,
         self.arrayOfBar = original.array.map({ a0 in BarObjc(a0) }),
         self.optMapOfIntToBaz = original.optMap?.mapValue({ a0 in Baz(a0) })

         super.init()
     }
     */
    @MemberBlockItemListBuilder
    private func objcInitializerFromSwiftType(
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
    private func objcEnumPrivateVariablesDecl(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        enumDecl.forEachCaseElement { caseElement in
            let caseName = caseElement.name.trimmed.text.uppercasingFirst
            let params = caseElement.parameterClause?.parameters ?? []
            for (index, caseParam) in params.enumerated() {
                VariableDeclSyntax(
                    modifiers: DeclModifierListSyntax {
                        DeclModifierSyntax(name: .keyword(.private))
                    },
                    bindingSpecifier: .keyword(.let)
                ) {
                    PatternBindingSyntax(
                        pattern: IdentifierPatternSyntax(
                            identifier: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst)
                        ),
                        typeAnnotation: TypeAnnotationSyntax(
                            type: caseParam.type.asNSNumberIfOptionalNumeral.aliasingToObjcIfSiblingSwiftType(referencedSwiftTypes).optionalized
                        )
                    )
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    private func objcVariableDecl(
        variableTypeDecl: VariableDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            leadingTrivia: variableTypeDecl.leadingTrivia,
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

private extension Trivia {
    var valueObjectFlags: Set<String> {
        pieces.compactMap {
            switch $0 {
            case .blockComment(let comment), .lineComment(let comment), .docLineComment(let comment), .docBlockComment(let comment):
                var set = Set<String>()
                for match in comment.matches(of: /@value_object\s+(.+)/) {
                    for flag in String(match.1).trimmingCharacters(in: .whitespaces).lowercased().components(separatedBy: " ") {
                        set.insert(flag)
                    }
                }
                return set
            default:
                return nil
            }
        }
        .reduce(Set<String>(), { $0.union($1) })
    }
}

private extension StructDeclSyntax {
    var valueObjectFlags: Set<String> {
        attributes.leadingTrivia.valueObjectFlags
            .union(modifiers.leadingTrivia.valueObjectFlags)
            .union(structKeyword.leadingTrivia.valueObjectFlags)
    }
}

private extension EnumDeclSyntax {
    var valueObjectFlags: Set<String> {
        attributes.leadingTrivia.valueObjectFlags
            .union(modifiers.leadingTrivia.valueObjectFlags)
            .union(enumKeyword.leadingTrivia.valueObjectFlags)
    }
}

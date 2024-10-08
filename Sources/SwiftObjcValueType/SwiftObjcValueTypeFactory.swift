import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities
import OrderedCollections

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
                    // Avoid class synthesizing for `OptionSet`: it has no equivalent in Objective-C
                    // https://stackoverflow.com/q/24066170
                    // Objective-C NS_OPTIONS may be imported to Swift, but not the other way around.
                    if !structDecl.inheritedTypes.contains("OptionSet") {
                        let configFlags = structDecl.valueObjectConfig.flags
                        let referencedSwiftTypes = referencedSwiftTypes.union(structDecl.valueObjectConfig.swiftTypesWithWrapper)

                        for decl in try wrappingClassDecl(
                            structDecl: structDecl,
                            referencedSwiftTypes: referencedSwiftTypes,
                            prefix: prefix,
                            imports: imports,
                            shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                            descriptor.inheritedTypes.contains("Identifiable"),
                            shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
                            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying"),
                            shouldSynthesizeObjcBuilder: shouldSynthesizeObjCBuilder || configFlags.contains("builder"),
                            shouldSynthesizeDescription: descriptor.inheritedTypes.contains("CustomStringConvertible"),
                            shouldSynthesizeDebugDescription: descriptor.inheritedTypes.contains("CustomDebugStringConvertible")
                        ) { decl }
                        
                        for decl in try extensionDecl(
                            structDecl: structDecl,
                            referencedSwiftTypes: referencedSwiftTypes
                        ) { decl }
                    }

                case .enumDecl(let enumDecl):
                    let configFlags = enumDecl.valueObjectConfig.flags
                    let referencedSwiftTypes = referencedSwiftTypes.union(enumDecl.valueObjectConfig.swiftTypesWithWrapper)

                    for decl in try wrappingClassDecl(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes,
                        prefix: prefix,
                        imports: imports,
                        shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                        descriptor.inheritedTypes.contains("Identifiable"),
                        shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
                        shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying")
                    ) { decl }
                    
                    for decl in try extensionDecl(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    ) { decl }
                }
            }
        }
    }

    public func wrappingClassDeclForPeerMacro(
        structDecl: StructDeclSyntax,
        shouldSynthesizeNSCoding: Bool = false,
        shouldSynthesizeNSCopying: Bool = false,
        shouldSynthesizeObjcBuilder: Bool = false
    ) throws -> [any DeclSyntaxProtocol] {
        let configFlags = structDecl.valueObjectConfig.flags

        return try wrappingClassDecl(
            structDecl: structDecl,
            referencedSwiftTypes: structDecl.valueObjectConfig.swiftTypesWithWrapper,
            prefix: "",
            imports: [],
            shouldSynthesizeEquatable: structDecl.inheritedTypes.contains("Equatable") || structDecl.inheritedTypes.contains("Hashable") ||
            structDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying"),
            shouldSynthesizeObjcBuilder: shouldSynthesizeObjcBuilder || configFlags.contains("builder"),
            shouldSynthesizeDescription: structDecl.inheritedTypes.contains("CustomStringConvertible"),
            shouldSynthesizeDebugDescription: structDecl.inheritedTypes.contains("CustomDebugStringConvertible")
        )
    }

    public func wrappingClassDeclForPeerMacro(
        enumDecl: EnumDeclSyntax,
        shouldSynthesizeNSCoding: Bool = false,
        shouldSynthesizeNSCopying: Bool = false
    ) throws -> [any DeclSyntaxProtocol] {
        let configFlags = enumDecl.valueObjectConfig.flags

        return try wrappingClassDecl(
            enumDecl: enumDecl,
            referencedSwiftTypes: enumDecl.valueObjectConfig.swiftTypesWithWrapper,
            prefix: "",
            imports: [],
            shouldSynthesizeEquatable: enumDecl.inheritedTypes.contains("Equatable") || enumDecl.inheritedTypes.contains("Hashable") ||
            enumDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeNSCoding: shouldSynthesizeNSCoding || configFlags.contains("nscoding"),
            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying || configFlags.contains("nscopying")
        )
    }
    
    public func extensionDecl(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> [ExtensionDeclSyntax] {
        var decls = [ExtensionDeclSyntax]()
        
        decls.append(
            try ExtensionDeclSyntax(
                extendedType: IdentifierTypeSyntax(name: structDecl.name.trimmed)
            ) {
                try swiftInitializerFromObjcWrapper(
                    structDecl: structDecl,
                    referencedSwiftTypes: referencedSwiftTypes
                )
            }
            .with(\.leadingTrivia, .newlines(2))
        )
        
        return decls
    }
    
    private func wrappingClassDecl(
        structDecl: StructDeclSyntax,
        referencedSwiftTypes: Set<String>,
        prefix: String,
        imports: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjcBuilder: Bool,
        shouldSynthesizeDescription: Bool,
        shouldSynthesizeDebugDescription: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        let structName = structDecl.name.trimmed.text

        var decls = [any DeclSyntaxProtocol]()

        for `import` in imports {
            decls.append(
                DeclSyntax(
                    "import \(raw: `import`)"
                )
            )
        }

        decls.append(
            try ClassDeclSyntax(
                attributes: AttributeListSyntax {
                    .attribute("@objc(\(raw: prefix + structName.trimmingPrefix(prefix)))")
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
                    if shouldSynthesizeNSCoding {
                        for decl in nsCodingConstants(structDecl: structDecl) { decl }
                    }
                    
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
                            structDecl: structDecl
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
                    
                    if shouldSynthesizeObjcBuilder {
                        try objcBuilderDecl(
                            structDecl: structDecl,
                            referencedSwiftTypes: referencedSwiftTypes,
                            prefix: prefix
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }
                }
            )
            .with(\.leadingTrivia, .newlines(2))
        )

        return decls
    }

    public func extensionDecl(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>
    ) throws -> [ExtensionDeclSyntax] {
        // Primitive enums are notated with @objc
        // Do not generate anything for primitive enums
        if enumDecl.attributes.hasObjc {
            return []
        }
        
        var decls = [ExtensionDeclSyntax]()
        
        decls.append(
            try ExtensionDeclSyntax(
                extendedType: IdentifierTypeSyntax(name: enumDecl.name.trimmed)
            ) {
                try swiftInitializerFromObjcWrapper(
                    enumDecl: enumDecl,
                    referencedSwiftTypes: referencedSwiftTypes
                )
            }
            .with(\.leadingTrivia, .newlines(2))
        )
        
        return decls
    }
    
    private func wrappingClassDecl(
        enumDecl: EnumDeclSyntax,
        referencedSwiftTypes: Set<String>,
        prefix: String = "",
        imports: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCoding: Bool,
        shouldSynthesizeNSCopying: Bool
    ) throws -> [any DeclSyntaxProtocol] {
        // Primitive enums are notated with @objc
        // Do not generate anything for primitive enums
        if enumDecl.attributes.hasObjc {
            return []
        }
        
        var decls = [any DeclSyntaxProtocol]()
        let enumName = enumDecl.name.trimmed.text

        for `import` in imports {
            decls.append(
                DeclSyntax(
                    "import \(raw: `import`)"
                )
            )
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
                        enumDecl.modifiersExcludingIndirect.trimmed
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
                modifiers: enumDecl.modifiersExcludingIndirect.trimmed,
                name: "\(raw: enumName)Objc",
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
                    if shouldSynthesizeNSCoding {
                        for decl in nsCodingConstants(enumDecl: enumDecl) { decl }
                    }
                    
                    DeclSyntax(
                        "private let subtype: \(raw: enumName)Subtype"
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try objcEnumPrivateVariablesDecl(
                        enumDecl: enumDecl, referencedSwiftTypes: referencedSwiftTypes
                    )

                    try enumPrivateObjcInitializer(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try objcInitializerFromSwiftType(
                        enumDecl: enumDecl,
                        referencedSwiftTypes: referencedSwiftTypes
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    try unavailableInit(
                        parentContainerModifiers: enumDecl.modifiersExcludingIndirect.trimmed
                    )
                    .with(\.leadingTrivia, .newlines(2))

                    if shouldSynthesizeEquatable {
                        objcHashFunc(
                            enumDecl: enumDecl
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
                                enumDecl.modifiersExcludingIndirect.trimmed

                                DeclModifierSyntax(name: .keyword(.class))
                            },
                            name: caseElement.name,
                            signature: FunctionSignatureSyntax(
                                parameterClause: FunctionParameterClauseSyntax(
                                    parametersBuilder: {
                                        for (index, caseParam) in (caseElement.parameterClause?.parameters ?? []).enumerated() {
                                            let isUnamed = caseParam.firstName == nil && caseParam.secondName == nil
                                            FunctionParameterSyntax(
                                                firstName: isUnamed ? .wildcardToken() : caseParam.properName(index: index),
                                                secondName: isUnamed ? caseParam.properName(index: index) : nil,
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
                    attributeName: IdentifierTypeSyntax(name: .identifier("objc"))
                )
            }
            .with(\.trailingTrivia, .newline),
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                enumDecl.modifiersExcludingIndirect.trimmed
            },
            name: enumDecl.firstCaseElement.flatMap { caseElement -> TokenSyntax? in
                let caseName = caseElement.name.trimmed.text.uppercasingFirst
                return .identifier("match\(caseName)")
            } ?? .identifier("match"),
            signature: FunctionSignatureSyntax(
                parameterClause: FunctionParameterClauseSyntax {
                    enumDecl.enumerateCaseElement { index, caseElement in
                        FunctionParameterSyntax(
                            firstName: index == 0 ? .wildcardToken() : caseElement.name,
                            secondName: index == 0 ? caseElement.name : nil,
                            type:IdentifierTypeSyntax(
                                name: .identifier("\(enumName)\(caseElement.name.trimmed.text.uppercasingFirst)MatchHandler")
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
                            calledExpression: DeclReferenceExprSyntax(
                                baseName: caseElement.name
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
            attributes: AttributeListSyntax {
                .attribute("@objc").with(\.leadingTrivia, variableTypeDecl.leadingTrivia.normalizingNewLines(2))
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
    ) -> OrderedDictionary<String, DeclDescriptor> {
        var containerDescriptorMap = OrderedDictionary<String, DeclDescriptor>()
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
    var valueObjectConfig: ValueObjectConfig {
        ValueObjectConfig(trivia: self)
    }
}

extension StructDeclSyntax {
    var valueObjectConfig: ValueObjectConfig {
        attributes.leadingTrivia.valueObjectConfig
            .union(modifiers.leadingTrivia.valueObjectConfig)
            .union(structKeyword.leadingTrivia.valueObjectConfig)
    }
}

extension EnumDeclSyntax {
    var valueObjectConfig: ValueObjectConfig {
        attributes.leadingTrivia.valueObjectConfig
            .union(modifiers.leadingTrivia.valueObjectConfig)
            .union(enumKeyword.leadingTrivia.valueObjectConfig)
    }
}

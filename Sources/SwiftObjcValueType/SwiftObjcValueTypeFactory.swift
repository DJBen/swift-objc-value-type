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
        referencedStructTypes: [String] = [],
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
                for decl in try wrappingClassDecl(
                    structDecl: descriptor.structDecl,
                    referencedStructTypes: referencedStructTypes,
                    shouldSynthesizeEquatable: descriptor.inheritedTypes.contains("Equatable") || descriptor.inheritedTypes.contains("Hashable") ||
                    descriptor.inheritedTypes.contains("Identifiable"),
                    shouldSynthesizeNSCodable: descriptor.inheritedTypes.contains("Codable"),
                    shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
                    shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder
                ) { decl }
            }
        }
    }

    public func wrappingClassDeclInMacro(
        structDecl: StructDeclSyntax,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool
    ) throws -> [DeclSyntax] {
        try wrappingClassDecl(
            structDecl: structDecl,
            referencedStructTypes: [],
            shouldSynthesizeEquatable: structDecl.inheritedTypes.contains("Equatable") || structDecl.inheritedTypes.contains("Hashable") ||
            structDecl.inheritedTypes.contains("Identifiable"),
            shouldSynthesizeNSCodable: structDecl.inheritedTypes.contains("Codable"),
            shouldSynthesizeNSCopying: shouldSynthesizeNSCopying,
            shouldSynthesizeObjCBuilder: shouldSynthesizeObjCBuilder
        )
    }

    public func wrappingClassDecl(
        structDecl: StructDeclSyntax,
        referencedStructTypes: [String],
        shouldSynthesizeEquatable: Bool,
        shouldSynthesizeNSCodable: Bool,
        shouldSynthesizeNSCopying: Bool,
        shouldSynthesizeObjCBuilder: Bool
    ) throws -> [DeclSyntax] {
        let structName = structDecl.name.trimmed.text

        var decls = [DeclSyntax]()

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
                    for member in structDecl.memberBlock.members {
                        if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                            try objcVariableDecl(
                                variableTypeDecl: variableTypeDecl
                            )
                            .with(\.leadingTrivia, .newlines(2))
                        }
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
                                    for member in structDecl.memberBlock.members {
                                        if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                                            for binding in variableTypeDecl.bindings {
                                                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                                    let variableName = identifierPattern.identifier.trimmed.text

                                                    FunctionParameterSyntax(
                                                        firstName: .identifier(variableName),
                                                        type: { () -> TypeSyntax in
                                                            if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
                                                                return OptionalTypeSyntax(
                                                                    wrappedType: IdentifierTypeSyntax(name: "NSNumber")
                                                                ).cast(TypeSyntax.self)
                                                            } else {
                                                                return typeAnnotation.type.trimmed
                                                            }
                                                        }()
                                                    )
                                                }
                                            }
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
                                for member in structDecl.memberBlock.members {
                                    if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                                        for binding in variableTypeDecl.bindings {
                                            if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let typeAnnotation = binding.typeAnnotation {
                                                let variableName = identifierPattern.identifier.trimmed.text

                                                LabeledExprSyntax(
                                                    label: .identifier(variableName),
                                                    colon: .colonToken(),
                                                    expression: { () -> ExprSyntax in
                                                        if let optional = typeAnnotation.type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged, let identifierType = optional.wrappedType.as(IdentifierTypeSyntax.self) {
                                                            return DeclReferenceExprSyntax(
                                                                baseName: .identifier(variableName)
                                                            )
                                                            .toNSNumberOptionalMapping(identifierType: identifierType)
                                                        } else {
                                                            return DeclReferenceExprSyntax(
                                                                baseName: .identifier(variableName)
                                                            )
                                                            .cast(ExprSyntax.self)
                                                        }
                                                    }()
                                                )
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .with(\.leadingTrivia, .newlines(2))

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

                    if shouldSynthesizeNSCodable {
                        try nsCodingConformances(
                            structDecl: structDecl
                        )
                        .with(\.leadingTrivia, .newlines(2))
                    }
                }
            )
            .cast(DeclSyntax.self)
        )


        decls.append(
            try builderFactory.objcBuilderExtensionDecl(
                structDecl: structDecl
            )
            .with(\.leadingTrivia, .newlines(2))
            .with(\.trailingTrivia, .newline)
            .cast(DeclSyntax.self)
        )

        return decls
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
            for binding in variableTypeDecl.bindings {
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
    private func objcIsEqualFunc(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let structName = structDecl.name.trimmed.text

        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                structDecl.modifiers.trimmed

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
                if let other = object as? \(raw: structName)Class {
                    return wrapped == other.wrapped
                }
                """
            )

            StmtSyntax("return false")
        }
    }

    @MemberBlockItemListBuilder
    private func nsCopyingConformances(
        structDecl: StructDeclSyntax
    ) throws -> MemberBlockItemListSyntax {
        let structName = structDecl.name.trimmed.text

        DeclSyntax(
            """
            private init(wrapped: \(raw: structName)) {
                self.wrapped = wrapped
            }
            """
        )

        FunctionDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                structDecl.modifiers.trimmed
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
                return \(raw: structName)Class(wrapped: wrapped)
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

    private struct StructDeclDescriptor {
        let structDecl: StructDeclSyntax
        var inheritedTypes: [String]
    }

    private func descriptorMap(
        codeBlocks: CodeBlockItemListSyntax
    ) -> [String: StructDeclDescriptor] {
        var structDescriptorMap = [String: StructDeclDescriptor]()
        var extensionInheritedTypesMap = [String: [String]]()

        for codeBlockItem in codeBlocks {
            if let structDecl = codeBlockItem.item.as(StructDeclSyntax.self) {
                let structName = structDecl.name.trimmed.text
                var inheritedTypes = Set(structDescriptorMap[structName]?.inheritedTypes ?? [])
                inheritedTypes.formUnion(structDecl.inheritedTypes)
                structDescriptorMap[structName] = StructDeclDescriptor(structDecl: structDecl, inheritedTypes: Array(inheritedTypes))
            } else if let extensionDecl = codeBlockItem.item.as(ExtensionDeclSyntax.self), let extensionId = extensionDecl.extendedType.as(IdentifierTypeSyntax.self) {
                let extensionName = extensionId.trimmed.name.text
                var inheritedTypes = Set(extensionInheritedTypesMap[extensionName] ?? [])
                inheritedTypes.formUnion(extensionDecl.inheritedTypes)
                extensionInheritedTypesMap[extensionName] = Array(inheritedTypes)
            }
        }

        var descriptorMap = structDescriptorMap

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

import SharedUtilities
import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    @CodeBlockItemListBuilder
    private func combineFunc(
        identifier: TokenSyntax,
        type: some TypeSyntaxProtocol,
        needsAppendRawValue: Bool,
        needsUnwrap: Bool = false
    ) -> CodeBlockItemListSyntax {
        if let optionalType = type.as(OptionalTypeSyntax.self) {
            combineFunc(
                identifier: identifier,
                type: optionalType.wrappedType,
                needsAppendRawValue: needsAppendRawValue,
                needsUnwrap: true
            )
        } else if needsAppendRawValue {
            "hasher.combine(\(identifier).rawValue)"
        } else if type.isObjcPrimitive {
            if type.isIdentifierTypeEqual("CGSize") {
                "hasher.combine(\(identifier).width)"
                "hasher.combine(\(identifier).height)"
            } else if type.isIdentifierTypeEqual("CGRect") {
                "hasher.combine(\(identifier).origin.x)"
                "hasher.combine(\(identifier).origin.y)"
                "hasher.combine(\(identifier).size.width)"
                "hasher.combine(\(identifier).size.height)"
            } else if type.isIdentifierTypeEqual("CGPoint") {
                "hasher.combine(\(identifier).x)"
                "hasher.combine(\(identifier).y)"
            } else if type.isIdentifierTypeEqual("CGVector") {
                "hasher.combine(\(identifier).dx)"
                "hasher.combine(\(identifier).dy)"
            } else if type.isIdentifierTypeEqual("CGAffineTransform") {
                "hasher.combine(\(identifier).a)"
                "hasher.combine(\(identifier).b)"
                "hasher.combine(\(identifier).c)"
                "hasher.combine(\(identifier).d)"
                "hasher.combine(\(identifier).tx)"
                "hasher.combine(\(identifier).ty)"
            } else {
                "hasher.combine(\(identifier))"
            }
        } else {
            if type.isArray {
                if needsUnwrap {
                    "hasher.combine((\(identifier) as? NSArray)?.hash ?? 0)"
                } else {
                    "hasher.combine((\(identifier) as NSArray).hash)"
                }
            } else if type.isDict {
                if needsUnwrap {
                    "hasher.combine((\(identifier) as? NSDictionary)?.hash ?? 0)"
                } else {
                    "hasher.combine((\(identifier) as NSDictionary).hash)"
                }
            } else if let idType = type.as(IdentifierTypeSyntax.self), let objcType = ObjcSwiftUtils.swiftToObjcFoundationTypeMap[idType.name.trimmed.text] {
                if needsUnwrap {
                    "hasher.combine((\(identifier) as? \(raw: objcType))?.hash ?? 0)"
                } else {
                    "hasher.combine((\(identifier) as \(raw: objcType)).hash)"
                }
            } else {
                // Other NSObject
                if needsUnwrap {
                    "hasher.combine(\(identifier)?.hash)"
                } else {
                    "hasher.combine(\(identifier).hash)"
                }
            }
        }
    }

    @CodeBlockItemListBuilder
    private func combineFuncs<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        valueObjectConfig: ValueObjectConfig
    ) -> CodeBlockItemListSyntax {
        if let structDecl = container.as(StructDeclSyntax.self) {
            structDecl.forEachBinding { binding in
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let type = binding.typeAnnotation?.type {
                    let (newType, needsAppendRawValue) = type.asEnumTypeIfKnown(nsEnumTypes: valueObjectConfig.nsEnumTypes)
                    combineFunc(
                        identifier: identifierPattern.identifier,
                        type: newType,
                        needsAppendRawValue: needsAppendRawValue
                    )
                }
            }
        } else if let enumDecl = container.as(EnumDeclSyntax.self) {
            "hasher.combine(subtype)"

            enumDecl.forEachCaseElement { caseElement in
                let caseName = caseElement.name.trimmed.text.uppercasingFirst
                for (index, caseParam) in (caseElement.parameterClause?.parameters ?? []).enumerated() {
                    let (newType, needsAppendRawValue) = caseParam.type.asEnumTypeIfKnown(nsEnumTypes: valueObjectConfig.nsEnumTypes)
                    combineFunc(
                        identifier: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst),
                        type: newType.optionalized,
                        needsAppendRawValue: needsAppendRawValue
                    )
                }
            }
        }
    }

    @CodeBlockItemListBuilder
    private func hashInvocation<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        valueObjectConfig: ValueObjectConfig
    ) -> CodeBlockItemListSyntax {
        "var hasher = Hasher()"
        
        combineFuncs(
            container: container,
            valueObjectConfig: valueObjectConfig
        )

        "return hasher.finalize()"
    }

    @MemberBlockItemListBuilder
    private func hashFunc<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        valueObjectConfig: ValueObjectConfig,
        modifiers: DeclModifierListSyntax
    ) -> MemberBlockItemListSyntax {
        VariableDeclSyntax(
            modifiers: DeclModifierListSyntax {
                // Inherit visibility modifiers
                modifiers.trimmed

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
                        hashInvocation(
                            container: container,
                            valueObjectConfig: valueObjectConfig
                        )
                    )
                )
            )
        }
    }

    @MemberBlockItemListBuilder
    func objcHashFunc(
        structDecl: StructDeclSyntax
    ) -> MemberBlockItemListSyntax {
        hashFunc(
            container: structDecl,
            valueObjectConfig: structDecl.valueObjectConfig,
            modifiers: structDecl.modifiers
        )
    }

    @MemberBlockItemListBuilder
    func objcHashFunc(
        enumDecl: EnumDeclSyntax
    ) -> MemberBlockItemListSyntax {
        hashFunc(
            container: enumDecl,
            valueObjectConfig: enumDecl.valueObjectConfig,
            modifiers: enumDecl.modifiers
        )
    }
}

extension DeclSyntaxProtocol {
    var propertyNeedsHashFloat: Bool {
        if let enumDecl = self.as(EnumDeclSyntax.self) {
            return enumDecl.propertyNeedsHashFloat
        } else if let structDecl = self.as(StructDeclSyntax.self) {
            return structDecl.propertyNeedsHashFloat
        } else {
            return false
        }
    }

    var propertyNeedsHashDouble: Bool {
        if let enumDecl = self.as(EnumDeclSyntax.self) {
            return enumDecl.propertyNeedsHashDouble
        } else if let structDecl = self.as(StructDeclSyntax.self) {
            return structDecl.propertyNeedsHashDouble
        } else {
            return false
        }
    }
}

extension StructDeclSyntax {
    var propertyNeedsHashFloat: Bool {
        var contains = false
        forEachBinding { binding in
            if let type = binding.typeAnnotation?.type, type.needsHashFloat {
                contains = true
            }
        }
        return contains
    }

    var propertyNeedsHashDouble: Bool {
        var contains = false
        forEachBinding { binding in
            if let type = binding.typeAnnotation?.type, type.needsHashDouble {
                contains = true
            }
        }
        return contains
    }
}

extension EnumDeclSyntax {
    var propertyNeedsHashFloat: Bool {
        var contains = false
        forEachCaseElement { caseElement in
            let params = caseElement.parameterClause?.parameters ?? []
            for caseParam in params {
                if caseParam.type.isFloat {
                    contains = true
                }
            }
        }
        return contains
    }

    var propertyNeedsHashDouble: Bool {
        var contains = false
        forEachCaseElement { caseElement in
            let params = caseElement.parameterClause?.parameters ?? []
            for caseParam in params {
                if caseParam.type.isDouble {
                    contains = true
                }
            }
        }
        return contains
    }
}

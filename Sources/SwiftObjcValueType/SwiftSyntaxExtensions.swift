import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

extension TypeSyntaxProtocol {
    // When these types are wrapped as Optional, they can't be bridged to Objective-C, instead they need to be wrapped as NSNumber.
    var isNSNumberBridged: Bool {
        asNSNumberBridged() != nil
    }

    func asNSNumberBridged() -> IdentifierTypeSyntax? {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "Int8", "UInt8", "Int16", "UInt16", "Int32", "UInt32", "Int64", "UInt64", "Float", "Double", "Bool", "Int", "UInt":
                return identifierType
            default:
                return nil
            }
        }
        return nil
    }

    var asNSNumberIfOptionalNumeral: any TypeSyntaxProtocol {
        if let optional = self.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged {
            return OptionalTypeSyntax(wrappedType: IdentifierTypeSyntax(name: .identifier("NSNumber")))
        } else {
            return self
        }
    }

    var optionalized: OptionalTypeSyntax {
        if let optional = self.as(OptionalTypeSyntax.self) {
            return optional
        }
        return OptionalTypeSyntax(wrappedType: self)
    }

    var nsCodableDecodingFunction: TokenSyntax {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "Int8", "UInt8", "Int16", "UInt16":
                return .identifier("decodeCInt")
            case "Int32", "UInt32":
                return .identifier("decodeInt32")
            case "Int64", "UInt64":
                return .identifier("decodeInt64")
            case "Float":
                return .identifier("decodeFloat")
            case "Double":
                return .identifier("decodeDouble")
            case "Bool":
                return .identifier("decodeBool")
            case "Int", "UInt":
                return .identifier("decodeInteger")
            default:
                return .identifier("decodeObject")
            }
        } else {
            return .identifier("decodeObject")
        }
    }

    var unwrappedIfOptional: any TypeSyntaxProtocol {
        if let optionalType = self.as(OptionalTypeSyntax.self) {
            return optionalType.wrappedType
        } else {
            return self
        }
    }
}

extension DeclReferenceExprSyntax {
    /// Append a `.map(\.<numeral>Value)` to an identifier if it is NSNumber optional.
    /// - Parameter identifierType: The identifier type.
    /// - Returns: A function expression call of `.map(\.<numeral>Value)`.
    func mappingNSNumberToNumeralValue(
        type: some TypeSyntaxProtocol
    ) -> any ExprSyntaxProtocol {
        guard let optional = type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged, let identifierType = optional.wrappedType.as(IdentifierTypeSyntax.self) else {
            return self
        }

        switch identifierType.name.trimmed.text {
        case "Int8", "UInt8", "Int16", "UInt16", "Int32", "UInt32", "Int64", "UInt64", "Float", "Double", "Bool", "Int", "UInt":
            return FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: self,
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(baseName: "map")
                ),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprSyntax(
                    expression: KeyPathExprSyntax(
                        components: KeyPathComponentListSyntax {
                            KeyPathComponentSyntax(
                                period: .periodToken(),
                                component: .property(
                                        KeyPathPropertyComponentSyntax(
                                        declName: DeclReferenceExprSyntax(
                                            baseName: .identifier(identifierType.name.trimmed.text.camelCased + "Value")
                                        )
                                    )
                                )
                            )
                        }
                    )
                )
            }
        default:
            return self
        }
    }
}

extension ExprSyntaxProtocol {
    /// Append a `.map(NSNumber.init)` to an identifier if it is a numeral
    /// - Parameter identifierType: The identifier type.
    /// - Returns: A function expression call of `.map(NSNumber.init)`.
    func mappingNumeralValueToNSNumber(
        type: some TypeSyntaxProtocol
    ) -> any ExprSyntaxProtocol {
        guard let optional = type.as(OptionalTypeSyntax.self), optional.wrappedType.isNSNumberBridged, let identifierType = optional.wrappedType.as(IdentifierTypeSyntax.self) else {
            return self
        }

        switch identifierType.name.trimmed.text {
        case "Int8", "UInt8", "Int16", "UInt16", "Int32", "UInt32", "Int64", "UInt64", "Float", "Double", "Bool", "Int", "UInt":
            return FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: self,
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(baseName: "map")
                ),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprSyntax(
                    expression: MemberAccessExprSyntax(
                        base: DeclReferenceExprSyntax(baseName: .identifier("NSNumber")),
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(baseName: .keyword(.`init`))
                    )
                )
            }
        default:
            return self
        }
    }
}

extension EnumDeclSyntax {
    var inheritedTypes: [String] {
        inheritanceClause?.inheritedTypes.compactMap {
            if let identifierType = $0.type.as(IdentifierTypeSyntax.self) {
                return identifierType.name.trimmed.text
            } else {
                return nil
            }
        } ?? []
    }

    func enumerateCaseElements(
        caseElementBlock: (EnumCaseElementSyntax) throws -> Void
    ) rethrows {
        for member in memberBlock.members {
            if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                for caseElement in caseDecl.elements {
                    try caseElementBlock(caseElement)
                }
            }
        }
    }

    private func enumerateCaseElementsGeneric<T: SyntaxCollection>(
        caseElementBlock: (EnumCaseElementSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()
        try enumerateCaseElements { caseElement in
            collection.append(contentsOf: try caseElementBlock(caseElement))
        }
        return collection
    }

    func enumerateCaseElements(
        @FunctionParameterListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try enumerateCaseElementsGeneric(caseElementBlock: caseElementBlock)
    }

    func enumerateCaseElements(
        @SwitchCaseListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> SwitchCaseListSyntax
    ) rethrows -> SwitchCaseListSyntax {
        try enumerateCaseElementsGeneric(caseElementBlock: caseElementBlock)
    }
}

extension StructDeclSyntax {
    var inheritedTypes: [String] {
        inheritanceClause?.inheritedTypes.compactMap {
            if let identifierType = $0.type.as(IdentifierTypeSyntax.self) {
                return identifierType.name.trimmed.text
            } else {
                return nil
            }
        } ?? []
    }

    var visibilityModifiers: [DeclModifierSyntax] {
        modifiers.filter {
            $0.name.keyword == .public ||
            $0.name.keyword == .private ||
            $0.name.keyword == .internal ||
            $0.name.keyword == .open
        }
    }

    /// The visibility modifier string appended by a space. If missing, it is going to be an empty string.
    var visibilityModifierString: String {
        visibilityModifiers.first.map { $0.trimmed.name.text + " " } ?? ""
    }

    func enumerateVariableDecls(
        @MemberBlockItemListBuilder memberBlockItem: (VariableDeclSyntax) throws -> MemberBlockItemListSyntax
    ) rethrows -> MemberBlockItemListSyntax {
        try enumerateVariableDeclsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateVariableDecls(
        @FunctionParameterListBuilder memberBlockItem: (VariableDeclSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try enumerateVariableDeclsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateVariableDecls(
        @LabeledExprListBuilder memberBlockItem: (VariableDeclSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try enumerateVariableDeclsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateVariableDecls(
        @CodeBlockItemListBuilder memberBlockItem: (VariableDeclSyntax) throws -> CodeBlockItemListSyntax
    ) rethrows -> CodeBlockItemListSyntax {
        try enumerateVariableDeclsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBindings(
        @FunctionParameterListBuilder memberBlockItem: (PatternBindingSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try enumerateBindingsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBindings(
        @CodeBlockItemListBuilder memberBlockItem: (PatternBindingSyntax) throws -> CodeBlockItemListSyntax
    ) rethrows -> CodeBlockItemListSyntax {
        try enumerateBindingsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBindings(
        @MemberBlockItemListBuilder memberBlockItem: (PatternBindingSyntax) throws -> MemberBlockItemListSyntax
    ) rethrows -> MemberBlockItemListSyntax {
        try enumerateBindingsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBindings(
        @LabeledExprListBuilder memberBlockItem: (PatternBindingSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try enumerateBindingsGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBindings(
        memberBlockItem: (PatternBindingSyntax) throws -> Void
    ) rethrows {
        try enumerateVariableDecls { variableDeclSyntax in
            for binding in variableDeclSyntax.bindings where !binding.isDerived {
                try memberBlockItem(binding)
            }
        }
    }

    func enumerateVariableDecls(
        memberBlockItem: (VariableDeclSyntax) throws -> Void
    ) rethrows {
        for member in memberBlock.members {
            if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                // If all bindings are derived values, skip this variable
                if !variableTypeDecl.bindings.allSatisfy(\.isDerived) {
                    try memberBlockItem(variableTypeDecl)
                }
            }
        }
    }

    private func enumerateVariableDeclsGeneric<T: SyntaxCollection>(
        memberBlockItem: (VariableDeclSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()
        try enumerateVariableDecls { variableDeclSyntax in
            collection.append(contentsOf: try memberBlockItem(variableDeclSyntax))
        }
        return collection
    }

    private func enumerateBindingsGeneric<T: SyntaxCollection>(
        memberBlockItem: (PatternBindingSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()

        try enumerateBindings { binding in
            collection.append(contentsOf: try memberBlockItem(binding))
        }

        return collection
    }
}

extension PatternBindingSyntax {
    /// True if the variable binding has a getter.
    var isDerived: Bool {
        switch accessorBlock?.accessors {
        case .accessors(let accessorDeclListSyntax):
            return accessorDeclListSyntax.allSatisfy { accessorDecl in
                accessorDecl.accessorSpecifier.keyword == .didSet || accessorDecl.accessorSpecifier.keyword == .willSet
            }
        case .getter(_):
            return true
        case nil:
            return false
        }
    }
}

extension ExtensionDeclSyntax {
    var inheritedTypes: [String] {
        inheritanceClause?.inheritedTypes.compactMap {
            if let identifierType = $0.type.as(IdentifierTypeSyntax.self) {
                return identifierType.name.trimmed.text
            } else {
                return nil
            }
        } ?? []
    }
}

extension TokenSyntax {
    var keyword: Keyword? {
        switch tokenKind {
        case let .keyword(value):
            return value
        default:
            return nil
        }
    }
}

extension AttributeListSyntax {
    /// Whether attribute has @objc annotation.
    var hasObjc: Bool {
        contains { attr in
            switch attr {
            case .attribute(let attrSyntax):
                return attrSyntax.attributeName.as(IdentifierTypeSyntax.self)?.name.text == "objc"
            case .ifConfigDecl(_):
                return false
            }
        }
    }
}

extension EnumCaseParameterSyntax {
    func properName(index: Int) -> TokenSyntax {
        firstName ?? secondName ?? .identifier("param\(index)")
    }
}

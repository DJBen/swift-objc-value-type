import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

extension TypeSyntax {
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
}

extension DeclReferenceExprSyntax {
    func toNSNumberOptionalMapping(
        identifierType: IdentifierTypeSyntax
    ) -> any ExprSyntaxProtocol {
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

    func enumerateBindings(
        @FunctionParameterListBuilder memberBlockItem: (PatternBindingSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try enumerateVariableDecls { variableTypeDecl in
            for binding in variableTypeDecl.bindings where !binding.isDerived {
                try memberBlockItem(binding)
            }
        }
    }

    func enumerateBindings(
        @LabeledExprListBuilder memberBlockItem: (PatternBindingSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try enumerateVariableDecls { variableTypeDecl in
            for binding in variableTypeDecl.bindings where !binding.isDerived {
                try memberBlockItem(binding)
            }
        }
    }

    private func enumerateVariableDeclsGeneric<T: SyntaxCollection>(
        memberBlockItem: (VariableDeclSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()

        for member in memberBlock.members {
            if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                // If all bindings are derived values, skip this variable
                if !variableTypeDecl.bindings.allSatisfy(\.isDerived) {
                    collection.append(contentsOf: try memberBlockItem(variableTypeDecl))
                }
            }
        }

        return collection
    }
}

extension VariableDeclSyntax {

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

extension String {
    var lowercasingFirst: String { prefix(1).lowercased() + dropFirst() }
    var uppercasingFirst: String { prefix(1).uppercased() + dropFirst() }

    var camelCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let first = parts.first!.lowercasingFirst
        let rest = parts.dropFirst().map { $0.uppercasingFirst }

        return ([first] + rest).joined()
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

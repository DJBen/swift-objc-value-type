import Foundation
import SharedUtilities
import SwiftSyntax
import SwiftSyntaxBuilder

extension TypeSyntaxProtocol {
    // When these types are wrapped as Optional, they can't be bridged to Objective-C, instead they need to be wrapped as NSNumber.
    var isNSNumberBridged: Bool {
        asNSNumberBridged() != nil
    }

    func aliasingToObjcIfSiblingSwiftType(_ referencedSwiftTypes: Set<String>) -> any TypeSyntaxProtocol {
        return mapTypeName { prevName in
            if referencedSwiftTypes.contains(prevName) {
                return "\(prevName)Objc"
            } else {
                return prevName
            }
        }
    }

    func aliasingIfSiblingSwiftType(_ referencedSwiftTypes: Set<String>, swiftToObjc: Bool) -> any TypeSyntaxProtocol {
        return mapTypeName { prevName in
            if swiftToObjc && referencedSwiftTypes.contains(prevName) {
                return "\(prevName)Objc"
            } else {
                return prevName
            }
        }
    }

    func isSiblingSwiftType(_ referencedSwiftTypes: Set<String>) -> Bool {
        conainsTypeName { prevName in
            return referencedSwiftTypes.contains(prevName)
        }
    }

    func asNSNumberBridged() -> IdentifierTypeSyntax? {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "Int8", "UInt8", "Int16", "UInt16", "Int32", "UInt32", "Int64", "UInt64", "Float", "CGFloat", "Double", "Bool", "Int", "UInt":
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
            case "Double", "CGFloat":
                // CGFloat is supposed to be Double, but when being decoded
                // as decodeDouble it throws http://www.openradar.me/39871638
                // Thus it is mandatory to cast to Double before encoding and
                // covert it back to CGFloat after decoding
                return .identifier("decodeDouble")
            case "Bool":
                return .identifier("decodeBool")
            case "Int", "UInt":
                return .identifier("decodeInteger")
            case "CGAffineTransform":
                return .identifier("decodeCGAffineTransform")
            case "CGPoint":
                return .identifier("decodeCGPoint")
            case "CGRect":
                return .identifier("decodeCGRect")
            case "CGVector":
                return .identifier("decodeCGVector")
            case "CGSize":
                return .identifier("decodeCGSize")
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

    /// Whether this property can be expressed as a primitive in Objective-C.
    var isObjcPrimitive: Bool {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "Int", "UInt8", "Int8", "Int16", "UInt16", "Int32", "UInt32", "Int64", "UInt64", "Float", "Double", "Bool":
                return true
            case "CGFloat", "CGPoint", "CGRect", "CGSize", "CGVector", "CGAffineTransform":
                // Core graphics
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }

    func isIdentifierTypeEqual(_ name: String) -> Bool {
        if let identifierType = self.as(IdentifierTypeSyntax.self), identifierType.name.trimmed.text == name {
            return true
        } else {
            return false
        }
    }

    var isFloat: Bool {
        isIdentifierTypeEqual("Float")
    }

    var isDouble: Bool {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "CGFloat", "TimeInterval", "Double":
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }

    var isBool: Bool {
        isIdentifierTypeEqual("Bool")
    }

    var isSignedInt: Bool {
        if let identifierType = self.as(IdentifierTypeSyntax.self) {
            switch identifierType.name.trimmed.text {
            case "Int", "Int8", "Int16", "Int32", "Int64":
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }

    var isArray: Bool {
        if self.is(ArrayTypeSyntax.self) {
            // [SomeType]
            return true
        } else if let idType = self.as(IdentifierTypeSyntax.self), idType.name.trimmed.text == "Array" {
            // Array<SomeType>
            return true
        }

        return false
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
    func convertingToObjcType(
        type: some TypeSyntaxProtocol,
        referencedSwiftTypes: Set<String>
    ) -> any ExprSyntaxProtocol {
        var argIndex = 0
        return convertingType(
            type: type,
            swiftToObjc: true,
            referencedSwiftTypes: referencedSwiftTypes,
            nextArgIndex: {
                let currentArgIndex = argIndex
                argIndex += 1
                return currentArgIndex
            }
        )
    }

    func convertingToSwiftType(
        type: some TypeSyntaxProtocol,
        referencedSwiftTypes: Set<String>
    ) -> any ExprSyntaxProtocol {
        var argIndex = 0
        return convertingType(
            type: type,
            swiftToObjc: false,
            referencedSwiftTypes: referencedSwiftTypes,
            nextArgIndex: {
                let currentArgIndex = argIndex
                argIndex += 1
                return currentArgIndex
            }
        )
    }

    private func convertingType(
        type: some TypeSyntaxProtocol,
        swiftToObjc: Bool,
        referencedSwiftTypes: Set<String>,
        temporaryDeclReferenceExpr: DeclReferenceExprSyntax? = nil,
        needsUnwrapRoot: Bool = false,
        useMapOptional: Bool = false,
        nextArgIndex: () -> Int
    ) -> any ExprSyntaxProtocol {
        guard type.isSiblingSwiftType(referencedSwiftTypes) else {
            return self
        }

        if let identifierType = type.as(IdentifierTypeSyntax.self) {
            // TODO: Add Dictionary<> support
            if useMapOptional {
                // .map(<Type>Objc.init)
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
                            base: DeclReferenceExprSyntax(
                                baseName: identifierType.aliasingIfSiblingSwiftType(referencedSwiftTypes, swiftToObjc: swiftToObjc).as(IdentifierTypeSyntax.self)!.name
                            ),
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(baseName: .keyword(.`init`))
                        )
                    )
                }
            } else {
                if identifierType.trimmed.name.text == "Set" || identifierType.trimmed.name.text == "Array" {
                    let genericType = identifierType.genericArgumentClause?.arguments.first?.argument ?? TypeSyntax(IdentifierTypeSyntax(name: .identifier("NSObject")))
                    // Append `.map({ e in ... })` and add Set(...) cast
                    return FunctionCallExprSyntax(
                        calledExpression: DeclReferenceExprSyntax(baseName: identifierType.name),
                        leftParen: .leftParenToken(),
                        arguments: LabeledExprListSyntax {
                            LabeledExprSyntax(
                                expression: FunctionCallExprSyntax(
                                    calledExpression: MemberAccessExprSyntax(
                                        base: ExprSyntax(temporaryDeclReferenceExpr) ?? (needsUnwrapRoot ? ExprSyntax(OptionalChainingExprSyntax(expression: self)) : ExprSyntax(self)),
                                        period: .periodToken(),
                                        declName: DeclReferenceExprSyntax(baseName: .identifier("map"))
                                    ),
                                    leftParen: .leftParenToken(),
                                    arguments: LabeledExprListSyntax {
                                        let argIndex = nextArgIndex()
                                        LabeledExprSyntax(
                                            expression: ClosureExprSyntax(
                                                leftBrace: .leftBraceToken(),
                                                signature: ClosureSignatureSyntax(
                                                    parameterClause: .simpleInput(
                                                        ClosureShorthandParameterListSyntax {
                                                            ClosureShorthandParameterSyntax(
                                                                name: .identifier("a\(argIndex)")
                                                            )
                                                        }
                                                    ),
                                                    inKeyword: .keyword(.in)
                                                ),
                                                statements: CodeBlockItemListSyntax {
                                                    convertingType(
                                                        type: genericType,
                                                        swiftToObjc: swiftToObjc,
                                                        referencedSwiftTypes: referencedSwiftTypes,
                                                        temporaryDeclReferenceExpr: DeclReferenceExprSyntax(baseName: .identifier("a\(argIndex)")),
                                                        needsUnwrapRoot: needsUnwrapRoot,
                                                        nextArgIndex: nextArgIndex
                                                    )
                                                }
                                            )
                                        )
                                    },
                                    rightParen: .rightParenToken()
                                )
                            )
                        },
                        rightParen: .rightParenToken()
                    )
                }
                // Wrapping the expr with `<Type>Objc(<expr>)`.
                return FunctionCallExprSyntax(
                    calledExpression: DeclReferenceExprSyntax(
                        baseName: identifierType.aliasingIfSiblingSwiftType(referencedSwiftTypes, swiftToObjc: swiftToObjc).as(IdentifierTypeSyntax.self)!.name
                    ),
                    leftParen: .leftParenToken(),
                    arguments: LabeledExprListSyntax {
                        LabeledExprSyntax(
                            expression: ExprSyntax(temporaryDeclReferenceExpr) ?? (needsUnwrapRoot ? ExprSyntax(OptionalChainingExprSyntax(expression: self)) : ExprSyntax(self))
                        )
                    },
                    rightParen: .rightParenToken()
                )
            }
        } else if let optionalTypeSyntax = type.as(OptionalTypeSyntax.self) {
            if optionalTypeSyntax.wrappedType.is(IdentifierTypeSyntax.self) {
                return convertingType(
                    type: optionalTypeSyntax.wrappedType,
                    swiftToObjc: swiftToObjc,
                    referencedSwiftTypes: referencedSwiftTypes,
                    useMapOptional: true,
                    nextArgIndex: nextArgIndex
                )
            } else {
                // Append `?`
                return convertingType(
                    type: optionalTypeSyntax.wrappedType,
                    swiftToObjc: swiftToObjc,
                    referencedSwiftTypes: referencedSwiftTypes,
                    needsUnwrapRoot: true,
                    nextArgIndex: nextArgIndex
                )
            }
        } else if let arrayTypeSyntax = type.as(ArrayTypeSyntax.self) {
            // Append `.map({ e in ... })`
            return FunctionCallExprSyntax(
                calledExpression: MemberAccessExprSyntax(
                    base: ExprSyntax(temporaryDeclReferenceExpr) ?? (needsUnwrapRoot ? ExprSyntax(OptionalChainingExprSyntax(expression: self)) : ExprSyntax(self)),
                    period: .periodToken(),
                    declName: DeclReferenceExprSyntax(baseName: .identifier("map"))
                ),
                leftParen: .leftParenToken(),
                arguments: LabeledExprListSyntax {
                    let argIndex = nextArgIndex()
                    LabeledExprSyntax(
                        expression: ClosureExprSyntax(
                            leftBrace: .leftBraceToken(),
                            signature: ClosureSignatureSyntax(
                                parameterClause: .simpleInput(
                                    ClosureShorthandParameterListSyntax {
                                        ClosureShorthandParameterSyntax(
                                            name: .identifier("a\(argIndex)")
                                        )
                                    }
                                ),
                                inKeyword: .keyword(.in)
                            ),
                            statements: CodeBlockItemListSyntax {
                                convertingType(
                                    type: arrayTypeSyntax.element,
                                    swiftToObjc: swiftToObjc,
                                    referencedSwiftTypes: referencedSwiftTypes,
                                    temporaryDeclReferenceExpr: DeclReferenceExprSyntax(baseName: .identifier("a\(argIndex)")),
                                    needsUnwrapRoot: needsUnwrapRoot,
                                    nextArgIndex: nextArgIndex
                                )
                            }
                        )
                    )
                },
                rightParen: .rightParenToken()
            )
        } else if let _ = type.as(TupleTypeSyntax.self) {
            fatalError("Tuple is not supported")
        } else if let dictTypeSyntax = type.as(DictionaryTypeSyntax.self) {
            if dictTypeSyntax.key.isSiblingSwiftType(referencedSwiftTypes) {
                fatalError("Value type as a dictionary key is currently not supported due to possible performance impact; it is advised to write a @objc class type manually or use Foundation types as key")
            } else {
                let argIndex = nextArgIndex()

                // Append `.mapValues({ e in ... })`
                return FunctionCallExprSyntax(
                    calledExpression: MemberAccessExprSyntax(
                        base: self,
                        period: .periodToken(),
                        declName: DeclReferenceExprSyntax(baseName: .identifier("mapValues"))
                    ),
                    leftParen: .leftParenToken(),
                    arguments: LabeledExprListSyntax {
                        LabeledExprSyntax(
                            expression: ClosureExprSyntax(
                                leftBrace: .leftBraceToken(),
                                signature: ClosureSignatureSyntax(
                                    parameterClause: .simpleInput(
                                        ClosureShorthandParameterListSyntax {
                                            ClosureShorthandParameterSyntax(
                                                name: .identifier("a\(argIndex)")
                                            )
                                        }
                                    ),
                                    inKeyword: .keyword(.in)
                                ),
                                statements: CodeBlockItemListSyntax {
                                    convertingType(
                                        type: dictTypeSyntax.value,
                                        swiftToObjc: swiftToObjc,
                                        referencedSwiftTypes: referencedSwiftTypes,
                                        temporaryDeclReferenceExpr: DeclReferenceExprSyntax(baseName: .identifier("a\(argIndex)")),
                                        needsUnwrapRoot: needsUnwrapRoot,
                                        nextArgIndex: nextArgIndex
                                    )
                                }
                            )
                        )
                    },
                    rightParen: .rightParenToken()
                )
            }
        } else if let _ = type.as(FunctionTypeSyntax.self) {
            // Unsupported
            fatalError("Value type as an argument in function type is not supported; function args should be value type anyway")
        } else {
            return self
        }
    }

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

    /// Append a `.map(\<numeral>Value)` to an identifier if it is an optional `NSNumber`. An
    /// example is `.map(\.doubleValue)`.
    /// - Parameter identifierType: The identifier type.
    /// - Returns: A function expression call of `.map(\<numeral>Value)`.
    func unmappingNumeralValueFromNSNumber(
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
                        backslash: .backslashToken(),
                        components: KeyPathComponentListSyntax {
                            KeyPathComponentSyntax(
                                period: .periodToken(),
                                component: .property(
                                    KeyPathPropertyComponentSyntax(
                                        declName: DeclReferenceExprSyntax(baseName: .identifier("\(identifierType.name.trimmed.text.lowercasingFirst)Value"))
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

    func forceUnwrapIfNotOptional(
        type: some TypeSyntaxProtocol
    ) -> any ExprSyntaxProtocol {
        if type.is(OptionalTypeSyntax.self) {
            return self
        }
        return ForceUnwrapExprSyntax(expression: self)
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

    func forEachCaseElement(
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

    func enumerateCaseElement(
        caseElementBlock: (Int, EnumCaseElementSyntax) throws -> Void
    ) rethrows {
        var index = 0
        for member in memberBlock.members {
            if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                for caseElement in caseDecl.elements {
                    try caseElementBlock(index, caseElement)
                    index += 1
                }
            }
        }
    }

    private func forEachCaseElementGeneric<T: SyntaxCollection>(
        caseElementBlock: (EnumCaseElementSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()
        try forEachCaseElement { caseElement in
            collection.append(contentsOf: try caseElementBlock(caseElement))
        }
        return collection
    }

    private func enumerateCaseElementGeneric<T: SyntaxCollection>(
        caseElementBlock: (Int, EnumCaseElementSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()
        try enumerateCaseElement { index, caseElement in
            collection.append(contentsOf: try caseElementBlock(index, caseElement))
        }
        return collection
    }

    func forEachCaseElement(
        @CodeBlockItemListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> CodeBlockItemListSyntax
    ) rethrows -> CodeBlockItemListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func forEachCaseElement(
        @MemberBlockItemListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> MemberBlockItemListSyntax
    ) rethrows -> MemberBlockItemListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func forEachCaseElement(
        @FunctionParameterListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func enumerateCaseElement(
        @FunctionParameterListBuilder caseElementBlock: (Int, EnumCaseElementSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try enumerateCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func forEachCaseElement(
        @SwitchCaseListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> SwitchCaseListSyntax
    ) rethrows -> SwitchCaseListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func forEachCaseElement(
        @LabeledExprListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func enumerateCaseElement(
        @LabeledExprListBuilder caseElementBlock: (Int, EnumCaseElementSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try enumerateCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func enumerateCaseElement(
        @ExprListBuilder caseElementBlock: (Int, EnumCaseElementSyntax) throws -> ExprListSyntax
    ) rethrows -> ExprListSyntax {
        try enumerateCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func enumerateCaseElement(
        @ObjCSelectorPieceListBuilder caseElementBlock: (Int, EnumCaseElementSyntax) throws -> ObjCSelectorPieceListSyntax
    ) rethrows -> ObjCSelectorPieceListSyntax {
        try enumerateCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    func forEachCaseElement(
        @ArrayElementListBuilder caseElementBlock: (EnumCaseElementSyntax) throws -> ArrayElementListSyntax
    ) rethrows -> ArrayElementListSyntax {
        try forEachCaseElementGeneric(caseElementBlock: caseElementBlock)
    }

    var firstCaseElement: EnumCaseElementSyntax? {
        for member in memberBlock.members {
            if let caseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                for caseElement in caseDecl.elements {
                    return caseElement
                }
            }
        }
        return nil
    }

    var caseCount: Int {
        var count = 0
        forEachCaseElement { _ in
            count += 1
        }
        return count
    }
}

extension DeclModifierListSyntax {
    var isPublic: Bool {
        return contains {
            $0.name.keyword == .public
        }
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

    func forEachVariableDecl(
        @MemberBlockItemListBuilder memberBlockItem: (VariableDeclSyntax) throws -> MemberBlockItemListSyntax
    ) rethrows -> MemberBlockItemListSyntax {
        try forEachVariableDeclGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachVariableDecl(
        @FunctionParameterListBuilder memberBlockItem: (VariableDeclSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try forEachVariableDeclGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachVariableDecl(
        @LabeledExprListBuilder memberBlockItem: (VariableDeclSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try forEachVariableDeclGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachVariableDecl(
        @CodeBlockItemListBuilder memberBlockItem: (VariableDeclSyntax) throws -> CodeBlockItemListSyntax
    ) rethrows -> CodeBlockItemListSyntax {
        try forEachVariableDeclGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @FunctionParameterListBuilder memberBlockItem: (PatternBindingSyntax) throws -> FunctionParameterListSyntax
    ) rethrows -> FunctionParameterListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @ArrayElementListBuilder memberBlockItem: (PatternBindingSyntax) throws -> ArrayElementListSyntax
    ) rethrows -> ArrayElementListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @CodeBlockItemListBuilder memberBlockItem: (PatternBindingSyntax) throws -> CodeBlockItemListSyntax
    ) rethrows -> CodeBlockItemListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @MemberBlockItemListBuilder memberBlockItem: (PatternBindingSyntax) throws -> MemberBlockItemListSyntax
    ) rethrows -> MemberBlockItemListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @LabeledExprListBuilder memberBlockItem: (PatternBindingSyntax) throws -> LabeledExprListSyntax
    ) rethrows -> LabeledExprListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        @ExprListBuilder memberBlockItem: (PatternBindingSyntax) throws -> ExprListSyntax
    ) rethrows -> ExprListSyntax {
        try forEachBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func enumerateBinding(
        @ExprListBuilder memberBlockItem: (Int, PatternBindingSyntax) throws -> ExprListSyntax
    ) rethrows -> ExprListSyntax {
        try enumerateBindingGeneric(memberBlockItem: memberBlockItem)
    }

    func forEachBinding(
        memberBlockItem: (PatternBindingSyntax) throws -> Void
    ) rethrows {
        try enumerateBinding { try memberBlockItem($1) }
    }

    func enumerateBinding(
        memberBlockItem: (Int, PatternBindingSyntax) throws -> Void
    ) rethrows {
        try enumerateVariableDecl { index, variableDeclSyntax in
            for binding in variableDeclSyntax.bindings where !binding.isDerived {
                try memberBlockItem(index, binding)
            }
        }
    }

    func forEachVariableDecl(
        memberBlockItem: (VariableDeclSyntax) throws -> Void
    ) rethrows {
        try enumerateVariableDecl { try memberBlockItem($1) }
    }

    func enumerateVariableDecl(
        memberBlockItem: (Int, VariableDeclSyntax) throws -> Void
    ) rethrows {
        for (index, member) in memberBlock.members.enumerated() {
            if let variableTypeDecl = member.decl.as(VariableDeclSyntax.self) {
                // If all bindings are derived values, skip this variable
                if !variableTypeDecl.bindings.allSatisfy(\.isDerived) {
                    try memberBlockItem(index, variableTypeDecl)
                }
            }
        }
    }

    private func forEachVariableDeclGeneric<T: SyntaxCollection>(
        memberBlockItem: (VariableDeclSyntax) throws -> T
    ) rethrows -> T {
        try enumerateVariableDeclGeneric { try memberBlockItem($1) }
    }

    private func enumerateVariableDeclGeneric<T: SyntaxCollection>(
        memberBlockItem: (Int, VariableDeclSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()
        try enumerateVariableDecl { index, variableDeclSyntax in
            collection.append(contentsOf: try memberBlockItem(index, variableDeclSyntax))
        }
        return collection
    }

    private func forEachBindingGeneric<T: SyntaxCollection>(
        memberBlockItem: (PatternBindingSyntax) throws -> T
    ) rethrows -> T {
        try enumerateBindingGeneric { try memberBlockItem($1) }
    }

    private func enumerateBindingGeneric<T: SyntaxCollection>(
        memberBlockItem: (Int, PatternBindingSyntax) throws -> T
    ) rethrows -> T {
        var collection = T()

        try enumerateBinding { index, binding in
            collection.append(contentsOf: try memberBlockItem(index, binding))
        }

        return collection
    }

    var bindingsCount: Int {
        var count = 0
        forEachBinding { _ in
            count += 1
        }
        return count
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

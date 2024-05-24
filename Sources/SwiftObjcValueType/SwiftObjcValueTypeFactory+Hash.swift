import SharedUtilities
import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    /// The hash of each instance `x` is as follows:
    /// - If NSObject: x.hash()
    /// - If Bool: x ? 1 : 0
    /// - If signed integer: UInt(abs(x))
    /// - If unsigned integer: UInt(x)
    /// - If optional: UInt(recursively expand x ?? 0)
    @ArrayElementListBuilder
    private func arrayElement(
        identifier: TokenSyntax,
        type: some TypeSyntaxProtocol,
        externalHashSettings: ExternalHashSettings?,
        needsUnwrap: Bool = false
    ) -> ArrayElementListSyntax {
        let numeralUnwrapSuffix = needsUnwrap ? " ?? 0" : ""
        if type.isBool {
            ArrayElementSyntax(expression: ExprSyntax("(\(identifier) ? 1 : 0)\(raw: numeralUnwrapSuffix)"))
        } else if let optionalType = type.as(OptionalTypeSyntax.self) {
            arrayElement(
                identifier: identifier,
                type: optionalType.wrappedType,
                externalHashSettings: externalHashSettings,
                needsUnwrap: true
            )
        } else if type.isArray {
            if needsUnwrap {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: (\(identifier) as? NSArray)?.hash ?? 0)"))
            } else {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: (\(identifier) as NSArray).hash)"))
            }
        } else if type.isSignedInt {
            ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: abs(\(identifier)\(raw: numeralUnwrapSuffix)))"))
        } else if type.isFloat {
            let floatHashFunc = externalHashSettings?.hashFloatFunc ?? "hashFloat"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: floatHashFunc)(\(identifier))"))
        } else if type.isDouble {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier))"))
        } else if type.isIdentifierTypeEqual("CGSize") {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).width)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).height)"))
        } else if type.isIdentifierTypeEqual("CGRect") {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).origin.x)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).origin.y)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).size.width)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).size.height)"))
        } else if type.isIdentifierTypeEqual("CGPoint") {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).x)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).y)"))
        } else if type.isIdentifierTypeEqual("CGVector") {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).dx)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).dy)"))
        } else if type.isIdentifierTypeEqual("CGAffineTransform") {
            let doubleHashFunc = externalHashSettings?.hashDoubleFunc ?? "hashDouble"
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).a)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).b)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).c)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).d)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).tx)"))
            ArrayElementSyntax(expression: ExprSyntax("\(raw: doubleHashFunc)(\(identifier).ty)"))
        } else if let idType = type.as(IdentifierTypeSyntax.self), let objcType = swiftToObjcFoundationTypeMap[idType.name.trimmed.text] {
            if needsUnwrap {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: (\(identifier) as? \(raw: objcType))?.hash ?? 0)"))
            } else {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: (\(identifier) as \(raw: objcType)).hash)"))
            }
        } else if type.isObjcPrimitive {
            ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: \(identifier)\(raw: numeralUnwrapSuffix))"))
        } else {
            if needsUnwrap {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: \(identifier)?.hash\(raw: numeralUnwrapSuffix))"))
            } else {
                ArrayElementSyntax(expression: ExprSyntax("UInt(bitPattern: \(identifier).hash)"))
            }
        }
    }

    @CodeBlockItemListBuilder
    private func hashInvocation<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        externalHashSettings: ExternalHashSettings?
    ) -> CodeBlockItemListSyntax {
        let count: Int = {
            if let structDecl = container.as(StructDeclSyntax.self) {
                return structDecl.bindingsCount
            } else if let enumDecl = container.as(EnumDeclSyntax.self) {
                return enumDecl.caseCount
            } else {
                return 0
            }
        }()

        VariableDeclSyntax(
            bindingSpecifier: .keyword(.let),
            bindings: PatternBindingListSyntax {
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(identifier: .identifier("hashes")),
                    typeAnnotation: TypeAnnotationSyntax(
                        type: ArrayTypeSyntax(element: IdentifierTypeSyntax(name: .identifier("UInt")))
                    ),
                    initializer: InitializerClauseSyntax(
                        value: ArrayExprSyntax {
                            if let structDecl = container.as(StructDeclSyntax.self) {
                                structDecl.forEachBinding { binding in
                                    if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self), let type = binding.typeAnnotation?.type {
                                        arrayElement(
                                            identifier: identifierPattern.identifier,
                                            type: type,
                                            externalHashSettings: externalHashSettings
                                        )

                                    }
                                }
                            } else if let enumDecl = container.as(EnumDeclSyntax.self) {
                                ArrayElementSyntax(
                                    expression: ExprSyntax("UInt(bitPattern: subtype.rawValue)")
                                )
                                enumDecl.forEachCaseElement { caseElement in
                                    let caseName = caseElement.name.trimmed.text.uppercasingFirst
                                    for (index, caseParam) in (caseElement.parameterClause?.parameters ?? []).enumerated() {
                                        arrayElement(
                                            identifier: .identifier(caseName.lowercasingFirst + caseParam.properName(index: index).trimmed.text.uppercasingFirst),
                                            type: caseParam.type.optionalized,
                                            externalHashSettings: externalHashSettings
                                        )
                                    }
                                }
                            }
                        }
                    )
                )
            }
        )

        let hashFunc = externalHashSettings?.hashFunc ?? "hashImpl"

        if externalHashSettings?.isUnsafePointer ?? false {
            #"""
            return Int(hashes.withUnsafeBufferPointer { p in
                \#(raw: hashFunc)(p.baseAddress, \#(raw: count))
            })
            """#
        } else {
            "return Int(\(raw: hashFunc)(hashes, \(raw: count)))"
        }
    }

    @MemberBlockItemListBuilder
    private func hashFunc<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        modifiers: DeclModifierListSyntax,
        externalHashSettings: ExternalHashSettings?
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
                            externalHashSettings: externalHashSettings
                        )
                    )
                )
            )
        }

        if container.propertyHasFloat && externalHashSettings?.hashFloatFunc == nil {
            DeclSyntax(
            #"""
            private func hashFloat(_ givenFloat: Float) -> UInt {
                var value = givenFloat
                var bits: UInt32 = 0
                withUnsafeBytes(of: &value) { bytes in
                    bits = bytes.load(as: UInt32.self)
                }
                var h = UInt(bits)
                h &+= ~h &+ (h << 21)
                h ^= (h >> 24)
                h = (h &+ (h << 3)) &+ (h << 8)
                h ^= (h >> 14)
                h = (h &+ (h << 2)) &+ (h << 4)
                h ^= (h >> 28)
                h &+= (h << 31)
                return h
            }
            """#
            )
            .with(\.leadingTrivia, .newlines(2))
        }

        if container.propertyHasDouble && externalHashSettings?.hashDoubleFunc == nil {
            DeclSyntax(
            #"""
            private func hashDouble(_ givenDouble: Double) -> UInt {
                var value = givenDouble
                var bits: UInt64 = 0
                withUnsafeBytes(of: &value) { bytes in
                    bits = bytes.load(as: UInt64.self)
                }
                var p = UInt(bits)
                p = (~p) &+ (p << 18)
                p ^= (p >> 31)
                p &*= 21
                p ^= (p >> 11)
                p &+= (p << 6)
                p ^= (p >> 22)
                return p
            }
            """#
            )
            .with(\.leadingTrivia, .newlines(2))
        }

        if externalHashSettings?.hashFunc == nil {
            DeclSyntax(
            #"""
            private func hashImpl(_ subhashes: UnsafePointer<UInt>, _ length: Int) -> UInt {
                var result = subhashes[0]
                for i in 1..<length {
                    var base = (UInt64(result) << 32) | UInt64(subhashes[i])
                    base = (~base) &+ (base << 18)
                    base ^= (base >> 31)
                    base &*= 21
                    base ^= (base >> 11)
                    base &+= (base << 6)
                    base ^= (base >> 22)
                    result = UInt(base)
                }
                return result
            }
            """#
            )
            .with(\.leadingTrivia, .newlines(2))
        }
    }

    @MemberBlockItemListBuilder
    func objcHashFunc(
        structDecl: StructDeclSyntax,
        externalHashSettings: ExternalHashSettings?
    ) -> MemberBlockItemListSyntax {
        hashFunc(
            container: structDecl,
            modifiers: structDecl.modifiers,
            externalHashSettings: externalHashSettings
        )
    }

    @MemberBlockItemListBuilder
    func objcHashFunc(
        enumDecl: EnumDeclSyntax,
        externalHashSettings: ExternalHashSettings?
    ) -> MemberBlockItemListSyntax {
        hashFunc(
            container: enumDecl,
            modifiers: enumDecl.modifiers,
            externalHashSettings: externalHashSettings
        )
    }
}

extension DeclSyntaxProtocol {
    var propertyHasFloat: Bool {
        if let enumDecl = self.as(EnumDeclSyntax.self) {
            return enumDecl.propertyHasFloat
        } else if let structDecl = self.as(StructDeclSyntax.self) {
            return structDecl.propertyHasFloat
        } else {
            return false
        }
    }

    var propertyHasDouble: Bool {
        if let enumDecl = self.as(EnumDeclSyntax.self) {
            return enumDecl.propertyHasDouble
        } else if let structDecl = self.as(StructDeclSyntax.self) {
            return structDecl.propertyHasDouble
        } else {
            return false
        }
    }
}

extension StructDeclSyntax {
    var propertyHasFloat: Bool {
        var contains = false
        forEachBinding { binding in
            if let type = binding.typeAnnotation?.type, type.isFloat {
                contains = true
            }
        }
        return contains
    }

    var propertyHasDouble: Bool {
        var contains = false
        forEachBinding { binding in
            if let type = binding.typeAnnotation?.type, type.isDouble {
                contains = true
            }
        }
        return contains
    }
}

extension EnumDeclSyntax {
    var propertyHasFloat: Bool {
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

    var propertyHasDouble: Bool {
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

import SwiftSyntax
import SwiftSyntaxBuilder

extension SwiftObjcValueTypeFactory {
    /// The hash of each instance `x` is as follows:
    /// - If NSObject: x.hash()
    /// - If Bool: x ? 1 : 0
    /// - If signed integer: UInt(abs(x))
    /// - If unsigned integer: UInt(x)
    /// - If optional: UInt(recursively expand x ?? 0)
    private func arrayElementExpr(
        identifier: TokenSyntax,
        type: some TypeSyntaxProtocol,
        needsUnwrap: Bool = false
    ) -> any ExprSyntaxProtocol {
        let numeralUnwrapSuffix = needsUnwrap ? " ?? 0" : ""
        if type.isBool {
            return ExprSyntax("(\(identifier) ? 1 : 0)\(raw: numeralUnwrapSuffix)")
        } else if let optionalType = type.as(OptionalTypeSyntax.self) {
            return arrayElementExpr(
                identifier: identifier,
                type: optionalType.wrappedType,
                needsUnwrap: true
            )
        } else if type.isSignedInt {
            return ExprSyntax("UInt(abs(\(identifier)\(raw: numeralUnwrapSuffix)))")
        } else if type.isObjcPrimitiveNumeral {
            return ExprSyntax("UInt(\(identifier)\(raw: numeralUnwrapSuffix))")
        } else {
            if needsUnwrap {
                return ExprSyntax("UInt(\(identifier)?.hash\(raw: numeralUnwrapSuffix))")
            } else {
                return ExprSyntax("UInt(\(identifier).hash)")
            }
        }
    }

    @CodeBlockItemListBuilder
    private func hashInvocation<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        externalHashFunc: String?
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
                                        ArrayElementSyntax(
                                            expression: arrayElementExpr(identifier: identifierPattern.identifier, type: type)
                                        )
                                    }
                                }
                            } else if let enumDecl = container.as(EnumDeclSyntax.self) {
                                enumDecl.forEachCaseElement { caseElement in
                                    // TODO: Implement enum hash function
                                }
                            }
                        }
                    )
                )
            }
        )

        let hashFunc = externalHashFunc ?? "hashImpl"

        "return Int(\(raw: hashFunc)(hashes, \(raw: count)))"
    }

    @MemberBlockItemListBuilder
    private func hashFunc<StructOrEnum: DeclSyntaxProtocol>(
        container: StructOrEnum,
        modifiers: DeclModifierListSyntax,
        externalHashFunc: String?
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
                            externalHashFunc: externalHashFunc
                        )
                    )
                )
            )
        }

    if externalHashFunc == nil {
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
        externalHashFunc: String?
    ) -> MemberBlockItemListSyntax {
        hashFunc(container: structDecl, modifiers: structDecl.modifiers, externalHashFunc: externalHashFunc)
    }

    @MemberBlockItemListBuilder
    func objcHashFunc(
        enumDecl: EnumDeclSyntax,
        externalHashFunc: String?
    ) -> MemberBlockItemListSyntax {
        hashFunc(container: enumDecl, modifiers: enumDecl.modifiers, externalHashFunc: externalHashFunc)
    }
}

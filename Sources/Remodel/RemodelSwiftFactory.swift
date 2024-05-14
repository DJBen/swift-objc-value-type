import Foundation
import SharedUtilities
import SwiftSyntax
import SwiftSyntaxBuilder

public enum RemodelSwiftFactoryError: Error {
    case adtInValue
    case valueInAdt
}

let primitiveCIntTRegex = /(?:(u)?int(\d+)_t)/
let primitiveCIntRegex = /(?:unsigned\s+)?(?:(?:short|(?:long)(?: long)?)\s+)?int/

// In remodel, types can be declared as `MediaType(NSInteger)`, indicating this
// is a primitive backed enum.
let aliasedPrimitiveTypeRegex = /(\w+)\((\w+)\)/

/// Generate Swift models (enums or structs) from Remodel models.
public class RemodelSwiftFactory {
    public init() {}

    @CodeBlockItemListBuilder
    public func generate(
        _ model: RMModelSyntax,
        imports: [String] = [],
        existingPrefix: String = ""
    ) throws -> CodeBlockItemListSyntax {
        try CodeBlockItemListSyntax {
            for `import` in imports {
                DeclSyntax(
                    "import \(raw: `import`)"
                )
            }

            switch model.type {
            case .value:
                for decl in try generateValue(model, existingPrefix: existingPrefix) { decl }
            case .adtValue:
                for decl in try generateAdt(model, existingPrefix: existingPrefix) { decl }
            case .interface:
                ""
            }
        }
    }

    func generateValue(
        _ model: RMModelSyntax,
        existingPrefix: String
    ) throws -> [any DeclSyntaxProtocol] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [any DeclSyntaxProtocol]()

        for library in Set(model.typeDecls.compactMap(\.library)).sorted() {
            decls.append(DeclSyntax("import \(raw: library)"))
        }

        decls.append(
            try StructDeclSyntax(
                leadingTrivia: Trivia(
                    pieces: [.newlines(2)] + model.comments.flatMap({ [.docLineComment("/// " + $0), .newlines(1)] })),
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .identifier("public"))
                },
                name: .identifier(removeTypePrefix(prefix: existingPrefix, name: model.name)),
                inheritanceClause: inheritanceClause(model)
            ) {
                for property in model.properties {
                    switch property.value {
                    case .value(let structValue):
                        VariableDeclSyntax(
                            leadingTrivia: Trivia(
                                pieces: [.newlines(2)] + structValue.comments.flatMap({ [.docLineComment("/// " + $0), .newlines(1)] })),
                            modifiers: DeclModifierListSyntax {
                                DeclModifierSyntax(name: .identifier("public"))
                            },
                            bindingSpecifier: .keyword(.let)
                        ) {
                            PatternBindingSyntax(
                                pattern: IdentifierPatternSyntax(identifier: .identifier(structValue.name)),
                                typeAnnotation: TypeAnnotationSyntax(
                                    type: propertyType(
                                        structValue,
                                        assumesNonnull: assumesNonnull,
                                        existingPrefix: existingPrefix
                                    )
                                    .mapTypeName {
                                        removeTypePrefix(prefix: existingPrefix, name: $0)
                                    }
                                )
                            )
                        }
                    case .adt(_):
                        throw RemodelSwiftFactoryError.adtInValue
                    }
                }

                try InitializerDeclSyntax(
                    modifiers: DeclModifierListSyntax {
                        DeclModifierSyntax(name: .identifier("public"))
                    },
                    signature: FunctionSignatureSyntax(
                        parameterClause: try FunctionParameterClauseSyntax {
                            for (index, property) in model.properties.enumerated() {
                                switch property.value {
                                case .value(let structValue):
                                    FunctionParameterSyntax(
                                        firstName: .identifier(structValue.name),
                                        type: propertyType(
                                            structValue,
                                            assumesNonnull: assumesNonnull,
                                            existingPrefix: existingPrefix
                                        )
                                        .mapTypeName {
                                            removeTypePrefix(prefix: existingPrefix, name: $0)
                                        },
                                        trailingComma: index == model.properties.count - 1 ? nil : .commaToken()
                                    )
                                case .adt(_):
                                    throw RemodelSwiftFactoryError.adtInValue
                                }
                            }
                        }
                    )
                ) {
                    for property in model.properties {
                        switch property.value {
                        case .value(let structValue):
                            "self.\(raw: structValue.name) = \(raw: structValue.name)"
                        case .adt(_):
                            throw RemodelSwiftFactoryError.adtInValue
                        }
                    }
                }
                .with(\.leadingTrivia, .newlines(2))
            }
            .with(\.trailingTrivia, .newline)
        )
        return decls
    }

    func generateAdt(
        _ model: RMModelSyntax,
        existingPrefix: String
    ) throws -> [any DeclSyntaxProtocol] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [any DeclSyntaxProtocol]()
        for library in Set(model.typeDecls.compactMap(\.library)).sorted() {
            decls.append(DeclSyntax("import \(raw: library)"))
        }

        decls.append(
            try EnumDeclSyntax(
                leadingTrivia: Trivia(
                    pieces: [.newlines(2)] + model.comments.flatMap({ [.docLineComment("/// " + $0), .newlines(1)] })),
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .identifier("public"))
                },
                name: .identifier(model.name),
                inheritanceClause: inheritanceClause(model)
            ) {
                for property in model.properties {
                    switch property.value {
                    case .value(_):
                        throw RemodelSwiftFactoryError.valueInAdt
                    case .adt(let adtValue):
                        EnumCaseDeclSyntax(
                            leadingTrivia: Trivia(
                                pieces: {
                                    var pieces: [TriviaPiece] = [
                                        adtValue.comments.isEmpty ? .newlines(1): .newlines(2)
                                    ]
                                    for comment in adtValue.comments {
                                        pieces.append(.docLineComment("/// \(comment)"))
                                    }
                                    for innerValue in adtValue.innerValues {
                                        for (index, comment) in innerValue.comments.enumerated() {
                                            pieces.append(.newlines(1))
                                            let prefix = index == 0 ? "- \(innerValue.name): " : "  "
                                            pieces.append(.docLineComment("/// \(prefix)\(comment)"))
                                        }
                                    }
                                    pieces.append(.newlines(1))
                                    return pieces
                                }()
                            )
                        ) {
                            EnumCaseElementSyntax(
                                name: .identifier(adtValue.name),
                                parameterClause: adtValue.innerValues.isEmpty ? nil : EnumCaseParameterClauseSyntax(
                                    parameters: EnumCaseParameterListSyntax {
                                        for innerValue in adtValue.innerValues {
                                            EnumCaseParameterSyntax(
                                                firstName: .identifier(innerValue.name),
                                                colon: .colonToken(),
                                                type: propertyType(
                                                    innerValue,
                                                    assumesNonnull: assumesNonnull,
                                                    existingPrefix: existingPrefix
                                                )
                                            )
                                        }
                                    }
                                )
                            )
                        }
                    }
                }
            }
            .with(\.trailingTrivia, .newline)
        )

        return decls
    }

    private func inheritanceClause(_ model: RMModelSyntax) -> InheritanceClauseSyntax? {
        // AdtValue always require equality check
        model.includes.contains("RMEquality") || model.type == .adtValue ? InheritanceClauseSyntax {
            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "Equatable"))
        } : nil
    }

    private func propertyType(
        _ structValue: RMPropertySyntax.StructValue,
        assumesNonnull: Bool,
        existingPrefix: String = ""
    ) -> any TypeSyntaxProtocol {
        IdentifierTypeSyntax(
            name: .identifier(
                mapType(structValue.type, existingPrefix: existingPrefix)
            )
        )
        .optionalized({
            if isObjcPrimitive(structValue.type) {
                return false
            }
            switch structValue.nullability {
            case .nonnull:
                return false
            case .null:
                return true
            case .none:
                return !assumesNonnull
            }
        }())
    }

    private func removeTypePrefix(prefix: String, name: String) -> String {
        if name.hasPrefix(prefix) {
            return String(name.dropFirst(prefix.count))
        } else {
            return name
        }
    }

    private func mapType(
        _ remodelType: String,
        existingPrefix: String
    ) -> String {
        if let match = remodelType.firstMatch(of: /NS(?:Mutable)?Dictionary<([\w\* <>]+),\s*([\w\* <>]+)>\s*\*/) {
            return "[\(mapType(String(match.1), existingPrefix: existingPrefix)): \(mapType(String(match.2), existingPrefix: existingPrefix))]"
        } else if let match = remodelType.firstMatch(of: /NS(?:Mutable)?(Set|Array)<([\w\* <>]+)>\s*\*/) {
            if match.1 == "Set" {
                return "Set<\(mapType(String(match.2), existingPrefix: existingPrefix))>"
            } else {
                return "[\(mapType(String(match.2), existingPrefix: existingPrefix))]"
            }
        } else if let match = remodelType.firstMatch(of: /(\w+)<([\w\* <>]+)>\s\*/) {
            return "\(String(match.1))<\(mapType(String(match.2), existingPrefix: existingPrefix))>"
        } else if remodelType.hasSuffix("*") {
            var result = remodelType
            result.removeLast()
            return mapType(result.trimmingCharacters(in: .whitespacesAndNewlines), existingPrefix: existingPrefix)
        } else if let aliasedType = remodelType.firstMatch(of: aliasedPrimitiveTypeRegex) {
            return String(aliasedType.1)
        } else if remodelType.lowercased() == "bool" {
            return "Bool"
        } else if remodelType == "char" {
            return "UInt8"
        } else if let match = remodelType.firstMatch(of: primitiveCIntTRegex) {
            let u = String(match.1 ?? "").uppercased()
            return "\(u)Int\(String(match.2))"
        } else if remodelType.contains(primitiveCIntRegex) {
            return "Int"
        } else if remodelType == "float" {
            return "Float"
        } else if remodelType == "double" {
            return "Double"
        } else if remodelType == "NSInteger" {
            return "Int"
        } else if remodelType == "NSUInteger" {
            return "UInt"
        } else if remodelType == "Class" {
            return "AnyClass"
        } else if remodelType == "NSTimeInterval" {
            return "TimeInterval"
        } else if let mappedSwiftType = objcToSwiftFoundationTypeMap[remodelType] {
            return mappedSwiftType
        } else {
            return removeTypePrefix(prefix: existingPrefix, name: remodelType)
        }
    }

    private func isObjcPrimitive(_ remodelType: String) -> Bool {
        if remodelType == "char" {
            return true
        } else if remodelType.lowercased() == "bool" {
            return true
        } else if remodelType == "float" || remodelType == "double" {
            return true
        } else if let aliasedType = remodelType.firstMatch(of: aliasedPrimitiveTypeRegex) {
            return isObjcPrimitive(String(aliasedType.2))
        } else if remodelType == "NSInteger" || remodelType == "NSUInteger" {
            return true
        } else if ["CGPoint", "CGFloat", "CGSize", "CGRect", "CGVector", "CGAffineTransform"].contains(remodelType) {
            return true
        } else {
            return remodelType.contains(primitiveCIntRegex) || remodelType.contains(primitiveCIntTRegex)
        }
    }
}

extension IdentifierTypeSyntax {
    func optionalized(_ shouldOptionalize: Bool) -> any TypeSyntaxProtocol {
        if shouldOptionalize {
            return OptionalTypeSyntax(wrappedType: self)
        } else {
            return self
        }
    }
}

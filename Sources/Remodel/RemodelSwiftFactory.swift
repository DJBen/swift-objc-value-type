import Foundation
import SharedUtilities
import OrderedCollections
import SwiftSyntax
import SwiftSyntaxBuilder

public enum RemodelSwiftFactoryError: Error {
    case adtInValue
    case valueInAdt
}

let primitiveCIntTRegex = /(?:(u)?int(\d+)_t)/
let primitiveCIntRegex = /(?:unsigned\s+)?(?:(?:short|(?:long)(?: long)?)\s+)?int/

// In Remodel, types can be declared as `MediaType(NSInteger)`, indicating this
// is a primitive backed enum.
let aliasedRemodelPrimitiveTypeRegex = /(\w+)\((\w+)\)/

/// Generate Swift models (enums or structs) from Remodel models.
public class RemodelSwiftFactory {
    let typeMigrations: TypeMigrations
    
    public init(
        typeMigrations: TypeMigrations = TypeMigrations()
    ) {
        self.typeMigrations = typeMigrations
    }

    @CodeBlockItemListBuilder
    public func generate(
        _ model: RMModelSyntax,
        imports: [String] = []
    ) throws -> CodeBlockItemListSyntax {
        try CodeBlockItemListSyntax {
            for `import` in imports {
                DeclSyntax(
                    "import \(raw: `import`)"
                )
            }

            switch model.type {
            case .value:
                for decl in try generateValue(model) { decl }
            case .adtValue:
                for decl in try generateAdt(model) { decl }
            case .interface:
                ""
            }
        }
    }

    private func configTrivia(
        _ model: RMModelSyntax
    ) -> Trivia {
        var flags = [String]()
        if model.includes.contains("RMCoding") {
            flags.append("NSCoding")
        }
        if model.includes.contains("RMCopying") {
            flags.append("NSCopying")
        }
        if model.includes.contains("RMBuilder") {
            flags.append("Builder")
        }
        var pieces = [TriviaPiece]()
        if !flags.isEmpty {
            pieces += [
                .docLineComment("// @value_object \(flags.joined(separator: " "))"),
                .newlines(1)
            ]
        }

        let nsEnumTypeMap = model.properties.flatMap { property -> [String] in
            switch property.value {
            case .value(let structValue):
                return [structValue.type]
            case .adt(let adtValue):
                return adtValue.innerValues.map(\.type)
            }
        }.compactMap { type -> (String, String)? in
            guard let match = type.firstMatch(of: aliasedRemodelPrimitiveTypeRegex) else {
                return nil
            }
            let actualType: String
            if ["NSInteger", "int"].contains(String(match.2).trimmingCharacters(in: .whitespaces)) {
                actualType = "Int"
            } else if ["NSUInteger"].contains(String(match.2).trimmingCharacters(in: .whitespaces)) {
                actualType = "UInt"
            } else {
                actualType = "Int"
            }
            return (String(match.1), actualType)
        }.reduce(into: [:]) { $0[$1.0] = $1.1 }

        if !nsEnumTypeMap.isEmpty {
            let jsonData = try! JSONEncoder().encode(nsEnumTypeMap)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                pieces += [
                    .docLineComment("// @value_object ns_enum_types \(jsonString)"),
                    .newlines(1)
                ]
            }
        }

        return Trivia(pieces: pieces)
    }

    func generateValue(
        _ model: RMModelSyntax
    ) throws -> [any DeclSyntaxProtocol] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [any DeclSyntaxProtocol]()

        for library in Set(model.typeDecls.compactMap(\.library)).sorted() {
            decls.append(DeclSyntax("import \(raw: library)"))
        }

        decls.append(
            try StructDeclSyntax(
                leadingTrivia: Trivia(
                    pieces: [.newlines(2)] + configTrivia(model) + model.comments.flatMap({ [.docLineComment("/// " + $0), .newlines(1)] })),
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .identifier("public"))
                },
                name: .identifier(
                    mappingObjcTypeToSwift(model.name)
                ),
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
                                        assumesNonnull: assumesNonnull
                                    )
                                    .mapTypeName {
                                        mappingObjcTypeToSwift($0)
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
                                            assumesNonnull: assumesNonnull
                                        )
                                        .mapTypeName {
                                            mappingObjcTypeToSwift($0)
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
        _ model: RMModelSyntax
    ) throws -> [any DeclSyntaxProtocol] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [any DeclSyntaxProtocol]()
        for library in Set(model.typeDecls.compactMap(\.library)).sorted() {
            decls.append(DeclSyntax("import \(raw: library)"))
        }

        decls.append(
            try EnumDeclSyntax(
                leadingTrivia: Trivia(
                    pieces: [.newlines(2)] + configTrivia(model) + model.comments.flatMap({ [.docLineComment("/// " + $0), .newlines(1)] })),
                modifiers: DeclModifierListSyntax {
                    DeclModifierSyntax(name: .identifier("public"))
                },
                name: .identifier(
                    mappingObjcTypeToSwift(model.name)
                ),
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
                                                    assumesNonnull: assumesNonnull
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
        model.includes.contains("RMEquality") ? InheritanceClauseSyntax {
            InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "Equatable"))
        } : nil
    }

    private func propertyType(
        _ structValue: RMPropertySyntax.StructValue,
        assumesNonnull: Bool
    ) -> any TypeSyntaxProtocol {
        IdentifierTypeSyntax(
            name: .identifier(
                mappingObjcTypeToSwift(
                    structValue.type
                )
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

    private func mappingObjcTypeToSwift(
        _ remodelType: String
    ) -> String {
        if let aliasedPrimitiveType = remodelType.firstMatch(of: aliasedRemodelPrimitiveTypeRegex) {
            return String(aliasedPrimitiveType.1)
        } else {
            return ObjcSwiftUtils.mappingObjcTypeToSwift(
                remodelType,
                mapSwiftType: {
                    if let mappedType = typeMigrations.swiftTypeMigrations[$0] {
                        return mappedType
                    }
                    return $0
                }
            )
        }
    }

    private func isObjcPrimitive(_ remodelType: String) -> Bool {
        if let aliasedType = remodelType.firstMatch(of: aliasedRemodelPrimitiveTypeRegex) {
            return isObjcPrimitive(String(aliasedType.2))
        } else {
            return ObjcSwiftUtils.isObjcPrimitive(remodelType)
        }
    }
}

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

public enum RemodelSwiftFactoryError: Error {
    case adtInValue
    case valueInAdt
}

let primitiveCIntTRegex = /(?:(u)?int(\d+)_t)/
let primitiveCIntRegex = /(?:unsigned\s+)?(?:(?:short|(?:long)(?: long)?)\s+)?int/

/// https://developer.apple.com/documentation/swift/working-with-foundation-types
let objcToSwiftMaps = [
    "NSAffineTransform": "AffineTransform",
    "NSArray": "Array",
    "NSCalendar": "Calendar",
    "NSCharacterSet": "CharacterSet",
    "NSData": "Data",
    "NSDateComponents": "DateComponents",
    "NSDateInterval": "DateInterval",
    "NSDate": "Date",
    "NSDecimalNumber": "Decimal",
    "NSDictionary": "Dictionary",
    "NSIndexPath": "IndexPath",
    "NSIndexSet": "IndexSet",
    "NSLocale": "Locale",
    "NSMeasurement": "Measurement",
    "NSNotification": "Notification",
    "NSPersonNameComponents": "PersonNameComponents",
    "NSSet": "Set",
    "NSString": "String",
    "NSTimeZone": "TimeZone",
    "NSURL": "URL",
    "NSURLComponents": "URLComponents",
    "NSURLQueryItem": "URLQueryItem",
    "NSURLRequest": "URLRequest",
    "NSUUID": "UUID",
    "NSError": "Error",
]

/// Generate Swift models (enums or structs) from Remodel models.
public class RemodelSwiftFactory {
    public init() {}

    @CodeBlockItemListBuilder
    public func generate(
        _ model: RMModelSyntax
    ) throws -> CodeBlockItemListSyntax {
        try CodeBlockItemListSyntax {
            switch model.type {
            case .value:
                for decl in try generateValue(model) { decl }
            case .adtValue:
                for decl in try generateAdt(model) { decl }
            }
        }
    }

    func generateValue(
        _ model: RMModelSyntax
    ) throws -> [DeclSyntax] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [DeclSyntax]()
        for typeDecl in model.typeDecls {
            if let library = typeDecl.library {
                decls.append(DeclSyntax("import \(raw: library)"))
            }
        }

        decls.append(
            try StructDeclSyntax(
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
                                    type: propertyType(structValue, assumesNonnull: assumesNonnull)
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
                                        type: propertyType(structValue, assumesNonnull: assumesNonnull),
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
            .cast(DeclSyntax.self)
        )
        return decls
    }

    func generateAdt(
        _ model: RMModelSyntax
    ) throws -> [DeclSyntax] {
        let assumesNonnull = model.includes.contains("RMAssumeNonnull")

        var decls = [DeclSyntax]()
        for typeDecl in model.typeDecls {
            if let library = typeDecl.library {
                decls.append(DeclSyntax("import \(raw: library)"))
            }
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
                                    var pieces: [TriviaPiece] = [.newlines(2)]
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
                                    if !adtValue.innerValues.isEmpty {
                                        pieces.append(.newlines(1))
                                    }
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
                                                type: propertyType(innerValue, assumesNonnull: assumesNonnull)
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
            .cast(DeclSyntax.self)
        )

        return decls
    }

    private func inheritanceClause(_ model: RMModelSyntax) -> InheritanceClauseSyntax? {
        model.includes.contains("RMEquality") || model.includes.contains("RMCoding") ? InheritanceClauseSyntax {
            if model.includes.contains("RMEquality") {
                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "Equatable"))
                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "Hashable"))
            }
            if model.includes.contains("RMCoding") {
                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: "Codable"))
            }
        } : nil
    }

    private func propertyType(_ structValue: RMPropertySyntax.StructValue, assumesNonnull: Bool) -> TypeSyntax {
        IdentifierTypeSyntax(
            name: .identifier(mapType(structValue.type))
        )
        .optionalized({
            if isObjcPrimitive(structValue.type) {
                return false
            }
            if structValue.declaresIsNullable {
                return true
            }
            return !assumesNonnull
        }())
    }

    private func mapType(_ remodelType: String) -> String {
        if let match = remodelType.firstMatch(of: /NS(?:Mutable)?Dictionary<([\w\* <>]+),\s*([\w\* <>]+)>\s*\*/) {
            return "[\(mapType(String(match.1))): \(mapType(String(match.2)))]"
        } else if let match = remodelType.firstMatch(of: /NS(?:Mutable)?(Set|Array)<([\w\* <>]+)>\s*\*/) {
            if match.1 == "Set" {
                return "Set<\(mapType(String(match.2)))>"
            } else {
                return "[\(mapType(String(match.2)))]"
            }
        } else if let match = remodelType.firstMatch(of: /(\w+)<([\w\* <>]+)>\s\*/) {
            return "\(String(match.1))<\(mapType(String(match.2)))>"
        } else if remodelType.hasSuffix("*") {
            var result = remodelType
            result.removeLast()
            return mapType(result.trimmingCharacters(in: .whitespacesAndNewlines))
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
        } else if let mappedSwiftType = objcToSwiftMaps[remodelType] {
            return mappedSwiftType
        } else {
            return remodelType
        }
    }

    private func isObjcPrimitive(_ remodelType: String) -> Bool {
        if remodelType == "char" {
            return true
        } else if remodelType.lowercased() == "bool" {
            return true
        } else if remodelType == "float" || remodelType == "double" {
            return true
        } else {
            return remodelType.contains(primitiveCIntRegex)
        }
    }
}

extension IdentifierTypeSyntax {
    func optionalized(_ shouldOptionalize: Bool) -> TypeSyntax {
        if shouldOptionalize {
            return OptionalTypeSyntax(wrappedType: self).cast(TypeSyntax.self)
        } else {
            return cast(TypeSyntax.self)
        }
    }
}

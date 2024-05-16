import SwiftSyntax
import SwiftSyntaxBuilder
import SharedUtilities
import Foundation

/// Converts objc plain enum into Swift ones.
/// Plain enum means that the enum is an integer based enum.
public final class EnumOptionConverter {
    enum ParseState {
        case parsingHeader
        case parsingCases
        case end
    }

    public enum ParseError: Error {
        case unclosedBlockComment
        case unfinishedParsing
        case optionSetsMissingCaseValue
        case enumCaseUsingNonNumericValue
    }

    public init() {}

    @MemberBlockItemListBuilder
    private func objcEnum(
        _ enumOrOption: ObjcEnumOrOption,
        isPublic: Bool = true
    ) throws -> MemberBlockItemListSyntax {
        try EnumDeclSyntax(
            leadingTrivia: Trivia(enumOrOption.trivia),
            modifiers: DeclModifierListSyntax {
                if isPublic {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(enumOrOption.name),
            inheritanceClause: InheritanceClauseSyntax(
                inheritedTypes: InheritedTypeListSyntax {
                    InheritedTypeSyntax(
                        type: IdentifierTypeSyntax(name: .identifier("Int"))
                    )
                }
            )
        ) {
            for optionCase in enumOrOption.cases {
                try EnumCaseDeclSyntax {
                    EnumCaseElementSyntax(
                        name: .identifier({
                            let prefix = optionCase.name.commonPrefix(with: enumOrOption.name)
                            return String(optionCase.name.suffix(from: optionCase.name.index(optionCase.name.startIndex, offsetBy: prefix.lengthOfBytes(using: .utf8)))).lowercasingFirst
                        }()),
                        rawValue: try {
                            switch optionCase.value {
                            case .none:
                                return nil
                            case .numeric(let int):
                                return InitializerClauseSyntax(
                                    equal: .equalToken(),
                                    value: ExprSyntax("\(raw: int)")
                                )
                            case .bitShift, .bitOr:
                                throw ParseError.enumCaseUsingNonNumericValue
                            }
                        }()
                    )
                }
            }
        }
    }

    @MemberBlockItemListBuilder
    private func optionSet(
        _ enumOrOption: ObjcEnumOrOption,
        isPublic: Bool = true
    ) throws -> MemberBlockItemListSyntax {
        try StructDeclSyntax(
            leadingTrivia: Trivia(enumOrOption.trivia),
            modifiers: DeclModifierListSyntax {
                if isPublic {
                    DeclModifierSyntax(name: .keyword(.public))
                }
            },
            name: .identifier(enumOrOption.name),
            inheritanceClause: InheritanceClauseSyntax(
                inheritedTypes: InheritedTypeListSyntax {
                    InheritedTypeSyntax(
                        type: IdentifierTypeSyntax(name: .identifier("OptionSet"))
                    )
                }
            )
        ) {
            // public let rawValue: Int
            VariableDeclSyntax(
                modifiers: DeclModifierListSyntax {
                    if isPublic {
                        DeclModifierSyntax(name: .keyword(.public))
                    }
                },
                bindingSpecifier: .keyword(.let)
            ) {
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(identifier: .identifier("rawValue")),
                    typeAnnotation: TypeAnnotationSyntax(
                        colon: .colonToken(),
                        type: IdentifierTypeSyntax(name: .identifier("Int"))
                    )
                )
            }
            .with(\.trailingTrivia, .newlines(2))

            for optionCase in enumOrOption.cases {
                // public static let displayName = UpdateOption(rawValue: 1 << 0)
                try VariableDeclSyntax(
                    leadingTrivia: Trivia(optionCase.beforeTrivia),
                    modifiers: DeclModifierListSyntax {
                        if isPublic {
                            DeclModifierSyntax(name: .keyword(.public))
                        }
                        DeclModifierSyntax(name: .keyword(.static))
                    },
                    bindingSpecifier: .keyword(.let),
                    bindingsBuilder:  {
                        PatternBindingSyntax(
                            pattern: IdentifierPatternSyntax(identifier: .identifier(optionCase.name.lowercasingFirst)),
                            typeAnnotation: TypeAnnotationSyntax(
                                colon: .colonToken(),
                                type: IdentifierTypeSyntax(name: .identifier(enumOrOption.name))
                            ),
                            initializer: InitializerClauseSyntax(
                                equal: .equalToken(),
                                value: try optionSetBindingExpr(
                                    option: enumOrOption,
                                    optionCase: optionCase,
                                    isPublic: isPublic
                                )
                            )
                        )
                    },
                    trailingTrivia: Trivia(optionCase.afterTrivia, isLeading: false)
                )
            }

            if isPublic {
                DeclSyntax(
                    """
                    public init(rawValue: Int) {
                        self.rawValue = rawValue
                    }
                    """
                )
                .with(\.leadingTrivia, .newlines(2))
            }
        }
    }

    // public static let all: UpdateOption = [.displayName, .postA, .viewB, .listC]
    // UpdateOption(rawValue: 1 << 0)
    private func optionSetBindingExpr(
        option: ObjcEnumOrOption,
        optionCase: ObjcEnumOrOption.Case,
        isPublic: Bool
    ) throws -> any ExprSyntaxProtocol {
        switch optionCase.value {
        case .numeric(let int):
            FunctionCallExprSyntax(
                calledExpression: DeclReferenceExprSyntax(
                    baseName: .identifier(option.name)
                ),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprSyntax(
                    label: .identifier("rawValue"),
                    colon: .colonToken(),
                    expression: SequenceExprSyntax {
                        IntegerLiteralExprSyntax(integerLiteral: int)
                    }
                )
            }
        case .bitShift(let base, let shift):
            FunctionCallExprSyntax(
                calledExpression: DeclReferenceExprSyntax(
                    baseName: .identifier(option.name)
                ),
                leftParen: .leftParenToken(),
                rightParen: .rightParenToken()
            ) {
                LabeledExprSyntax(
                    label: .identifier("rawValue"),
                    colon: .colonToken(),
                    expression: SequenceExprSyntax {
                        IntegerLiteralExprSyntax(integerLiteral: base)
                        BinaryOperatorExprSyntax(operator: .binaryOperator("<<"))
                        IntegerLiteralExprSyntax(integerLiteral: shift)
                    }
                )
            }
        case .bitOr(let options):
            ArrayExprSyntax {
                for (index, option) in options.enumerated() {
                    ArrayElementSyntax(
                        expression: MemberAccessExprSyntax(
                            period: .periodToken(),
                            declName: DeclReferenceExprSyntax(
                                baseName: .identifier(option.lowercasingFirst)
                            )
                        ),
                        trailingComma: index < options.count - 1 ? .commaToken() : nil
                    )
                }
            }
        case .none:
            throw ParseError.optionSetsMissingCaseValue
        }
    }

    @MemberBlockItemListBuilder
    public func convert(
        _ enumOrOption: ObjcEnumOrOption,
        isPublic: Bool = true
    ) throws -> MemberBlockItemListSyntax {
        switch enumOrOption.type {
        case .nsOption:
            try optionSet(enumOrOption, isPublic: isPublic)
        case .nsEnum:
            try objcEnum(enumOrOption, isPublic: isPublic)
        }
    }

    public func parse(
        source: String
    ) throws -> ObjcEnumOrOption? {
        var parseState = ParseState.parsingHeader
        var expectEndBlockComment = false

        var beforeTrivia = [ObjcEnumOrOption.Trivia]()
        var blockComment = [String]()
        var cases = [ObjcEnumOrOption.Case]()

        let resultBuilder = ObjcEnumOrOption.Builder()

        let lines = source.components(separatedBy: .newlines)

        guard var line: String = lines.first?.trimmingCharacters(in: .whitespaces) else {
            return nil
        }
        var lineIndex = 0
        outer: while lineIndex < lines.count {
            if line.isEmpty && lineIndex < lines.count - 1 {
                line = lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                lineIndex += 1
                continue
            }

            switch parseState {
            case .parsingHeader:
                if expectEndBlockComment {
                    if let match = line.firstMatch(of: /^(?:\/\*\**)\s*([^\/]*)/) {
                        blockComment.append(String(match.1))
                    } else if let match = line.firstMatch(of: /^([^\*\/]*)\**\//) {
                        if !String(match.1).isEmpty {
                            blockComment.append(String(match.1))
                        }
                        beforeTrivia.append(.blockComment(blockComment))
                        expectEndBlockComment = false
                    } else if let match = line.firstMatch(of: /^\**\s*(.+)/) {
                        blockComment.append(String(match.1))
                    }

                    line = lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                    lineIndex += 1
                    continue
                }
                if line.starts(with: "///") {
                    beforeTrivia.append(.tripleSlashLine(String(line.dropFirst(3))))
                } else if line.starts(with: "//") {
                    beforeTrivia.append(.doubleSlashLine(String(line.dropFirst(2))))
                } else if let match = line.firstMatch(of: /^\/\*\*?\s*(.*)/) {
                    expectEndBlockComment = true
                    if !String(match.1).isEmpty {
                        blockComment.append(String(match.1))
                    }
                } else if let match = line.firstMatch(of: /^typedef\s+(NS_OPTIONS|NS_ENUM)\((\w+),\s*(\w+)\)\s*{\s*$/) {
                    let type: EnumOrOptionType = String(match.1) == "NS_OPTIONS" ? .nsOption : .nsEnum
                    resultBuilder.type = type
                    resultBuilder.underlyingType = String(match.2)
                    resultBuilder.name = String(match.3)
                    resultBuilder.trivia = beforeTrivia
                    beforeTrivia = []
                    parseState = .parsingCases
                }
            case .parsingCases:
                if line.starts(with: "///") {
                    beforeTrivia.append(.tripleSlashLine(String(line.dropFirst(3)).trimmingCharacters(in: .whitespaces)))
                    line = lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                    lineIndex += 1
                } else if line.starts(with: "//") {
                    beforeTrivia.append(.doubleSlashLine(String(line.dropFirst(2)).trimmingCharacters(in: .whitespaces)))
                    line = lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                    lineIndex += 1
                }

                // Ingest line until met ',' or '},'
                while !line.contains(/(};|,)(\s*\/\/.*)?$/) {
                    line.append(lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines))
                    lineIndex += 1
                }
                let caseBuilder = ObjcEnumOrOption.Case.Builder()

                if let match = line.firstMatch(of: /(\w+)(?:\s*=\s*((?:[-\d]+(?:\s*<<\s*\d+)?)|(?:\w+(?:\s*\|\s*\w+)*)))?\s*,?/) {
                    // This regex matches the following
                    // CaseXXX = 123,
                    // CaseXXX = 2 << 1,
                    // CaseXXX,
                    // CaseXXX = AB | CD
                    caseBuilder.name = String(match.1)
                    if let value = match.2.map({ String($0).trimmingCharacters(in: .whitespaces) }) {
                        if let valueMatch = value.firstMatch(of: /^([-\d]+)\s*<<\s*(\d+)$/) {
                            caseBuilder.value = .bitShift(base: Int(valueMatch.1)!, shift: Int(valueMatch.2)!)
                        } else if let valueMatch = value.firstMatch(of: /^([-\d]+)$/) {
                            caseBuilder.value = .numeric(Int(valueMatch.1)!)
                        } else {
                            caseBuilder.value = .bitOr(value.components(separatedBy: "|").map {
                                $0.trimmingCharacters(in: .whitespaces)
                            })
                        }
                    }
                    var remainingOfLine = line
                    remainingOfLine.removeSubrange(match.range)
                    remainingOfLine = remainingOfLine.trimmingCharacters(in: .whitespaces)
                    caseBuilder.beforeTrivia = beforeTrivia
                    beforeTrivia = []
                    if remainingOfLine.starts(with: "///") {
                        caseBuilder.afterTrivia = [.tripleSlashLine(String(remainingOfLine.dropFirst(3)).trimmingCharacters(in: .whitespaces))]
                    } else if remainingOfLine.starts(with: "//") {
                        caseBuilder.afterTrivia = [.doubleSlashLine(String(remainingOfLine.dropFirst(2)).trimmingCharacters(in: .whitespaces))]
                    } else {
                        caseBuilder.afterTrivia = []
                    }
                    cases.append(try caseBuilder.build())
                } else if line.contains(/};$/) {
                    resultBuilder.cases = cases
                    parseState = .end
                }
            case .end:
                break outer
            }

            if lineIndex < lines.count - 1 {
                line = lines[lineIndex + 1].trimmingCharacters(in: .whitespacesAndNewlines)
                lineIndex += 1
            }
        }

        if expectEndBlockComment {
            throw ParseError.unclosedBlockComment
        }
        if parseState != .end {
            throw ParseError.unfinishedParsing
        }

        return try resultBuilder.build()
    }
}

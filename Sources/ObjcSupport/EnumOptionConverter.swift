import SwiftSyntax
import SwiftSyntaxBuilder
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
    }

    public func parse(
        source: String
    ) throws -> ObjcEnumOrOption? {
        var parseState = ParseState.parsingHeader
        var expectEndBlockComment = false

        var beforeTrivia = [Trivia]()
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

                if let match = line.firstMatch(of: /(\w+)(?:\s*=\s*((?:\d+(?:\s*<<\s*\d+)?)|(?:\w+(?:\s*\|\s*\w+)*)))?\s*,?/) {
                    // This regex matches the following
                    // CaseXXX = 123,
                    // CaseXXX = 2 << 1,
                    // CaseXXX,
                    // CaseXXX = AB | CD | let caseBuilder.beforeTrivia = beforeTrivia
                    caseBuilder.name = String(match.1)
                    if let value = match.2.map({ String($0).trimmingCharacters(in: .whitespaces) }) {
                        if let valueMatch = value.firstMatch(of: /^(\d+)\s*<<\s*(\d+)$/) {
                            caseBuilder.value = .bitShift(base: Int(valueMatch.1)!, shift: Int(valueMatch.2)!)
                        } else if let valueMatch = value.firstMatch(of: /^(\d+)$/) {
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

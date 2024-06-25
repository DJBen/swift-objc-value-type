import SwiftSyntax
import SwiftSyntaxBuilder

extension Trivia {
    init?(_ trivia: [ObjcEnumOrOption.Trivia], isLeading: Bool = true) {
        guard !trivia.isEmpty else {
            return nil
        }

        self.init(
            pieces: (isLeading ? [] : [.spaces(1)]) +
                trivia.flatMap { triviaPiece -> [TriviaPiece] in
                switch triviaPiece {
                case .doubleSlashLine(let string):
                    return [.lineComment("// " + string)]
                case .tripleSlashLine(let string):
                    return [.docLineComment("/// " + string)]
                case .blockComment(let array):
                    return array.map {
                        .docLineComment("/// " + $0)
                    }.interspaced(separator: .newlines(1))
                case .newlines(let int):
                    return [.newlines(int)]
                }
            }
            /*.interspaced(separator: .newlines(1))*/ + (isLeading ? [.newlines(1)] : [])
        )
    }
}

extension Array {
    func interspaced(separator: Element) -> [Element] {
        guard count > 1 else {
            return self
        }

        var result = [Element]()

        for i in 0..<count {
            result.append(self[i])

            if i < count - 1 {
                result.append(separator)
            }
        }

        return result
    }
}

import Foundation

public extension String {
    var lowercasingFirst: String { prefix(1).lowercased() + dropFirst() }
    var uppercasingFirst: String { prefix(1).uppercased() + dropFirst() }

    var camelCased: String {
        guard !isEmpty else { return "" }
        let parts = components(separatedBy: .alphanumerics.inverted)
        let first = parts.first!.lowercasingFirst
        let rest = parts.dropFirst().map { $0.uppercasingFirst }

        return ([first] + rest).joined()
    }

    var upperSnakeCased: String {
        guard !isEmpty else { return "" }

        var result = ""
        var previousChar: Character?

        for char in self {
            if char.isUppercase, let previous = previousChar, previous.isLowercase {
                result += "_"
            }
            result += char.uppercased()
            previousChar = char
        }

        return result
    }
}

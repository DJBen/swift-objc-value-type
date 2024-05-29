import Foundation
import SwiftSyntax

struct ValueObjectConfig: Hashable {
    let swiftTypesWithWrapper: Set<String>
    let flags: Set<String>
    let nsEnumTypes: [String: String]

    private init(swiftTypesWithWrapper: Set<String>, flags: Set<String>, nsEnumTypes: [String: String]) {
        self.swiftTypesWithWrapper = swiftTypesWithWrapper
        self.flags = flags
        self.nsEnumTypes = nsEnumTypes
    }

    init(trivia: Trivia) {
        self.flags = trivia.pieces.compactMap {
            switch $0 {
            case .blockComment(let comment), .lineComment(let comment), .docLineComment(let comment), .docBlockComment(let comment):
                var set = Set<String>()
                for match in comment.matches(of: /@value_object\s+(.+)/) {
                    for flag in String(match.1).trimmingCharacters(in: .whitespaces).lowercased().components(separatedBy: " ") {
                        set.insert(flag)
                    }
                }
                return set
            default:
                return nil
            }
        }
        .reduce(Set<String>(), { $0.union($1) })
        
        self.swiftTypesWithWrapper = {
            var swiftTypesWithWrapper: Set<String> = []
            for piece in trivia.pieces {
                switch piece {
                case .blockComment(let comment), .lineComment(let comment), .docLineComment(let comment), .docBlockComment(let comment):
                    for match in comment.matches(of: /@value_object\s+swift_types_with_wrapper\s+(\[[^\]]+\])/) {
                        let json = String(match.1).trimmingCharacters(in: .whitespaces)
                        // parse and insert json into mappings
                        if let data = json.data(using: .utf8) {
                            do {
                                if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [String] {
                                    swiftTypesWithWrapper.formUnion(jsonArray)
                                }
                            } catch {
                                print("Failed to parse @value_object swift_types_with_wrapper: \(error)")
                            }
                        }
                    }
                default:
                    break
                }
            }
            return swiftTypesWithWrapper
        }()

        self.nsEnumTypes = {
            var nsEnumTypes: [String: String] = [:]
            for piece in trivia.pieces {
                switch piece {
                case .blockComment(let comment), .lineComment(let comment), .docLineComment(let comment), .docBlockComment(let comment):
                    for match in comment.matches(of: /@value_object\s+ns_enum_types\s+({[^}]+})/) {
                        let json = String(match.1).trimmingCharacters(in: .whitespaces)
                        // parse and insert json into mappings
                        if let data = json.data(using: .utf8) {
                            do {
                                if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                                    for (key, value) in jsonDict {
                                        nsEnumTypes[key] = value
                                    }
                                }
                            } catch {
                                print("Failed to parse @value_object ns_enum_types: \(error)")
                            }
                        }
                    }
                default:
                    break
                }
            }
            return nsEnumTypes
        }()
    }

    func union(_ other: ValueObjectConfig) -> ValueObjectConfig {
        ValueObjectConfig(
            swiftTypesWithWrapper: swiftTypesWithWrapper.union(other.swiftTypesWithWrapper),
            flags: flags.union(other.flags),
            nsEnumTypes: nsEnumTypes.merging(other.nsEnumTypes, uniquingKeysWith: { $1 })
        )
    }
}

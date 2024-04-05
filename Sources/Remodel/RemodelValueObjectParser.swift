import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

public class RemodelValueObjectParser {
    public struct Context {
        public let libName: String?
    }

    enum State {
        case parsingTypeAndHeader
        case parsingProperties
    }

    public func parse(_ remodelSource: String) throws -> RMModelSyntax {
        var state = State.parsingTypeAndHeader

        let typeRegex = /%type((?:\s+\w+=\w+)*)/

        // Matches `TrackV2ConfigValue includes(RMAssumeNonnull, RMEquality)`
        let headerRegex = /(\w+)\s*includes\(([^)]+)\)(?:\s*excludes\(([^)]+)\))?\s*{/

        // Matches the following
        // - BOOL enableAttachment
        // - %nullable NSArray<NSNumber *> *supportedTypes
        // - NSDictionary<NSNumber *, NSString *> *parserRegexes
        let propertyRegex = /(?:(%nullable)\s+)?(\S+(?:\<[^>]+\>)?\s+\*?)(\w+)\s*;?/
        let lines = remodelSource.components(separatedBy: .newlines)

        var comments: [String] = []
        var typeDecls: [RMTypeDeclSyntax] = []
        var modelName = ""
        var includes: [String] = []
        var excludes: [String] = []
        var properties: [RMPropertySyntax] = []

        var stagedPropertyComments: [String] = []

        for line in lines {
            let line = line.trimmingCharacters(in: .whitespaces)
            switch state {
            case .parsingTypeAndHeader:
                if line.hasPrefix("#") {
                    comments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: typeRegex) {
                    let typeParams = match.1.trimmingCharacters(in: .whitespaces).split(separator: " ")
                    var paramName: String!
                    var paramFile: String?
                    var paramLib: String?
                    var paramCanForwardDeclare: Bool?

                    for typeParam in typeParams {
                        if let paramMatch = typeParam.firstMatch(of: /(\w+)=(\w+)/) {
                            switch paramMatch.1 {
                            case "name":
                                paramName = String(paramMatch.2)
                            case "file":
                                paramFile = String(paramMatch.2)
                            case "library":
                                paramLib = String(paramMatch.2)
                            case "canForwardDeclare":
                                paramCanForwardDeclare = String(paramMatch.2) == "true"
                            default:
                                break
                            }
                        }
                    }
                    typeDecls.append(RMTypeDeclSyntax(name: paramName, library: paramLib, file: paramFile, canForwardDeclare: paramCanForwardDeclare))

                } else if let match = line.firstMatch(of: headerRegex) {
                    modelName = String(match.1)
                    includes = match.2.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                    excludes = match.3?.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
                    state = .parsingProperties
                }
            case .parsingProperties:
                if line.hasPrefix("#") {
                    stagedPropertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: propertyRegex) {
                    let isNullable = match.1 != nil
                    let type = String(match.2).trimmingCharacters(in: .whitespaces)
                    let name = String(match.3)
                    properties.append(RMPropertySyntax(comments: stagedPropertyComments, declaresIsNullable: isNullable, type: type, name: name))
                    stagedPropertyComments = []
                }
            }
        }

        return RMModelSyntax(comments: comments, typeDecls: typeDecls, name: modelName, includes: includes, excludes: excludes, properties: properties)
    }
}

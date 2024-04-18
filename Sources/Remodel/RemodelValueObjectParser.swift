import Foundation

public class RemodelValueObjectParser {
    enum State {
        case parsingTypeAndHeader
        case parsingValueProperties
        case parsingAdtValueProperties
        case parsingAdtInnerProperties
        case parsingLegacyInterfaceProperties
        case end
    }

    public enum ParseError: Error {
        case missingPropertyName(String)
        case unfinishedParsing
        case unsupportedLegacyInterfaceValueType
    }

    public init() {}

    public func parse(
        type: RemodelType,
        source: String
    ) throws -> RMModelSyntax? {
        var state = State.parsingTypeAndHeader

        let typeRegex = /^%type((?:\s+[\w"]+=[\w"]+)*)/
        // let legacyImportRegex = /#import\s+(?:"([\w\._]+)"|<([\w_]+)\/([\w\._]+)>)/

        // Matches the following
        // - TrackV2ConfigValue {
        // - TrackV2ConfigValue includes(RMAssumeNonnull, RMEquality) {
        // - TrackV2ConfigValue includes(RMAssumeNonnull, RMEquality) excludes(RMDescription) {
        let headerRegex = /^(\w+)(?:\s*includes\(([^)]*)\))?(?:\s*excludes\(([^)]*)\))?(\s*{)?/

        let adtHeaderRegex = /^(\w+)(:\d+)?(\s*{)?/

        let legacyInterfaceHeaderRegex = /^interface\s*(\w+)/

        // Matches the following
        // - BOOL enableAttachment
        // - %nullable NSArray<NSNumber *> *supportedTypes
        // - NSDictionary<NSNumber *, NSString *> *parserRegexes
        let propertyRegex = /(?:(%nullable|%nonnull)\s+)?(\S+(?:\<[^>]+\>)?\s+\*?)(\w+)\s*;?/

        let lines = source.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

        guard !lines.isEmpty && !lines.first!.isEmpty else {
            return nil
        }

        var comments: [String] = []
        var typeDecls: [RMTypeDeclSyntax] = []
        var modelName = ""
        var includes: [String] = []
        var excludes: [String] = []
        var properties: [RMPropertySyntax] = []
        var nextPropertyNullability: RMPropertyNullability?

        var propertyComments: [String] = []
        var adtInnerPropertyComments: [String] = []
        var adtInnerProperties: [RMPropertySyntax.StructValue] = []
        var adtName = ""

        for line in lines {
            let line = line.trimmingCharacters(in: .whitespaces)
            switch state {
            case .parsingTypeAndHeader:
                if line.hasPrefix("#") {
                    comments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: typeRegex) {
                    let typeParams = match.1.split(separator: " ").compactMap { $0.trimmingCharacters(in: .whitespaces) }
                    var paramName: String?
                    var paramFile: String?
                    var paramLib: String?
                    var paramCanForwardDeclare: Bool?

                    for typeParam in typeParams {
                        if let paramMatch = typeParam.firstMatch(of: /(\w+)="?([\w]+)"?/) {
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
                    guard let paramName = paramName ?? paramFile else {
                        throw ParseError.missingPropertyName(line)
                    }
                    typeDecls.append(RMTypeDeclSyntax(name: paramName, library: paramLib, file: paramFile, canForwardDeclare: paramCanForwardDeclare))

                } else if let _ = line.firstMatch(of: legacyInterfaceHeaderRegex) {
                    state = .parsingLegacyInterfaceProperties
                } else if let match = line.firstMatch(of: headerRegex) {
                    modelName = String(match.1)
                    includes = match.2?.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
                    excludes = match.3?.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
                    if match.4 != nil { // if contains trailing '{'
                        state = type == .value ? .parsingValueProperties : .parsingAdtValueProperties
                    }
                } else if line == "{" {
                    state = type == .value ? .parsingValueProperties : .parsingAdtValueProperties
                }
            case .parsingValueProperties:
                if line.hasPrefix("#") {
                    propertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: /^(%nullable|%nonnull)$/) {
                    nextPropertyNullability = String(match.1) == "%nullable" ? .null : .nonnull
                } else if let match = line.firstMatch(of: propertyRegex) {
                    var nullability: RMPropertyNullability? = match.1.map { $0 == "%nullable" ? .null : .nonnull }
                    if let nn = nextPropertyNullability {
                        nullability = nullability ?? nn
                        nextPropertyNullability = nil
                    }
                    let type = String(match.2).trimmingCharacters(in: .whitespaces)
                    let name = String(match.3)
                    properties.append(
                        RMPropertySyntax(
                            .value(
                                RMPropertySyntax.StructValue(
                                    comments: propertyComments,
                                    nullability: nullability,
                                    type: type,
                                    name: name
                                )
                            )
                        )
                    )
                    propertyComments = []
                }
                if line.hasSuffix("}") {
                    state = .end
                }
            case .parsingAdtValueProperties:
                if line.hasPrefix("#") {
                    propertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: adtHeaderRegex) {
                    adtName = String(match.1)
                    if match.3 != nil { // If trailing '{' exists
                        state = .parsingAdtInnerProperties
                    } else {
                        properties.append(
                            RMPropertySyntax(
                                .adt(
                                    RMPropertySyntax.AdtValue(
                                        comments: propertyComments,
                                        name: adtName,
                                        innerValues: []
                                    )
                                )
                            )
                        )
                        propertyComments = []
                    }
                } else if let match = line.firstMatch(of: /^(\w+)$/) {
                    properties.append(
                        RMPropertySyntax(
                            .adt(
                                RMPropertySyntax.AdtValue(
                                    comments: propertyComments,
                                    name: String(match.1),
                                    innerValues: []
                                )
                            )
                        )
                    )
                    propertyComments = []
                }
                if line.hasSuffix("}") {
                    state = .end
                }
            case .parsingAdtInnerProperties:
                if line.hasPrefix("#") {
                    adtInnerPropertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: propertyRegex) {
                    let nullability: RMPropertyNullability? = match.1.map { $0 == "%nullable" ? .null : .nonnull }
                    let type = String(match.2).trimmingCharacters(in: .whitespaces)
                    let name = String(match.3)
                    adtInnerProperties.append(
                        RMPropertySyntax.StructValue(
                            comments: adtInnerPropertyComments,
                            nullability: nullability,
                            type: type,
                            name: name
                        )
                    )

                    adtInnerPropertyComments = []
                }
                if line.hasSuffix("}") {
                    state = .parsingAdtValueProperties
                    properties.append(
                        RMPropertySyntax(
                            .adt(
                                RMPropertySyntax.AdtValue(
                                    comments: propertyComments,
                                    name: adtName,
                                    innerValues: adtInnerProperties
                                )
                            )
                        )
                    )
                    adtInnerProperties = []
                    propertyComments = []
                }
            case .parsingLegacyInterfaceProperties:
                if line.contains(/^end/) {
                    state = .end
                }
                throw ParseError.unsupportedLegacyInterfaceValueType
            case .end:
                break
            }
        }

        if state != .end {
            throw ParseError.unfinishedParsing
        }

        return RMModelSyntax(comments: comments, typeDecls: typeDecls, name: modelName, includes: includes, excludes: excludes, properties: properties)
    }
}

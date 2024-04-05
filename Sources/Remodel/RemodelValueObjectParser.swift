import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

public class RemodelValueObjectParser {
    enum State {
        case parsingTypeAndHeader
        case parsingProperties
        case parsingAdtInnerProperties
        case end
    }

    // https://engineering.fb.com/2016/04/13/ios/building-and-managing-ios-model-objects-with-remodel/
    public enum ModelType {
        /**
         MessageContent {
          ContentType(NSUInteger) type
          # Set if the type is ContentTypePhoto
          Photo *photo;
          # Set if the type is ContentTypeSticker
          NSInteger stickerId
          # Set if the type is ContentTypeText
          NSString *text
             }
         */
        case value

        /**
         MessageContent includes(RMCoding) {
           image {
             Photo *photo
           }
           sticker {
             NSInteger stickerId
           }
           text {
              NSString *body
           }
         }
         */
        case adtValue
    }

    enum ParseError: Error {
        case missingPropertyName(String)
        case unfinishedParsing
    }

    public func parse(
        type: ModelType,
        source: String
    ) throws -> RMModelSyntax {
        var state = State.parsingTypeAndHeader

        let typeRegex = /%type((?:\s+\w+=\w+)*)/

        // Matches `TrackV2ConfigValue includes(RMAssumeNonnull, RMEquality)`
        let headerRegex = /(\w+)\s*includes\(([^)]+)\)(?:\s*excludes\(([^)]+)\))?\s*{/

        // Matches the following
        // - BOOL enableAttachment
        // - %nullable NSArray<NSNumber *> *supportedTypes
        // - NSDictionary<NSNumber *, NSString *> *parserRegexes
        let propertyRegex = /(?:(%nullable)\s+)?(\S+(?:\<[^>]+\>)?\s+\*?)(\w+)\s*;?/
        let adtHeaderRegex = /(\w+)\s*{/

        let lines = source.components(separatedBy: .newlines)

        var comments: [String] = []
        var typeDecls: [RMTypeDeclSyntax] = []
        var modelName = ""
        var includes: [String] = []
        var excludes: [String] = []
        var properties: [RMPropertySyntax] = []

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
                    let typeParams = match.1.trimmingCharacters(in: .whitespaces).split(separator: " ")
                    var paramName: String?
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
                    guard let paramName = paramName else {
                        throw ParseError.missingPropertyName(line)
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
                    propertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: propertyRegex) {
                    let isNullable = match.1 != nil
                    let type = String(match.2).trimmingCharacters(in: .whitespaces)
                    let name = String(match.3)
                    properties.append(
                        RMPropertySyntax(
                            .value(
                                RMPropertySyntax.StructValue(
                                    comments: propertyComments,
                                    declaresIsNullable: isNullable,
                                    type: type,
                                    name: name
                                )
                            )
                        )
                    )
                    propertyComments = []
                } else if let match = line.firstMatch(of: adtHeaderRegex) {
                    adtName = String(match.1)
                    state = .parsingAdtInnerProperties
                }
                if line.hasSuffix("}") {
                    state = .end
                }
            case .parsingAdtInnerProperties:
                if line.hasPrefix("#") {
                    adtInnerPropertyComments.append(String(line[line.index(after: line.startIndex)...].trimmingCharacters(in: .whitespacesAndNewlines)))
                } else if let match = line.firstMatch(of: propertyRegex) {
                    let isNullable = match.1 != nil
                    let type = String(match.2).trimmingCharacters(in: .whitespaces)
                    let name = String(match.3)
                    adtInnerProperties.append(
                        RMPropertySyntax.StructValue(
                            comments: adtInnerPropertyComments,
                            declaresIsNullable: isNullable, 
                            type: type,
                            name: name
                        )
                    )

                    adtInnerPropertyComments = []
                }
                if line.hasSuffix("}") {
                    state = .parsingProperties
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
                    propertyComments = []
                }
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

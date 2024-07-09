import Antlr4
import ObjcSyntax
import RegexBuilder

struct MacroDefinition {
    let name: String
    let params: [String]
    let body: String
}
/// Preprocesses #define macros and replace those macros with the actual definitions
public class ObjcPreprocessor {
    let macroDefinitions: [MacroDefinition]
    
    public init(
        macroSources: [ObjectiveCPreprocessorParser.ObjectiveCDocumentContext]
    ) {
        var macroDefinitions = [MacroDefinition]()
        for macroSource in macroSources {
            for text in macroSource.text() {
                if let defineDirective = text.directive() as? PP.PreprocessorDefineContext {
                    let key = defineDirective.CONDITIONAL_SYMBOL()!.getText()
                    // Ignore metamacro because it creates so many clutter
                    if key.contains("metamacro") {
                        continue
                    }
                    var value = defineDirective.directive_text()?.getText() ?? ""
                    for existingMacroDefinition in macroDefinitions {
                        value = ObjcPreprocessor.expandMacro(existingMacroDefinition, in: value)
                    }
                    let macroDefinition = ObjcPreprocessor.parseMacroDefinition(key: key, value: value)
                    macroDefinitions.append(macroDefinition)
                }
                
                // Seek previously defined macros and replace if the new macro's definition relies on the previous
            }
        }
        self.macroDefinitions = macroDefinitions
    }
    
    private static func parseMacroDefinition(key: String, value: String) -> MacroDefinition {
        let components = key.components(separatedBy: "(")
        if components.count > 1 {
            let name = components[0].trimmingCharacters(in: .whitespaces)
            let params = components[1].replacingOccurrences(of: ")", with: "")
                .components(separatedBy: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
            return MacroDefinition(name: name, params: params, body: value)
        } else {
            return MacroDefinition(name: key, params: [], body: value)
        }
    }

    static func expandMacro(_ macro: MacroDefinition, in text: String) -> String {
        var result = text
        if macro.params.isEmpty {
            result = result.replacingOccurrences(of: macro.name, with: macro.body)
        } else {
            // Handle function-like macros
            let pattern = Regex {
                macro.name
                /\s*\((.*?)\)/
            }
            result = result.replacing(pattern) { match in
                let paramString = String(match.1)
                let args = paramString.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) }
                
                var replacedBody = macro.body
                for (index, paramAndArgs) in zip(macro.params, args).enumerated() {
                    let (param, arg) = paramAndArgs
                    if param == "..." {
                        replacedBody = replacedBody.replacingOccurrences(of: "__VA_ARGS__", with: args[index...].joined(separator: ","))
                    } else {
                        replacedBody = replacedBody.replacingOccurrences(of: param, with: arg)
                    }
                }
                return replacedBody
            }
        }
        return result
    }
    
    public func preprocess(_ source: CharStream) throws -> String {
        var allText = try source.getText(Interval(0, source.size() - 1))
        for macro in macroDefinitions {
            allText = ObjcPreprocessor.expandMacro(macro, in: allText)
        }
        // Remove _Pragma
        let pragmaPattern = /_Pragma\(\s*"(?:[^"\\]|\\.)*"\s*\)/
        allText.replace(pragmaPattern, with: "")
//        print(allText)
        return allText
    }
}

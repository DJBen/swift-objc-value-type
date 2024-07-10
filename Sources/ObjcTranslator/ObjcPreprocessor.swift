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
    
    // Keep track of all the ifdefs.
    struct IfDefState {
        var ifDefs = [String]()
        var ifNDefs = [String]()
        var isLastIfDefs: [Bool] = []
        
        mutating func ifDef(_ def: String) {
            ifDefs.append(def)
            isLastIfDefs.append(true)
        }
        
        mutating func ifNDef(_ def: String) {
            ifNDefs.append(def)
            isLastIfDefs.append(false)
        }
        
        mutating func elseBranch() {
            let isLastIfDef = isLastIfDefs.removeLast()
            if isLastIfDef {
                let def = ifDefs.removeLast()
                ifNDefs.append(def)
                isLastIfDefs.append(false)
            } else {
                let def = ifNDefs.removeLast()
                ifDefs.append(def)
                isLastIfDefs.append(true)
            }
        }
        
        mutating func elif(_ def: String) {
            let isLastIfDef = isLastIfDefs.removeLast()
            if isLastIfDef {
                ifDefs.removeLast()
            } else {
                ifNDefs.removeLast()
            }
            ifDefs.append(def)
            isLastIfDefs.append(true)
        }
        
        mutating func endIf() {
            let isLastIfDef = isLastIfDefs.removeLast()
            if isLastIfDef {
                ifDefs.removeLast()
            } else {
                ifNDefs.removeLast()
            }
        }
        
        func isInContext(_ definedSymbols: [String]) -> Bool {
            return ifDefs.allSatisfy({ definedSymbols.contains($0) }) &&
            ifNDefs.allSatisfy({ !definedSymbols.contains($0) })
        }
    }
    
    private(set) var definedSymbols: [String]

    public init(
        macroSources: [ObjectiveCPreprocessorParser.ObjectiveCDocumentContext],
        definedSymbols: [String]
    ) {
        var macroDefinitions = [MacroDefinition]()
        for macroSource in macroSources {
            var ifDefState = IfDefState()
            for text in macroSource.text() {
                if let defDirective = text.directive() as? PP.PreprocessorDefContext {
                    if defDirective.IFDEF() != nil {
                        ifDefState.ifDef(defDirective.CONDITIONAL_SYMBOL()!.getText())
                    } else if defDirective.IFNDEF() != nil {
                        ifDefState.ifNDef(defDirective.CONDITIONAL_SYMBOL()!.getText())
                    }
                } else if let conditional = text.directive() as? PP.PreprocessorConditionalContext {
                    if conditional.IF() != nil {
                        ifDefState.ifDef(conditional.preprocessor_expression()!.getText())
                    } else if conditional.ELIF() != nil {
                        ifDefState.elif(conditional.preprocessor_expression()!.getText())
                    } else if conditional.ELSE() != nil {
                        ifDefState.elseBranch()
                    } else if conditional.ENDIF() != nil {
                        ifDefState.endIf()
                    }
                } else if let defineDirective = text.directive() as? PP.PreprocessorDefineContext {
                    guard ifDefState.isInContext(definedSymbols) else {
                        continue
                    }
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
        self.definedSymbols = definedSymbols
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
                /\s*\(((?:.|\n|\r)*?)\)/
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
                        // Support stringizing https://gcc.gnu.org/onlinedocs/cpp/Stringizing.html
                        replacedBody = replacedBody.replacingOccurrences(of: "#\(param)", with: "\"\(arg)\"")
                        replacedBody = replacedBody.replacingOccurrences(of: param, with: arg)
                    }
                }
                // Support concatenation https://gcc.gnu.org/onlinedocs/cpp/Concatenation.html
                replacedBody.replace(/##/) { match in
                    ""
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
        print(allText)
        return allText
    }
}

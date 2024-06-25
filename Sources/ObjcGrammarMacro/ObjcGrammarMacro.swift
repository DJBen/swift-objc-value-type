
import SwiftSyntax
import SwiftSyntaxMacros
import ObjcGrammar

#if canImport(SwiftCompilerPlugin)
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct ObjcGrammarCompilerPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ObjcGrammarTypeMacro.self,
    ]
}
#endif

public enum ObjcGrammarTypeMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        return []
    }
}

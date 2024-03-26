
import SwiftSyntax
import SwiftSyntaxMacros
import SwiftObjcValueType

#if canImport(SwiftCompilerPlugin)
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SwiftObjcValueTypeCompilerPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SwiftObjcValueTypeMacro.self,
    ]
}
#endif

public enum SwiftObjcValueTypeMacro: PeerMacro {
    private static let factory = SwiftObjcValueTypeFactory()

    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        return []
//        let protocolDecl = try extractor.extractProtocolDecl(from: declaration)
//        return try factory.decls(
//            protocolDecl: protocolDecl,
//            surroundWithPoundIfDebug: true,
//            excludeProtocols: [],
//            importDeclsToCopy: [],
//            customGenericTypes: [:],
//            customSnippet: nil,
//            onlyGenerateForPublicProtocols: false,
//            verbose: false
//        )
    }
}

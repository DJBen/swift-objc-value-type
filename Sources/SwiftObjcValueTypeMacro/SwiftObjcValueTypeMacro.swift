
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
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            return try factory.wrappingClassDeclInMacro(
                structDecl: structDecl,
                prefix: "",
                imports: [],
                shouldSynthesizeNSCoding: true,
                shouldSynthesizeNSCopying: true,
                shouldSynthesizeObjCBuilder: true
            )
            .map(DeclSyntax.init)
        }
        return []
    }
}


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
                structDecl: structDecl
            )
            .map(DeclSyntax.init)
        } else if let enumDecl = declaration.as(EnumDeclSyntax.self) {
            return try factory.wrappingClassDeclInMacro(
                enumDecl: enumDecl
            )
            .map(DeclSyntax.init)
        }
        return []
    }
}

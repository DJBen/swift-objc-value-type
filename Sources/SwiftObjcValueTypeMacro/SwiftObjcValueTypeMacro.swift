
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

public enum SwiftObjcValueTypeMacro: PeerMacro, ExtensionMacro {
    private static let factory = SwiftObjcValueTypeFactory()

    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            var objcValueWrapperNSCopying = false
            var objcValueWrapperNSCoding = false
            var objcValueWrapperObjcBuilder = false
            if let macro = structDecl.attributes.objcValueWrapperMacro {
                objcValueWrapperNSCopying = macro.objcValueWrapperNSCopying ?? false
                objcValueWrapperNSCoding = macro.objcValueWrapperNSCoding ?? false
                objcValueWrapperObjcBuilder = macro.objcValueWrapperObjcBuilder ?? false
            }
            
            return try factory.wrappingClassDeclForPeerMacro(
                structDecl: structDecl,
                shouldSynthesizeNSCoding: objcValueWrapperNSCopying,
                shouldSynthesizeNSCopying: objcValueWrapperNSCoding,
                shouldSynthesizeObjcBuilder: objcValueWrapperObjcBuilder
            )
            .map(DeclSyntax.init)
        } else if let enumDecl = declaration.as(EnumDeclSyntax.self) {
            var objcValueWrapperNSCopying = false
            var objcValueWrapperNSCoding = false
            if let macro = enumDecl.attributes.objcValueWrapperMacro {
                objcValueWrapperNSCopying = macro.objcValueWrapperNSCopying ?? false
                objcValueWrapperNSCoding = macro.objcValueWrapperNSCoding ?? false
            }
            
            return try factory.wrappingClassDeclForPeerMacro(
                enumDecl: enumDecl,
                shouldSynthesizeNSCoding: objcValueWrapperNSCopying,
                shouldSynthesizeNSCopying: objcValueWrapperNSCoding
            )
            .map(DeclSyntax.init)
        }
        return []
    }
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            return try factory.extensionDecl(
                structDecl: structDecl,
                referencedSwiftTypes: []
            )
        } else if let enumDecl = declaration.as(EnumDeclSyntax.self) {
            return try factory.extensionDecl(
                enumDecl: enumDecl,
                referencedSwiftTypes: []
            )
        }
        
        return []
    }
}

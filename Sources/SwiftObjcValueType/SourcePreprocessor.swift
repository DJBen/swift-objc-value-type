import SwiftSyntax
import SwiftSyntaxBuilder

/// When input contains multiple files, if one struct references another, their objective-C wrapper aliases
/// need to be communicated with one another.
public class SourcePreprocessor {
    private var referencedTypes: Set<TypeSyntax> = []
    private var structNames: Set<String> = []

    public init() {}

    public func addSource(
        sourceFileSyntax: SourceFileSyntax
    ) {
        for codeBlockItem in sourceFileSyntax.statements {
            if let structDecl = codeBlockItem.item.as(StructDeclSyntax.self) {
                let structName = structDecl.name.trimmed.text
                structNames.insert(structName)
                for member in structDecl.memberBlock.members {
                    if let variableDecl = member.decl.as(VariableDeclSyntax.self) {
                        for binding in variableDecl.bindings {
                            guard let typeAnnotation = binding.typeAnnotation else {
                                continue
                            }
                            referencedTypes.insert(typeAnnotation.type.trimmed)
                        }
                    }
                }
            }
        }
    }
    
    /// Returns all struct types that are referenced within the source's structs as properties.
    ///
    /// This is used to hint the alias of the objc wrapper type.
    /// - Returns: a list of struct types that are declared and referenced within the source.
    public func referencedStructTypes() -> [String] {
        referencedTypes.compactMap { type -> String? in
            if let identifier = type.as(IdentifierTypeSyntax.self) {
                if structNames.contains(identifier.trimmed.name.text) {
                    return identifier.trimmed.name.text
                }
            }
            return nil
        }
    }
}

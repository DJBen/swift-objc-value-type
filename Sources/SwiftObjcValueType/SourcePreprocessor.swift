import SwiftSyntax
import SwiftSyntaxBuilder

/// When input contains multiple files, if one struct references another, their objective-C wrapper aliases
/// need to be communicated with one another.
public class SourcePreprocessor {
    private var referencedTypes: Set<TypeSyntax> = []
    private var containerTypes: Set<String> = []

    public init() {}

    public func addSource(
        sourceFileSyntax: SourceFileSyntax
    ) {
        for codeBlockItem in sourceFileSyntax.statements {
            if let structDecl = codeBlockItem.item.as(StructDeclSyntax.self) {
                let structName = structDecl.name.trimmed.text
                containerTypes.insert(structName)
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
            } else if let enumDecl = codeBlockItem.item.as(EnumDeclSyntax.self) {
                let enumName = enumDecl.name.trimmed.text
                containerTypes.insert(enumName)
                for member in enumDecl.memberBlock.members {
                    if let enumCaseDecl = member.decl.as(EnumCaseDeclSyntax.self) {
                        for element in enumCaseDecl.elements {
                            for param in element.parameterClause?.parameters ?? [] {
                                referencedTypes.insert(param.type.trimmed)
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Returns all Swift types that are referenced within the source as properties.
    ///
    /// This is used to alias the type in objc wrapper.
    /// - Returns: a list of Swift types that are referenced within the source as properties.
    public var referencedSwiftTypes: [String] {
        referencedTypes.compactMap { type -> String? in
            if let identifier = type.as(IdentifierTypeSyntax.self) {
                if containerTypes.contains(identifier.trimmed.name.text) {
                    return identifier.trimmed.name.text
                }
            }
            return nil
        }
    }
}

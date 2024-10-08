import SharedUtilities
import ObjcSyntax

public extension TypeMappings {
    init(
        _ translationUnit: ObjectiveCParser.TranslationUnitContext,
        existingPrefix: String,
        typeRegexesExcludedFromPrefixStripping: [any RegexComponent]
    ) {
        var swiftTypeMappings = [String: String]()
        for topLevelDecl in translationUnit.topLevelDeclaration() {
            if let classInterfaceDecl = topLevelDecl.classInterface() {
                let className = classInterfaceDecl.className.getText()
                if typeRegexesExcludedFromPrefixStripping.contains(where: {
                    className.contains($0)
                }) {
                    continue
                }
                
                swiftTypeMappings[className] = className.removingPrefix(
                    existingPrefix,
                    typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping
                )
            } else if let protocolDecl = topLevelDecl.protocolDeclaration() {
                let protocolName = protocolDecl.protocolName()!.getText()
                if typeRegexesExcludedFromPrefixStripping.contains(where: {
                    protocolName.contains($0)
                }) {
                    continue
                }
                
                if let macro = protocolDecl.macro(), macro.identifier().contains(where: { $0.NS_SWIFT_NAME() != nil }), let swiftName = macro.primaryExpression().first?.getText() {
                    // No swift type migration takes place
                    let _ = swiftName
                } else {
                    swiftTypeMappings[protocolName] = protocolName.removingPrefix(
                        existingPrefix,
                        typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping
                    )
                }
            } else if let decl = topLevelDecl.declaration() {
                // declaration
                //    : functionCallExpression
                //    | enumDeclaration
                //    | varDeclaration
                //    | typedefDeclaration
                //    ;
                if let enumDecl = decl.enumDeclaration() {
                    // Includes enum and optionSet decls
                    if let typedefEnumIdentifier = enumDecl.identifier()?.getText() {
                        swiftTypeMappings[typedefEnumIdentifier] = typedefEnumIdentifier.removingPrefix(
                            existingPrefix,
                            typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping
                        )
                    } else if let nsEnumOrOptionSpecifier = enumDecl.nsEnumOrOptionSpecifier(), let identifier = nsEnumOrOptionSpecifier.identifier()?.getText() {
                        swiftTypeMappings[identifier] = identifier.removingPrefix(
                            existingPrefix,
                            typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping
                        )
                    }
                        
                } else if let _ = decl.varDeclaration() {
                    // Do not strip prefix for variables
                }
            }
        }
        
        self.init(
            swiftValueTypes: [],
            swiftTypeMappings: swiftTypeMappings,
            typedefBlockNames: translationUnit.typedefBlockNames
        )
    }
}

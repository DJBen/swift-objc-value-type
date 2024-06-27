import ArgumentParser
import Foundation
import ObjcGrammar
import SwiftParser
import SwiftSyntax
import Antlr4
import CustomDump

struct ParseObjcCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "parse-objc",
        abstract: """
        Prase Objective-C code into syntax tree.
        """,
        discussion: """
        """
    )

    @OptionGroup
    var fileArguments: FileHandlingArguments
    
    @Flag
    var noOutput: Bool = false

    func run() throws {
        if fileArguments.sourcePaths.isEmpty {
            // Read from stdin
            try parse(
                ANTLRInputStream(
                    String(
                        data: FileHandle.standardInput.readDataToEndOfFile(),
                        encoding: .unicode
                    )!
                )
            )
        } else {
            var sourceFilesIterator = SourceFileIterator(
                sourcePaths: Set(fileArguments.sourcePaths),
                filteringExtension: {
                    ["h"].contains($0.lowercased())
                }
            )
            while let sourceFile = sourceFilesIterator.next() {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(sourceFile.path))")
                }
            
                try parse(
                    try ANTLRFileStream(sourceFile.path)
                )
            }
        }
    }
    
    private func parse(_ charStream: CharStream) throws {
        let lexer = ObjectiveCLexer(charStream)

        let parser = try ObjectiveCParser(CommonTokenStream(lexer))
        let translationUnit = try parser.translationUnit()
        let listener = Listener()
        let walker = ParseTreeWalker()
        try walker.walk(listener, translationUnit)
    }
}

class Listener: ObjectiveCParserListener {
    func enterTranslationUnit(_ ctx: ObjectiveCParser.TranslationUnitContext) {
        
    }
    
    func exitTranslationUnit(_ ctx: ObjectiveCParser.TranslationUnitContext) {
        
    }
    
    func enterTopLevelDeclaration(_ ctx: ObjectiveCParser.TopLevelDeclarationContext) {
        
    }
    
    func exitTopLevelDeclaration(_ ctx: ObjectiveCParser.TopLevelDeclarationContext) {
        
    }
    
    func enterImportDeclaration(_ ctx: ObjectiveCParser.ImportDeclarationContext) {
        
    }
    
    func exitImportDeclaration(_ ctx: ObjectiveCParser.ImportDeclarationContext) {
        
    }
    
    func enterClassInterface(_ ctx: ObjectiveCParser.ClassInterfaceContext) {
        
    }
    
    func exitClassInterface(_ ctx: ObjectiveCParser.ClassInterfaceContext) {
        
    }
    
    func enterCategoryInterface(_ ctx: ObjectiveCParser.CategoryInterfaceContext) {
        
    }
    
    func exitCategoryInterface(_ ctx: ObjectiveCParser.CategoryInterfaceContext) {
        
    }
    
    func enterClassImplementation(_ ctx: ObjectiveCParser.ClassImplementationContext) {
        
    }
    
    func exitClassImplementation(_ ctx: ObjectiveCParser.ClassImplementationContext) {
        
    }
    
    func enterCategoryImplementation(_ ctx: ObjectiveCParser.CategoryImplementationContext) {
        
    }
    
    func exitCategoryImplementation(_ ctx: ObjectiveCParser.CategoryImplementationContext) {
        
    }
    
    func enterGenericTypeSpecifier(_ ctx: ObjectiveCParser.GenericTypeSpecifierContext) {
        
    }
    
    func exitGenericTypeSpecifier(_ ctx: ObjectiveCParser.GenericTypeSpecifierContext) {
        
    }
    
    func enterProtocolDeclaration(_ ctx: ObjectiveCParser.ProtocolDeclarationContext) {
        
    }
    
    func exitProtocolDeclaration(_ ctx: ObjectiveCParser.ProtocolDeclarationContext) {
        
    }
    
    func enterProtocolDeclarationSection(_ ctx: ObjectiveCParser.ProtocolDeclarationSectionContext) {
        
    }
    
    func exitProtocolDeclarationSection(_ ctx: ObjectiveCParser.ProtocolDeclarationSectionContext) {
        
    }
    
    func enterProtocolDeclarationList(_ ctx: ObjectiveCParser.ProtocolDeclarationListContext) {
        
    }
    
    func exitProtocolDeclarationList(_ ctx: ObjectiveCParser.ProtocolDeclarationListContext) {
        
    }
    
    func enterClassDeclarationList(_ ctx: ObjectiveCParser.ClassDeclarationListContext) {
        
    }
    
    func exitClassDeclarationList(_ ctx: ObjectiveCParser.ClassDeclarationListContext) {
        
    }
    
    func enterProtocolList(_ ctx: ObjectiveCParser.ProtocolListContext) {
        
    }
    
    func exitProtocolList(_ ctx: ObjectiveCParser.ProtocolListContext) {
        
    }
    
    func enterPropertyDeclaration(_ ctx: ObjectiveCParser.PropertyDeclarationContext) {
        
    }
    
    func exitPropertyDeclaration(_ ctx: ObjectiveCParser.PropertyDeclarationContext) {
        
    }
    
    func enterPropertyAttributesList(_ ctx: ObjectiveCParser.PropertyAttributesListContext) {
        
    }
    
    func exitPropertyAttributesList(_ ctx: ObjectiveCParser.PropertyAttributesListContext) {
        
    }
    
    func enterPropertyAttribute(_ ctx: ObjectiveCParser.PropertyAttributeContext) {
        
    }
    
    func exitPropertyAttribute(_ ctx: ObjectiveCParser.PropertyAttributeContext) {
        
    }
    
    func enterProtocolName(_ ctx: ObjectiveCParser.ProtocolNameContext) {
        
    }
    
    func exitProtocolName(_ ctx: ObjectiveCParser.ProtocolNameContext) {
        
    }
    
    func enterInstanceVariables(_ ctx: ObjectiveCParser.InstanceVariablesContext) {
        
    }
    
    func exitInstanceVariables(_ ctx: ObjectiveCParser.InstanceVariablesContext) {
        
    }
    
    func enterVisibilitySection(_ ctx: ObjectiveCParser.VisibilitySectionContext) {
        
    }
    
    func exitVisibilitySection(_ ctx: ObjectiveCParser.VisibilitySectionContext) {
        
    }
    
    func enterAccessModifier(_ ctx: ObjectiveCParser.AccessModifierContext) {
        
    }
    
    func exitAccessModifier(_ ctx: ObjectiveCParser.AccessModifierContext) {
        
    }
    
    func enterInterfaceDeclarationList(_ ctx: ObjectiveCParser.InterfaceDeclarationListContext) {
        
    }
    
    func exitInterfaceDeclarationList(_ ctx: ObjectiveCParser.InterfaceDeclarationListContext) {
        
    }
    
    func enterClassMethodDeclaration(_ ctx: ObjectiveCParser.ClassMethodDeclarationContext) {
        
    }
    
    func exitClassMethodDeclaration(_ ctx: ObjectiveCParser.ClassMethodDeclarationContext) {
        
    }
    
    func enterInstanceMethodDeclaration(_ ctx: ObjectiveCParser.InstanceMethodDeclarationContext) {
        
    }
    
    func exitInstanceMethodDeclaration(_ ctx: ObjectiveCParser.InstanceMethodDeclarationContext) {
        
    }
    
    func enterMethodDeclaration(_ ctx: ObjectiveCParser.MethodDeclarationContext) {
        
    }
    
    func exitMethodDeclaration(_ ctx: ObjectiveCParser.MethodDeclarationContext) {
        
    }
    
    func enterImplementationDefinitionList(_ ctx: ObjectiveCParser.ImplementationDefinitionListContext) {
        
    }
    
    func exitImplementationDefinitionList(_ ctx: ObjectiveCParser.ImplementationDefinitionListContext) {
        
    }
    
    func enterClassMethodDefinition(_ ctx: ObjectiveCParser.ClassMethodDefinitionContext) {
        
    }
    
    func exitClassMethodDefinition(_ ctx: ObjectiveCParser.ClassMethodDefinitionContext) {
        
    }
    
    func enterInstanceMethodDefinition(_ ctx: ObjectiveCParser.InstanceMethodDefinitionContext) {
        
    }
    
    func exitInstanceMethodDefinition(_ ctx: ObjectiveCParser.InstanceMethodDefinitionContext) {
        
    }
    
    func enterMethodDefinition(_ ctx: ObjectiveCParser.MethodDefinitionContext) {
        
    }
    
    func exitMethodDefinition(_ ctx: ObjectiveCParser.MethodDefinitionContext) {
        
    }
    
    func enterMethodSelector(_ ctx: ObjectiveCParser.MethodSelectorContext) {
        
    }
    
    func exitMethodSelector(_ ctx: ObjectiveCParser.MethodSelectorContext) {
        
    }
    
    func enterKeywordDeclarator(_ ctx: ObjectiveCParser.KeywordDeclaratorContext) {
        
    }
    
    func exitKeywordDeclarator(_ ctx: ObjectiveCParser.KeywordDeclaratorContext) {
        
    }
    
    func enterSelector(_ ctx: ObjectiveCParser.SelectorContext) {
        
    }
    
    func exitSelector(_ ctx: ObjectiveCParser.SelectorContext) {
        
    }
    
    func enterMethodType(_ ctx: ObjectiveCParser.MethodTypeContext) {
        
    }
    
    func exitMethodType(_ ctx: ObjectiveCParser.MethodTypeContext) {
        
    }
    
    func enterPropertyImplementation(_ ctx: ObjectiveCParser.PropertyImplementationContext) {
        
    }
    
    func exitPropertyImplementation(_ ctx: ObjectiveCParser.PropertyImplementationContext) {
        
    }
    
    func enterPropertySynthesizeList(_ ctx: ObjectiveCParser.PropertySynthesizeListContext) {
        
    }
    
    func exitPropertySynthesizeList(_ ctx: ObjectiveCParser.PropertySynthesizeListContext) {
        
    }
    
    func enterPropertySynthesizeItem(_ ctx: ObjectiveCParser.PropertySynthesizeItemContext) {
        
    }
    
    func exitPropertySynthesizeItem(_ ctx: ObjectiveCParser.PropertySynthesizeItemContext) {
        
    }
    
    func enterBlockType(_ ctx: ObjectiveCParser.BlockTypeContext) {
        
    }
    
    func exitBlockType(_ ctx: ObjectiveCParser.BlockTypeContext) {
        
    }
    
    func enterGenericsSpecifier(_ ctx: ObjectiveCParser.GenericsSpecifierContext) {
        
    }
    
    func exitGenericsSpecifier(_ ctx: ObjectiveCParser.GenericsSpecifierContext) {
        
    }
    
    func enterTypeSpecifierWithPrefixes(_ ctx: ObjectiveCParser.TypeSpecifierWithPrefixesContext) {
        
    }
    
    func exitTypeSpecifierWithPrefixes(_ ctx: ObjectiveCParser.TypeSpecifierWithPrefixesContext) {
        
    }
    
    func enterDictionaryExpression(_ ctx: ObjectiveCParser.DictionaryExpressionContext) {
        
    }
    
    func exitDictionaryExpression(_ ctx: ObjectiveCParser.DictionaryExpressionContext) {
        
    }
    
    func enterDictionaryPair(_ ctx: ObjectiveCParser.DictionaryPairContext) {
        
    }
    
    func exitDictionaryPair(_ ctx: ObjectiveCParser.DictionaryPairContext) {
        
    }
    
    func enterArrayExpression(_ ctx: ObjectiveCParser.ArrayExpressionContext) {
        
    }
    
    func exitArrayExpression(_ ctx: ObjectiveCParser.ArrayExpressionContext) {
        
    }
    
    func enterBoxExpression(_ ctx: ObjectiveCParser.BoxExpressionContext) {
        
    }
    
    func exitBoxExpression(_ ctx: ObjectiveCParser.BoxExpressionContext) {
        
    }
    
    func enterBlockParameters(_ ctx: ObjectiveCParser.BlockParametersContext) {
        
    }
    
    func exitBlockParameters(_ ctx: ObjectiveCParser.BlockParametersContext) {
        
    }
    
    func enterTypeVariableDeclaratorOrName(_ ctx: ObjectiveCParser.TypeVariableDeclaratorOrNameContext) {
        
    }
    
    func exitTypeVariableDeclaratorOrName(_ ctx: ObjectiveCParser.TypeVariableDeclaratorOrNameContext) {
        
    }
    
    func enterBlockExpression(_ ctx: ObjectiveCParser.BlockExpressionContext) {
        
    }
    
    func exitBlockExpression(_ ctx: ObjectiveCParser.BlockExpressionContext) {
        
    }
    
    func enterMessageExpression(_ ctx: ObjectiveCParser.MessageExpressionContext) {
        
    }
    
    func exitMessageExpression(_ ctx: ObjectiveCParser.MessageExpressionContext) {
        
    }
    
    func enterReceiver(_ ctx: ObjectiveCParser.ReceiverContext) {
        
    }
    
    func exitReceiver(_ ctx: ObjectiveCParser.ReceiverContext) {
        
    }
    
    func enterMessageSelector(_ ctx: ObjectiveCParser.MessageSelectorContext) {
        
    }
    
    func exitMessageSelector(_ ctx: ObjectiveCParser.MessageSelectorContext) {
        
    }
    
    func enterKeywordArgument(_ ctx: ObjectiveCParser.KeywordArgumentContext) {
        
    }
    
    func exitKeywordArgument(_ ctx: ObjectiveCParser.KeywordArgumentContext) {
        
    }
    
    func enterKeywordArgumentType(_ ctx: ObjectiveCParser.KeywordArgumentTypeContext) {
        
    }
    
    func exitKeywordArgumentType(_ ctx: ObjectiveCParser.KeywordArgumentTypeContext) {
        
    }
    
    func enterSelectorExpression(_ ctx: ObjectiveCParser.SelectorExpressionContext) {
        
    }
    
    func exitSelectorExpression(_ ctx: ObjectiveCParser.SelectorExpressionContext) {
        
    }
    
    func enterSelectorName(_ ctx: ObjectiveCParser.SelectorNameContext) {
        
    }
    
    func exitSelectorName(_ ctx: ObjectiveCParser.SelectorNameContext) {
        
    }
    
    func enterProtocolExpression(_ ctx: ObjectiveCParser.ProtocolExpressionContext) {
        
    }
    
    func exitProtocolExpression(_ ctx: ObjectiveCParser.ProtocolExpressionContext) {
        
    }
    
    func enterEncodeExpression(_ ctx: ObjectiveCParser.EncodeExpressionContext) {
        
    }
    
    func exitEncodeExpression(_ ctx: ObjectiveCParser.EncodeExpressionContext) {
        
    }
    
    func enterTypeVariableDeclarator(_ ctx: ObjectiveCParser.TypeVariableDeclaratorContext) {
        
    }
    
    func exitTypeVariableDeclarator(_ ctx: ObjectiveCParser.TypeVariableDeclaratorContext) {
        
    }
    
    func enterThrowStatement(_ ctx: ObjectiveCParser.ThrowStatementContext) {
        
    }
    
    func exitThrowStatement(_ ctx: ObjectiveCParser.ThrowStatementContext) {
        
    }
    
    func enterTryBlock(_ ctx: ObjectiveCParser.TryBlockContext) {
        
    }
    
    func exitTryBlock(_ ctx: ObjectiveCParser.TryBlockContext) {
        
    }
    
    func enterCatchStatement(_ ctx: ObjectiveCParser.CatchStatementContext) {
        
    }
    
    func exitCatchStatement(_ ctx: ObjectiveCParser.CatchStatementContext) {
        
    }
    
    func enterSynchronizedStatement(_ ctx: ObjectiveCParser.SynchronizedStatementContext) {
        
    }
    
    func exitSynchronizedStatement(_ ctx: ObjectiveCParser.SynchronizedStatementContext) {
        
    }
    
    func enterAutoreleaseStatement(_ ctx: ObjectiveCParser.AutoreleaseStatementContext) {
        
    }
    
    func exitAutoreleaseStatement(_ ctx: ObjectiveCParser.AutoreleaseStatementContext) {
        
    }
    
    func enterFunctionDeclaration(_ ctx: ObjectiveCParser.FunctionDeclarationContext) {
        
    }
    
    func exitFunctionDeclaration(_ ctx: ObjectiveCParser.FunctionDeclarationContext) {
        
    }
    
    func enterFunctionDefinition(_ ctx: ObjectiveCParser.FunctionDefinitionContext) {
        
    }
    
    func exitFunctionDefinition(_ ctx: ObjectiveCParser.FunctionDefinitionContext) {
        
    }
    
    func enterFunctionSignature(_ ctx: ObjectiveCParser.FunctionSignatureContext) {
        
    }
    
    func exitFunctionSignature(_ ctx: ObjectiveCParser.FunctionSignatureContext) {
        
    }
    
    func enterAttribute(_ ctx: ObjectiveCParser.AttributeContext) {
        
    }
    
    func exitAttribute(_ ctx: ObjectiveCParser.AttributeContext) {
        
    }
    
    func enterAttributeName(_ ctx: ObjectiveCParser.AttributeNameContext) {
        
    }
    
    func exitAttributeName(_ ctx: ObjectiveCParser.AttributeNameContext) {
        
    }
    
    func enterAttributeParameters(_ ctx: ObjectiveCParser.AttributeParametersContext) {
        
    }
    
    func exitAttributeParameters(_ ctx: ObjectiveCParser.AttributeParametersContext) {
        
    }
    
    func enterAttributeParameterList(_ ctx: ObjectiveCParser.AttributeParameterListContext) {
        
    }
    
    func exitAttributeParameterList(_ ctx: ObjectiveCParser.AttributeParameterListContext) {
        
    }
    
    func enterAttributeParameter(_ ctx: ObjectiveCParser.AttributeParameterContext) {
        
    }
    
    func exitAttributeParameter(_ ctx: ObjectiveCParser.AttributeParameterContext) {
        
    }
    
    func enterAttributeParameterAssignment(_ ctx: ObjectiveCParser.AttributeParameterAssignmentContext) {
        
    }
    
    func exitAttributeParameterAssignment(_ ctx: ObjectiveCParser.AttributeParameterAssignmentContext) {
        
    }
    
    func enterDeclaration(_ ctx: ObjectiveCParser.DeclarationContext) {
        
    }
    
    func exitDeclaration(_ ctx: ObjectiveCParser.DeclarationContext) {
        
    }
    
    func enterFunctionCallExpression(_ ctx: ObjectiveCParser.FunctionCallExpressionContext) {
        
    }
    
    func exitFunctionCallExpression(_ ctx: ObjectiveCParser.FunctionCallExpressionContext) {
        
    }
    
    func enterEnumDeclaration(_ ctx: ObjectiveCParser.EnumDeclarationContext) {
        
    }
    
    func exitEnumDeclaration(_ ctx: ObjectiveCParser.EnumDeclarationContext) {
        
    }
    
    func enterVarDeclaration(_ ctx: ObjectiveCParser.VarDeclarationContext) {
        
    }
    
    func exitVarDeclaration(_ ctx: ObjectiveCParser.VarDeclarationContext) {
        
    }
    
    func enterTypedefDeclaration(_ ctx: ObjectiveCParser.TypedefDeclarationContext) {
        
    }
    
    func exitTypedefDeclaration(_ ctx: ObjectiveCParser.TypedefDeclarationContext) {
        
    }
    
    func enterTypeDeclaratorList(_ ctx: ObjectiveCParser.TypeDeclaratorListContext) {
        
    }
    
    func exitTypeDeclaratorList(_ ctx: ObjectiveCParser.TypeDeclaratorListContext) {
        
    }
    
    func enterTypeDeclarator(_ ctx: ObjectiveCParser.TypeDeclaratorContext) {
        
    }
    
    func exitTypeDeclarator(_ ctx: ObjectiveCParser.TypeDeclaratorContext) {
        
    }
    
    func enterDeclarationSpecifiers(_ ctx: ObjectiveCParser.DeclarationSpecifiersContext) {
        
    }
    
    func exitDeclarationSpecifiers(_ ctx: ObjectiveCParser.DeclarationSpecifiersContext) {
        
    }
    
    func enterAttributeSpecifier(_ ctx: ObjectiveCParser.AttributeSpecifierContext) {
        
    }
    
    func exitAttributeSpecifier(_ ctx: ObjectiveCParser.AttributeSpecifierContext) {
        
    }
    
    func enterInitDeclaratorList(_ ctx: ObjectiveCParser.InitDeclaratorListContext) {
        
    }
    
    func exitInitDeclaratorList(_ ctx: ObjectiveCParser.InitDeclaratorListContext) {
        
    }
    
    func enterInitDeclarator(_ ctx: ObjectiveCParser.InitDeclaratorContext) {
        
    }
    
    func exitInitDeclarator(_ ctx: ObjectiveCParser.InitDeclaratorContext) {
        
    }
    
    func enterStructOrUnionSpecifier(_ ctx: ObjectiveCParser.StructOrUnionSpecifierContext) {
        
    }
    
    func exitStructOrUnionSpecifier(_ ctx: ObjectiveCParser.StructOrUnionSpecifierContext) {
        
    }
    
    func enterFieldDeclaration(_ ctx: ObjectiveCParser.FieldDeclarationContext) {
        
    }
    
    func exitFieldDeclaration(_ ctx: ObjectiveCParser.FieldDeclarationContext) {
        
    }
    
    func enterSpecifierQualifierList(_ ctx: ObjectiveCParser.SpecifierQualifierListContext) {
        
    }
    
    func exitSpecifierQualifierList(_ ctx: ObjectiveCParser.SpecifierQualifierListContext) {
        
    }
    
    func enterIbOutletQualifier(_ ctx: ObjectiveCParser.IbOutletQualifierContext) {
        
    }
    
    func exitIbOutletQualifier(_ ctx: ObjectiveCParser.IbOutletQualifierContext) {
        
    }
    
    func enterArcBehaviourSpecifier(_ ctx: ObjectiveCParser.ArcBehaviourSpecifierContext) {
        
    }
    
    func exitArcBehaviourSpecifier(_ ctx: ObjectiveCParser.ArcBehaviourSpecifierContext) {
        
    }
    
    func enterNullabilitySpecifier(_ ctx: ObjectiveCParser.NullabilitySpecifierContext) {
        
    }
    
    func exitNullabilitySpecifier(_ ctx: ObjectiveCParser.NullabilitySpecifierContext) {
        
    }
    
    func enterStorageClassSpecifier(_ ctx: ObjectiveCParser.StorageClassSpecifierContext) {
        
    }
    
    func exitStorageClassSpecifier(_ ctx: ObjectiveCParser.StorageClassSpecifierContext) {
        
    }
    
    func enterTypePrefix(_ ctx: ObjectiveCParser.TypePrefixContext) {
        
    }
    
    func exitTypePrefix(_ ctx: ObjectiveCParser.TypePrefixContext) {
        
    }
    
    func enterTypeQualifier(_ ctx: ObjectiveCParser.TypeQualifierContext) {
        
    }
    
    func exitTypeQualifier(_ ctx: ObjectiveCParser.TypeQualifierContext) {
        
    }
    
    func enterProtocolQualifier(_ ctx: ObjectiveCParser.ProtocolQualifierContext) {
        
    }
    
    func exitProtocolQualifier(_ ctx: ObjectiveCParser.ProtocolQualifierContext) {
        
    }
    
    func enterTypeSpecifier(_ ctx: ObjectiveCParser.TypeSpecifierContext) {
        
    }
    
    func exitTypeSpecifier(_ ctx: ObjectiveCParser.TypeSpecifierContext) {
        
    }
    
    func enterTypeofExpression(_ ctx: ObjectiveCParser.TypeofExpressionContext) {
        
    }
    
    func exitTypeofExpression(_ ctx: ObjectiveCParser.TypeofExpressionContext) {
        
    }
    
    func enterFieldDeclaratorList(_ ctx: ObjectiveCParser.FieldDeclaratorListContext) {
        
    }
    
    func exitFieldDeclaratorList(_ ctx: ObjectiveCParser.FieldDeclaratorListContext) {
        
    }
    
    func enterFieldDeclarator(_ ctx: ObjectiveCParser.FieldDeclaratorContext) {
        
    }
    
    func exitFieldDeclarator(_ ctx: ObjectiveCParser.FieldDeclaratorContext) {
        
    }
    
    func enterEnumSpecifier(_ ctx: ObjectiveCParser.EnumSpecifierContext) {
        
    }
    
    func exitEnumSpecifier(_ ctx: ObjectiveCParser.EnumSpecifierContext) {
        
    }
    
    func enterEnumeratorList(_ ctx: ObjectiveCParser.EnumeratorListContext) {
        
    }
    
    func exitEnumeratorList(_ ctx: ObjectiveCParser.EnumeratorListContext) {
        
    }
    
    func enterEnumerator(_ ctx: ObjectiveCParser.EnumeratorContext) {
        
    }
    
    func exitEnumerator(_ ctx: ObjectiveCParser.EnumeratorContext) {
        
    }
    
    func enterEnumeratorIdentifier(_ ctx: ObjectiveCParser.EnumeratorIdentifierContext) {
        
    }
    
    func exitEnumeratorIdentifier(_ ctx: ObjectiveCParser.EnumeratorIdentifierContext) {
        
    }
    
    func enterDirectDeclarator(_ ctx: ObjectiveCParser.DirectDeclaratorContext) {
        
    }
    
    func exitDirectDeclarator(_ ctx: ObjectiveCParser.DirectDeclaratorContext) {
        
    }
    
    func enterDeclaratorSuffix(_ ctx: ObjectiveCParser.DeclaratorSuffixContext) {
        
    }
    
    func exitDeclaratorSuffix(_ ctx: ObjectiveCParser.DeclaratorSuffixContext) {
        
    }
    
    func enterParameterList(_ ctx: ObjectiveCParser.ParameterListContext) {
        
    }
    
    func exitParameterList(_ ctx: ObjectiveCParser.ParameterListContext) {
        
    }
    
    func enterPointer(_ ctx: ObjectiveCParser.PointerContext) {
        
    }
    
    func exitPointer(_ ctx: ObjectiveCParser.PointerContext) {
        
    }
    
    func enterMacro(_ ctx: ObjectiveCParser.MacroContext) {
        
    }
    
    func exitMacro(_ ctx: ObjectiveCParser.MacroContext) {
        
    }
    
    func enterArrayInitializer(_ ctx: ObjectiveCParser.ArrayInitializerContext) {
        
    }
    
    func exitArrayInitializer(_ ctx: ObjectiveCParser.ArrayInitializerContext) {
        
    }
    
    func enterStructInitializer(_ ctx: ObjectiveCParser.StructInitializerContext) {
        
    }
    
    func exitStructInitializer(_ ctx: ObjectiveCParser.StructInitializerContext) {
        
    }
    
    func enterInitializerList(_ ctx: ObjectiveCParser.InitializerListContext) {
        
    }
    
    func exitInitializerList(_ ctx: ObjectiveCParser.InitializerListContext) {
        
    }
    
    func enterTypeName(_ ctx: ObjectiveCParser.TypeNameContext) {
        
    }
    
    func exitTypeName(_ ctx: ObjectiveCParser.TypeNameContext) {
        
    }
    
    func enterAbstractDeclarator(_ ctx: ObjectiveCParser.AbstractDeclaratorContext) {
        
    }
    
    func exitAbstractDeclarator(_ ctx: ObjectiveCParser.AbstractDeclaratorContext) {
        
    }
    
    func enterAbstractDeclaratorSuffix(_ ctx: ObjectiveCParser.AbstractDeclaratorSuffixContext) {
        
    }
    
    func exitAbstractDeclaratorSuffix(_ ctx: ObjectiveCParser.AbstractDeclaratorSuffixContext) {
        
    }
    
    func enterParameterDeclarationList(_ ctx: ObjectiveCParser.ParameterDeclarationListContext) {
        
    }
    
    func exitParameterDeclarationList(_ ctx: ObjectiveCParser.ParameterDeclarationListContext) {
        
    }
    
    func enterParameterDeclaration(_ ctx: ObjectiveCParser.ParameterDeclarationContext) {
        
    }
    
    func exitParameterDeclaration(_ ctx: ObjectiveCParser.ParameterDeclarationContext) {
        
    }
    
    func enterDeclarator(_ ctx: ObjectiveCParser.DeclaratorContext) {
        
    }
    
    func exitDeclarator(_ ctx: ObjectiveCParser.DeclaratorContext) {
        
    }
    
    func enterStatement(_ ctx: ObjectiveCParser.StatementContext) {
        
    }
    
    func exitStatement(_ ctx: ObjectiveCParser.StatementContext) {
        
    }
    
    func enterLabeledStatement(_ ctx: ObjectiveCParser.LabeledStatementContext) {
        
    }
    
    func exitLabeledStatement(_ ctx: ObjectiveCParser.LabeledStatementContext) {
        
    }
    
    func enterRangeExpression(_ ctx: ObjectiveCParser.RangeExpressionContext) {
        
    }
    
    func exitRangeExpression(_ ctx: ObjectiveCParser.RangeExpressionContext) {
        
    }
    
    func enterCompoundStatement(_ ctx: ObjectiveCParser.CompoundStatementContext) {
        
    }
    
    func exitCompoundStatement(_ ctx: ObjectiveCParser.CompoundStatementContext) {
        
    }
    
    func enterSelectionStatement(_ ctx: ObjectiveCParser.SelectionStatementContext) {
        
    }
    
    func exitSelectionStatement(_ ctx: ObjectiveCParser.SelectionStatementContext) {
        
    }
    
    func enterSwitchStatement(_ ctx: ObjectiveCParser.SwitchStatementContext) {
        
    }
    
    func exitSwitchStatement(_ ctx: ObjectiveCParser.SwitchStatementContext) {
        
    }
    
    func enterSwitchBlock(_ ctx: ObjectiveCParser.SwitchBlockContext) {
        
    }
    
    func exitSwitchBlock(_ ctx: ObjectiveCParser.SwitchBlockContext) {
        
    }
    
    func enterSwitchSection(_ ctx: ObjectiveCParser.SwitchSectionContext) {
        
    }
    
    func exitSwitchSection(_ ctx: ObjectiveCParser.SwitchSectionContext) {
        
    }
    
    func enterSwitchLabel(_ ctx: ObjectiveCParser.SwitchLabelContext) {
        
    }
    
    func exitSwitchLabel(_ ctx: ObjectiveCParser.SwitchLabelContext) {
        
    }
    
    func enterIterationStatement(_ ctx: ObjectiveCParser.IterationStatementContext) {
        
    }
    
    func exitIterationStatement(_ ctx: ObjectiveCParser.IterationStatementContext) {
        
    }
    
    func enterWhileStatement(_ ctx: ObjectiveCParser.WhileStatementContext) {
        
    }
    
    func exitWhileStatement(_ ctx: ObjectiveCParser.WhileStatementContext) {
        
    }
    
    func enterDoStatement(_ ctx: ObjectiveCParser.DoStatementContext) {
        
    }
    
    func exitDoStatement(_ ctx: ObjectiveCParser.DoStatementContext) {
        
    }
    
    func enterForStatement(_ ctx: ObjectiveCParser.ForStatementContext) {
        
    }
    
    func exitForStatement(_ ctx: ObjectiveCParser.ForStatementContext) {
        
    }
    
    func enterForLoopInitializer(_ ctx: ObjectiveCParser.ForLoopInitializerContext) {
        
    }
    
    func exitForLoopInitializer(_ ctx: ObjectiveCParser.ForLoopInitializerContext) {
        
    }
    
    func enterForInStatement(_ ctx: ObjectiveCParser.ForInStatementContext) {
        
    }
    
    func exitForInStatement(_ ctx: ObjectiveCParser.ForInStatementContext) {
        
    }
    
    func enterJumpStatement(_ ctx: ObjectiveCParser.JumpStatementContext) {
        
    }
    
    func exitJumpStatement(_ ctx: ObjectiveCParser.JumpStatementContext) {
        
    }
    
    func enterExpressions(_ ctx: ObjectiveCParser.ExpressionsContext) {
        
    }
    
    func exitExpressions(_ ctx: ObjectiveCParser.ExpressionsContext) {
        
    }
    
    func enterExpression(_ ctx: ObjectiveCParser.ExpressionContext) {
        
    }
    
    func exitExpression(_ ctx: ObjectiveCParser.ExpressionContext) {
        
    }
    
    func enterAssignmentOperator(_ ctx: ObjectiveCParser.AssignmentOperatorContext) {
        
    }
    
    func exitAssignmentOperator(_ ctx: ObjectiveCParser.AssignmentOperatorContext) {
        
    }
    
    func enterCastExpression(_ ctx: ObjectiveCParser.CastExpressionContext) {
        
    }
    
    func exitCastExpression(_ ctx: ObjectiveCParser.CastExpressionContext) {
        
    }
    
    func enterInitializer(_ ctx: ObjectiveCParser.InitializerContext) {
        
    }
    
    func exitInitializer(_ ctx: ObjectiveCParser.InitializerContext) {
        
    }
    
    func enterConstantExpression(_ ctx: ObjectiveCParser.ConstantExpressionContext) {
        
    }
    
    func exitConstantExpression(_ ctx: ObjectiveCParser.ConstantExpressionContext) {
        
    }
    
    func enterUnaryExpression(_ ctx: ObjectiveCParser.UnaryExpressionContext) {
        
    }
    
    func exitUnaryExpression(_ ctx: ObjectiveCParser.UnaryExpressionContext) {
        
    }
    
    func enterUnaryOperator(_ ctx: ObjectiveCParser.UnaryOperatorContext) {
        
    }
    
    func exitUnaryOperator(_ ctx: ObjectiveCParser.UnaryOperatorContext) {
        
    }
    
    func enterPostfixExpression(_ ctx: ObjectiveCParser.PostfixExpressionContext) {
        
    }
    
    func exitPostfixExpression(_ ctx: ObjectiveCParser.PostfixExpressionContext) {
        
    }
    
    func enterPostfix(_ ctx: ObjectiveCParser.PostfixContext) {
        
    }
    
    func exitPostfix(_ ctx: ObjectiveCParser.PostfixContext) {
        
    }
    
    func enterArgumentExpressionList(_ ctx: ObjectiveCParser.ArgumentExpressionListContext) {
        
    }
    
    func exitArgumentExpressionList(_ ctx: ObjectiveCParser.ArgumentExpressionListContext) {
        
    }
    
    func enterArgumentExpression(_ ctx: ObjectiveCParser.ArgumentExpressionContext) {
        
    }
    
    func exitArgumentExpression(_ ctx: ObjectiveCParser.ArgumentExpressionContext) {
        
    }
    
    func enterPrimaryExpression(_ ctx: ObjectiveCParser.PrimaryExpressionContext) {
        
    }
    
    func exitPrimaryExpression(_ ctx: ObjectiveCParser.PrimaryExpressionContext) {
        
    }
    
    func enterConstant(_ ctx: ObjectiveCParser.ConstantContext) {
        
    }
    
    func exitConstant(_ ctx: ObjectiveCParser.ConstantContext) {
        
    }
    
    func enterStringLiteral(_ ctx: ObjectiveCParser.StringLiteralContext) {
        
    }
    
    func exitStringLiteral(_ ctx: ObjectiveCParser.StringLiteralContext) {
        
    }
    
    func enterIdentifier(_ ctx: ObjectiveCParser.IdentifierContext) {
        
    }
    
    func exitIdentifier(_ ctx: ObjectiveCParser.IdentifierContext) {
        
    }
    
    func visitTerminal(_ node: TerminalNode) {
        
    }
    
    func visitErrorNode(_ node: ErrorNode) {
        
    }
    
    func enterEveryRule(_ ctx: ParserRuleContext) throws {
        
    }
    
    func exitEveryRule(_ ctx: ParserRuleContext) throws {
        
    }
}

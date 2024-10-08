// Generated from Sources/ObjcSyntax/ObjectiveCParser.g4 by ANTLR 4.13.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ObjectiveCParser}.
 */
public protocol ObjectiveCParserListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#translationUnit}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTranslationUnit(_ ctx: ObjectiveCParser.TranslationUnitContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#translationUnit}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTranslationUnit(_ ctx: ObjectiveCParser.TranslationUnitContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#topLevelDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTopLevelDeclaration(_ ctx: ObjectiveCParser.TopLevelDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#topLevelDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTopLevelDeclaration(_ ctx: ObjectiveCParser.TopLevelDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#importDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterImportDeclaration(_ ctx: ObjectiveCParser.ImportDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#importDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitImportDeclaration(_ ctx: ObjectiveCParser.ImportDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#classInterface}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClassInterface(_ ctx: ObjectiveCParser.ClassInterfaceContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#classInterface}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClassInterface(_ ctx: ObjectiveCParser.ClassInterfaceContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#categoryInterface}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCategoryInterface(_ ctx: ObjectiveCParser.CategoryInterfaceContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#categoryInterface}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCategoryInterface(_ ctx: ObjectiveCParser.CategoryInterfaceContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#classImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClassImplementation(_ ctx: ObjectiveCParser.ClassImplementationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#classImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClassImplementation(_ ctx: ObjectiveCParser.ClassImplementationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#categoryImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCategoryImplementation(_ ctx: ObjectiveCParser.CategoryImplementationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#categoryImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCategoryImplementation(_ ctx: ObjectiveCParser.CategoryImplementationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#genericTypeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterGenericTypeSpecifier(_ ctx: ObjectiveCParser.GenericTypeSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#genericTypeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitGenericTypeSpecifier(_ ctx: ObjectiveCParser.GenericTypeSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#genericConformanceList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterGenericConformanceList(_ ctx: ObjectiveCParser.GenericConformanceListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#genericConformanceList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitGenericConformanceList(_ ctx: ObjectiveCParser.GenericConformanceListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#genericConformance}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterGenericConformance(_ ctx: ObjectiveCParser.GenericConformanceContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#genericConformance}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitGenericConformance(_ ctx: ObjectiveCParser.GenericConformanceContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolDeclaration(_ ctx: ObjectiveCParser.ProtocolDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolDeclaration(_ ctx: ObjectiveCParser.ProtocolDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolDeclarationSection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolDeclarationSection(_ ctx: ObjectiveCParser.ProtocolDeclarationSectionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolDeclarationSection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolDeclarationSection(_ ctx: ObjectiveCParser.ProtocolDeclarationSectionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolDeclarationList(_ ctx: ObjectiveCParser.ProtocolDeclarationListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolDeclarationList(_ ctx: ObjectiveCParser.ProtocolDeclarationListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#classDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClassDeclarationList(_ ctx: ObjectiveCParser.ClassDeclarationListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#classDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClassDeclarationList(_ ctx: ObjectiveCParser.ClassDeclarationListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolList(_ ctx: ObjectiveCParser.ProtocolListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolList(_ ctx: ObjectiveCParser.ProtocolListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertyDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertyDeclaration(_ ctx: ObjectiveCParser.PropertyDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertyDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertyDeclaration(_ ctx: ObjectiveCParser.PropertyDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertyAttributesList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertyAttributesList(_ ctx: ObjectiveCParser.PropertyAttributesListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertyAttributesList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertyAttributesList(_ ctx: ObjectiveCParser.PropertyAttributesListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertyAttribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertyAttribute(_ ctx: ObjectiveCParser.PropertyAttributeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertyAttribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertyAttribute(_ ctx: ObjectiveCParser.PropertyAttributeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolName(_ ctx: ObjectiveCParser.ProtocolNameContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolName(_ ctx: ObjectiveCParser.ProtocolNameContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#instanceVariables}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInstanceVariables(_ ctx: ObjectiveCParser.InstanceVariablesContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#instanceVariables}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInstanceVariables(_ ctx: ObjectiveCParser.InstanceVariablesContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#visibilitySection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVisibilitySection(_ ctx: ObjectiveCParser.VisibilitySectionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#visibilitySection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVisibilitySection(_ ctx: ObjectiveCParser.VisibilitySectionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#accessModifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAccessModifier(_ ctx: ObjectiveCParser.AccessModifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#accessModifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAccessModifier(_ ctx: ObjectiveCParser.AccessModifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#interfaceDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInterfaceDeclarationList(_ ctx: ObjectiveCParser.InterfaceDeclarationListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#interfaceDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInterfaceDeclarationList(_ ctx: ObjectiveCParser.InterfaceDeclarationListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#classMethodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClassMethodDeclaration(_ ctx: ObjectiveCParser.ClassMethodDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#classMethodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClassMethodDeclaration(_ ctx: ObjectiveCParser.ClassMethodDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#instanceMethodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInstanceMethodDeclaration(_ ctx: ObjectiveCParser.InstanceMethodDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#instanceMethodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInstanceMethodDeclaration(_ ctx: ObjectiveCParser.InstanceMethodDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#methodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMethodDeclaration(_ ctx: ObjectiveCParser.MethodDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#methodDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMethodDeclaration(_ ctx: ObjectiveCParser.MethodDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#implementationDefinitionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterImplementationDefinitionList(_ ctx: ObjectiveCParser.ImplementationDefinitionListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#implementationDefinitionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitImplementationDefinitionList(_ ctx: ObjectiveCParser.ImplementationDefinitionListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#classMethodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClassMethodDefinition(_ ctx: ObjectiveCParser.ClassMethodDefinitionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#classMethodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClassMethodDefinition(_ ctx: ObjectiveCParser.ClassMethodDefinitionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#instanceMethodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInstanceMethodDefinition(_ ctx: ObjectiveCParser.InstanceMethodDefinitionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#instanceMethodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInstanceMethodDefinition(_ ctx: ObjectiveCParser.InstanceMethodDefinitionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#methodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMethodDefinition(_ ctx: ObjectiveCParser.MethodDefinitionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#methodDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMethodDefinition(_ ctx: ObjectiveCParser.MethodDefinitionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#methodSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMethodSelector(_ ctx: ObjectiveCParser.MethodSelectorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#methodSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMethodSelector(_ ctx: ObjectiveCParser.MethodSelectorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#keywordDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterKeywordDeclarator(_ ctx: ObjectiveCParser.KeywordDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#keywordDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitKeywordDeclarator(_ ctx: ObjectiveCParser.KeywordDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#selector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSelector(_ ctx: ObjectiveCParser.SelectorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#selector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSelector(_ ctx: ObjectiveCParser.SelectorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#methodType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMethodType(_ ctx: ObjectiveCParser.MethodTypeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#methodType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMethodType(_ ctx: ObjectiveCParser.MethodTypeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertyImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertyImplementation(_ ctx: ObjectiveCParser.PropertyImplementationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertyImplementation}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertyImplementation(_ ctx: ObjectiveCParser.PropertyImplementationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertySynthesizeList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertySynthesizeList(_ ctx: ObjectiveCParser.PropertySynthesizeListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertySynthesizeList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertySynthesizeList(_ ctx: ObjectiveCParser.PropertySynthesizeListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#propertySynthesizeItem}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPropertySynthesizeItem(_ ctx: ObjectiveCParser.PropertySynthesizeItemContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#propertySynthesizeItem}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPropertySynthesizeItem(_ ctx: ObjectiveCParser.PropertySynthesizeItemContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#blockType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlockType(_ ctx: ObjectiveCParser.BlockTypeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#blockType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlockType(_ ctx: ObjectiveCParser.BlockTypeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#genericsSpecifierList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterGenericsSpecifierList(_ ctx: ObjectiveCParser.GenericsSpecifierListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#genericsSpecifierList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitGenericsSpecifierList(_ ctx: ObjectiveCParser.GenericsSpecifierListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#genericsSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterGenericsSpecifier(_ ctx: ObjectiveCParser.GenericsSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#genericsSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitGenericsSpecifier(_ ctx: ObjectiveCParser.GenericsSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#dictionaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDictionaryExpression(_ ctx: ObjectiveCParser.DictionaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#dictionaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDictionaryExpression(_ ctx: ObjectiveCParser.DictionaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#dictionaryPair}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDictionaryPair(_ ctx: ObjectiveCParser.DictionaryPairContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#dictionaryPair}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDictionaryPair(_ ctx: ObjectiveCParser.DictionaryPairContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#arrayExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArrayExpression(_ ctx: ObjectiveCParser.ArrayExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#arrayExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArrayExpression(_ ctx: ObjectiveCParser.ArrayExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#boxExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBoxExpression(_ ctx: ObjectiveCParser.BoxExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#boxExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBoxExpression(_ ctx: ObjectiveCParser.BoxExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#blockParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlockParameters(_ ctx: ObjectiveCParser.BlockParametersContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#blockParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlockParameters(_ ctx: ObjectiveCParser.BlockParametersContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeVariableDeclaratorOrName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeVariableDeclaratorOrName(_ ctx: ObjectiveCParser.TypeVariableDeclaratorOrNameContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeVariableDeclaratorOrName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeVariableDeclaratorOrName(_ ctx: ObjectiveCParser.TypeVariableDeclaratorOrNameContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#blockExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBlockExpression(_ ctx: ObjectiveCParser.BlockExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#blockExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBlockExpression(_ ctx: ObjectiveCParser.BlockExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#messageExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMessageExpression(_ ctx: ObjectiveCParser.MessageExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#messageExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMessageExpression(_ ctx: ObjectiveCParser.MessageExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#receiver}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterReceiver(_ ctx: ObjectiveCParser.ReceiverContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#receiver}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitReceiver(_ ctx: ObjectiveCParser.ReceiverContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#messageSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMessageSelector(_ ctx: ObjectiveCParser.MessageSelectorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#messageSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMessageSelector(_ ctx: ObjectiveCParser.MessageSelectorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#keywordArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterKeywordArgument(_ ctx: ObjectiveCParser.KeywordArgumentContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#keywordArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitKeywordArgument(_ ctx: ObjectiveCParser.KeywordArgumentContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#keywordArgumentType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterKeywordArgumentType(_ ctx: ObjectiveCParser.KeywordArgumentTypeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#keywordArgumentType}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitKeywordArgumentType(_ ctx: ObjectiveCParser.KeywordArgumentTypeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#selectorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSelectorExpression(_ ctx: ObjectiveCParser.SelectorExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#selectorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSelectorExpression(_ ctx: ObjectiveCParser.SelectorExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#selectorName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSelectorName(_ ctx: ObjectiveCParser.SelectorNameContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#selectorName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSelectorName(_ ctx: ObjectiveCParser.SelectorNameContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolExpression(_ ctx: ObjectiveCParser.ProtocolExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolExpression(_ ctx: ObjectiveCParser.ProtocolExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#encodeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEncodeExpression(_ ctx: ObjectiveCParser.EncodeExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#encodeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEncodeExpression(_ ctx: ObjectiveCParser.EncodeExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeVariableDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeVariableDeclarator(_ ctx: ObjectiveCParser.TypeVariableDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeVariableDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeVariableDeclarator(_ ctx: ObjectiveCParser.TypeVariableDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#throwStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterThrowStatement(_ ctx: ObjectiveCParser.ThrowStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#throwStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitThrowStatement(_ ctx: ObjectiveCParser.ThrowStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#tryBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTryBlock(_ ctx: ObjectiveCParser.TryBlockContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#tryBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTryBlock(_ ctx: ObjectiveCParser.TryBlockContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#catchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCatchStatement(_ ctx: ObjectiveCParser.CatchStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#catchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCatchStatement(_ ctx: ObjectiveCParser.CatchStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#synchronizedStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSynchronizedStatement(_ ctx: ObjectiveCParser.SynchronizedStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#synchronizedStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSynchronizedStatement(_ ctx: ObjectiveCParser.SynchronizedStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#autoreleaseStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAutoreleaseStatement(_ ctx: ObjectiveCParser.AutoreleaseStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#autoreleaseStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAutoreleaseStatement(_ ctx: ObjectiveCParser.AutoreleaseStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionDeclaration(_ ctx: ObjectiveCParser.FunctionDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionDeclaration(_ ctx: ObjectiveCParser.FunctionDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#functionDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionDefinition(_ ctx: ObjectiveCParser.FunctionDefinitionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#functionDefinition}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionDefinition(_ ctx: ObjectiveCParser.FunctionDefinitionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#functionSignature}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionSignature(_ ctx: ObjectiveCParser.FunctionSignatureContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#functionSignature}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionSignature(_ ctx: ObjectiveCParser.FunctionSignatureContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttribute(_ ctx: ObjectiveCParser.AttributeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttribute(_ ctx: ObjectiveCParser.AttributeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeName(_ ctx: ObjectiveCParser.AttributeNameContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeName(_ ctx: ObjectiveCParser.AttributeNameContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeParameters(_ ctx: ObjectiveCParser.AttributeParametersContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeParameters(_ ctx: ObjectiveCParser.AttributeParametersContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeParameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeParameterList(_ ctx: ObjectiveCParser.AttributeParameterListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeParameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeParameterList(_ ctx: ObjectiveCParser.AttributeParameterListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeParameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeParameter(_ ctx: ObjectiveCParser.AttributeParameterContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeParameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeParameter(_ ctx: ObjectiveCParser.AttributeParameterContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeParameterAssignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeParameterAssignment(_ ctx: ObjectiveCParser.AttributeParameterAssignmentContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeParameterAssignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeParameterAssignment(_ ctx: ObjectiveCParser.AttributeParameterAssignmentContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclaration(_ ctx: ObjectiveCParser.DeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclaration(_ ctx: ObjectiveCParser.DeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#functionCallExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCallExpression(_ ctx: ObjectiveCParser.FunctionCallExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#functionCallExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCallExpression(_ ctx: ObjectiveCParser.FunctionCallExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#enumDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEnumDeclaration(_ ctx: ObjectiveCParser.EnumDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#enumDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEnumDeclaration(_ ctx: ObjectiveCParser.EnumDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#varDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVarDeclaration(_ ctx: ObjectiveCParser.VarDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#varDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVarDeclaration(_ ctx: ObjectiveCParser.VarDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typedefDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypedefDeclaration(_ ctx: ObjectiveCParser.TypedefDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typedefDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypedefDeclaration(_ ctx: ObjectiveCParser.TypedefDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeDeclaratorList(_ ctx: ObjectiveCParser.TypeDeclaratorListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeDeclaratorList(_ ctx: ObjectiveCParser.TypeDeclaratorListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#declarationSpecifiers}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclarationSpecifiers(_ ctx: ObjectiveCParser.DeclarationSpecifiersContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#declarationSpecifiers}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclarationSpecifiers(_ ctx: ObjectiveCParser.DeclarationSpecifiersContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#attributeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAttributeSpecifier(_ ctx: ObjectiveCParser.AttributeSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#attributeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAttributeSpecifier(_ ctx: ObjectiveCParser.AttributeSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#initDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInitDeclaratorList(_ ctx: ObjectiveCParser.InitDeclaratorListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#initDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInitDeclaratorList(_ ctx: ObjectiveCParser.InitDeclaratorListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#initDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInitDeclarator(_ ctx: ObjectiveCParser.InitDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#initDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInitDeclarator(_ ctx: ObjectiveCParser.InitDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#structOrUnionSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStructOrUnionSpecifier(_ ctx: ObjectiveCParser.StructOrUnionSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#structOrUnionSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStructOrUnionSpecifier(_ ctx: ObjectiveCParser.StructOrUnionSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#fieldDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFieldDeclaration(_ ctx: ObjectiveCParser.FieldDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#fieldDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFieldDeclaration(_ ctx: ObjectiveCParser.FieldDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#ibOutletQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIbOutletQualifier(_ ctx: ObjectiveCParser.IbOutletQualifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#ibOutletQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIbOutletQualifier(_ ctx: ObjectiveCParser.IbOutletQualifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#arcBehaviourSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArcBehaviourSpecifier(_ ctx: ObjectiveCParser.ArcBehaviourSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#arcBehaviourSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArcBehaviourSpecifier(_ ctx: ObjectiveCParser.ArcBehaviourSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#nullabilitySpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterNullabilitySpecifier(_ ctx: ObjectiveCParser.NullabilitySpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#nullabilitySpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitNullabilitySpecifier(_ ctx: ObjectiveCParser.NullabilitySpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#storageClassSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStorageClassSpecifier(_ ctx: ObjectiveCParser.StorageClassSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#storageClassSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStorageClassSpecifier(_ ctx: ObjectiveCParser.StorageClassSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typePrefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypePrefix(_ ctx: ObjectiveCParser.TypePrefixContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typePrefix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypePrefix(_ ctx: ObjectiveCParser.TypePrefixContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeQualifier(_ ctx: ObjectiveCParser.TypeQualifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeQualifier(_ ctx: ObjectiveCParser.TypeQualifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#protocolQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProtocolQualifier(_ ctx: ObjectiveCParser.ProtocolQualifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#protocolQualifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProtocolQualifier(_ ctx: ObjectiveCParser.ProtocolQualifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeSpecifierModifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeSpecifierModifier(_ ctx: ObjectiveCParser.TypeSpecifierModifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeSpecifierModifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeSpecifierModifier(_ ctx: ObjectiveCParser.TypeSpecifierModifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeSpecifier(_ ctx: ObjectiveCParser.TypeSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeSpecifier(_ ctx: ObjectiveCParser.TypeSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeofExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeofExpression(_ ctx: ObjectiveCParser.TypeofExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeofExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeofExpression(_ ctx: ObjectiveCParser.TypeofExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#fieldDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFieldDeclaratorList(_ ctx: ObjectiveCParser.FieldDeclaratorListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#fieldDeclaratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFieldDeclaratorList(_ ctx: ObjectiveCParser.FieldDeclaratorListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#fieldDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFieldDeclarator(_ ctx: ObjectiveCParser.FieldDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#fieldDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFieldDeclarator(_ ctx: ObjectiveCParser.FieldDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#enumSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEnumSpecifier(_ ctx: ObjectiveCParser.EnumSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#enumSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEnumSpecifier(_ ctx: ObjectiveCParser.EnumSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#nsEnumOrOptionSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterNsEnumOrOptionSpecifier(_ ctx: ObjectiveCParser.NsEnumOrOptionSpecifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#nsEnumOrOptionSpecifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitNsEnumOrOptionSpecifier(_ ctx: ObjectiveCParser.NsEnumOrOptionSpecifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#enumeratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEnumeratorList(_ ctx: ObjectiveCParser.EnumeratorListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#enumeratorList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEnumeratorList(_ ctx: ObjectiveCParser.EnumeratorListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#enumerator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEnumerator(_ ctx: ObjectiveCParser.EnumeratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#enumerator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEnumerator(_ ctx: ObjectiveCParser.EnumeratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#enumeratorIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEnumeratorIdentifier(_ ctx: ObjectiveCParser.EnumeratorIdentifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#enumeratorIdentifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEnumeratorIdentifier(_ ctx: ObjectiveCParser.EnumeratorIdentifierContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#declarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclarator(_ ctx: ObjectiveCParser.DeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#declarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclarator(_ ctx: ObjectiveCParser.DeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#declaratorSuffix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclaratorSuffix(_ ctx: ObjectiveCParser.DeclaratorSuffixContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#declaratorSuffix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclaratorSuffix(_ ctx: ObjectiveCParser.DeclaratorSuffixContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterList(_ ctx: ObjectiveCParser.ParameterListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterList(_ ctx: ObjectiveCParser.ParameterListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#macro}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMacro(_ ctx: ObjectiveCParser.MacroContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#macro}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMacro(_ ctx: ObjectiveCParser.MacroContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#clangAttribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClangAttribute(_ ctx: ObjectiveCParser.ClangAttributeContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#clangAttribute}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClangAttribute(_ ctx: ObjectiveCParser.ClangAttributeContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#clangAttributeArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterClangAttributeArgument(_ ctx: ObjectiveCParser.ClangAttributeArgumentContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#clangAttributeArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitClangAttributeArgument(_ ctx: ObjectiveCParser.ClangAttributeArgumentContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#swiftAliasExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwiftAliasExpression(_ ctx: ObjectiveCParser.SwiftAliasExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#swiftAliasExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwiftAliasExpression(_ ctx: ObjectiveCParser.SwiftAliasExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#swiftSelectorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwiftSelectorExpression(_ ctx: ObjectiveCParser.SwiftSelectorExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#swiftSelectorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwiftSelectorExpression(_ ctx: ObjectiveCParser.SwiftSelectorExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#swiftSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwiftSelector(_ ctx: ObjectiveCParser.SwiftSelectorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#swiftSelector}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwiftSelector(_ ctx: ObjectiveCParser.SwiftSelectorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#apiAvailableOsVersion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterApiAvailableOsVersion(_ ctx: ObjectiveCParser.ApiAvailableOsVersionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#apiAvailableOsVersion}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitApiAvailableOsVersion(_ ctx: ObjectiveCParser.ApiAvailableOsVersionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#version}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVersion(_ ctx: ObjectiveCParser.VersionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#version}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVersion(_ ctx: ObjectiveCParser.VersionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#arrayInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArrayInitializer(_ ctx: ObjectiveCParser.ArrayInitializerContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#arrayInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArrayInitializer(_ ctx: ObjectiveCParser.ArrayInitializerContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#structInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStructInitializer(_ ctx: ObjectiveCParser.StructInitializerContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#structInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStructInitializer(_ ctx: ObjectiveCParser.StructInitializerContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#initializerList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInitializerList(_ ctx: ObjectiveCParser.InitializerListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#initializerList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInitializerList(_ ctx: ObjectiveCParser.InitializerListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#typeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeName(_ ctx: ObjectiveCParser.TypeNameContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#typeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeName(_ ctx: ObjectiveCParser.TypeNameContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#abstractDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAbstractDeclarator(_ ctx: ObjectiveCParser.AbstractDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#abstractDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAbstractDeclarator(_ ctx: ObjectiveCParser.AbstractDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#abstractDeclaratorSuffix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAbstractDeclaratorSuffix(_ ctx: ObjectiveCParser.AbstractDeclaratorSuffixContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#abstractDeclaratorSuffix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAbstractDeclaratorSuffix(_ ctx: ObjectiveCParser.AbstractDeclaratorSuffixContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#parameterDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterDeclarationList(_ ctx: ObjectiveCParser.ParameterDeclarationListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#parameterDeclarationList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterDeclarationList(_ ctx: ObjectiveCParser.ParameterDeclarationListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#parameterDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterDeclaration(_ ctx: ObjectiveCParser.ParameterDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#parameterDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterDeclaration(_ ctx: ObjectiveCParser.ParameterDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: ObjectiveCParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: ObjectiveCParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#labeledStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLabeledStatement(_ ctx: ObjectiveCParser.LabeledStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#labeledStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLabeledStatement(_ ctx: ObjectiveCParser.LabeledStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#rangeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRangeExpression(_ ctx: ObjectiveCParser.RangeExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#rangeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRangeExpression(_ ctx: ObjectiveCParser.RangeExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#compoundStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCompoundStatement(_ ctx: ObjectiveCParser.CompoundStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#compoundStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCompoundStatement(_ ctx: ObjectiveCParser.CompoundStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#selectionStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSelectionStatement(_ ctx: ObjectiveCParser.SelectionStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#selectionStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSelectionStatement(_ ctx: ObjectiveCParser.SelectionStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#switchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwitchStatement(_ ctx: ObjectiveCParser.SwitchStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#switchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwitchStatement(_ ctx: ObjectiveCParser.SwitchStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#switchBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwitchBlock(_ ctx: ObjectiveCParser.SwitchBlockContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#switchBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwitchBlock(_ ctx: ObjectiveCParser.SwitchBlockContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#switchSection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwitchSection(_ ctx: ObjectiveCParser.SwitchSectionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#switchSection}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwitchSection(_ ctx: ObjectiveCParser.SwitchSectionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#switchLabel}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterSwitchLabel(_ ctx: ObjectiveCParser.SwitchLabelContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#switchLabel}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitSwitchLabel(_ ctx: ObjectiveCParser.SwitchLabelContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#iterationStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIterationStatement(_ ctx: ObjectiveCParser.IterationStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#iterationStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIterationStatement(_ ctx: ObjectiveCParser.IterationStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#whileStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterWhileStatement(_ ctx: ObjectiveCParser.WhileStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#whileStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitWhileStatement(_ ctx: ObjectiveCParser.WhileStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#doStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDoStatement(_ ctx: ObjectiveCParser.DoStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#doStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDoStatement(_ ctx: ObjectiveCParser.DoStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#forStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterForStatement(_ ctx: ObjectiveCParser.ForStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#forStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitForStatement(_ ctx: ObjectiveCParser.ForStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#forLoopInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterForLoopInitializer(_ ctx: ObjectiveCParser.ForLoopInitializerContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#forLoopInitializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitForLoopInitializer(_ ctx: ObjectiveCParser.ForLoopInitializerContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#forInStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterForInStatement(_ ctx: ObjectiveCParser.ForInStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#forInStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitForInStatement(_ ctx: ObjectiveCParser.ForInStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#jumpStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterJumpStatement(_ ctx: ObjectiveCParser.JumpStatementContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#jumpStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitJumpStatement(_ ctx: ObjectiveCParser.JumpStatementContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#expressions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressions(_ ctx: ObjectiveCParser.ExpressionsContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#expressions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressions(_ ctx: ObjectiveCParser.ExpressionsContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: ObjectiveCParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: ObjectiveCParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#assignmentOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignmentOperator(_ ctx: ObjectiveCParser.AssignmentOperatorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#assignmentOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignmentOperator(_ ctx: ObjectiveCParser.AssignmentOperatorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#castExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCastExpression(_ ctx: ObjectiveCParser.CastExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#castExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCastExpression(_ ctx: ObjectiveCParser.CastExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#initializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInitializer(_ ctx: ObjectiveCParser.InitializerContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#initializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInitializer(_ ctx: ObjectiveCParser.InitializerContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#constantExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConstantExpression(_ ctx: ObjectiveCParser.ConstantExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#constantExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConstantExpression(_ ctx: ObjectiveCParser.ConstantExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterUnaryExpression(_ ctx: ObjectiveCParser.UnaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitUnaryExpression(_ ctx: ObjectiveCParser.UnaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#unaryOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterUnaryOperator(_ ctx: ObjectiveCParser.UnaryOperatorContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#unaryOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitUnaryOperator(_ ctx: ObjectiveCParser.UnaryOperatorContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#postfixExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPostfixExpression(_ ctx: ObjectiveCParser.PostfixExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#postfixExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPostfixExpression(_ ctx: ObjectiveCParser.PostfixExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#postfix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPostfix(_ ctx: ObjectiveCParser.PostfixContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#postfix}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPostfix(_ ctx: ObjectiveCParser.PostfixContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#argumentExpressionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArgumentExpressionList(_ ctx: ObjectiveCParser.ArgumentExpressionListContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#argumentExpressionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArgumentExpressionList(_ ctx: ObjectiveCParser.ArgumentExpressionListContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#argumentExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterArgumentExpression(_ ctx: ObjectiveCParser.ArgumentExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#argumentExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitArgumentExpression(_ ctx: ObjectiveCParser.ArgumentExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimaryExpression(_ ctx: ObjectiveCParser.PrimaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimaryExpression(_ ctx: ObjectiveCParser.PrimaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#constant}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConstant(_ ctx: ObjectiveCParser.ConstantContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#constant}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConstant(_ ctx: ObjectiveCParser.ConstantContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#stringLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStringLiteral(_ ctx: ObjectiveCParser.StringLiteralContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#stringLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStringLiteral(_ ctx: ObjectiveCParser.StringLiteralContext)
	/**
	 * Enter a parse tree produced by {@link ObjectiveCParser#identifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIdentifier(_ ctx: ObjectiveCParser.IdentifierContext)
	/**
	 * Exit a parse tree produced by {@link ObjectiveCParser#identifier}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIdentifier(_ ctx: ObjectiveCParser.IdentifierContext)
}
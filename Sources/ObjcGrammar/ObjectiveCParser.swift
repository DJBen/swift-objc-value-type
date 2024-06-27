// Generated from one-step-processing/ObjectiveCParser.g4 by ANTLR 4.13.1
import Antlr4

open class ObjectiveCParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = ObjectiveCParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(ObjectiveCParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, AUTO = 1, BREAK = 2, CASE = 3, CHAR = 4, CONST = 5, CONTINUE = 6, 
                 DEFAULT = 7, DO = 8, DOUBLE = 9, ELSE = 10, ENUM = 11, 
                 EXTERN = 12, FLOAT = 13, FOR = 14, GOTO = 15, IF = 16, 
                 INLINE = 17, INT = 18, LONG = 19, REGISTER = 20, RESTRICT = 21, 
                 RETURN = 22, SHORT = 23, SIGNED = 24, SIZEOF = 25, STATIC = 26, 
                 STRUCT = 27, SWITCH = 28, TYPEDEF = 29, UNION = 30, UNSIGNED = 31, 
                 VOID = 32, VOLATILE = 33, WHILE = 34, BOOL_ = 35, COMPLEX = 36, 
                 IMAGINERY = 37, TRUE = 38, FALSE = 39, BOOL = 40, Class = 41, 
                 BYCOPY = 42, BYREF = 43, ID = 44, IMP = 45, IN = 46, INOUT = 47, 
                 NIL = 48, NO = 49, NULL_ = 50, ONEWAY = 51, OUT = 52, PROTOCOL_ = 53, 
                 SEL = 54, SELF = 55, SUPER = 56, YES = 57, AUTORELEASEPOOL = 58, 
                 CATCH = 59, CLASS = 60, DYNAMIC = 61, ENCODE = 62, END = 63, 
                 FINALLY = 64, IMPLEMENTATION = 65, INTERFACE = 66, IMPORT = 67, 
                 PACKAGE = 68, PROTOCOL = 69, OPTIONAL = 70, PRIVATE = 71, 
                 PROPERTY = 72, PROTECTED = 73, PUBLIC = 74, REQUIRED = 75, 
                 SELECTOR = 76, SYNCHRONIZED = 77, SYNTHESIZE = 78, THROW = 79, 
                 TRY = 80, ATOMIC = 81, NONATOMIC = 82, RETAIN = 83, ATTRIBUTE = 84, 
                 AUTORELEASING_QUALIFIER = 85, BLOCK = 86, BRIDGE = 87, 
                 BRIDGE_RETAINED = 88, BRIDGE_TRANSFER = 89, COVARIANT = 90, 
                 CONTRAVARIANT = 91, DEPRECATED = 92, KINDOF = 93, STRONG_QUALIFIER = 94, 
                 TYPEOF = 95, UNSAFE_UNRETAINED_QUALIFIER = 96, UNUSED = 97, 
                 WEAK_QUALIFIER = 98, NULL_UNSPECIFIED = 99, NULLABLE = 100, 
                 NONNULL = 101, NULL_RESETTABLE = 102, NS_INLINE = 103, 
                 NS_ENUM = 104, NS_OPTIONS = 105, ASSIGN = 106, COPY = 107, 
                 GETTER = 108, SETTER = 109, STRONG = 110, READONLY = 111, 
                 READWRITE = 112, WEAK = 113, UNSAFE_UNRETAINED = 114, IB_OUTLET = 115, 
                 IB_OUTLET_COLLECTION = 116, IB_INSPECTABLE = 117, IB_DESIGNABLE = 118, 
                 NS_ASSUME_NONNULL_BEGIN = 119, NS_ASSUME_NONNULL_END = 120, 
                 EXTERN_SUFFIX = 121, IOS_SUFFIX = 122, MAC_SUFFIX = 123, 
                 TVOS_PROHIBITED = 124, IDENTIFIER = 125, LP = 126, RP = 127, 
                 LBRACE = 128, RBRACE = 129, LBRACK = 130, RBRACK = 131, 
                 SEMI = 132, COMMA = 133, DOT = 134, STRUCTACCESS = 135, 
                 AT = 136, ASSIGNMENT = 137, GT = 138, LT = 139, BANG = 140, 
                 TILDE = 141, QUESTION = 142, COLON = 143, EQUAL = 144, 
                 LE = 145, GE = 146, NOTEQUAL = 147, AND = 148, OR = 149, 
                 INC = 150, DEC = 151, ADD = 152, SUB = 153, MUL = 154, 
                 DIV = 155, BITAND = 156, BITOR = 157, BITXOR = 158, MOD = 159, 
                 ADD_ASSIGN = 160, SUB_ASSIGN = 161, MUL_ASSIGN = 162, DIV_ASSIGN = 163, 
                 AND_ASSIGN = 164, OR_ASSIGN = 165, XOR_ASSIGN = 166, MOD_ASSIGN = 167, 
                 LSHIFT_ASSIGN = 168, RSHIFT_ASSIGN = 169, ELIPSIS = 170, 
                 CHARACTER_LITERAL = 171, STRING_START = 172, HEX_LITERAL = 173, 
                 OCTAL_LITERAL = 174, BINARY_LITERAL = 175, DECIMAL_LITERAL = 176, 
                 FLOATING_POINT_LITERAL = 177, WS = 178, MULTI_COMMENT = 179, 
                 SINGLE_COMMENT = 180, BACKSLASH = 181, SHARP = 182, STRING_NEWLINE = 183, 
                 STRING_END = 184, STRING_VALUE = 185, DIRECTIVE_IMPORT = 186, 
                 DIRECTIVE_INCLUDE = 187, DIRECTIVE_PRAGMA = 188, DIRECTIVE_DEFINE = 189, 
                 DIRECTIVE_DEFINED = 190, DIRECTIVE_IF = 191, DIRECTIVE_ELIF = 192, 
                 DIRECTIVE_ELSE = 193, DIRECTIVE_UNDEF = 194, DIRECTIVE_IFDEF = 195, 
                 DIRECTIVE_IFNDEF = 196, DIRECTIVE_ENDIF = 197, DIRECTIVE_TRUE = 198, 
                 DIRECTIVE_FALSE = 199, DIRECTIVE_ERROR = 200, DIRECTIVE_WARNING = 201, 
                 DIRECTIVE_BANG = 202, DIRECTIVE_LP = 203, DIRECTIVE_RP = 204, 
                 DIRECTIVE_EQUAL = 205, DIRECTIVE_NOTEQUAL = 206, DIRECTIVE_AND = 207, 
                 DIRECTIVE_OR = 208, DIRECTIVE_LT = 209, DIRECTIVE_GT = 210, 
                 DIRECTIVE_LE = 211, DIRECTIVE_GE = 212, DIRECTIVE_STRING = 213, 
                 DIRECTIVE_ID = 214, DIRECTIVE_DECIMAL_LITERAL = 215, DIRECTIVE_FLOAT = 216, 
                 DIRECTIVE_NEWLINE = 217, DIRECTIVE_MULTI_COMMENT = 218, 
                 DIRECTIVE_SINGLE_COMMENT = 219, DIRECTIVE_BACKSLASH_NEWLINE = 220, 
                 DIRECTIVE_TEXT_NEWLINE = 221, DIRECTIVE_TEXT = 222
	}

	public
	static let RULE_translationUnit = 0, RULE_topLevelDeclaration = 1, RULE_importDeclaration = 2, 
            RULE_classInterface = 3, RULE_categoryInterface = 4, RULE_classImplementation = 5, 
            RULE_categoryImplementation = 6, RULE_genericTypeSpecifier = 7, 
            RULE_protocolDeclaration = 8, RULE_protocolDeclarationSection = 9, 
            RULE_protocolDeclarationList = 10, RULE_classDeclarationList = 11, 
            RULE_protocolList = 12, RULE_propertyDeclaration = 13, RULE_propertyAttributesList = 14, 
            RULE_propertyAttribute = 15, RULE_protocolName = 16, RULE_instanceVariables = 17, 
            RULE_visibilitySection = 18, RULE_accessModifier = 19, RULE_interfaceDeclarationList = 20, 
            RULE_classMethodDeclaration = 21, RULE_instanceMethodDeclaration = 22, 
            RULE_methodDeclaration = 23, RULE_implementationDefinitionList = 24, 
            RULE_classMethodDefinition = 25, RULE_instanceMethodDefinition = 26, 
            RULE_methodDefinition = 27, RULE_methodSelector = 28, RULE_keywordDeclarator = 29, 
            RULE_selector = 30, RULE_methodType = 31, RULE_propertyImplementation = 32, 
            RULE_propertySynthesizeList = 33, RULE_propertySynthesizeItem = 34, 
            RULE_blockType = 35, RULE_genericsSpecifier = 36, RULE_typeSpecifierWithPrefixes = 37, 
            RULE_dictionaryExpression = 38, RULE_dictionaryPair = 39, RULE_arrayExpression = 40, 
            RULE_boxExpression = 41, RULE_blockParameters = 42, RULE_typeVariableDeclaratorOrName = 43, 
            RULE_blockExpression = 44, RULE_messageExpression = 45, RULE_receiver = 46, 
            RULE_messageSelector = 47, RULE_keywordArgument = 48, RULE_keywordArgumentType = 49, 
            RULE_selectorExpression = 50, RULE_selectorName = 51, RULE_protocolExpression = 52, 
            RULE_encodeExpression = 53, RULE_typeVariableDeclarator = 54, 
            RULE_throwStatement = 55, RULE_tryBlock = 56, RULE_catchStatement = 57, 
            RULE_synchronizedStatement = 58, RULE_autoreleaseStatement = 59, 
            RULE_functionDeclaration = 60, RULE_functionDefinition = 61, 
            RULE_functionSignature = 62, RULE_attribute = 63, RULE_attributeName = 64, 
            RULE_attributeParameters = 65, RULE_attributeParameterList = 66, 
            RULE_attributeParameter = 67, RULE_attributeParameterAssignment = 68, 
            RULE_declaration = 69, RULE_functionCallExpression = 70, RULE_enumDeclaration = 71, 
            RULE_varDeclaration = 72, RULE_typedefDeclaration = 73, RULE_typeDeclaratorList = 74, 
            RULE_typeDeclarator = 75, RULE_declarationSpecifiers = 76, RULE_attributeSpecifier = 77, 
            RULE_initDeclaratorList = 78, RULE_initDeclarator = 79, RULE_structOrUnionSpecifier = 80, 
            RULE_fieldDeclaration = 81, RULE_specifierQualifierList = 82, 
            RULE_ibOutletQualifier = 83, RULE_arcBehaviourSpecifier = 84, 
            RULE_nullabilitySpecifier = 85, RULE_storageClassSpecifier = 86, 
            RULE_typePrefix = 87, RULE_typeQualifier = 88, RULE_protocolQualifier = 89, 
            RULE_typeSpecifier = 90, RULE_typeofExpression = 91, RULE_fieldDeclaratorList = 92, 
            RULE_fieldDeclarator = 93, RULE_enumSpecifier = 94, RULE_enumeratorList = 95, 
            RULE_enumerator = 96, RULE_enumeratorIdentifier = 97, RULE_directDeclarator = 98, 
            RULE_declaratorSuffix = 99, RULE_parameterList = 100, RULE_pointer = 101, 
            RULE_macro = 102, RULE_arrayInitializer = 103, RULE_structInitializer = 104, 
            RULE_initializerList = 105, RULE_typeName = 106, RULE_abstractDeclarator = 107, 
            RULE_abstractDeclaratorSuffix = 108, RULE_parameterDeclarationList = 109, 
            RULE_parameterDeclaration = 110, RULE_declarator = 111, RULE_statement = 112, 
            RULE_labeledStatement = 113, RULE_rangeExpression = 114, RULE_compoundStatement = 115, 
            RULE_selectionStatement = 116, RULE_switchStatement = 117, RULE_switchBlock = 118, 
            RULE_switchSection = 119, RULE_switchLabel = 120, RULE_iterationStatement = 121, 
            RULE_whileStatement = 122, RULE_doStatement = 123, RULE_forStatement = 124, 
            RULE_forLoopInitializer = 125, RULE_forInStatement = 126, RULE_jumpStatement = 127, 
            RULE_expressions = 128, RULE_expression = 129, RULE_assignmentOperator = 130, 
            RULE_castExpression = 131, RULE_initializer = 132, RULE_constantExpression = 133, 
            RULE_unaryExpression = 134, RULE_unaryOperator = 135, RULE_postfixExpression = 136, 
            RULE_postfix = 137, RULE_argumentExpressionList = 138, RULE_argumentExpression = 139, 
            RULE_primaryExpression = 140, RULE_constant = 141, RULE_stringLiteral = 142, 
            RULE_identifier = 143

	public
	static let ruleNames: [String] = [
		"translationUnit", "topLevelDeclaration", "importDeclaration", "classInterface", 
		"categoryInterface", "classImplementation", "categoryImplementation", 
		"genericTypeSpecifier", "protocolDeclaration", "protocolDeclarationSection", 
		"protocolDeclarationList", "classDeclarationList", "protocolList", "propertyDeclaration", 
		"propertyAttributesList", "propertyAttribute", "protocolName", "instanceVariables", 
		"visibilitySection", "accessModifier", "interfaceDeclarationList", "classMethodDeclaration", 
		"instanceMethodDeclaration", "methodDeclaration", "implementationDefinitionList", 
		"classMethodDefinition", "instanceMethodDefinition", "methodDefinition", 
		"methodSelector", "keywordDeclarator", "selector", "methodType", "propertyImplementation", 
		"propertySynthesizeList", "propertySynthesizeItem", "blockType", "genericsSpecifier", 
		"typeSpecifierWithPrefixes", "dictionaryExpression", "dictionaryPair", 
		"arrayExpression", "boxExpression", "blockParameters", "typeVariableDeclaratorOrName", 
		"blockExpression", "messageExpression", "receiver", "messageSelector", 
		"keywordArgument", "keywordArgumentType", "selectorExpression", "selectorName", 
		"protocolExpression", "encodeExpression", "typeVariableDeclarator", "throwStatement", 
		"tryBlock", "catchStatement", "synchronizedStatement", "autoreleaseStatement", 
		"functionDeclaration", "functionDefinition", "functionSignature", "attribute", 
		"attributeName", "attributeParameters", "attributeParameterList", "attributeParameter", 
		"attributeParameterAssignment", "declaration", "functionCallExpression", 
		"enumDeclaration", "varDeclaration", "typedefDeclaration", "typeDeclaratorList", 
		"typeDeclarator", "declarationSpecifiers", "attributeSpecifier", "initDeclaratorList", 
		"initDeclarator", "structOrUnionSpecifier", "fieldDeclaration", "specifierQualifierList", 
		"ibOutletQualifier", "arcBehaviourSpecifier", "nullabilitySpecifier", 
		"storageClassSpecifier", "typePrefix", "typeQualifier", "protocolQualifier", 
		"typeSpecifier", "typeofExpression", "fieldDeclaratorList", "fieldDeclarator", 
		"enumSpecifier", "enumeratorList", "enumerator", "enumeratorIdentifier", 
		"directDeclarator", "declaratorSuffix", "parameterList", "pointer", "macro", 
		"arrayInitializer", "structInitializer", "initializerList", "typeName", 
		"abstractDeclarator", "abstractDeclaratorSuffix", "parameterDeclarationList", 
		"parameterDeclaration", "declarator", "statement", "labeledStatement", 
		"rangeExpression", "compoundStatement", "selectionStatement", "switchStatement", 
		"switchBlock", "switchSection", "switchLabel", "iterationStatement", "whileStatement", 
		"doStatement", "forStatement", "forLoopInitializer", "forInStatement", 
		"jumpStatement", "expressions", "expression", "assignmentOperator", "castExpression", 
		"initializer", "constantExpression", "unaryExpression", "unaryOperator", 
		"postfixExpression", "postfix", "argumentExpressionList", "argumentExpression", 
		"primaryExpression", "constant", "stringLiteral", "identifier"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'auto'", "'break'", "'case'", "'char'", "'const'", "'continue'", 
		"'default'", "'do'", "'double'", nil, "'enum'", "'extern'", "'float'", 
		"'for'", "'goto'", nil, "'inline'", "'int'", "'long'", "'register'", "'restrict'", 
		"'return'", "'short'", "'signed'", "'sizeof'", "'static'", "'struct'", 
		"'switch'", "'typedef'", "'union'", "'unsigned'", "'void'", "'volatile'", 
		"'while'", "'_Bool'", "'_Complex'", "'_Imaginery'", "'true'", "'false'", 
		"'BOOL'", "'Class'", "'bycopy'", "'byref'", "'id'", "'IMP'", "'in'", "'inout'", 
		"'nil'", "'NO'", "'NULL'", "'oneway'", "'out'", "'Protocol'", "'SEL'", 
		"'self'", "'super'", "'YES'", "'@autoreleasepool'", "'@catch'", "'@class'", 
		"'@dynamic'", "'@encode'", "'@end'", "'@finally'", "'@implementation'", 
		"'@interface'", "'@import'", "'@package'", "'@protocol'", "'@optional'", 
		"'@private'", "'@property'", "'@protected'", "'@public'", "'@required'", 
		"'@selector'", "'@synchronized'", "'@synthesize'", "'@throw'", "'@try'", 
		"'atomic'", "'nonatomic'", "'retain'", "'__attribute__'", "'__autoreleasing'", 
		"'__block'", "'__bridge'", "'__bridge_retained'", "'__bridge_transfer'", 
		"'__covariant'", "'__contravariant'", "'__deprecated'", "'__kindof'", 
		"'__strong'", nil, "'__unsafe_unretained'", "'__unused'", "'__weak'", 
		nil, nil, nil, "'null_resettable'", "'NS_INLINE'", "'NS_ENUM'", "'NS_OPTIONS'", 
		"'assign'", "'copy'", "'getter'", "'setter'", "'strong'", "'readonly'", 
		"'readwrite'", "'weak'", "'unsafe_unretained'", "'IBOutlet'", "'IBOutletCollection'", 
		"'IBInspectable'", "'IB_DESIGNABLE'", nil, nil, nil, nil, nil, "'__TVOS_PROHIBITED'", 
		nil, nil, nil, "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'->'", 
		"'@'", "'='", nil, nil, nil, "'~'", "'?'", "':'", nil, nil, nil, nil, 
		nil, nil, "'++'", "'--'", "'+'", "'-'", "'*'", "'/'", "'&'", "'|'", "'^'", 
		"'%'", "'+='", "'-='", "'*='", "'/='", "'&='", "'|='", "'^='", "'%='", 
		"'<<='", "'>>='", "'...'", nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, "'\\'", nil, nil, nil, nil, nil, nil, nil, nil, "'defined'", nil, 
		"'elif'", nil, "'undef'", "'ifdef'", "'ifndef'", "'endif'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "AUTO", "BREAK", "CASE", "CHAR", "CONST", "CONTINUE", "DEFAULT", 
		"DO", "DOUBLE", "ELSE", "ENUM", "EXTERN", "FLOAT", "FOR", "GOTO", "IF", 
		"INLINE", "INT", "LONG", "REGISTER", "RESTRICT", "RETURN", "SHORT", "SIGNED", 
		"SIZEOF", "STATIC", "STRUCT", "SWITCH", "TYPEDEF", "UNION", "UNSIGNED", 
		"VOID", "VOLATILE", "WHILE", "BOOL_", "COMPLEX", "IMAGINERY", "TRUE", 
		"FALSE", "BOOL", "Class", "BYCOPY", "BYREF", "ID", "IMP", "IN", "INOUT", 
		"NIL", "NO", "NULL_", "ONEWAY", "OUT", "PROTOCOL_", "SEL", "SELF", "SUPER", 
		"YES", "AUTORELEASEPOOL", "CATCH", "CLASS", "DYNAMIC", "ENCODE", "END", 
		"FINALLY", "IMPLEMENTATION", "INTERFACE", "IMPORT", "PACKAGE", "PROTOCOL", 
		"OPTIONAL", "PRIVATE", "PROPERTY", "PROTECTED", "PUBLIC", "REQUIRED", 
		"SELECTOR", "SYNCHRONIZED", "SYNTHESIZE", "THROW", "TRY", "ATOMIC", "NONATOMIC", 
		"RETAIN", "ATTRIBUTE", "AUTORELEASING_QUALIFIER", "BLOCK", "BRIDGE", "BRIDGE_RETAINED", 
		"BRIDGE_TRANSFER", "COVARIANT", "CONTRAVARIANT", "DEPRECATED", "KINDOF", 
		"STRONG_QUALIFIER", "TYPEOF", "UNSAFE_UNRETAINED_QUALIFIER", "UNUSED", 
		"WEAK_QUALIFIER", "NULL_UNSPECIFIED", "NULLABLE", "NONNULL", "NULL_RESETTABLE", 
		"NS_INLINE", "NS_ENUM", "NS_OPTIONS", "ASSIGN", "COPY", "GETTER", "SETTER", 
		"STRONG", "READONLY", "READWRITE", "WEAK", "UNSAFE_UNRETAINED", "IB_OUTLET", 
		"IB_OUTLET_COLLECTION", "IB_INSPECTABLE", "IB_DESIGNABLE", "NS_ASSUME_NONNULL_BEGIN", 
		"NS_ASSUME_NONNULL_END", "EXTERN_SUFFIX", "IOS_SUFFIX", "MAC_SUFFIX", 
		"TVOS_PROHIBITED", "IDENTIFIER", "LP", "RP", "LBRACE", "RBRACE", "LBRACK", 
		"RBRACK", "SEMI", "COMMA", "DOT", "STRUCTACCESS", "AT", "ASSIGNMENT", 
		"GT", "LT", "BANG", "TILDE", "QUESTION", "COLON", "EQUAL", "LE", "GE", 
		"NOTEQUAL", "AND", "OR", "INC", "DEC", "ADD", "SUB", "MUL", "DIV", "BITAND", 
		"BITOR", "BITXOR", "MOD", "ADD_ASSIGN", "SUB_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", 
		"AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "MOD_ASSIGN", "LSHIFT_ASSIGN", 
		"RSHIFT_ASSIGN", "ELIPSIS", "CHARACTER_LITERAL", "STRING_START", "HEX_LITERAL", 
		"OCTAL_LITERAL", "BINARY_LITERAL", "DECIMAL_LITERAL", "FLOATING_POINT_LITERAL", 
		"WS", "MULTI_COMMENT", "SINGLE_COMMENT", "BACKSLASH", "SHARP", "STRING_NEWLINE", 
		"STRING_END", "STRING_VALUE", "DIRECTIVE_IMPORT", "DIRECTIVE_INCLUDE", 
		"DIRECTIVE_PRAGMA", "DIRECTIVE_DEFINE", "DIRECTIVE_DEFINED", "DIRECTIVE_IF", 
		"DIRECTIVE_ELIF", "DIRECTIVE_ELSE", "DIRECTIVE_UNDEF", "DIRECTIVE_IFDEF", 
		"DIRECTIVE_IFNDEF", "DIRECTIVE_ENDIF", "DIRECTIVE_TRUE", "DIRECTIVE_FALSE", 
		"DIRECTIVE_ERROR", "DIRECTIVE_WARNING", "DIRECTIVE_BANG", "DIRECTIVE_LP", 
		"DIRECTIVE_RP", "DIRECTIVE_EQUAL", "DIRECTIVE_NOTEQUAL", "DIRECTIVE_AND", 
		"DIRECTIVE_OR", "DIRECTIVE_LT", "DIRECTIVE_GT", "DIRECTIVE_LE", "DIRECTIVE_GE", 
		"DIRECTIVE_STRING", "DIRECTIVE_ID", "DIRECTIVE_DECIMAL_LITERAL", "DIRECTIVE_FLOAT", 
		"DIRECTIVE_NEWLINE", "DIRECTIVE_MULTI_COMMENT", "DIRECTIVE_SINGLE_COMMENT", 
		"DIRECTIVE_BACKSLASH_NEWLINE", "DIRECTIVE_TEXT_NEWLINE", "DIRECTIVE_TEXT"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "ObjectiveCParser.g4" }

	override open
	func getRuleNames() -> [String] { return ObjectiveCParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return ObjectiveCParser._serializedATN }

	override open
	func getATN() -> ATN { return ObjectiveCParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return ObjectiveCParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,ObjectiveCParser._ATN,ObjectiveCParser._decisionToDFA, ObjectiveCParser._sharedContextCache)
	}


	public class TranslationUnitContext: ParserRuleContext {
			open
			func EOF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.EOF.rawValue, 0)
			}
			open
			func topLevelDeclaration() -> [TopLevelDeclarationContext] {
				return getRuleContexts(TopLevelDeclarationContext.self)
			}
			open
			func topLevelDeclaration(_ i: Int) -> TopLevelDeclarationContext? {
				return getRuleContext(TopLevelDeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_translationUnit
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTranslationUnit(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTranslationUnit(self)
			}
		}
	}
	@discardableResult
	 open func translationUnit() throws -> TranslationUnitContext {
		var _localctx: TranslationUnitContext
		_localctx = TranslationUnitContext(_ctx, getState())
		try enterRule(_localctx, 0, ObjectiveCParser.RULE_translationUnit)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(291)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1295065285207669298) != 0) || ((Int64((_la - 65)) & ~0x3f) == 0 && ((Int64(1) << (_la - 65)) & 1170935903116263447) != 0)) {
		 		setState(288)
		 		try topLevelDeclaration()


		 		setState(293)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(294)
		 	try match(ObjectiveCParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TopLevelDeclarationContext: ParserRuleContext {
			open
			func importDeclaration() -> ImportDeclarationContext? {
				return getRuleContext(ImportDeclarationContext.self, 0)
			}
			open
			func functionDeclaration() -> FunctionDeclarationContext? {
				return getRuleContext(FunctionDeclarationContext.self, 0)
			}
			open
			func declaration() -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, 0)
			}
			open
			func classInterface() -> ClassInterfaceContext? {
				return getRuleContext(ClassInterfaceContext.self, 0)
			}
			open
			func classImplementation() -> ClassImplementationContext? {
				return getRuleContext(ClassImplementationContext.self, 0)
			}
			open
			func categoryInterface() -> CategoryInterfaceContext? {
				return getRuleContext(CategoryInterfaceContext.self, 0)
			}
			open
			func categoryImplementation() -> CategoryImplementationContext? {
				return getRuleContext(CategoryImplementationContext.self, 0)
			}
			open
			func protocolDeclaration() -> ProtocolDeclarationContext? {
				return getRuleContext(ProtocolDeclarationContext.self, 0)
			}
			open
			func protocolDeclarationList() -> ProtocolDeclarationListContext? {
				return getRuleContext(ProtocolDeclarationListContext.self, 0)
			}
			open
			func classDeclarationList() -> ClassDeclarationListContext? {
				return getRuleContext(ClassDeclarationListContext.self, 0)
			}
			open
			func functionDefinition() -> FunctionDefinitionContext? {
				return getRuleContext(FunctionDefinitionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_topLevelDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTopLevelDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTopLevelDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func topLevelDeclaration() throws -> TopLevelDeclarationContext {
		var _localctx: TopLevelDeclarationContext
		_localctx = TopLevelDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 2, ObjectiveCParser.RULE_topLevelDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(307)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(296)
		 		try importDeclaration()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(297)
		 		try functionDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(298)
		 		try declaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(299)
		 		try classInterface()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(300)
		 		try classImplementation()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(301)
		 		try categoryInterface()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(302)
		 		try categoryImplementation()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(303)
		 		try protocolDeclaration()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(304)
		 		try protocolDeclarationList()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(305)
		 		try classDeclarationList()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(306)
		 		try functionDefinition()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ImportDeclarationContext: ParserRuleContext {
			open
			func IMPORT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IMPORT.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_importDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterImportDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitImportDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func importDeclaration() throws -> ImportDeclarationContext {
		var _localctx: ImportDeclarationContext
		_localctx = ImportDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 4, ObjectiveCParser.RULE_importDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(309)
		 	try match(ObjectiveCParser.Tokens.IMPORT.rawValue)
		 	setState(310)
		 	try identifier()
		 	setState(311)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ClassInterfaceContext: ParserRuleContext {
		open var className: GenericTypeSpecifierContext!
		open var superclassName: IdentifierContext!
			open
			func INTERFACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INTERFACE.rawValue, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.END.rawValue, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func IB_DESIGNABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func instanceVariables() -> InstanceVariablesContext? {
				return getRuleContext(InstanceVariablesContext.self, 0)
			}
			open
			func interfaceDeclarationList() -> InterfaceDeclarationListContext? {
				return getRuleContext(InterfaceDeclarationListContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_classInterface
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClassInterface(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClassInterface(self)
			}
		}
	}
	@discardableResult
	 open func classInterface() throws -> ClassInterfaceContext {
		var _localctx: ClassInterfaceContext
		_localctx = ClassInterfaceContext(_ctx, getState())
		try enterRule(_localctx, 6, ObjectiveCParser.RULE_classInterface)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(314)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue) {
		 		setState(313)
		 		try match(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue)

		 	}

		 	setState(316)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(317)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(320)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(318)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(319)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassInterfaceContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(326)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(322)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(323)
		 		try protocolList()
		 		setState(324)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(329)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(328)
		 		try instanceVariables()

		 	}

		 	setState(332)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 9147936743095809) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(331)
		 		try interfaceDeclarationList()

		 	}

		 	setState(334)
		 	try match(ObjectiveCParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CategoryInterfaceContext: ParserRuleContext {
		open var className: GenericTypeSpecifierContext!
		open var categoryName: IdentifierContext!
			open
			func INTERFACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INTERFACE.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.END.rawValue, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func instanceVariables() -> InstanceVariablesContext? {
				return getRuleContext(InstanceVariablesContext.self, 0)
			}
			open
			func interfaceDeclarationList() -> InterfaceDeclarationListContext? {
				return getRuleContext(InterfaceDeclarationListContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_categoryInterface
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterCategoryInterface(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitCategoryInterface(self)
			}
		}
	}
	@discardableResult
	 open func categoryInterface() throws -> CategoryInterfaceContext {
		var _localctx: CategoryInterfaceContext
		_localctx = CategoryInterfaceContext(_ctx, getState())
		try enterRule(_localctx, 8, ObjectiveCParser.RULE_categoryInterface)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(336)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(337)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(338)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(340)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(339)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(CategoryInterfaceContext.self).categoryName = assignmentValue
		 		     }()


		 	}

		 	setState(342)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(347)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(343)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(344)
		 		try protocolList()
		 		setState(345)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(350)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(349)
		 		try instanceVariables()

		 	}

		 	setState(353)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 9147936743095809) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(352)
		 		try interfaceDeclarationList()

		 	}

		 	setState(355)
		 	try match(ObjectiveCParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ClassImplementationContext: ParserRuleContext {
		open var className: GenericTypeSpecifierContext!
		open var superclassName: IdentifierContext!
			open
			func IMPLEMENTATION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.END.rawValue, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func instanceVariables() -> InstanceVariablesContext? {
				return getRuleContext(InstanceVariablesContext.self, 0)
			}
			open
			func implementationDefinitionList() -> ImplementationDefinitionListContext? {
				return getRuleContext(ImplementationDefinitionListContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_classImplementation
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClassImplementation(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClassImplementation(self)
			}
		}
	}
	@discardableResult
	 open func classImplementation() throws -> ClassImplementationContext {
		var _localctx: ClassImplementationContext
		_localctx = ClassImplementationContext(_ctx, getState())
		try enterRule(_localctx, 10, ObjectiveCParser.RULE_classImplementation)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(357)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(358)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(361)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(359)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(360)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassImplementationContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(364)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(363)
		 		try instanceVariables()

		 	}

		 	setState(367)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 142936511610873) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(366)
		 		try implementationDefinitionList()

		 	}

		 	setState(369)
		 	try match(ObjectiveCParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CategoryImplementationContext: ParserRuleContext {
		open var className: GenericTypeSpecifierContext!
		open var categoryName: IdentifierContext!
			open
			func IMPLEMENTATION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.END.rawValue, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func implementationDefinitionList() -> ImplementationDefinitionListContext? {
				return getRuleContext(ImplementationDefinitionListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_categoryImplementation
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterCategoryImplementation(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitCategoryImplementation(self)
			}
		}
	}
	@discardableResult
	 open func categoryImplementation() throws -> CategoryImplementationContext {
		var _localctx: CategoryImplementationContext
		_localctx = CategoryImplementationContext(_ctx, getState())
		try enterRule(_localctx, 12, ObjectiveCParser.RULE_categoryImplementation)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(371)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(372)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(373)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(374)
		 	try {
		 			let assignmentValue = try identifier()
		 			_localctx.castdown(CategoryImplementationContext.self).categoryName = assignmentValue
		 	     }()

		 	setState(375)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(377)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 142936511610873) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(376)
		 		try implementationDefinitionList()

		 	}

		 	setState(379)
		 	try match(ObjectiveCParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class GenericTypeSpecifierContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func genericsSpecifier() -> GenericsSpecifierContext? {
				return getRuleContext(GenericsSpecifierContext.self, 0)
			}
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_genericTypeSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterGenericTypeSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitGenericTypeSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func genericTypeSpecifier() throws -> GenericTypeSpecifierContext {
		var _localctx: GenericTypeSpecifierContext
		_localctx = GenericTypeSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 14, ObjectiveCParser.RULE_genericTypeSpecifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(381)
		 	try identifier()
		 	setState(387)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,15,_ctx)) {
		 	case 1:
		 		setState(382)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(383)
		 		try protocolList()
		 		setState(384)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)


		 		break
		 	case 2:
		 		setState(386)
		 		try genericsSpecifier()

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolDeclarationContext: ParserRuleContext {
			open
			func PROTOCOL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROTOCOL.rawValue, 0)
			}
			open
			func protocolName() -> ProtocolNameContext? {
				return getRuleContext(ProtocolNameContext.self, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.END.rawValue, 0)
			}
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func protocolDeclarationSection() -> [ProtocolDeclarationSectionContext] {
				return getRuleContexts(ProtocolDeclarationSectionContext.self)
			}
			open
			func protocolDeclarationSection(_ i: Int) -> ProtocolDeclarationSectionContext? {
				return getRuleContext(ProtocolDeclarationSectionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func protocolDeclaration() throws -> ProtocolDeclarationContext {
		var _localctx: ProtocolDeclarationContext
		_localctx = ProtocolDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 16, ObjectiveCParser.RULE_protocolDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(389)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(390)
		 	try protocolName()
		 	setState(395)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(391)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(392)
		 		try protocolList()
		 		setState(393)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(400)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 70)) & ~0x3f) == 0 && ((Int64(1) << (_la - 70)) & 36591746972383269) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(397)
		 		try protocolDeclarationSection()


		 		setState(402)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(403)
		 	try match(ObjectiveCParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolDeclarationSectionContext: ParserRuleContext {
		open var modifier: Token!
			open
			func REQUIRED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.REQUIRED.rawValue, 0)
			}
			open
			func OPTIONAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OPTIONAL.rawValue, 0)
			}
			open
			func interfaceDeclarationList() -> [InterfaceDeclarationListContext] {
				return getRuleContexts(InterfaceDeclarationListContext.self)
			}
			open
			func interfaceDeclarationList(_ i: Int) -> InterfaceDeclarationListContext? {
				return getRuleContext(InterfaceDeclarationListContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolDeclarationSection
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolDeclarationSection(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolDeclarationSection(self)
			}
		}
	}
	@discardableResult
	 open func protocolDeclarationSection() throws -> ProtocolDeclarationSectionContext {
		var _localctx: ProtocolDeclarationSectionContext
		_localctx = ProtocolDeclarationSectionContext(_ctx, getState())
		try enterRule(_localctx, 18, ObjectiveCParser.RULE_protocolDeclarationSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(417)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .OPTIONAL:fallthrough
		 	case .REQUIRED:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(405)
		 		_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.OPTIONAL.rawValue || _la == ObjectiveCParser.Tokens.REQUIRED.rawValue)) {
		 			_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(409)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(406)
		 				try interfaceDeclarationList()

		 		 
		 			}
		 			setState(411)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
		 		}

		 		break
		 	case .AUTO:fallthrough
		 	case .CHAR:fallthrough
		 	case .CONST:fallthrough
		 	case .DOUBLE:fallthrough
		 	case .ENUM:fallthrough
		 	case .EXTERN:fallthrough
		 	case .FLOAT:fallthrough
		 	case .INLINE:fallthrough
		 	case .INT:fallthrough
		 	case .LONG:fallthrough
		 	case .REGISTER:fallthrough
		 	case .RESTRICT:fallthrough
		 	case .SHORT:fallthrough
		 	case .SIGNED:fallthrough
		 	case .STATIC:fallthrough
		 	case .STRUCT:fallthrough
		 	case .TYPEDEF:fallthrough
		 	case .UNION:fallthrough
		 	case .UNSIGNED:fallthrough
		 	case .VOID:fallthrough
		 	case .VOLATILE:fallthrough
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .PROPERTY:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .ATTRIBUTE:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .STRONG_QUALIFIER:fallthrough
		 	case .TYPEOF:fallthrough
		 	case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
		 	case .UNUSED:fallthrough
		 	case .WEAK_QUALIFIER:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:fallthrough
		 	case .ADD:fallthrough
		 	case .SUB:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(413); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(412)
		 				try interfaceDeclarationList()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(415); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolDeclarationListContext: ParserRuleContext {
			open
			func PROTOCOL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROTOCOL.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolDeclarationList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolDeclarationList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolDeclarationList(self)
			}
		}
	}
	@discardableResult
	 open func protocolDeclarationList() throws -> ProtocolDeclarationListContext {
		var _localctx: ProtocolDeclarationListContext
		_localctx = ProtocolDeclarationListContext(_ctx, getState())
		try enterRule(_localctx, 20, ObjectiveCParser.RULE_protocolDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(419)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(420)
		 	try protocolList()
		 	setState(421)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ClassDeclarationListContext: ParserRuleContext {
			open
			func CLASS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CLASS.rawValue, 0)
			}
			open
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_classDeclarationList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClassDeclarationList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClassDeclarationList(self)
			}
		}
	}
	@discardableResult
	 open func classDeclarationList() throws -> ClassDeclarationListContext {
		var _localctx: ClassDeclarationListContext
		_localctx = ClassDeclarationListContext(_ctx, getState())
		try enterRule(_localctx, 22, ObjectiveCParser.RULE_classDeclarationList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(423)
		 	try match(ObjectiveCParser.Tokens.CLASS.rawValue)
		 	setState(424)
		 	try identifier()
		 	setState(429)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(425)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(426)
		 		try identifier()


		 		setState(431)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(432)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolListContext: ParserRuleContext {
			open
			func protocolName() -> [ProtocolNameContext] {
				return getRuleContexts(ProtocolNameContext.self)
			}
			open
			func protocolName(_ i: Int) -> ProtocolNameContext? {
				return getRuleContext(ProtocolNameContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolList(self)
			}
		}
	}
	@discardableResult
	 open func protocolList() throws -> ProtocolListContext {
		var _localctx: ProtocolListContext
		_localctx = ProtocolListContext(_ctx, getState())
		try enterRule(_localctx, 24, ObjectiveCParser.RULE_protocolList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(434)
		 	try protocolName()
		 	setState(439)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(435)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(436)
		 		try protocolName()


		 		setState(441)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertyDeclarationContext: ParserRuleContext {
			open
			func PROPERTY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROPERTY.rawValue, 0)
			}
			open
			func fieldDeclaration() -> FieldDeclarationContext? {
				return getRuleContext(FieldDeclarationContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func propertyAttributesList() -> PropertyAttributesListContext? {
				return getRuleContext(PropertyAttributesListContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func ibOutletQualifier() -> IbOutletQualifierContext? {
				return getRuleContext(IbOutletQualifierContext.self, 0)
			}
			open
			func IB_INSPECTABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertyDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertyDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertyDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func propertyDeclaration() throws -> PropertyDeclarationContext {
		var _localctx: PropertyDeclarationContext
		_localctx = PropertyDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 26, ObjectiveCParser.RULE_propertyDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(442)
		 	try match(ObjectiveCParser.Tokens.PROPERTY.rawValue)
		 	setState(447)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(443)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(444)
		 		try propertyAttributesList()
		 		setState(445)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	}

		 	setState(450)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,24,_ctx)) {
		 	case 1:
		 		setState(449)
		 		try ibOutletQualifier()

		 		break
		 	default: break
		 	}
		 	setState(453)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,25,_ctx)) {
		 	case 1:
		 		setState(452)
		 		try match(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(455)
		 	try fieldDeclaration()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertyAttributesListContext: ParserRuleContext {
			open
			func propertyAttribute() -> [PropertyAttributeContext] {
				return getRuleContexts(PropertyAttributeContext.self)
			}
			open
			func propertyAttribute(_ i: Int) -> PropertyAttributeContext? {
				return getRuleContext(PropertyAttributeContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertyAttributesList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertyAttributesList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertyAttributesList(self)
			}
		}
	}
	@discardableResult
	 open func propertyAttributesList() throws -> PropertyAttributesListContext {
		var _localctx: PropertyAttributesListContext
		_localctx = PropertyAttributesListContext(_ctx, getState())
		try enterRule(_localctx, 28, ObjectiveCParser.RULE_propertyAttributesList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(457)
		 	try propertyAttribute()
		 	setState(462)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(458)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(459)
		 		try propertyAttribute()


		 		setState(464)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertyAttributeContext: ParserRuleContext {
			open
			func ATOMIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ATOMIC.rawValue, 0)
			}
			open
			func NONATOMIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NONATOMIC.rawValue, 0)
			}
			open
			func STRONG() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRONG.rawValue, 0)
			}
			open
			func WEAK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.WEAK.rawValue, 0)
			}
			open
			func RETAIN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RETAIN.rawValue, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func UNSAFE_UNRETAINED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue, 0)
			}
			open
			func COPY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COPY.rawValue, 0)
			}
			open
			func READONLY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.READONLY.rawValue, 0)
			}
			open
			func READWRITE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.READWRITE.rawValue, 0)
			}
			open
			func GETTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GETTER.rawValue, 0)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func SETTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SETTER.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func nullabilitySpecifier() -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertyAttribute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertyAttribute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertyAttribute(self)
			}
		}
	}
	@discardableResult
	 open func propertyAttribute() throws -> PropertyAttributeContext {
		var _localctx: PropertyAttributeContext
		_localctx = PropertyAttributeContext(_ctx, getState())
		try enterRule(_localctx, 30, ObjectiveCParser.RULE_propertyAttribute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(485)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,27, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(465)
		 		try match(ObjectiveCParser.Tokens.ATOMIC.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(466)
		 		try match(ObjectiveCParser.Tokens.NONATOMIC.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(467)
		 		try match(ObjectiveCParser.Tokens.STRONG.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(468)
		 		try match(ObjectiveCParser.Tokens.WEAK.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(469)
		 		try match(ObjectiveCParser.Tokens.RETAIN.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(470)
		 		try match(ObjectiveCParser.Tokens.ASSIGN.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(471)
		 		try match(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(472)
		 		try match(ObjectiveCParser.Tokens.COPY.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(473)
		 		try match(ObjectiveCParser.Tokens.READONLY.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(474)
		 		try match(ObjectiveCParser.Tokens.READWRITE.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(475)
		 		try match(ObjectiveCParser.Tokens.GETTER.rawValue)
		 		setState(476)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(477)
		 		try identifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(478)
		 		try match(ObjectiveCParser.Tokens.SETTER.rawValue)
		 		setState(479)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(480)
		 		try identifier()
		 		setState(481)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(483)
		 		try nullabilitySpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(484)
		 		try identifier()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolNameContext: ParserRuleContext {
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func COVARIANT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COVARIANT.rawValue, 0)
			}
			open
			func CONTRAVARIANT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CONTRAVARIANT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolName(self)
			}
		}
	}
	@discardableResult
	 open func protocolName() throws -> ProtocolNameContext {
		var _localctx: ProtocolNameContext
		_localctx = ProtocolNameContext(_ctx, getState())
		try enterRule(_localctx, 32, ObjectiveCParser.RULE_protocolName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(495)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LT:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(487)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(488)
		 		try protocolList()
		 		setState(489)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 		break
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(492)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,28,_ctx)) {
		 		case 1:
		 			setState(491)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.COVARIANT.rawValue || _la == ObjectiveCParser.Tokens.CONTRAVARIANT.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 			break
		 		default: break
		 		}
		 		setState(494)
		 		try identifier()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InstanceVariablesContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func visibilitySection() -> [VisibilitySectionContext] {
				return getRuleContexts(VisibilitySectionContext.self)
			}
			open
			func visibilitySection(_ i: Int) -> VisibilitySectionContext? {
				return getRuleContext(VisibilitySectionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_instanceVariables
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInstanceVariables(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInstanceVariables(self)
			}
		}
	}
	@discardableResult
	 open func instanceVariables() throws -> InstanceVariablesContext {
		var _localctx: InstanceVariablesContext
		_localctx = InstanceVariablesContext(_ctx, getState())
		try enterRule(_localctx, 34, ObjectiveCParser.RULE_instanceVariables)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(497)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(501)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 68)) & ~0x3f) == 0 && ((Int64(1) << (_la - 68)) & 146366987889467497) != 0)) {
		 		setState(498)
		 		try visibilitySection()


		 		setState(503)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(504)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VisibilitySectionContext: ParserRuleContext {
			open
			func accessModifier() -> AccessModifierContext? {
				return getRuleContext(AccessModifierContext.self, 0)
			}
			open
			func fieldDeclaration() -> [FieldDeclarationContext] {
				return getRuleContexts(FieldDeclarationContext.self)
			}
			open
			func fieldDeclaration(_ i: Int) -> FieldDeclarationContext? {
				return getRuleContext(FieldDeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_visibilitySection
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterVisibilitySection(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitVisibilitySection(self)
			}
		}
	}
	@discardableResult
	 open func visibilitySection() throws -> VisibilitySectionContext {
		var _localctx: VisibilitySectionContext
		_localctx = VisibilitySectionContext(_ctx, getState())
		try enterRule(_localctx, 36, ObjectiveCParser.RULE_visibilitySection)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(518)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PACKAGE:fallthrough
		 	case .PRIVATE:fallthrough
		 	case .PROTECTED:fallthrough
		 	case .PUBLIC:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(506)
		 		try accessModifier()
		 		setState(510)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,31,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(507)
		 				try fieldDeclaration()

		 		 
		 			}
		 			setState(512)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,31,_ctx)
		 		}

		 		break
		 	case .CHAR:fallthrough
		 	case .CONST:fallthrough
		 	case .DOUBLE:fallthrough
		 	case .ENUM:fallthrough
		 	case .FLOAT:fallthrough
		 	case .INLINE:fallthrough
		 	case .INT:fallthrough
		 	case .LONG:fallthrough
		 	case .RESTRICT:fallthrough
		 	case .SHORT:fallthrough
		 	case .SIGNED:fallthrough
		 	case .STRUCT:fallthrough
		 	case .UNION:fallthrough
		 	case .UNSIGNED:fallthrough
		 	case .VOID:fallthrough
		 	case .VOLATILE:fallthrough
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .STRONG_QUALIFIER:fallthrough
		 	case .TYPEOF:fallthrough
		 	case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
		 	case .UNUSED:fallthrough
		 	case .WEAK_QUALIFIER:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(514); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(513)
		 				try fieldDeclaration()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(516); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,32,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AccessModifierContext: ParserRuleContext {
			open
			func PRIVATE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PRIVATE.rawValue, 0)
			}
			open
			func PROTECTED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROTECTED.rawValue, 0)
			}
			open
			func PACKAGE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PACKAGE.rawValue, 0)
			}
			open
			func PUBLIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PUBLIC.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_accessModifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAccessModifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAccessModifier(self)
			}
		}
	}
	@discardableResult
	 open func accessModifier() throws -> AccessModifierContext {
		var _localctx: AccessModifierContext
		_localctx = AccessModifierContext(_ctx, getState())
		try enterRule(_localctx, 38, ObjectiveCParser.RULE_accessModifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(520)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 68)) & ~0x3f) == 0 && ((Int64(1) << (_la - 68)) & 105) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InterfaceDeclarationListContext: ParserRuleContext {
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
			open
			func classMethodDeclaration() -> [ClassMethodDeclarationContext] {
				return getRuleContexts(ClassMethodDeclarationContext.self)
			}
			open
			func classMethodDeclaration(_ i: Int) -> ClassMethodDeclarationContext? {
				return getRuleContext(ClassMethodDeclarationContext.self, i)
			}
			open
			func instanceMethodDeclaration() -> [InstanceMethodDeclarationContext] {
				return getRuleContexts(InstanceMethodDeclarationContext.self)
			}
			open
			func instanceMethodDeclaration(_ i: Int) -> InstanceMethodDeclarationContext? {
				return getRuleContext(InstanceMethodDeclarationContext.self, i)
			}
			open
			func propertyDeclaration() -> [PropertyDeclarationContext] {
				return getRuleContexts(PropertyDeclarationContext.self)
			}
			open
			func propertyDeclaration(_ i: Int) -> PropertyDeclarationContext? {
				return getRuleContext(PropertyDeclarationContext.self, i)
			}
			open
			func functionDeclaration() -> [FunctionDeclarationContext] {
				return getRuleContexts(FunctionDeclarationContext.self)
			}
			open
			func functionDeclaration(_ i: Int) -> FunctionDeclarationContext? {
				return getRuleContext(FunctionDeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_interfaceDeclarationList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInterfaceDeclarationList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInterfaceDeclarationList(self)
			}
		}
	}
	@discardableResult
	 open func interfaceDeclarationList() throws -> InterfaceDeclarationListContext {
		var _localctx: InterfaceDeclarationListContext
		_localctx = InterfaceDeclarationListContext(_ctx, getState())
		try enterRule(_localctx, 40, ObjectiveCParser.RULE_interfaceDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(527); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(527)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,34, _ctx)) {
		 			case 1:
		 				setState(522)
		 				try declaration()

		 				break
		 			case 2:
		 				setState(523)
		 				try classMethodDeclaration()

		 				break
		 			case 3:
		 				setState(524)
		 				try instanceMethodDeclaration()

		 				break
		 			case 4:
		 				setState(525)
		 				try propertyDeclaration()

		 				break
		 			case 5:
		 				setState(526)
		 				try functionDeclaration()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(529); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,35,_ctx)
		 	} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ClassMethodDeclarationContext: ParserRuleContext {
			open
			func ADD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD.rawValue, 0)
			}
			open
			func methodDeclaration() -> MethodDeclarationContext? {
				return getRuleContext(MethodDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_classMethodDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClassMethodDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClassMethodDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func classMethodDeclaration() throws -> ClassMethodDeclarationContext {
		var _localctx: ClassMethodDeclarationContext
		_localctx = ClassMethodDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 42, ObjectiveCParser.RULE_classMethodDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(531)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(532)
		 	try methodDeclaration()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InstanceMethodDeclarationContext: ParserRuleContext {
			open
			func SUB() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB.rawValue, 0)
			}
			open
			func methodDeclaration() -> MethodDeclarationContext? {
				return getRuleContext(MethodDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_instanceMethodDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInstanceMethodDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInstanceMethodDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func instanceMethodDeclaration() throws -> InstanceMethodDeclarationContext {
		var _localctx: InstanceMethodDeclarationContext
		_localctx = InstanceMethodDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 44, ObjectiveCParser.RULE_instanceMethodDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(534)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(535)
		 	try methodDeclaration()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MethodDeclarationContext: ParserRuleContext {
			open
			func methodSelector() -> MethodSelectorContext? {
				return getRuleContext(MethodSelectorContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func methodType() -> MethodTypeContext? {
				return getRuleContext(MethodTypeContext.self, 0)
			}
			open
			func macro() -> MacroContext? {
				return getRuleContext(MacroContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_methodDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMethodDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMethodDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func methodDeclaration() throws -> MethodDeclarationContext {
		var _localctx: MethodDeclarationContext
		_localctx = MethodDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 46, ObjectiveCParser.RULE_methodDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(538)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(537)
		 		try methodType()

		 	}

		 	setState(540)
		 	try methodSelector()
		 	setState(542)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(541)
		 		try macro()

		 	}

		 	setState(544)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ImplementationDefinitionListContext: ParserRuleContext {
			open
			func functionDefinition() -> [FunctionDefinitionContext] {
				return getRuleContexts(FunctionDefinitionContext.self)
			}
			open
			func functionDefinition(_ i: Int) -> FunctionDefinitionContext? {
				return getRuleContext(FunctionDefinitionContext.self, i)
			}
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
			open
			func classMethodDefinition() -> [ClassMethodDefinitionContext] {
				return getRuleContexts(ClassMethodDefinitionContext.self)
			}
			open
			func classMethodDefinition(_ i: Int) -> ClassMethodDefinitionContext? {
				return getRuleContext(ClassMethodDefinitionContext.self, i)
			}
			open
			func instanceMethodDefinition() -> [InstanceMethodDefinitionContext] {
				return getRuleContexts(InstanceMethodDefinitionContext.self)
			}
			open
			func instanceMethodDefinition(_ i: Int) -> InstanceMethodDefinitionContext? {
				return getRuleContext(InstanceMethodDefinitionContext.self, i)
			}
			open
			func propertyImplementation() -> [PropertyImplementationContext] {
				return getRuleContexts(PropertyImplementationContext.self)
			}
			open
			func propertyImplementation(_ i: Int) -> PropertyImplementationContext? {
				return getRuleContext(PropertyImplementationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_implementationDefinitionList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterImplementationDefinitionList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitImplementationDefinitionList(self)
			}
		}
	}
	@discardableResult
	 open func implementationDefinitionList() throws -> ImplementationDefinitionListContext {
		var _localctx: ImplementationDefinitionListContext
		_localctx = ImplementationDefinitionListContext(_ctx, getState())
		try enterRule(_localctx, 48, ObjectiveCParser.RULE_implementationDefinitionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(551) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(551)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,38, _ctx)) {
		 		case 1:
		 			setState(546)
		 			try functionDefinition()

		 			break
		 		case 2:
		 			setState(547)
		 			try declaration()

		 			break
		 		case 3:
		 			setState(548)
		 			try classMethodDefinition()

		 			break
		 		case 4:
		 			setState(549)
		 			try instanceMethodDefinition()

		 			break
		 		case 5:
		 			setState(550)
		 			try propertyImplementation()

		 			break
		 		default: break
		 		}

		 		setState(553); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 142936511610873) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ClassMethodDefinitionContext: ParserRuleContext {
			open
			func ADD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD.rawValue, 0)
			}
			open
			func methodDefinition() -> MethodDefinitionContext? {
				return getRuleContext(MethodDefinitionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_classMethodDefinition
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClassMethodDefinition(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClassMethodDefinition(self)
			}
		}
	}
	@discardableResult
	 open func classMethodDefinition() throws -> ClassMethodDefinitionContext {
		var _localctx: ClassMethodDefinitionContext
		_localctx = ClassMethodDefinitionContext(_ctx, getState())
		try enterRule(_localctx, 50, ObjectiveCParser.RULE_classMethodDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(555)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(556)
		 	try methodDefinition()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InstanceMethodDefinitionContext: ParserRuleContext {
			open
			func SUB() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB.rawValue, 0)
			}
			open
			func methodDefinition() -> MethodDefinitionContext? {
				return getRuleContext(MethodDefinitionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_instanceMethodDefinition
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInstanceMethodDefinition(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInstanceMethodDefinition(self)
			}
		}
	}
	@discardableResult
	 open func instanceMethodDefinition() throws -> InstanceMethodDefinitionContext {
		var _localctx: InstanceMethodDefinitionContext
		_localctx = InstanceMethodDefinitionContext(_ctx, getState())
		try enterRule(_localctx, 52, ObjectiveCParser.RULE_instanceMethodDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(558)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(559)
		 	try methodDefinition()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MethodDefinitionContext: ParserRuleContext {
			open
			func methodSelector() -> MethodSelectorContext? {
				return getRuleContext(MethodSelectorContext.self, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
			open
			func methodType() -> MethodTypeContext? {
				return getRuleContext(MethodTypeContext.self, 0)
			}
			open
			func initDeclaratorList() -> InitDeclaratorListContext? {
				return getRuleContext(InitDeclaratorListContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_methodDefinition
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMethodDefinition(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMethodDefinition(self)
			}
		}
	}
	@discardableResult
	 open func methodDefinition() throws -> MethodDefinitionContext {
		var _localctx: MethodDefinitionContext
		_localctx = MethodDefinitionContext(_ctx, getState())
		try enterRule(_localctx, 54, ObjectiveCParser.RULE_methodDefinition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(562)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(561)
		 		try methodType()

		 	}

		 	setState(564)
		 	try methodSelector()
		 	setState(566)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 40)) & ~0x3f) == 0 && ((Int64(1) << (_la - 40)) & -414491694415611649) != 0) || ((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 1125899913166847) != 0)) {
		 		setState(565)
		 		try initDeclaratorList()

		 	}

		 	setState(569)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(568)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 	}

		 	setState(571)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MethodSelectorContext: ParserRuleContext {
			open
			func selector() -> SelectorContext? {
				return getRuleContext(SelectorContext.self, 0)
			}
			open
			func keywordDeclarator() -> [KeywordDeclaratorContext] {
				return getRuleContexts(KeywordDeclaratorContext.self)
			}
			open
			func keywordDeclarator(_ i: Int) -> KeywordDeclaratorContext? {
				return getRuleContext(KeywordDeclaratorContext.self, i)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func ELIPSIS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ELIPSIS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_methodSelector
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMethodSelector(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMethodSelector(self)
			}
		}
	}
	@discardableResult
	 open func methodSelector() throws -> MethodSelectorContext {
		var _localctx: MethodSelectorContext
		_localctx = MethodSelectorContext(_ctx, getState())
		try enterRule(_localctx, 56, ObjectiveCParser.RULE_methodSelector)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(583)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,45, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(573)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(575); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(574)
		 				try keywordDeclarator()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(577); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,43,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(581)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(579)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(580)
		 			try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)

		 		}


		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class KeywordDeclaratorContext: ParserRuleContext {
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func selector() -> SelectorContext? {
				return getRuleContext(SelectorContext.self, 0)
			}
			open
			func methodType() -> [MethodTypeContext] {
				return getRuleContexts(MethodTypeContext.self)
			}
			open
			func methodType(_ i: Int) -> MethodTypeContext? {
				return getRuleContext(MethodTypeContext.self, i)
			}
			open
			func arcBehaviourSpecifier() -> ArcBehaviourSpecifierContext? {
				return getRuleContext(ArcBehaviourSpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_keywordDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterKeywordDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitKeywordDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func keywordDeclarator() throws -> KeywordDeclaratorContext {
		var _localctx: KeywordDeclaratorContext
		_localctx = KeywordDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 58, ObjectiveCParser.RULE_keywordDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(586)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(585)
		 		try selector()

		 	}

		 	setState(588)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(592)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(589)
		 		try methodType()


		 		setState(594)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(596)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,48,_ctx)) {
		 	case 1:
		 		setState(595)
		 		try arcBehaviourSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(598)
		 	try identifier()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectorContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func RETURN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RETURN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_selector
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSelector(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSelector(self)
			}
		}
	}
	@discardableResult
	 open func selector() throws -> SelectorContext {
		var _localctx: SelectorContext
		_localctx = SelectorContext(_ctx, getState())
		try enterRule(_localctx, 60, ObjectiveCParser.RULE_selector)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(602)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(600)
		 		try identifier()

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(601)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MethodTypeContext: ParserRuleContext {
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_methodType
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMethodType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMethodType(self)
			}
		}
	}
	@discardableResult
	 open func methodType() throws -> MethodTypeContext {
		var _localctx: MethodTypeContext
		_localctx = MethodTypeContext(_ctx, getState())
		try enterRule(_localctx, 62, ObjectiveCParser.RULE_methodType)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(604)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(605)
		 	try typeName()
		 	setState(606)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertyImplementationContext: ParserRuleContext {
			open
			func SYNTHESIZE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SYNTHESIZE.rawValue, 0)
			}
			open
			func propertySynthesizeList() -> PropertySynthesizeListContext? {
				return getRuleContext(PropertySynthesizeListContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func DYNAMIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DYNAMIC.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertyImplementation
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertyImplementation(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertyImplementation(self)
			}
		}
	}
	@discardableResult
	 open func propertyImplementation() throws -> PropertyImplementationContext {
		var _localctx: PropertyImplementationContext
		_localctx = PropertyImplementationContext(_ctx, getState())
		try enterRule(_localctx, 64, ObjectiveCParser.RULE_propertyImplementation)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(616)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .SYNTHESIZE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(608)
		 		try match(ObjectiveCParser.Tokens.SYNTHESIZE.rawValue)
		 		setState(609)
		 		try propertySynthesizeList()
		 		setState(610)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break

		 	case .DYNAMIC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(612)
		 		try match(ObjectiveCParser.Tokens.DYNAMIC.rawValue)
		 		setState(613)
		 		try propertySynthesizeList()
		 		setState(614)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertySynthesizeListContext: ParserRuleContext {
			open
			func propertySynthesizeItem() -> [PropertySynthesizeItemContext] {
				return getRuleContexts(PropertySynthesizeItemContext.self)
			}
			open
			func propertySynthesizeItem(_ i: Int) -> PropertySynthesizeItemContext? {
				return getRuleContext(PropertySynthesizeItemContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertySynthesizeList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertySynthesizeList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertySynthesizeList(self)
			}
		}
	}
	@discardableResult
	 open func propertySynthesizeList() throws -> PropertySynthesizeListContext {
		var _localctx: PropertySynthesizeListContext
		_localctx = PropertySynthesizeListContext(_ctx, getState())
		try enterRule(_localctx, 66, ObjectiveCParser.RULE_propertySynthesizeList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(618)
		 	try propertySynthesizeItem()
		 	setState(623)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(619)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(620)
		 		try propertySynthesizeItem()


		 		setState(625)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PropertySynthesizeItemContext: ParserRuleContext {
			open
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_propertySynthesizeItem
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPropertySynthesizeItem(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPropertySynthesizeItem(self)
			}
		}
	}
	@discardableResult
	 open func propertySynthesizeItem() throws -> PropertySynthesizeItemContext {
		var _localctx: PropertySynthesizeItemContext
		_localctx = PropertySynthesizeItemContext(_ctx, getState())
		try enterRule(_localctx, 68, ObjectiveCParser.RULE_propertySynthesizeItem)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(626)
		 	try identifier()
		 	setState(629)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(627)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(628)
		 		try identifier()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockTypeContext: ParserRuleContext {
			open
			func typeSpecifier() -> [TypeSpecifierContext] {
				return getRuleContexts(TypeSpecifierContext.self)
			}
			open
			func typeSpecifier(_ i: Int) -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, i)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func BITXOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITXOR.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func nullabilitySpecifier() -> [NullabilitySpecifierContext] {
				return getRuleContexts(NullabilitySpecifierContext.self)
			}
			open
			func nullabilitySpecifier(_ i: Int) -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, i)
			}
			open
			func blockParameters() -> BlockParametersContext? {
				return getRuleContext(BlockParametersContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_blockType
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterBlockType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitBlockType(self)
			}
		}
	}
	@discardableResult
	 open func blockType() throws -> BlockTypeContext {
		var _localctx: BlockTypeContext
		_localctx = BlockTypeContext(_ctx, getState())
		try enterRule(_localctx, 70, ObjectiveCParser.RULE_blockType)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(632)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,53,_ctx)) {
		 	case 1:
		 		setState(631)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(634)
		 	try typeSpecifier()
		 	setState(636)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(635)
		 		try nullabilitySpecifier()

		 	}

		 	setState(638)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(639)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(642)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,55,_ctx)) {
		 	case 1:
		 		setState(640)
		 		try nullabilitySpecifier()

		 		break
		 	case 2:
		 		setState(641)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(644)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(646)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(645)
		 		try blockParameters()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class GenericsSpecifierContext: ParserRuleContext {
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func typeSpecifierWithPrefixes() -> [TypeSpecifierWithPrefixesContext] {
				return getRuleContexts(TypeSpecifierWithPrefixesContext.self)
			}
			open
			func typeSpecifierWithPrefixes(_ i: Int) -> TypeSpecifierWithPrefixesContext? {
				return getRuleContext(TypeSpecifierWithPrefixesContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_genericsSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterGenericsSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitGenericsSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func genericsSpecifier() throws -> GenericsSpecifierContext {
		var _localctx: GenericsSpecifierContext
		_localctx = GenericsSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 72, ObjectiveCParser.RULE_genericsSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(648)
		 	try match(ObjectiveCParser.Tokens.LT.rawValue)
		 	setState(657)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063951351) != 0)) {
		 		setState(649)
		 		try typeSpecifierWithPrefixes()
		 		setState(654)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(650)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(651)
		 			try typeSpecifierWithPrefixes()


		 			setState(656)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(659)
		 	try match(ObjectiveCParser.Tokens.GT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeSpecifierWithPrefixesContext: ParserRuleContext {
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
			open
			func typePrefix() -> [TypePrefixContext] {
				return getRuleContexts(TypePrefixContext.self)
			}
			open
			func typePrefix(_ i: Int) -> TypePrefixContext? {
				return getRuleContext(TypePrefixContext.self, i)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeSpecifierWithPrefixes
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeSpecifierWithPrefixes(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeSpecifierWithPrefixes(self)
			}
		}
	}
	@discardableResult
	 open func typeSpecifierWithPrefixes() throws -> TypeSpecifierWithPrefixesContext {
		var _localctx: TypeSpecifierWithPrefixesContext
		_localctx = TypeSpecifierWithPrefixesContext(_ctx, getState())
		try enterRule(_localctx, 74, ObjectiveCParser.RULE_typeSpecifierWithPrefixes)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(669)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,60, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(664)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,59,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(661)
		 				try typePrefix()

		 		 
		 			}
		 			setState(666)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,59,_ctx)
		 		}
		 		setState(667)
		 		try typeSpecifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(668)
		 		try typeName()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DictionaryExpressionContext: ParserRuleContext {
			open
			func AT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AT.rawValue, 0)
			}
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func dictionaryPair() -> [DictionaryPairContext] {
				return getRuleContexts(DictionaryPairContext.self)
			}
			open
			func dictionaryPair(_ i: Int) -> DictionaryPairContext? {
				return getRuleContext(DictionaryPairContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_dictionaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDictionaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDictionaryExpression(self)
			}
		}
	}
	@discardableResult
	 open func dictionaryExpression() throws -> DictionaryExpressionContext {
		var _localctx: DictionaryExpressionContext
		_localctx = DictionaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 76, ObjectiveCParser.RULE_dictionaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(671)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(672)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(684)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(673)
		 		try dictionaryPair()
		 		setState(678)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(674)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(675)
		 				try dictionaryPair()

		 		 
		 			}
		 			setState(680)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		}
		 		setState(682)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(681)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(686)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DictionaryPairContext: ParserRuleContext {
			open
			func castExpression() -> CastExpressionContext? {
				return getRuleContext(CastExpressionContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_dictionaryPair
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDictionaryPair(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDictionaryPair(self)
			}
		}
	}
	@discardableResult
	 open func dictionaryPair() throws -> DictionaryPairContext {
		var _localctx: DictionaryPairContext
		_localctx = DictionaryPairContext(_ctx, getState())
		try enterRule(_localctx, 78, ObjectiveCParser.RULE_dictionaryPair)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(688)
		 	try castExpression()
		 	setState(689)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(690)
		 	try expression(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArrayExpressionContext: ParserRuleContext {
			open
			func AT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AT.rawValue, 0)
			}
			open
			func LBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, 0)
			}
			open
			func RBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, 0)
			}
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_arrayExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterArrayExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitArrayExpression(self)
			}
		}
	}
	@discardableResult
	 open func arrayExpression() throws -> ArrayExpressionContext {
		var _localctx: ArrayExpressionContext
		_localctx = ArrayExpressionContext(_ctx, getState())
		try enterRule(_localctx, 80, ObjectiveCParser.RULE_arrayExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(692)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(693)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(698)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(694)
		 		try expressions()
		 		setState(696)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(695)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(700)
		 	try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BoxExpressionContext: ParserRuleContext {
			open
			func AT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AT.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_boxExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterBoxExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitBoxExpression(self)
			}
		}
	}
	@discardableResult
	 open func boxExpression() throws -> BoxExpressionContext {
		var _localctx: BoxExpressionContext
		_localctx = BoxExpressionContext(_ctx, getState())
		try enterRule(_localctx, 82, ObjectiveCParser.RULE_boxExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(712)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,67, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(702)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(703)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(704)
		 		try expression(0)
		 		setState(705)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(707)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(710)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .TRUE:fallthrough
		 		case .FALSE:fallthrough
		 		case .NIL:fallthrough
		 		case .NO:fallthrough
		 		case .NULL_:fallthrough
		 		case .YES:fallthrough
		 		case .ADD:fallthrough
		 		case .SUB:fallthrough
		 		case .CHARACTER_LITERAL:fallthrough
		 		case .HEX_LITERAL:fallthrough
		 		case .OCTAL_LITERAL:fallthrough
		 		case .BINARY_LITERAL:fallthrough
		 		case .DECIMAL_LITERAL:fallthrough
		 		case .FLOATING_POINT_LITERAL:
		 			setState(708)
		 			try constant()

		 			break
		 		case .BOOL:fallthrough
		 		case .Class:fallthrough
		 		case .BYCOPY:fallthrough
		 		case .BYREF:fallthrough
		 		case .ID:fallthrough
		 		case .IMP:fallthrough
		 		case .IN:fallthrough
		 		case .INOUT:fallthrough
		 		case .ONEWAY:fallthrough
		 		case .OUT:fallthrough
		 		case .PROTOCOL_:fallthrough
		 		case .SEL:fallthrough
		 		case .SELF:fallthrough
		 		case .SUPER:fallthrough
		 		case .ATOMIC:fallthrough
		 		case .NONATOMIC:fallthrough
		 		case .RETAIN:fallthrough
		 		case .AUTORELEASING_QUALIFIER:fallthrough
		 		case .BLOCK:fallthrough
		 		case .BRIDGE_RETAINED:fallthrough
		 		case .BRIDGE_TRANSFER:fallthrough
		 		case .COVARIANT:fallthrough
		 		case .CONTRAVARIANT:fallthrough
		 		case .DEPRECATED:fallthrough
		 		case .KINDOF:fallthrough
		 		case .UNUSED:fallthrough
		 		case .NULL_UNSPECIFIED:fallthrough
		 		case .NULLABLE:fallthrough
		 		case .NONNULL:fallthrough
		 		case .NULL_RESETTABLE:fallthrough
		 		case .NS_INLINE:fallthrough
		 		case .NS_ENUM:fallthrough
		 		case .NS_OPTIONS:fallthrough
		 		case .ASSIGN:fallthrough
		 		case .COPY:fallthrough
		 		case .GETTER:fallthrough
		 		case .SETTER:fallthrough
		 		case .STRONG:fallthrough
		 		case .READONLY:fallthrough
		 		case .READWRITE:fallthrough
		 		case .WEAK:fallthrough
		 		case .UNSAFE_UNRETAINED:fallthrough
		 		case .IB_OUTLET:fallthrough
		 		case .IB_OUTLET_COLLECTION:fallthrough
		 		case .IB_INSPECTABLE:fallthrough
		 		case .IB_DESIGNABLE:fallthrough
		 		case .IDENTIFIER:
		 			setState(709)
		 			try identifier()

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockParametersContext: ParserRuleContext {
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func typeVariableDeclaratorOrName() -> [TypeVariableDeclaratorOrNameContext] {
				return getRuleContexts(TypeVariableDeclaratorOrNameContext.self)
			}
			open
			func typeVariableDeclaratorOrName(_ i: Int) -> TypeVariableDeclaratorOrNameContext? {
				return getRuleContext(TypeVariableDeclaratorOrNameContext.self, i)
			}
			open
			func VOID() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.VOID.rawValue, 0)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_blockParameters
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterBlockParameters(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitBlockParameters(self)
			}
		}
	}
	@discardableResult
	 open func blockParameters() throws -> BlockParametersContext {
		var _localctx: BlockParametersContext
		_localctx = BlockParametersContext(_ctx, getState())
		try enterRule(_localctx, 84, ObjectiveCParser.RULE_blockParameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(714)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(726)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063951359) != 0)) {
		 		setState(717)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,68, _ctx)) {
		 		case 1:
		 			setState(715)
		 			try typeVariableDeclaratorOrName()

		 			break
		 		case 2:
		 			setState(716)
		 			try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 			break
		 		default: break
		 		}
		 		setState(723)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(719)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(720)
		 			try typeVariableDeclaratorOrName()


		 			setState(725)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(728)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeVariableDeclaratorOrNameContext: ParserRuleContext {
			open
			func typeVariableDeclarator() -> TypeVariableDeclaratorContext? {
				return getRuleContext(TypeVariableDeclaratorContext.self, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeVariableDeclaratorOrName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeVariableDeclaratorOrName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeVariableDeclaratorOrName(self)
			}
		}
	}
	@discardableResult
	 open func typeVariableDeclaratorOrName() throws -> TypeVariableDeclaratorOrNameContext {
		var _localctx: TypeVariableDeclaratorOrNameContext
		_localctx = TypeVariableDeclaratorOrNameContext(_ctx, getState())
		try enterRule(_localctx, 86, ObjectiveCParser.RULE_typeVariableDeclaratorOrName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(732)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,71, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(730)
		 		try typeVariableDeclarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(731)
		 		try typeName()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BlockExpressionContext: ParserRuleContext {
			open
			func BITXOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITXOR.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
			open
			func nullabilitySpecifier() -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, 0)
			}
			open
			func blockParameters() -> BlockParametersContext? {
				return getRuleContext(BlockParametersContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_blockExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterBlockExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitBlockExpression(self)
			}
		}
	}
	@discardableResult
	 open func blockExpression() throws -> BlockExpressionContext {
		var _localctx: BlockExpressionContext
		_localctx = BlockExpressionContext(_ctx, getState())
		try enterRule(_localctx, 88, ObjectiveCParser.RULE_blockExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(734)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(736)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,72,_ctx)) {
		 	case 1:
		 		setState(735)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(739)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(738)
		 		try nullabilitySpecifier()

		 	}

		 	setState(742)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(741)
		 		try blockParameters()

		 	}

		 	setState(744)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MessageExpressionContext: ParserRuleContext {
			open
			func LBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, 0)
			}
			open
			func receiver() -> ReceiverContext? {
				return getRuleContext(ReceiverContext.self, 0)
			}
			open
			func messageSelector() -> MessageSelectorContext? {
				return getRuleContext(MessageSelectorContext.self, 0)
			}
			open
			func RBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_messageExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMessageExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMessageExpression(self)
			}
		}
	}
	@discardableResult
	 open func messageExpression() throws -> MessageExpressionContext {
		var _localctx: MessageExpressionContext
		_localctx = MessageExpressionContext(_ctx, getState())
		try enterRule(_localctx, 90, ObjectiveCParser.RULE_messageExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(746)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(747)
		 	try receiver()
		 	setState(748)
		 	try messageSelector()
		 	setState(749)
		 	try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReceiverContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_receiver
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterReceiver(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitReceiver(self)
			}
		}
	}
	@discardableResult
	 open func receiver() throws -> ReceiverContext {
		var _localctx: ReceiverContext
		_localctx = ReceiverContext(_ctx, getState())
		try enterRule(_localctx, 92, ObjectiveCParser.RULE_receiver)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(753)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,75, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(751)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(752)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MessageSelectorContext: ParserRuleContext {
			open
			func selector() -> SelectorContext? {
				return getRuleContext(SelectorContext.self, 0)
			}
			open
			func keywordArgument() -> [KeywordArgumentContext] {
				return getRuleContexts(KeywordArgumentContext.self)
			}
			open
			func keywordArgument(_ i: Int) -> KeywordArgumentContext? {
				return getRuleContext(KeywordArgumentContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_messageSelector
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMessageSelector(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMessageSelector(self)
			}
		}
	}
	@discardableResult
	 open func messageSelector() throws -> MessageSelectorContext {
		var _localctx: MessageSelectorContext
		_localctx = MessageSelectorContext(_ctx, getState())
		try enterRule(_localctx, 94, ObjectiveCParser.RULE_messageSelector)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(761)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,77, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(755)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(757) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(756)
		 			try keywordArgument()


		 			setState(759); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4611703885491150775) != 0))

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class KeywordArgumentContext: ParserRuleContext {
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func keywordArgumentType() -> [KeywordArgumentTypeContext] {
				return getRuleContexts(KeywordArgumentTypeContext.self)
			}
			open
			func keywordArgumentType(_ i: Int) -> KeywordArgumentTypeContext? {
				return getRuleContext(KeywordArgumentTypeContext.self, i)
			}
			open
			func selector() -> SelectorContext? {
				return getRuleContext(SelectorContext.self, 0)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_keywordArgument
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterKeywordArgument(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitKeywordArgument(self)
			}
		}
	}
	@discardableResult
	 open func keywordArgument() throws -> KeywordArgumentContext {
		var _localctx: KeywordArgumentContext
		_localctx = KeywordArgumentContext(_ctx, getState())
		try enterRule(_localctx, 96, ObjectiveCParser.RULE_keywordArgument)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(764)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(763)
		 		try selector()

		 	}

		 	setState(766)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(767)
		 	try keywordArgumentType()
		 	setState(772)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(768)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(769)
		 		try keywordArgumentType()


		 		setState(774)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class KeywordArgumentTypeContext: ParserRuleContext {
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
			open
			func nullabilitySpecifier() -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, 0)
			}
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func initializerList() -> InitializerListContext? {
				return getRuleContext(InitializerListContext.self, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_keywordArgumentType
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterKeywordArgumentType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitKeywordArgumentType(self)
			}
		}
	}
	@discardableResult
	 open func keywordArgumentType() throws -> KeywordArgumentTypeContext {
		var _localctx: KeywordArgumentTypeContext
		_localctx = KeywordArgumentTypeContext(_ctx, getState())
		try enterRule(_localctx, 98, ObjectiveCParser.RULE_keywordArgumentType)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(775)
		 	try expressions()
		 	setState(777)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,80,_ctx)) {
		 	case 1:
		 		setState(776)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(783)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(779)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(780)
		 		try initializerList()
		 		setState(781)
		 		try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectorExpressionContext: ParserRuleContext {
			open
			func SELECTOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SELECTOR.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func selectorName() -> SelectorNameContext? {
				return getRuleContext(SelectorNameContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_selectorExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSelectorExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSelectorExpression(self)
			}
		}
	}
	@discardableResult
	 open func selectorExpression() throws -> SelectorExpressionContext {
		var _localctx: SelectorExpressionContext
		_localctx = SelectorExpressionContext(_ctx, getState())
		try enterRule(_localctx, 100, ObjectiveCParser.RULE_selectorExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(785)
		 	try match(ObjectiveCParser.Tokens.SELECTOR.rawValue)
		 	setState(786)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(787)
		 	try selectorName()
		 	setState(788)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectorNameContext: ParserRuleContext {
			open
			func selector() -> [SelectorContext] {
				return getRuleContexts(SelectorContext.self)
			}
			open
			func selector(_ i: Int) -> SelectorContext? {
				return getRuleContext(SelectorContext.self, i)
			}
			open
			func COLON() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COLON.rawValue)
			}
			open
			func COLON(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_selectorName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSelectorName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSelectorName(self)
			}
		}
	}
	@discardableResult
	 open func selectorName() throws -> SelectorNameContext {
		var _localctx: SelectorNameContext
		_localctx = SelectorNameContext(_ctx, getState())
		try enterRule(_localctx, 102, ObjectiveCParser.RULE_selectorName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(799)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,84, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(790)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(795) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(792)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 				setState(791)
		 				try selector()

		 			}

		 			setState(794)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 			setState(797); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4611703885491150775) != 0))

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolExpressionContext: ParserRuleContext {
			open
			func PROTOCOL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROTOCOL.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func protocolName() -> ProtocolNameContext? {
				return getRuleContext(ProtocolNameContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolExpression(self)
			}
		}
	}
	@discardableResult
	 open func protocolExpression() throws -> ProtocolExpressionContext {
		var _localctx: ProtocolExpressionContext
		_localctx = ProtocolExpressionContext(_ctx, getState())
		try enterRule(_localctx, 104, ObjectiveCParser.RULE_protocolExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(801)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(802)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(803)
		 	try protocolName()
		 	setState(804)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EncodeExpressionContext: ParserRuleContext {
			open
			func ENCODE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ENCODE.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_encodeExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEncodeExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEncodeExpression(self)
			}
		}
	}
	@discardableResult
	 open func encodeExpression() throws -> EncodeExpressionContext {
		var _localctx: EncodeExpressionContext
		_localctx = EncodeExpressionContext(_ctx, getState())
		try enterRule(_localctx, 106, ObjectiveCParser.RULE_encodeExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(806)
		 	try match(ObjectiveCParser.Tokens.ENCODE.rawValue)
		 	setState(807)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(808)
		 	try typeName()
		 	setState(809)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeVariableDeclaratorContext: ParserRuleContext {
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeVariableDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeVariableDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeVariableDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func typeVariableDeclarator() throws -> TypeVariableDeclaratorContext {
		var _localctx: TypeVariableDeclaratorContext
		_localctx = TypeVariableDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 108, ObjectiveCParser.RULE_typeVariableDeclarator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(811)
		 	try declarationSpecifiers()
		 	setState(812)
		 	try declarator()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ThrowStatementContext: ParserRuleContext {
			open
			func THROW() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.THROW.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_throwStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterThrowStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitThrowStatement(self)
			}
		}
	}
	@discardableResult
	 open func throwStatement() throws -> ThrowStatementContext {
		var _localctx: ThrowStatementContext
		_localctx = ThrowStatementContext(_ctx, getState())
		try enterRule(_localctx, 110, ObjectiveCParser.RULE_throwStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(821)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,85, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(814)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(815)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(816)
		 		try identifier()
		 		setState(817)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(819)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(820)
		 		try expression(0)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TryBlockContext: ParserRuleContext {
		open var tryStatement: CompoundStatementContext!
		open var finallyStatement: CompoundStatementContext!
			open
			func TRY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TRY.rawValue, 0)
			}
			open
			func compoundStatement() -> [CompoundStatementContext] {
				return getRuleContexts(CompoundStatementContext.self)
			}
			open
			func compoundStatement(_ i: Int) -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, i)
			}
			open
			func catchStatement() -> [CatchStatementContext] {
				return getRuleContexts(CatchStatementContext.self)
			}
			open
			func catchStatement(_ i: Int) -> CatchStatementContext? {
				return getRuleContext(CatchStatementContext.self, i)
			}
			open
			func FINALLY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FINALLY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_tryBlock
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTryBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTryBlock(self)
			}
		}
	}
	@discardableResult
	 open func tryBlock() throws -> TryBlockContext {
		var _localctx: TryBlockContext
		_localctx = TryBlockContext(_ctx, getState())
		try enterRule(_localctx, 112, ObjectiveCParser.RULE_tryBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(823)
		 	try match(ObjectiveCParser.Tokens.TRY.rawValue)
		 	setState(824)
		 	try {
		 			let assignmentValue = try compoundStatement()
		 			_localctx.castdown(TryBlockContext.self).tryStatement = assignmentValue
		 	     }()

		 	setState(828)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CATCH.rawValue) {
		 		setState(825)
		 		try catchStatement()


		 		setState(830)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(833)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.FINALLY.rawValue) {
		 		setState(831)
		 		try match(ObjectiveCParser.Tokens.FINALLY.rawValue)
		 		setState(832)
		 		try {
		 				let assignmentValue = try compoundStatement()
		 				_localctx.castdown(TryBlockContext.self).finallyStatement = assignmentValue
		 		     }()


		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CatchStatementContext: ParserRuleContext {
			open
			func CATCH() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CATCH.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeVariableDeclarator() -> TypeVariableDeclaratorContext? {
				return getRuleContext(TypeVariableDeclaratorContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_catchStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterCatchStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitCatchStatement(self)
			}
		}
	}
	@discardableResult
	 open func catchStatement() throws -> CatchStatementContext {
		var _localctx: CatchStatementContext
		_localctx = CatchStatementContext(_ctx, getState())
		try enterRule(_localctx, 114, ObjectiveCParser.RULE_catchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(835)
		 	try match(ObjectiveCParser.Tokens.CATCH.rawValue)
		 	setState(836)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(837)
		 	try typeVariableDeclarator()
		 	setState(838)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(839)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SynchronizedStatementContext: ParserRuleContext {
			open
			func SYNCHRONIZED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_synchronizedStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSynchronizedStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSynchronizedStatement(self)
			}
		}
	}
	@discardableResult
	 open func synchronizedStatement() throws -> SynchronizedStatementContext {
		var _localctx: SynchronizedStatementContext
		_localctx = SynchronizedStatementContext(_ctx, getState())
		try enterRule(_localctx, 116, ObjectiveCParser.RULE_synchronizedStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(841)
		 	try match(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue)
		 	setState(842)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(843)
		 	try expression(0)
		 	setState(844)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(845)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AutoreleaseStatementContext: ParserRuleContext {
			open
			func AUTORELEASEPOOL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_autoreleaseStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAutoreleaseStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAutoreleaseStatement(self)
			}
		}
	}
	@discardableResult
	 open func autoreleaseStatement() throws -> AutoreleaseStatementContext {
		var _localctx: AutoreleaseStatementContext
		_localctx = AutoreleaseStatementContext(_ctx, getState())
		try enterRule(_localctx, 118, ObjectiveCParser.RULE_autoreleaseStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(847)
		 	try match(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue)
		 	setState(848)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDeclarationContext: ParserRuleContext {
			open
			func functionSignature() -> FunctionSignatureContext? {
				return getRuleContext(FunctionSignatureContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_functionDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFunctionDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFunctionDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func functionDeclaration() throws -> FunctionDeclarationContext {
		var _localctx: FunctionDeclarationContext
		_localctx = FunctionDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 120, ObjectiveCParser.RULE_functionDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(850)
		 	try functionSignature()
		 	setState(851)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDefinitionContext: ParserRuleContext {
			open
			func functionSignature() -> FunctionSignatureContext? {
				return getRuleContext(FunctionSignatureContext.self, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_functionDefinition
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFunctionDefinition(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFunctionDefinition(self)
			}
		}
	}
	@discardableResult
	 open func functionDefinition() throws -> FunctionDefinitionContext {
		var _localctx: FunctionDefinitionContext
		_localctx = FunctionDefinitionContext(_ctx, getState())
		try enterRule(_localctx, 122, ObjectiveCParser.RULE_functionDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(853)
		 	try functionSignature()
		 	setState(854)
		 	try compoundStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionSignatureContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func attributeSpecifier() -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, 0)
			}
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_functionSignature
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFunctionSignature(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFunctionSignature(self)
			}
		}
	}
	@discardableResult
	 open func functionSignature() throws -> FunctionSignatureContext {
		var _localctx: FunctionSignatureContext
		_localctx = FunctionSignatureContext(_ctx, getState())
		try enterRule(_localctx, 124, ObjectiveCParser.RULE_functionSignature)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(857)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,88,_ctx)) {
		 	case 1:
		 		setState(856)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(859)
		 	try identifier()

		 	setState(860)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(862)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063951359) != 0)) {
		 		setState(861)
		 		try parameterList()

		 	}

		 	setState(864)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	setState(867)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(866)
		 		try attributeSpecifier()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeContext: ParserRuleContext {
			open
			func attributeName() -> AttributeNameContext? {
				return getRuleContext(AttributeNameContext.self, 0)
			}
			open
			func attributeParameters() -> AttributeParametersContext? {
				return getRuleContext(AttributeParametersContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attribute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttribute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttribute(self)
			}
		}
	}
	@discardableResult
	 open func attribute() throws -> AttributeContext {
		var _localctx: AttributeContext
		_localctx = AttributeContext(_ctx, getState())
		try enterRule(_localctx, 126, ObjectiveCParser.RULE_attribute)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(869)
		 	try attributeName()
		 	setState(871)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(870)
		 		try attributeParameters()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeNameContext: ParserRuleContext {
			open
			func CONST() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CONST.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeName(self)
			}
		}
	}
	@discardableResult
	 open func attributeName() throws -> AttributeNameContext {
		var _localctx: AttributeNameContext
		_localctx = AttributeNameContext(_ctx, getState())
		try enterRule(_localctx, 128, ObjectiveCParser.RULE_attributeName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(875)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(873)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(874)
		 		try identifier()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeParametersContext: ParserRuleContext {
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func attributeParameterList() -> AttributeParameterListContext? {
				return getRuleContext(AttributeParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeParameters
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeParameters(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeParameters(self)
			}
		}
	}
	@discardableResult
	 open func attributeParameters() throws -> AttributeParametersContext {
		var _localctx: AttributeParametersContext
		_localctx = AttributeParametersContext(_ctx, getState())
		try enterRule(_localctx, 130, ObjectiveCParser.RULE_attributeParameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(877)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(879)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804832) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0) || ((Int64((_la - 152)) & ~0x3f) == 0 && ((Int64(1) << (_la - 152)) & 66584579) != 0)) {
		 		setState(878)
		 		try attributeParameterList()

		 	}

		 	setState(881)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeParameterListContext: ParserRuleContext {
			open
			func attributeParameter() -> [AttributeParameterContext] {
				return getRuleContexts(AttributeParameterContext.self)
			}
			open
			func attributeParameter(_ i: Int) -> AttributeParameterContext? {
				return getRuleContext(AttributeParameterContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeParameterList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeParameterList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeParameterList(self)
			}
		}
	}
	@discardableResult
	 open func attributeParameterList() throws -> AttributeParameterListContext {
		var _localctx: AttributeParameterListContext
		_localctx = AttributeParameterListContext(_ctx, getState())
		try enterRule(_localctx, 132, ObjectiveCParser.RULE_attributeParameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(883)
		 	try attributeParameter()
		 	setState(888)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(884)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(885)
		 		try attributeParameter()


		 		setState(890)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeParameterContext: ParserRuleContext {
			open
			func attribute() -> AttributeContext? {
				return getRuleContext(AttributeContext.self, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
			}
			open
			func attributeParameterAssignment() -> AttributeParameterAssignmentContext? {
				return getRuleContext(AttributeParameterAssignmentContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeParameter
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeParameter(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeParameter(self)
			}
		}
	}
	@discardableResult
	 open func attributeParameter() throws -> AttributeParameterContext {
		var _localctx: AttributeParameterContext
		_localctx = AttributeParameterContext(_ctx, getState())
		try enterRule(_localctx, 134, ObjectiveCParser.RULE_attributeParameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(895)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,95, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(891)
		 		try attribute()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(892)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(893)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(894)
		 		try attributeParameterAssignment()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeParameterAssignmentContext: ParserRuleContext {
			open
			func attributeName() -> [AttributeNameContext] {
				return getRuleContexts(AttributeNameContext.self)
			}
			open
			func attributeName(_ i: Int) -> AttributeNameContext? {
				return getRuleContext(AttributeNameContext.self, i)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeParameterAssignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeParameterAssignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeParameterAssignment(self)
			}
		}
	}
	@discardableResult
	 open func attributeParameterAssignment() throws -> AttributeParameterAssignmentContext {
		var _localctx: AttributeParameterAssignmentContext
		_localctx = AttributeParameterAssignmentContext(_ctx, getState())
		try enterRule(_localctx, 136, ObjectiveCParser.RULE_attributeParameterAssignment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(897)
		 	try attributeName()
		 	setState(898)
		 	try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 	setState(902)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .TRUE:fallthrough
		 	case .FALSE:fallthrough
		 	case .NIL:fallthrough
		 	case .NO:fallthrough
		 	case .NULL_:fallthrough
		 	case .YES:fallthrough
		 	case .ADD:fallthrough
		 	case .SUB:fallthrough
		 	case .CHARACTER_LITERAL:fallthrough
		 	case .HEX_LITERAL:fallthrough
		 	case .OCTAL_LITERAL:fallthrough
		 	case .BINARY_LITERAL:fallthrough
		 	case .DECIMAL_LITERAL:fallthrough
		 	case .FLOATING_POINT_LITERAL:
		 		setState(899)
		 		try constant()

		 		break
		 	case .CONST:fallthrough
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		setState(900)
		 		try attributeName()

		 		break

		 	case .STRING_START:
		 		setState(901)
		 		try stringLiteral()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclarationContext: ParserRuleContext {
			open
			func functionCallExpression() -> FunctionCallExpressionContext? {
				return getRuleContext(FunctionCallExpressionContext.self, 0)
			}
			open
			func enumDeclaration() -> EnumDeclarationContext? {
				return getRuleContext(EnumDeclarationContext.self, 0)
			}
			open
			func varDeclaration() -> VarDeclarationContext? {
				return getRuleContext(VarDeclarationContext.self, 0)
			}
			open
			func typedefDeclaration() -> TypedefDeclarationContext? {
				return getRuleContext(TypedefDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_declaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func declaration() throws -> DeclarationContext {
		var _localctx: DeclarationContext
		_localctx = DeclarationContext(_ctx, getState())
		try enterRule(_localctx, 138, ObjectiveCParser.RULE_declaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(908)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,97, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(904)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(905)
		 		try enumDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(906)
		 		try varDeclaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(907)
		 		try typedefDeclaration()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallExpressionContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func directDeclarator() -> DirectDeclaratorContext? {
				return getRuleContext(DirectDeclaratorContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func attributeSpecifier() -> [AttributeSpecifierContext] {
				return getRuleContexts(AttributeSpecifierContext.self)
			}
			open
			func attributeSpecifier(_ i: Int) -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_functionCallExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFunctionCallExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFunctionCallExpression(self)
			}
		}
	}
	@discardableResult
	 open func functionCallExpression() throws -> FunctionCallExpressionContext {
		var _localctx: FunctionCallExpressionContext
		_localctx = FunctionCallExpressionContext(_ctx, getState())
		try enterRule(_localctx, 140, ObjectiveCParser.RULE_functionCallExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(911)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(910)
		 		try attributeSpecifier()

		 	}

		 	setState(913)
		 	try identifier()
		 	setState(915)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(914)
		 		try attributeSpecifier()

		 	}

		 	setState(917)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(918)
		 	try directDeclarator()
		 	setState(919)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(920)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EnumDeclarationContext: ParserRuleContext {
			open
			func enumSpecifier() -> EnumSpecifierContext? {
				return getRuleContext(EnumSpecifierContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func attributeSpecifier() -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, 0)
			}
			open
			func TYPEDEF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TYPEDEF.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_enumDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEnumDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEnumDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func enumDeclaration() throws -> EnumDeclarationContext {
		var _localctx: EnumDeclarationContext
		_localctx = EnumDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 142, ObjectiveCParser.RULE_enumDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(923)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(922)
		 		try attributeSpecifier()

		 	}

		 	setState(926)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.TYPEDEF.rawValue) {
		 		setState(925)
		 		try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)

		 	}

		 	setState(928)
		 	try enumSpecifier()
		 	setState(930)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(929)
		 		try identifier()

		 	}

		 	setState(932)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VarDeclarationContext: ParserRuleContext {
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func initDeclaratorList() -> InitDeclaratorListContext? {
				return getRuleContext(InitDeclaratorListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_varDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterVarDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitVarDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func varDeclaration() throws -> VarDeclarationContext {
		var _localctx: VarDeclarationContext
		_localctx = VarDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 144, ObjectiveCParser.RULE_varDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(938)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,103, _ctx)) {
		 	case 1:
		 		setState(934)
		 		try declarationSpecifiers()
		 		setState(935)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		setState(937)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(940)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypedefDeclarationContext: ParserRuleContext {
			open
			func TYPEDEF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TYPEDEF.rawValue, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func typeDeclaratorList() -> TypeDeclaratorListContext? {
				return getRuleContext(TypeDeclaratorListContext.self, 0)
			}
			open
			func attributeSpecifier() -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typedefDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypedefDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypedefDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func typedefDeclaration() throws -> TypedefDeclarationContext {
		var _localctx: TypedefDeclarationContext
		_localctx = TypedefDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 146, ObjectiveCParser.RULE_typedefDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(943)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(942)
		 		try attributeSpecifier()

		 	}

		 	setState(945)
		 	try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)
		 	setState(950)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,105, _ctx)) {
		 	case 1:
		 		setState(946)
		 		try declarationSpecifiers()
		 		setState(947)
		 		try typeDeclaratorList()

		 		break
		 	case 2:
		 		setState(949)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(952)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeDeclaratorListContext: ParserRuleContext {
			open
			func typeDeclarator() -> [TypeDeclaratorContext] {
				return getRuleContexts(TypeDeclaratorContext.self)
			}
			open
			func typeDeclarator(_ i: Int) -> TypeDeclaratorContext? {
				return getRuleContext(TypeDeclaratorContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeDeclaratorList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeDeclaratorList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeDeclaratorList(self)
			}
		}
	}
	@discardableResult
	 open func typeDeclaratorList() throws -> TypeDeclaratorListContext {
		var _localctx: TypeDeclaratorListContext
		_localctx = TypeDeclaratorListContext(_ctx, getState())
		try enterRule(_localctx, 148, ObjectiveCParser.RULE_typeDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(954)
		 	try typeDeclarator()
		 	setState(959)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(955)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(956)
		 		try typeDeclarator()


		 		setState(961)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeDeclaratorContext: ParserRuleContext {
			open
			func directDeclarator() -> DirectDeclaratorContext? {
				return getRuleContext(DirectDeclaratorContext.self, 0)
			}
			open
			func pointer() -> PointerContext? {
				return getRuleContext(PointerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func typeDeclarator() throws -> TypeDeclaratorContext {
		var _localctx: TypeDeclaratorContext
		_localctx = TypeDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 150, ObjectiveCParser.RULE_typeDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(963)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.MUL.rawValue) {
		 		setState(962)
		 		try pointer()

		 	}

		 	setState(965)
		 	try directDeclarator()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclarationSpecifiersContext: ParserRuleContext {
			open
			func storageClassSpecifier() -> [StorageClassSpecifierContext] {
				return getRuleContexts(StorageClassSpecifierContext.self)
			}
			open
			func storageClassSpecifier(_ i: Int) -> StorageClassSpecifierContext? {
				return getRuleContext(StorageClassSpecifierContext.self, i)
			}
			open
			func attributeSpecifier() -> [AttributeSpecifierContext] {
				return getRuleContexts(AttributeSpecifierContext.self)
			}
			open
			func attributeSpecifier(_ i: Int) -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, i)
			}
			open
			func arcBehaviourSpecifier() -> [ArcBehaviourSpecifierContext] {
				return getRuleContexts(ArcBehaviourSpecifierContext.self)
			}
			open
			func arcBehaviourSpecifier(_ i: Int) -> ArcBehaviourSpecifierContext? {
				return getRuleContext(ArcBehaviourSpecifierContext.self, i)
			}
			open
			func nullabilitySpecifier() -> [NullabilitySpecifierContext] {
				return getRuleContexts(NullabilitySpecifierContext.self)
			}
			open
			func nullabilitySpecifier(_ i: Int) -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, i)
			}
			open
			func ibOutletQualifier() -> [IbOutletQualifierContext] {
				return getRuleContexts(IbOutletQualifierContext.self)
			}
			open
			func ibOutletQualifier(_ i: Int) -> IbOutletQualifierContext? {
				return getRuleContext(IbOutletQualifierContext.self, i)
			}
			open
			func typePrefix() -> [TypePrefixContext] {
				return getRuleContexts(TypePrefixContext.self)
			}
			open
			func typePrefix(_ i: Int) -> TypePrefixContext? {
				return getRuleContext(TypePrefixContext.self, i)
			}
			open
			func typeQualifier() -> [TypeQualifierContext] {
				return getRuleContexts(TypeQualifierContext.self)
			}
			open
			func typeQualifier(_ i: Int) -> TypeQualifierContext? {
				return getRuleContext(TypeQualifierContext.self, i)
			}
			open
			func typeSpecifier() -> [TypeSpecifierContext] {
				return getRuleContexts(TypeSpecifierContext.self)
			}
			open
			func typeSpecifier(_ i: Int) -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_declarationSpecifiers
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDeclarationSpecifiers(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDeclarationSpecifiers(self)
			}
		}
	}
	@discardableResult
	 open func declarationSpecifiers() throws -> DeclarationSpecifiersContext {
		var _localctx: DeclarationSpecifiersContext
		_localctx = DeclarationSpecifiersContext(_ctx, getState())
		try enterRule(_localctx, 152, ObjectiveCParser.RULE_declarationSpecifiers)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(975); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(975)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,108, _ctx)) {
		 			case 1:
		 				setState(967)
		 				try storageClassSpecifier()

		 				break
		 			case 2:
		 				setState(968)
		 				try attributeSpecifier()

		 				break
		 			case 3:
		 				setState(969)
		 				try arcBehaviourSpecifier()

		 				break
		 			case 4:
		 				setState(970)
		 				try nullabilitySpecifier()

		 				break
		 			case 5:
		 				setState(971)
		 				try ibOutletQualifier()

		 				break
		 			case 6:
		 				setState(972)
		 				try typePrefix()

		 				break
		 			case 7:
		 				setState(973)
		 				try typeQualifier()

		 				break
		 			case 8:
		 				setState(974)
		 				try typeSpecifier()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(977); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,109,_ctx)
		 	} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AttributeSpecifierContext: ParserRuleContext {
			open
			func ATTRIBUTE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue, 0)
			}
			open
			func LP() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.LP.rawValue)
			}
			open
			func LP(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, i)
			}
			open
			func attribute() -> [AttributeContext] {
				return getRuleContexts(AttributeContext.self)
			}
			open
			func attribute(_ i: Int) -> AttributeContext? {
				return getRuleContext(AttributeContext.self, i)
			}
			open
			func RP() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.RP.rawValue)
			}
			open
			func RP(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_attributeSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAttributeSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAttributeSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func attributeSpecifier() throws -> AttributeSpecifierContext {
		var _localctx: AttributeSpecifierContext
		_localctx = AttributeSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 154, ObjectiveCParser.RULE_attributeSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(979)
		 	try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 	setState(980)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(981)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(982)
		 	try attribute()
		 	setState(987)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(983)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(984)
		 		try attribute()


		 		setState(989)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(990)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(991)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InitDeclaratorListContext: ParserRuleContext {
			open
			func initDeclarator() -> [InitDeclaratorContext] {
				return getRuleContexts(InitDeclaratorContext.self)
			}
			open
			func initDeclarator(_ i: Int) -> InitDeclaratorContext? {
				return getRuleContext(InitDeclaratorContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_initDeclaratorList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInitDeclaratorList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInitDeclaratorList(self)
			}
		}
	}
	@discardableResult
	 open func initDeclaratorList() throws -> InitDeclaratorListContext {
		var _localctx: InitDeclaratorListContext
		_localctx = InitDeclaratorListContext(_ctx, getState())
		try enterRule(_localctx, 156, ObjectiveCParser.RULE_initDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(993)
		 	try initDeclarator()
		 	setState(998)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(994)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(995)
		 		try initDeclarator()


		 		setState(1000)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InitDeclaratorContext: ParserRuleContext {
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func initializer() -> InitializerContext? {
				return getRuleContext(InitializerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_initDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInitDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInitDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func initDeclarator() throws -> InitDeclaratorContext {
		var _localctx: InitDeclaratorContext
		_localctx = InitDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 158, ObjectiveCParser.RULE_initDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1001)
		 	try declarator()
		 	setState(1004)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1002)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1003)
		 		try initializer()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StructOrUnionSpecifierContext: ParserRuleContext {
			open
			func STRUCT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRUCT.rawValue, 0)
			}
			open
			func UNION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNION.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func fieldDeclaration() -> [FieldDeclarationContext] {
				return getRuleContexts(FieldDeclarationContext.self)
			}
			open
			func fieldDeclaration(_ i: Int) -> FieldDeclarationContext? {
				return getRuleContext(FieldDeclarationContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_structOrUnionSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterStructOrUnionSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitStructOrUnionSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func structOrUnionSpecifier() throws -> StructOrUnionSpecifierContext {
		var _localctx: StructOrUnionSpecifierContext
		_localctx = StructOrUnionSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 160, ObjectiveCParser.RULE_structOrUnionSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1006)
		 	_la = try _input.LA(1)
		 	if (!(_la == ObjectiveCParser.Tokens.STRUCT.rawValue || _la == ObjectiveCParser.Tokens.UNION.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1019)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,115, _ctx)) {
		 	case 1:
		 		setState(1007)
		 		try identifier()

		 		break
		 	case 2:
		 		setState(1009)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 			setState(1008)
		 			try identifier()

		 		}

		 		setState(1011)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1013) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1012)
		 			try fieldDeclaration()


		 			setState(1015); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063951351) != 0))
		 		setState(1017)
		 		try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldDeclarationContext: ParserRuleContext {
			open
			func specifierQualifierList() -> SpecifierQualifierListContext? {
				return getRuleContext(SpecifierQualifierListContext.self, 0)
			}
			open
			func fieldDeclaratorList() -> FieldDeclaratorListContext? {
				return getRuleContext(FieldDeclaratorListContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func macro() -> MacroContext? {
				return getRuleContext(MacroContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_fieldDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFieldDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFieldDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func fieldDeclaration() throws -> FieldDeclarationContext {
		var _localctx: FieldDeclarationContext
		_localctx = FieldDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 162, ObjectiveCParser.RULE_fieldDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1021)
		 	try specifierQualifierList()
		 	setState(1022)
		 	try fieldDeclaratorList()
		 	setState(1024)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 		setState(1023)
		 		try macro()

		 	}

		 	setState(1026)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SpecifierQualifierListContext: ParserRuleContext {
			open
			func arcBehaviourSpecifier() -> [ArcBehaviourSpecifierContext] {
				return getRuleContexts(ArcBehaviourSpecifierContext.self)
			}
			open
			func arcBehaviourSpecifier(_ i: Int) -> ArcBehaviourSpecifierContext? {
				return getRuleContext(ArcBehaviourSpecifierContext.self, i)
			}
			open
			func nullabilitySpecifier() -> [NullabilitySpecifierContext] {
				return getRuleContexts(NullabilitySpecifierContext.self)
			}
			open
			func nullabilitySpecifier(_ i: Int) -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, i)
			}
			open
			func ibOutletQualifier() -> [IbOutletQualifierContext] {
				return getRuleContexts(IbOutletQualifierContext.self)
			}
			open
			func ibOutletQualifier(_ i: Int) -> IbOutletQualifierContext? {
				return getRuleContext(IbOutletQualifierContext.self, i)
			}
			open
			func typePrefix() -> [TypePrefixContext] {
				return getRuleContexts(TypePrefixContext.self)
			}
			open
			func typePrefix(_ i: Int) -> TypePrefixContext? {
				return getRuleContext(TypePrefixContext.self, i)
			}
			open
			func typeQualifier() -> [TypeQualifierContext] {
				return getRuleContexts(TypeQualifierContext.self)
			}
			open
			func typeQualifier(_ i: Int) -> TypeQualifierContext? {
				return getRuleContext(TypeQualifierContext.self, i)
			}
			open
			func typeSpecifier() -> [TypeSpecifierContext] {
				return getRuleContexts(TypeSpecifierContext.self)
			}
			open
			func typeSpecifier(_ i: Int) -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_specifierQualifierList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSpecifierQualifierList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSpecifierQualifierList(self)
			}
		}
	}
	@discardableResult
	 open func specifierQualifierList() throws -> SpecifierQualifierListContext {
		var _localctx: SpecifierQualifierListContext
		_localctx = SpecifierQualifierListContext(_ctx, getState())
		try enterRule(_localctx, 164, ObjectiveCParser.RULE_specifierQualifierList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1034); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1034)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,117, _ctx)) {
		 			case 1:
		 				setState(1028)
		 				try arcBehaviourSpecifier()

		 				break
		 			case 2:
		 				setState(1029)
		 				try nullabilitySpecifier()

		 				break
		 			case 3:
		 				setState(1030)
		 				try ibOutletQualifier()

		 				break
		 			case 4:
		 				setState(1031)
		 				try typePrefix()

		 				break
		 			case 5:
		 				setState(1032)
		 				try typeQualifier()

		 				break
		 			case 6:
		 				setState(1033)
		 				try typeSpecifier()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1036); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,118,_ctx)
		 	} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IbOutletQualifierContext: ParserRuleContext {
			open
			func IB_OUTLET_COLLECTION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func IB_OUTLET() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_OUTLET.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_ibOutletQualifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterIbOutletQualifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitIbOutletQualifier(self)
			}
		}
	}
	@discardableResult
	 open func ibOutletQualifier() throws -> IbOutletQualifierContext {
		var _localctx: IbOutletQualifierContext
		_localctx = IbOutletQualifierContext(_ctx, getState())
		try enterRule(_localctx, 166, ObjectiveCParser.RULE_ibOutletQualifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1044)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IB_OUTLET_COLLECTION:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1038)
		 		try match(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue)
		 		setState(1039)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1040)
		 		try identifier()
		 		setState(1041)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break

		 	case .IB_OUTLET:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1043)
		 		try match(ObjectiveCParser.Tokens.IB_OUTLET.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArcBehaviourSpecifierContext: ParserRuleContext {
			open
			func WEAK_QUALIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.WEAK_QUALIFIER.rawValue, 0)
			}
			open
			func STRONG_QUALIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRONG_QUALIFIER.rawValue, 0)
			}
			open
			func AUTORELEASING_QUALIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AUTORELEASING_QUALIFIER.rawValue, 0)
			}
			open
			func UNSAFE_UNRETAINED_QUALIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED_QUALIFIER.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_arcBehaviourSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterArcBehaviourSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitArcBehaviourSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func arcBehaviourSpecifier() throws -> ArcBehaviourSpecifierContext {
		var _localctx: ArcBehaviourSpecifierContext
		_localctx = ArcBehaviourSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 168, ObjectiveCParser.RULE_arcBehaviourSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1046)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 85)) & ~0x3f) == 0 && ((Int64(1) << (_la - 85)) & 10753) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class NullabilitySpecifierContext: ParserRuleContext {
			open
			func NULL_UNSPECIFIED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULL_UNSPECIFIED.rawValue, 0)
			}
			open
			func NULLABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULLABLE.rawValue, 0)
			}
			open
			func NONNULL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NONNULL.rawValue, 0)
			}
			open
			func NULL_RESETTABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULL_RESETTABLE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_nullabilitySpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterNullabilitySpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitNullabilitySpecifier(self)
			}
		}
	}
	@discardableResult
	 open func nullabilitySpecifier() throws -> NullabilitySpecifierContext {
		var _localctx: NullabilitySpecifierContext
		_localctx = NullabilitySpecifierContext(_ctx, getState())
		try enterRule(_localctx, 170, ObjectiveCParser.RULE_nullabilitySpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1048)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StorageClassSpecifierContext: ParserRuleContext {
			open
			func AUTO() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AUTO.rawValue, 0)
			}
			open
			func REGISTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.REGISTER.rawValue, 0)
			}
			open
			func STATIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STATIC.rawValue, 0)
			}
			open
			func EXTERN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.EXTERN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_storageClassSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterStorageClassSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitStorageClassSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func storageClassSpecifier() throws -> StorageClassSpecifierContext {
		var _localctx: StorageClassSpecifierContext
		_localctx = StorageClassSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 172, ObjectiveCParser.RULE_storageClassSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1050)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 68161538) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypePrefixContext: ParserRuleContext {
			open
			func BRIDGE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BRIDGE.rawValue, 0)
			}
			open
			func BRIDGE_TRANSFER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BRIDGE_TRANSFER.rawValue, 0)
			}
			open
			func BRIDGE_RETAINED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BRIDGE_RETAINED.rawValue, 0)
			}
			open
			func BLOCK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BLOCK.rawValue, 0)
			}
			open
			func INLINE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INLINE.rawValue, 0)
			}
			open
			func NS_INLINE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_INLINE.rawValue, 0)
			}
			open
			func KINDOF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.KINDOF.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typePrefix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypePrefix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypePrefix(self)
			}
		}
	}
	@discardableResult
	 open func typePrefix() throws -> TypePrefixContext {
		var _localctx: TypePrefixContext
		_localctx = TypePrefixContext(_ctx, getState())
		try enterRule(_localctx, 174, ObjectiveCParser.RULE_typePrefix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1052)
		 	_la = try _input.LA(1)
		 	if (!(_la == ObjectiveCParser.Tokens.INLINE.rawValue || ((Int64((_la - 86)) & ~0x3f) == 0 && ((Int64(1) << (_la - 86)) & 131215) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeQualifierContext: ParserRuleContext {
			open
			func CONST() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CONST.rawValue, 0)
			}
			open
			func VOLATILE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.VOLATILE.rawValue, 0)
			}
			open
			func RESTRICT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RESTRICT.rawValue, 0)
			}
			open
			func protocolQualifier() -> ProtocolQualifierContext? {
				return getRuleContext(ProtocolQualifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeQualifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeQualifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeQualifier(self)
			}
		}
	}
	@discardableResult
	 open func typeQualifier() throws -> TypeQualifierContext {
		var _localctx: TypeQualifierContext
		_localctx = TypeQualifierContext(_ctx, getState())
		try enterRule(_localctx, 176, ObjectiveCParser.RULE_typeQualifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1058)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1054)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break

		 	case .VOLATILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1055)
		 		try match(ObjectiveCParser.Tokens.VOLATILE.rawValue)

		 		break

		 	case .RESTRICT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1056)
		 		try match(ObjectiveCParser.Tokens.RESTRICT.rawValue)

		 		break
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1057)
		 		try protocolQualifier()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ProtocolQualifierContext: ParserRuleContext {
			open
			func IN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IN.rawValue, 0)
			}
			open
			func OUT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OUT.rawValue, 0)
			}
			open
			func INOUT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INOUT.rawValue, 0)
			}
			open
			func BYCOPY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BYCOPY.rawValue, 0)
			}
			open
			func BYREF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BYREF.rawValue, 0)
			}
			open
			func ONEWAY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ONEWAY.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_protocolQualifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterProtocolQualifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitProtocolQualifier(self)
			}
		}
	}
	@discardableResult
	 open func protocolQualifier() throws -> ProtocolQualifierContext {
		var _localctx: ProtocolQualifierContext
		_localctx = ProtocolQualifierContext(_ctx, getState())
		try enterRule(_localctx, 178, ObjectiveCParser.RULE_protocolQualifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1060)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 6979699813122048) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeSpecifierContext: ParserRuleContext {
			open
			func VOID() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.VOID.rawValue, 0)
			}
			open
			func CHAR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CHAR.rawValue, 0)
			}
			open
			func SHORT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SHORT.rawValue, 0)
			}
			open
			func INT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INT.rawValue, 0)
			}
			open
			func LONG() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LONG.rawValue, 0)
			}
			open
			func FLOAT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FLOAT.rawValue, 0)
			}
			open
			func DOUBLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DOUBLE.rawValue, 0)
			}
			open
			func SIGNED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SIGNED.rawValue, 0)
			}
			open
			func UNSIGNED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNSIGNED.rawValue, 0)
			}
			open
			func typeofExpression() -> TypeofExpressionContext? {
				return getRuleContext(TypeofExpressionContext.self, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func structOrUnionSpecifier() -> StructOrUnionSpecifierContext? {
				return getRuleContext(StructOrUnionSpecifierContext.self, 0)
			}
			open
			func enumSpecifier() -> EnumSpecifierContext? {
				return getRuleContext(EnumSpecifierContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func pointer() -> PointerContext? {
				return getRuleContext(PointerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func typeSpecifier() throws -> TypeSpecifierContext {
		var _localctx: TypeSpecifierContext
		_localctx = TypeSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 180, ObjectiveCParser.RULE_typeSpecifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1079)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,122, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1062)
		 		try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1063)
		 		try match(ObjectiveCParser.Tokens.CHAR.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1064)
		 		try match(ObjectiveCParser.Tokens.SHORT.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1065)
		 		try match(ObjectiveCParser.Tokens.INT.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1066)
		 		try match(ObjectiveCParser.Tokens.LONG.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1067)
		 		try match(ObjectiveCParser.Tokens.FLOAT.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1068)
		 		try match(ObjectiveCParser.Tokens.DOUBLE.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1069)
		 		try match(ObjectiveCParser.Tokens.SIGNED.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1070)
		 		try match(ObjectiveCParser.Tokens.UNSIGNED.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1071)
		 		try typeofExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1072)
		 		try genericTypeSpecifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1073)
		 		try structOrUnionSpecifier()

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(1074)
		 		try enumSpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(1075)
		 		try identifier()
		 		setState(1077)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,121,_ctx)) {
		 		case 1:
		 			setState(1076)
		 			try pointer()

		 			break
		 		default: break
		 		}

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeofExpressionContext: ParserRuleContext {
			open
			func TYPEOF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TYPEOF.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeofExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeofExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeofExpression(self)
			}
		}
	}
	@discardableResult
	 open func typeofExpression() throws -> TypeofExpressionContext {
		var _localctx: TypeofExpressionContext
		_localctx = TypeofExpressionContext(_ctx, getState())
		try enterRule(_localctx, 182, ObjectiveCParser.RULE_typeofExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1081)
		 	try match(ObjectiveCParser.Tokens.TYPEOF.rawValue)

		 	setState(1082)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1083)
		 	try expression(0)
		 	setState(1084)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldDeclaratorListContext: ParserRuleContext {
			open
			func fieldDeclarator() -> [FieldDeclaratorContext] {
				return getRuleContexts(FieldDeclaratorContext.self)
			}
			open
			func fieldDeclarator(_ i: Int) -> FieldDeclaratorContext? {
				return getRuleContext(FieldDeclaratorContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_fieldDeclaratorList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFieldDeclaratorList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFieldDeclaratorList(self)
			}
		}
	}
	@discardableResult
	 open func fieldDeclaratorList() throws -> FieldDeclaratorListContext {
		var _localctx: FieldDeclaratorListContext
		_localctx = FieldDeclaratorListContext(_ctx, getState())
		try enterRule(_localctx, 184, ObjectiveCParser.RULE_fieldDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1086)
		 	try fieldDeclarator()
		 	setState(1091)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1087)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1088)
		 		try fieldDeclarator()


		 		setState(1093)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FieldDeclaratorContext: ParserRuleContext {
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_fieldDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterFieldDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitFieldDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func fieldDeclarator() throws -> FieldDeclaratorContext {
		var _localctx: FieldDeclaratorContext
		_localctx = FieldDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 186, ObjectiveCParser.RULE_fieldDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1100)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,125, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1094)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1096)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 40)) & ~0x3f) == 0 && ((Int64(1) << (_la - 40)) & -414491694415611649) != 0) || ((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 1125899913166847) != 0)) {
		 			setState(1095)
		 			try declarator()

		 		}

		 		setState(1098)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1099)
		 		try constant()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EnumSpecifierContext: ParserRuleContext {
			open
			func ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ENUM.rawValue, 0)
			}
			open
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
			}
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func enumeratorList() -> EnumeratorListContext? {
				return getRuleContext(EnumeratorListContext.self, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func NS_OPTIONS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_OPTIONS.rawValue, 0)
			}
			open
			func NS_ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_ENUM.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_enumSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEnumSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEnumSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func enumSpecifier() throws -> EnumSpecifierContext {
		var _localctx: EnumSpecifierContext
		_localctx = EnumSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 188, ObjectiveCParser.RULE_enumSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1133)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ENUM:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1102)
		 		try match(ObjectiveCParser.Tokens.ENUM.rawValue)
		 		setState(1108)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,127,_ctx)) {
		 		case 1:
		 			setState(1104)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 				setState(1103)
		 				try identifier()

		 			}

		 			setState(1106)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 			setState(1107)
		 			try typeName()

		 			break
		 		default: break
		 		}
		 		setState(1121)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .BOOL:fallthrough
		 		case .Class:fallthrough
		 		case .BYCOPY:fallthrough
		 		case .BYREF:fallthrough
		 		case .ID:fallthrough
		 		case .IMP:fallthrough
		 		case .IN:fallthrough
		 		case .INOUT:fallthrough
		 		case .ONEWAY:fallthrough
		 		case .OUT:fallthrough
		 		case .PROTOCOL_:fallthrough
		 		case .SEL:fallthrough
		 		case .SELF:fallthrough
		 		case .SUPER:fallthrough
		 		case .ATOMIC:fallthrough
		 		case .NONATOMIC:fallthrough
		 		case .RETAIN:fallthrough
		 		case .AUTORELEASING_QUALIFIER:fallthrough
		 		case .BLOCK:fallthrough
		 		case .BRIDGE_RETAINED:fallthrough
		 		case .BRIDGE_TRANSFER:fallthrough
		 		case .COVARIANT:fallthrough
		 		case .CONTRAVARIANT:fallthrough
		 		case .DEPRECATED:fallthrough
		 		case .KINDOF:fallthrough
		 		case .UNUSED:fallthrough
		 		case .NULL_UNSPECIFIED:fallthrough
		 		case .NULLABLE:fallthrough
		 		case .NONNULL:fallthrough
		 		case .NULL_RESETTABLE:fallthrough
		 		case .NS_INLINE:fallthrough
		 		case .NS_ENUM:fallthrough
		 		case .NS_OPTIONS:fallthrough
		 		case .ASSIGN:fallthrough
		 		case .COPY:fallthrough
		 		case .GETTER:fallthrough
		 		case .SETTER:fallthrough
		 		case .STRONG:fallthrough
		 		case .READONLY:fallthrough
		 		case .READWRITE:fallthrough
		 		case .WEAK:fallthrough
		 		case .UNSAFE_UNRETAINED:fallthrough
		 		case .IB_OUTLET:fallthrough
		 		case .IB_OUTLET_COLLECTION:fallthrough
		 		case .IB_INSPECTABLE:fallthrough
		 		case .IB_DESIGNABLE:fallthrough
		 		case .IDENTIFIER:
		 			setState(1110)
		 			try identifier()
		 			setState(1115)
		 			try _errHandler.sync(self)
		 			switch (try getInterpreter().adaptivePredict(_input,128,_ctx)) {
		 			case 1:
		 				setState(1111)
		 				try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 				setState(1112)
		 				try enumeratorList()
		 				setState(1113)
		 				try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 				break
		 			default: break
		 			}

		 			break

		 		case .LBRACE:
		 			setState(1117)
		 			try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 			setState(1118)
		 			try enumeratorList()
		 			setState(1119)
		 			try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		break
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1123)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.NS_ENUM.rawValue || _la == ObjectiveCParser.Tokens.NS_OPTIONS.rawValue)) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1124)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1125)
		 		try typeName()
		 		setState(1126)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1127)
		 		try identifier()
		 		setState(1128)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1129)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1130)
		 		try enumeratorList()
		 		setState(1131)
		 		try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EnumeratorListContext: ParserRuleContext {
			open
			func enumerator() -> [EnumeratorContext] {
				return getRuleContexts(EnumeratorContext.self)
			}
			open
			func enumerator(_ i: Int) -> EnumeratorContext? {
				return getRuleContext(EnumeratorContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_enumeratorList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEnumeratorList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEnumeratorList(self)
			}
		}
	}
	@discardableResult
	 open func enumeratorList() throws -> EnumeratorListContext {
		var _localctx: EnumeratorListContext
		_localctx = EnumeratorListContext(_ctx, getState())
		try enterRule(_localctx, 190, ObjectiveCParser.RULE_enumeratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1135)
		 	try enumerator()
		 	setState(1140)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,131,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1136)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1137)
		 			try enumerator()

		 	 
		 		}
		 		setState(1142)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,131,_ctx)
		 	}
		 	setState(1144)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1143)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EnumeratorContext: ParserRuleContext {
			open
			func enumeratorIdentifier() -> EnumeratorIdentifierContext? {
				return getRuleContext(EnumeratorIdentifierContext.self, 0)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_enumerator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEnumerator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEnumerator(self)
			}
		}
	}
	@discardableResult
	 open func enumerator() throws -> EnumeratorContext {
		var _localctx: EnumeratorContext
		_localctx = EnumeratorContext(_ctx, getState())
		try enterRule(_localctx, 192, ObjectiveCParser.RULE_enumerator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1146)
		 	try enumeratorIdentifier()
		 	setState(1149)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1147)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1148)
		 		try expression(0)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class EnumeratorIdentifierContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func DEFAULT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DEFAULT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_enumeratorIdentifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterEnumeratorIdentifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitEnumeratorIdentifier(self)
			}
		}
	}
	@discardableResult
	 open func enumeratorIdentifier() throws -> EnumeratorIdentifierContext {
		var _localctx: EnumeratorIdentifierContext
		_localctx = EnumeratorIdentifierContext(_ctx, getState())
		try enterRule(_localctx, 194, ObjectiveCParser.RULE_enumeratorIdentifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1153)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1151)
		 		try identifier()

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1152)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DirectDeclaratorContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func declaratorSuffix() -> [DeclaratorSuffixContext] {
				return getRuleContexts(DeclaratorSuffixContext.self)
			}
			open
			func declaratorSuffix(_ i: Int) -> DeclaratorSuffixContext? {
				return getRuleContext(DeclaratorSuffixContext.self, i)
			}
			open
			func BITXOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITXOR.rawValue, 0)
			}
			open
			func blockParameters() -> BlockParametersContext? {
				return getRuleContext(BlockParametersContext.self, 0)
			}
			open
			func nullabilitySpecifier() -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_directDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDirectDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDirectDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func directDeclarator() throws -> DirectDeclaratorContext {
		var _localctx: DirectDeclaratorContext
		_localctx = DirectDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 196, ObjectiveCParser.RULE_directDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1178)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,139, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1160)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .BOOL:fallthrough
		 		case .Class:fallthrough
		 		case .BYCOPY:fallthrough
		 		case .BYREF:fallthrough
		 		case .ID:fallthrough
		 		case .IMP:fallthrough
		 		case .IN:fallthrough
		 		case .INOUT:fallthrough
		 		case .ONEWAY:fallthrough
		 		case .OUT:fallthrough
		 		case .PROTOCOL_:fallthrough
		 		case .SEL:fallthrough
		 		case .SELF:fallthrough
		 		case .SUPER:fallthrough
		 		case .ATOMIC:fallthrough
		 		case .NONATOMIC:fallthrough
		 		case .RETAIN:fallthrough
		 		case .AUTORELEASING_QUALIFIER:fallthrough
		 		case .BLOCK:fallthrough
		 		case .BRIDGE_RETAINED:fallthrough
		 		case .BRIDGE_TRANSFER:fallthrough
		 		case .COVARIANT:fallthrough
		 		case .CONTRAVARIANT:fallthrough
		 		case .DEPRECATED:fallthrough
		 		case .KINDOF:fallthrough
		 		case .UNUSED:fallthrough
		 		case .NULL_UNSPECIFIED:fallthrough
		 		case .NULLABLE:fallthrough
		 		case .NONNULL:fallthrough
		 		case .NULL_RESETTABLE:fallthrough
		 		case .NS_INLINE:fallthrough
		 		case .NS_ENUM:fallthrough
		 		case .NS_OPTIONS:fallthrough
		 		case .ASSIGN:fallthrough
		 		case .COPY:fallthrough
		 		case .GETTER:fallthrough
		 		case .SETTER:fallthrough
		 		case .STRONG:fallthrough
		 		case .READONLY:fallthrough
		 		case .READWRITE:fallthrough
		 		case .WEAK:fallthrough
		 		case .UNSAFE_UNRETAINED:fallthrough
		 		case .IB_OUTLET:fallthrough
		 		case .IB_OUTLET_COLLECTION:fallthrough
		 		case .IB_INSPECTABLE:fallthrough
		 		case .IB_DESIGNABLE:fallthrough
		 		case .IDENTIFIER:
		 			setState(1155)
		 			try identifier()

		 			break

		 		case .LP:
		 			setState(1156)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1157)
		 			try declarator()
		 			setState(1158)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1165)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1162)
		 			try declaratorSuffix()


		 			setState(1167)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1168)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1169)
		 		try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 		setState(1171)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,137,_ctx)) {
		 		case 1:
		 			setState(1170)
		 			try nullabilitySpecifier()

		 			break
		 		default: break
		 		}
		 		setState(1174)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0)) {
		 			setState(1173)
		 			try identifier()

		 		}

		 		setState(1176)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1177)
		 		try blockParameters()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclaratorSuffixContext: ParserRuleContext {
			open
			func LBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, 0)
			}
			open
			func RBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, 0)
			}
			open
			func constantExpression() -> ConstantExpressionContext? {
				return getRuleContext(ConstantExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_declaratorSuffix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDeclaratorSuffix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDeclaratorSuffix(self)
			}
		}
	}
	@discardableResult
	 open func declaratorSuffix() throws -> DeclaratorSuffixContext {
		var _localctx: DeclaratorSuffixContext
		_localctx = DeclaratorSuffixContext(_ctx, getState())
		try enterRule(_localctx, 198, ObjectiveCParser.RULE_declaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1180)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(1182)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0) || ((Int64((_la - 152)) & ~0x3f) == 0 && ((Int64(1) << (_la - 152)) & 65536003) != 0)) {
		 		setState(1181)
		 		try constantExpression()

		 	}

		 	setState(1184)
		 	try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterListContext: ParserRuleContext {
			open
			func parameterDeclarationList() -> ParameterDeclarationListContext? {
				return getRuleContext(ParameterDeclarationListContext.self, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func ELIPSIS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ELIPSIS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_parameterList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterParameterList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitParameterList(self)
			}
		}
	}
	@discardableResult
	 open func parameterList() throws -> ParameterListContext {
		var _localctx: ParameterListContext
		_localctx = ParameterListContext(_ctx, getState())
		try enterRule(_localctx, 200, ObjectiveCParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1186)
		 	try parameterDeclarationList()
		 	setState(1189)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1187)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1188)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PointerContext: ParserRuleContext {
			open
			func MUL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MUL.rawValue, 0)
			}
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func pointer() -> PointerContext? {
				return getRuleContext(PointerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_pointer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPointer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPointer(self)
			}
		}
	}
	@discardableResult
	 open func pointer() throws -> PointerContext {
		var _localctx: PointerContext
		_localctx = PointerContext(_ctx, getState())
		try enterRule(_localctx, 202, ObjectiveCParser.RULE_pointer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1191)
		 	try match(ObjectiveCParser.Tokens.MUL.rawValue)
		 	setState(1193)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,142,_ctx)) {
		 	case 1:
		 		setState(1192)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(1196)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,143,_ctx)) {
		 	case 1:
		 		setState(1195)
		 		try pointer()

		 		break
		 	default: break
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MacroContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func primaryExpression() -> [PrimaryExpressionContext] {
				return getRuleContexts(PrimaryExpressionContext.self)
			}
			open
			func primaryExpression(_ i: Int) -> PrimaryExpressionContext? {
				return getRuleContext(PrimaryExpressionContext.self, i)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_macro
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterMacro(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitMacro(self)
			}
		}
	}
	@discardableResult
	 open func macro() throws -> MacroContext {
		var _localctx: MacroContext
		_localctx = MacroContext(_ctx, getState())
		try enterRule(_localctx, 204, ObjectiveCParser.RULE_macro)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1198)
		 	try identifier()
		 	setState(1210)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(1199)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1200)
		 		try primaryExpression()
		 		setState(1205)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1201)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1202)
		 			try primaryExpression()


		 			setState(1207)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1208)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArrayInitializerContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_arrayInitializer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterArrayInitializer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitArrayInitializer(self)
			}
		}
	}
	@discardableResult
	 open func arrayInitializer() throws -> ArrayInitializerContext {
		var _localctx: ArrayInitializerContext
		_localctx = ArrayInitializerContext(_ctx, getState())
		try enterRule(_localctx, 206, ObjectiveCParser.RULE_arrayInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1212)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1217)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1213)
		 		try expressions()
		 		setState(1215)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1214)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1219)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StructInitializerContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func DOT() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.DOT.rawValue)
			}
			open
			func DOT(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DOT.rawValue, i)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_structInitializer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterStructInitializer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitStructInitializer(self)
			}
		}
	}
	@discardableResult
	 open func structInitializer() throws -> StructInitializerContext {
		var _localctx: StructInitializerContext
		_localctx = StructInitializerContext(_ctx, getState())
		try enterRule(_localctx, 208, ObjectiveCParser.RULE_structInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1221)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1235)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1222)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1223)
		 		try expression(0)
		 		setState(1229)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,148,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(1224)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1225)
		 				try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 				setState(1226)
		 				try expression(0)

		 		 
		 			}
		 			setState(1231)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,148,_ctx)
		 		}
		 		setState(1233)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1232)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1237)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InitializerListContext: ParserRuleContext {
			open
			func initializer() -> [InitializerContext] {
				return getRuleContexts(InitializerContext.self)
			}
			open
			func initializer(_ i: Int) -> InitializerContext? {
				return getRuleContext(InitializerContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_initializerList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInitializerList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInitializerList(self)
			}
		}
	}
	@discardableResult
	 open func initializerList() throws -> InitializerListContext {
		var _localctx: InitializerListContext
		_localctx = InitializerListContext(_ctx, getState())
		try enterRule(_localctx, 210, ObjectiveCParser.RULE_initializerList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1239)
		 	try initializer()
		 	setState(1244)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,151,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1240)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1241)
		 			try initializer()

		 	 
		 		}
		 		setState(1246)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,151,_ctx)
		 	}
		 	setState(1248)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1247)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeNameContext: ParserRuleContext {
			open
			func specifierQualifierList() -> SpecifierQualifierListContext? {
				return getRuleContext(SpecifierQualifierListContext.self, 0)
			}
			open
			func abstractDeclarator() -> AbstractDeclaratorContext? {
				return getRuleContext(AbstractDeclaratorContext.self, 0)
			}
			open
			func blockType() -> BlockTypeContext? {
				return getRuleContext(BlockTypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeName(self)
			}
		}
	}
	@discardableResult
	 open func typeName() throws -> TypeNameContext {
		var _localctx: TypeNameContext
		_localctx = TypeNameContext(_ctx, getState())
		try enterRule(_localctx, 212, ObjectiveCParser.RULE_typeName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1255)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,154, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1250)
		 		try specifierQualifierList()
		 		setState(1252)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 126)) & ~0x3f) == 0 && ((Int64(1) << (_la - 126)) & 268435473) != 0)) {
		 			setState(1251)
		 			try abstractDeclarator()

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1254)
		 		try blockType()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AbstractDeclaratorContext: ParserRuleContext {
			open
			func pointer() -> PointerContext? {
				return getRuleContext(PointerContext.self, 0)
			}
			open
			func abstractDeclarator() -> AbstractDeclaratorContext? {
				return getRuleContext(AbstractDeclaratorContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func abstractDeclaratorSuffix() -> [AbstractDeclaratorSuffixContext] {
				return getRuleContexts(AbstractDeclaratorSuffixContext.self)
			}
			open
			func abstractDeclaratorSuffix(_ i: Int) -> AbstractDeclaratorSuffixContext? {
				return getRuleContext(AbstractDeclaratorSuffixContext.self, i)
			}
			open
			func LBRACK() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.LBRACK.rawValue)
			}
			open
			func LBRACK(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, i)
			}
			open
			func RBRACK() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.RBRACK.rawValue)
			}
			open
			func RBRACK(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, i)
			}
			open
			func constantExpression() -> [ConstantExpressionContext] {
				return getRuleContexts(ConstantExpressionContext.self)
			}
			open
			func constantExpression(_ i: Int) -> ConstantExpressionContext? {
				return getRuleContext(ConstantExpressionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_abstractDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAbstractDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAbstractDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func abstractDeclarator() throws -> AbstractDeclaratorContext {
		var _localctx: AbstractDeclaratorContext
		_localctx = AbstractDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 214, ObjectiveCParser.RULE_abstractDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1280)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MUL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1257)
		 		try pointer()
		 		setState(1259)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 126)) & ~0x3f) == 0 && ((Int64(1) << (_la - 126)) & 268435473) != 0)) {
		 			setState(1258)
		 			try abstractDeclarator()

		 		}


		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1261)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1263)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 126)) & ~0x3f) == 0 && ((Int64(1) << (_la - 126)) & 268435473) != 0)) {
		 			setState(1262)
		 			try abstractDeclarator()

		 		}

		 		setState(1265)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1267) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1266)
		 			try abstractDeclaratorSuffix()


		 			setState(1269); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break

		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1276) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1271)
		 			try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 			setState(1273)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0) || ((Int64((_la - 152)) & ~0x3f) == 0 && ((Int64(1) << (_la - 152)) & 65536003) != 0)) {
		 				setState(1272)
		 				try constantExpression()

		 			}

		 			setState(1275)
		 			try match(ObjectiveCParser.Tokens.RBRACK.rawValue)


		 			setState(1278); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AbstractDeclaratorSuffixContext: ParserRuleContext {
			open
			func LBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, 0)
			}
			open
			func RBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, 0)
			}
			open
			func constantExpression() -> ConstantExpressionContext? {
				return getRuleContext(ConstantExpressionContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func parameterDeclarationList() -> ParameterDeclarationListContext? {
				return getRuleContext(ParameterDeclarationListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_abstractDeclaratorSuffix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAbstractDeclaratorSuffix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAbstractDeclaratorSuffix(self)
			}
		}
	}
	@discardableResult
	 open func abstractDeclaratorSuffix() throws -> AbstractDeclaratorSuffixContext {
		var _localctx: AbstractDeclaratorSuffixContext
		_localctx = AbstractDeclaratorSuffixContext(_ctx, getState())
		try enterRule(_localctx, 216, ObjectiveCParser.RULE_abstractDeclaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1292)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1282)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1284)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0) || ((Int64((_la - 152)) & ~0x3f) == 0 && ((Int64(1) << (_la - 152)) & 65536003) != 0)) {
		 			setState(1283)
		 			try constantExpression()

		 		}

		 		setState(1286)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1287)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1289)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063951359) != 0)) {
		 			setState(1288)
		 			try parameterDeclarationList()

		 		}

		 		setState(1291)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterDeclarationListContext: ParserRuleContext {
			open
			func parameterDeclaration() -> [ParameterDeclarationContext] {
				return getRuleContexts(ParameterDeclarationContext.self)
			}
			open
			func parameterDeclaration(_ i: Int) -> ParameterDeclarationContext? {
				return getRuleContext(ParameterDeclarationContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_parameterDeclarationList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterParameterDeclarationList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitParameterDeclarationList(self)
			}
		}
	}
	@discardableResult
	 open func parameterDeclarationList() throws -> ParameterDeclarationListContext {
		var _localctx: ParameterDeclarationListContext
		_localctx = ParameterDeclarationListContext(_ctx, getState())
		try enterRule(_localctx, 218, ObjectiveCParser.RULE_parameterDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1294)
		 	try parameterDeclaration()
		 	setState(1299)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,164,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1295)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1296)
		 			try parameterDeclaration()

		 	 
		 		}
		 		setState(1301)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,164,_ctx)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterDeclarationContext: ParserRuleContext {
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func VOID() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.VOID.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_parameterDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterParameterDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitParameterDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func parameterDeclaration() throws -> ParameterDeclarationContext {
		var _localctx: ParameterDeclarationContext
		_localctx = ParameterDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 220, ObjectiveCParser.RULE_parameterDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1306)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,165, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1302)
		 		try declarationSpecifiers()
		 		setState(1303)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1305)
		 		try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclaratorContext: ParserRuleContext {
			open
			func directDeclarator() -> DirectDeclaratorContext? {
				return getRuleContext(DirectDeclaratorContext.self, 0)
			}
			open
			func pointer() -> PointerContext? {
				return getRuleContext(PointerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_declarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func declarator() throws -> DeclaratorContext {
		var _localctx: DeclaratorContext
		_localctx = DeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 222, ObjectiveCParser.RULE_declarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1309)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.MUL.rawValue) {
		 		setState(1308)
		 		try pointer()

		 	}

		 	setState(1311)
		 	try directDeclarator()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func labeledStatement() -> LabeledStatementContext? {
				return getRuleContext(LabeledStatementContext.self, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
			open
			func selectionStatement() -> SelectionStatementContext? {
				return getRuleContext(SelectionStatementContext.self, 0)
			}
			open
			func iterationStatement() -> IterationStatementContext? {
				return getRuleContext(IterationStatementContext.self, 0)
			}
			open
			func jumpStatement() -> JumpStatementContext? {
				return getRuleContext(JumpStatementContext.self, 0)
			}
			open
			func synchronizedStatement() -> SynchronizedStatementContext? {
				return getRuleContext(SynchronizedStatementContext.self, 0)
			}
			open
			func autoreleaseStatement() -> AutoreleaseStatementContext? {
				return getRuleContext(AutoreleaseStatementContext.self, 0)
			}
			open
			func throwStatement() -> ThrowStatementContext? {
				return getRuleContext(ThrowStatementContext.self, 0)
			}
			open
			func tryBlock() -> TryBlockContext? {
				return getRuleContext(TryBlockContext.self, 0)
			}
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitStatement(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext
		_localctx = StatementContext(_ctx, getState())
		try enterRule(_localctx, 224, ObjectiveCParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1354)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,177, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1313)
		 		try labeledStatement()
		 		setState(1315)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,167,_ctx)) {
		 		case 1:
		 			setState(1314)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1317)
		 		try compoundStatement()
		 		setState(1319)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,168,_ctx)) {
		 		case 1:
		 			setState(1318)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1321)
		 		try selectionStatement()
		 		setState(1323)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,169,_ctx)) {
		 		case 1:
		 			setState(1322)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1325)
		 		try iterationStatement()
		 		setState(1327)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,170,_ctx)) {
		 		case 1:
		 			setState(1326)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1329)
		 		try jumpStatement()
		 		setState(1331)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,171,_ctx)) {
		 		case 1:
		 			setState(1330)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1333)
		 		try synchronizedStatement()
		 		setState(1335)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,172,_ctx)) {
		 		case 1:
		 			setState(1334)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1337)
		 		try autoreleaseStatement()
		 		setState(1339)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,173,_ctx)) {
		 		case 1:
		 			setState(1338)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1341)
		 		try throwStatement()
		 		setState(1343)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,174,_ctx)) {
		 		case 1:
		 			setState(1342)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1345)
		 		try tryBlock()
		 		setState(1347)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,175,_ctx)) {
		 		case 1:
		 			setState(1346)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1349)
		 		try expressions()
		 		setState(1351)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,176,_ctx)) {
		 		case 1:
		 			setState(1350)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1353)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LabeledStatementContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_labeledStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterLabeledStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitLabeledStatement(self)
			}
		}
	}
	@discardableResult
	 open func labeledStatement() throws -> LabeledStatementContext {
		var _localctx: LabeledStatementContext
		_localctx = LabeledStatementContext(_ctx, getState())
		try enterRule(_localctx, 226, ObjectiveCParser.RULE_labeledStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1356)
		 	try identifier()
		 	setState(1357)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(1358)
		 	try statement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class RangeExpressionContext: ParserRuleContext {
			open
			func constantExpression() -> [ConstantExpressionContext] {
				return getRuleContexts(ConstantExpressionContext.self)
			}
			open
			func constantExpression(_ i: Int) -> ConstantExpressionContext? {
				return getRuleContext(ConstantExpressionContext.self, i)
			}
			open
			func ELIPSIS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ELIPSIS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_rangeExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterRangeExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitRangeExpression(self)
			}
		}
	}
	@discardableResult
	 open func rangeExpression() throws -> RangeExpressionContext {
		var _localctx: RangeExpressionContext
		_localctx = RangeExpressionContext(_ctx, getState())
		try enterRule(_localctx, 228, ObjectiveCParser.RULE_rangeExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1360)
		 	try constantExpression()
		 	setState(1363)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ELIPSIS.rawValue) {
		 		setState(1361)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)
		 		setState(1362)
		 		try constantExpression()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CompoundStatementContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func declaration() -> [DeclarationContext] {
				return getRuleContexts(DeclarationContext.self)
			}
			open
			func declaration(_ i: Int) -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, i)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_compoundStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterCompoundStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitCompoundStatement(self)
			}
		}
	}
	@discardableResult
	 open func compoundStatement() throws -> CompoundStatementContext {
		var _localctx: CompoundStatementContext
		_localctx = CompoundStatementContext(_ctx, getState())
		try enterRule(_localctx, 230, ObjectiveCParser.RULE_compoundStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1365)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1370)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146530212641654) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -6123769593317032575) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1368)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,179, _ctx)) {
		 		case 1:
		 			setState(1366)
		 			try declaration()

		 			break
		 		case 2:
		 			setState(1367)
		 			try statement()

		 			break
		 		default: break
		 		}

		 		setState(1372)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1373)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectionStatementContext: ParserRuleContext {
		open var ifBody: StatementContext!
		open var elseBody: StatementContext!
			open
			func IF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IF.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
			open
			func ELSE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ELSE.rawValue, 0)
			}
			open
			func switchStatement() -> SwitchStatementContext? {
				return getRuleContext(SwitchStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_selectionStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSelectionStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSelectionStatement(self)
			}
		}
	}
	@discardableResult
	 open func selectionStatement() throws -> SelectionStatementContext {
		var _localctx: SelectionStatementContext
		_localctx = SelectionStatementContext(_ctx, getState())
		try enterRule(_localctx, 232, ObjectiveCParser.RULE_selectionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1385)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IF:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1375)
		 		try match(ObjectiveCParser.Tokens.IF.rawValue)
		 		setState(1376)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1377)
		 		try expression(0)
		 		setState(1378)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1379)
		 		try {
		 				let assignmentValue = try statement()
		 				_localctx.castdown(SelectionStatementContext.self).ifBody = assignmentValue
		 		     }()

		 		setState(1382)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,181,_ctx)) {
		 		case 1:
		 			setState(1380)
		 			try match(ObjectiveCParser.Tokens.ELSE.rawValue)
		 			setState(1381)
		 			try {
		 					let assignmentValue = try statement()
		 					_localctx.castdown(SelectionStatementContext.self).elseBody = assignmentValue
		 			     }()


		 			break
		 		default: break
		 		}

		 		break

		 	case .SWITCH:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1384)
		 		try switchStatement()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SwitchStatementContext: ParserRuleContext {
			open
			func SWITCH() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SWITCH.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func switchBlock() -> SwitchBlockContext? {
				return getRuleContext(SwitchBlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_switchStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwitchStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwitchStatement(self)
			}
		}
	}
	@discardableResult
	 open func switchStatement() throws -> SwitchStatementContext {
		var _localctx: SwitchStatementContext
		_localctx = SwitchStatementContext(_ctx, getState())
		try enterRule(_localctx, 234, ObjectiveCParser.RULE_switchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1387)
		 	try match(ObjectiveCParser.Tokens.SWITCH.rawValue)
		 	setState(1388)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1389)
		 	try expression(0)
		 	setState(1390)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1391)
		 	try switchBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SwitchBlockContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func switchSection() -> [SwitchSectionContext] {
				return getRuleContexts(SwitchSectionContext.self)
			}
			open
			func switchSection(_ i: Int) -> SwitchSectionContext? {
				return getRuleContext(SwitchSectionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_switchBlock
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwitchBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwitchBlock(self)
			}
		}
	}
	@discardableResult
	 open func switchBlock() throws -> SwitchBlockContext {
		var _localctx: SwitchBlockContext
		_localctx = SwitchBlockContext(_ctx, getState())
		try enterRule(_localctx, 236, ObjectiveCParser.RULE_switchBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1393)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1397)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue) {
		 		setState(1394)
		 		try switchSection()


		 		setState(1399)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1400)
		 	try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SwitchSectionContext: ParserRuleContext {
			open
			func switchLabel() -> [SwitchLabelContext] {
				return getRuleContexts(SwitchLabelContext.self)
			}
			open
			func switchLabel(_ i: Int) -> SwitchLabelContext? {
				return getRuleContext(SwitchLabelContext.self, i)
			}
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_switchSection
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwitchSection(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwitchSection(self)
			}
		}
	}
	@discardableResult
	 open func switchSection() throws -> SwitchSectionContext {
		var _localctx: SwitchSectionContext
		_localctx = SwitchSectionContext(_ctx, getState())
		try enterRule(_localctx, 238, ObjectiveCParser.RULE_switchSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1403) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1402)
		 		try switchLabel()


		 		setState(1405); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 	setState(1408) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1407)
		 		try statement()


		 		setState(1410); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146513339072836) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -6123769594089079423) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0))

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SwitchLabelContext: ParserRuleContext {
			open
			func CASE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CASE.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
			open
			func rangeExpression() -> RangeExpressionContext? {
				return getRuleContext(RangeExpressionContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func DEFAULT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DEFAULT.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_switchLabel
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwitchLabel(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwitchLabel(self)
			}
		}
	}
	@discardableResult
	 open func switchLabel() throws -> SwitchLabelContext {
		var _localctx: SwitchLabelContext
		_localctx = SwitchLabelContext(_ctx, getState())
		try enterRule(_localctx, 240, ObjectiveCParser.RULE_switchLabel)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1424)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CASE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1412)
		 		try match(ObjectiveCParser.Tokens.CASE.rawValue)
		 		setState(1418)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .TRUE:fallthrough
		 		case .FALSE:fallthrough
		 		case .BOOL:fallthrough
		 		case .Class:fallthrough
		 		case .BYCOPY:fallthrough
		 		case .BYREF:fallthrough
		 		case .ID:fallthrough
		 		case .IMP:fallthrough
		 		case .IN:fallthrough
		 		case .INOUT:fallthrough
		 		case .NIL:fallthrough
		 		case .NO:fallthrough
		 		case .NULL_:fallthrough
		 		case .ONEWAY:fallthrough
		 		case .OUT:fallthrough
		 		case .PROTOCOL_:fallthrough
		 		case .SEL:fallthrough
		 		case .SELF:fallthrough
		 		case .SUPER:fallthrough
		 		case .YES:fallthrough
		 		case .ATOMIC:fallthrough
		 		case .NONATOMIC:fallthrough
		 		case .RETAIN:fallthrough
		 		case .AUTORELEASING_QUALIFIER:fallthrough
		 		case .BLOCK:fallthrough
		 		case .BRIDGE_RETAINED:fallthrough
		 		case .BRIDGE_TRANSFER:fallthrough
		 		case .COVARIANT:fallthrough
		 		case .CONTRAVARIANT:fallthrough
		 		case .DEPRECATED:fallthrough
		 		case .KINDOF:fallthrough
		 		case .UNUSED:fallthrough
		 		case .NULL_UNSPECIFIED:fallthrough
		 		case .NULLABLE:fallthrough
		 		case .NONNULL:fallthrough
		 		case .NULL_RESETTABLE:fallthrough
		 		case .NS_INLINE:fallthrough
		 		case .NS_ENUM:fallthrough
		 		case .NS_OPTIONS:fallthrough
		 		case .ASSIGN:fallthrough
		 		case .COPY:fallthrough
		 		case .GETTER:fallthrough
		 		case .SETTER:fallthrough
		 		case .STRONG:fallthrough
		 		case .READONLY:fallthrough
		 		case .READWRITE:fallthrough
		 		case .WEAK:fallthrough
		 		case .UNSAFE_UNRETAINED:fallthrough
		 		case .IB_OUTLET:fallthrough
		 		case .IB_OUTLET_COLLECTION:fallthrough
		 		case .IB_INSPECTABLE:fallthrough
		 		case .IB_DESIGNABLE:fallthrough
		 		case .IDENTIFIER:fallthrough
		 		case .ADD:fallthrough
		 		case .SUB:fallthrough
		 		case .CHARACTER_LITERAL:fallthrough
		 		case .HEX_LITERAL:fallthrough
		 		case .OCTAL_LITERAL:fallthrough
		 		case .BINARY_LITERAL:fallthrough
		 		case .DECIMAL_LITERAL:fallthrough
		 		case .FLOATING_POINT_LITERAL:
		 			setState(1413)
		 			try rangeExpression()

		 			break

		 		case .LP:
		 			setState(1414)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1415)
		 			try rangeExpression()
		 			setState(1416)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1420)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1422)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 		setState(1423)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IterationStatementContext: ParserRuleContext {
			open
			func whileStatement() -> WhileStatementContext? {
				return getRuleContext(WhileStatementContext.self, 0)
			}
			open
			func doStatement() -> DoStatementContext? {
				return getRuleContext(DoStatementContext.self, 0)
			}
			open
			func forStatement() -> ForStatementContext? {
				return getRuleContext(ForStatementContext.self, 0)
			}
			open
			func forInStatement() -> ForInStatementContext? {
				return getRuleContext(ForInStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_iterationStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterIterationStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitIterationStatement(self)
			}
		}
	}
	@discardableResult
	 open func iterationStatement() throws -> IterationStatementContext {
		var _localctx: IterationStatementContext
		_localctx = IterationStatementContext(_ctx, getState())
		try enterRule(_localctx, 242, ObjectiveCParser.RULE_iterationStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1430)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,188, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1426)
		 		try whileStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1427)
		 		try doStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1428)
		 		try forStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1429)
		 		try forInStatement()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class WhileStatementContext: ParserRuleContext {
			open
			func WHILE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.WHILE.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_whileStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterWhileStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitWhileStatement(self)
			}
		}
	}
	@discardableResult
	 open func whileStatement() throws -> WhileStatementContext {
		var _localctx: WhileStatementContext
		_localctx = WhileStatementContext(_ctx, getState())
		try enterRule(_localctx, 244, ObjectiveCParser.RULE_whileStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1432)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1433)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1434)
		 	try expression(0)
		 	setState(1435)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1436)
		 	try statement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DoStatementContext: ParserRuleContext {
			open
			func DO() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DO.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func WHILE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.WHILE.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_doStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterDoStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitDoStatement(self)
			}
		}
	}
	@discardableResult
	 open func doStatement() throws -> DoStatementContext {
		var _localctx: DoStatementContext
		_localctx = DoStatementContext(_ctx, getState())
		try enterRule(_localctx, 246, ObjectiveCParser.RULE_doStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1438)
		 	try match(ObjectiveCParser.Tokens.DO.rawValue)
		 	setState(1439)
		 	try statement()
		 	setState(1440)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1441)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1442)
		 	try expression(0)
		 	setState(1443)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1444)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForStatementContext: ParserRuleContext {
			open
			func FOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FOR.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func SEMI() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.SEMI.rawValue)
			}
			open
			func SEMI(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, i)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func forLoopInitializer() -> ForLoopInitializerContext? {
				return getRuleContext(ForLoopInitializerContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_forStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterForStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitForStatement(self)
			}
		}
	}
	@discardableResult
	 open func forStatement() throws -> ForStatementContext {
		var _localctx: ForStatementContext
		_localctx = ForStatementContext(_ctx, getState())
		try enterRule(_localctx, 248, ObjectiveCParser.RULE_forStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1446)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1447)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1449)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916136071445042) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141691234316417) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1448)
		 		try forLoopInitializer()

		 	}

		 	setState(1451)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1453)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1452)
		 		try expression(0)

		 	}

		 	setState(1455)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1457)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1456)
		 		try expressions()

		 	}

		 	setState(1459)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1460)
		 	try statement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForLoopInitializerContext: ParserRuleContext {
			open
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
			}
			open
			func initDeclaratorList() -> InitDeclaratorListContext? {
				return getRuleContext(InitDeclaratorListContext.self, 0)
			}
			open
			func expressions() -> ExpressionsContext? {
				return getRuleContext(ExpressionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_forLoopInitializer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterForLoopInitializer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitForLoopInitializer(self)
			}
		}
	}
	@discardableResult
	 open func forLoopInitializer() throws -> ForLoopInitializerContext {
		var _localctx: ForLoopInitializerContext
		_localctx = ForLoopInitializerContext(_ctx, getState())
		try enterRule(_localctx, 250, ObjectiveCParser.RULE_forLoopInitializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1466)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,192, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1462)
		 		try declarationSpecifiers()
		 		setState(1463)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1465)
		 		try expressions()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ForInStatementContext: ParserRuleContext {
			open
			func FOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FOR.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeVariableDeclarator() -> TypeVariableDeclaratorContext? {
				return getRuleContext(TypeVariableDeclaratorContext.self, 0)
			}
			open
			func IN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IN.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_forInStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterForInStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitForInStatement(self)
			}
		}
	}
	@discardableResult
	 open func forInStatement() throws -> ForInStatementContext {
		var _localctx: ForInStatementContext
		_localctx = ForInStatementContext(_ctx, getState())
		try enterRule(_localctx, 252, ObjectiveCParser.RULE_forInStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1468)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1469)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1470)
		 	try typeVariableDeclarator()
		 	setState(1471)
		 	try match(ObjectiveCParser.Tokens.IN.rawValue)
		 	setState(1473)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 		setState(1472)
		 		try expression(0)

		 	}

		 	setState(1475)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1476)
		 	try statement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class JumpStatementContext: ParserRuleContext {
			open
			func GOTO() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GOTO.rawValue, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func CONTINUE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CONTINUE.rawValue, 0)
			}
			open
			func BREAK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BREAK.rawValue, 0)
			}
			open
			func RETURN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_jumpStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterJumpStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitJumpStatement(self)
			}
		}
	}
	@discardableResult
	 open func jumpStatement() throws -> JumpStatementContext {
		var _localctx: JumpStatementContext
		_localctx = JumpStatementContext(_ctx, getState())
		try enterRule(_localctx, 254, ObjectiveCParser.RULE_jumpStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1486)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .GOTO:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1478)
		 		try match(ObjectiveCParser.Tokens.GOTO.rawValue)
		 		setState(1479)
		 		try identifier()

		 		break

		 	case .CONTINUE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1480)
		 		try match(ObjectiveCParser.Tokens.CONTINUE.rawValue)

		 		break

		 	case .BREAK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1481)
		 		try match(ObjectiveCParser.Tokens.BREAK.rawValue)

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1482)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)
		 		setState(1484)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,194,_ctx)) {
		 		case 1:
		 			setState(1483)
		 			try expression(0)

		 			break
		 		default: break
		 		}

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionsContext: ParserRuleContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_expressions
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterExpressions(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitExpressions(self)
			}
		}
	}
	@discardableResult
	 open func expressions() throws -> ExpressionsContext {
		var _localctx: ExpressionsContext
		_localctx = ExpressionsContext(_ctx, getState())
		try enterRule(_localctx, 256, ObjectiveCParser.RULE_expressions)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1488)
		 	try expression(0)
		 	setState(1493)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,196,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1489)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1490)
		 			try expression(0)

		 	 
		 		}
		 		setState(1495)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,196,_ctx)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class ExpressionContext: ParserRuleContext {
		open var assignmentExpression: ExpressionContext!
		open var op: Token!
		open var trueExpression: ExpressionContext!
		open var falseExpression: ExpressionContext!
			open
			func castExpression() -> CastExpressionContext? {
				return getRuleContext(CastExpressionContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func compoundStatement() -> CompoundStatementContext? {
				return getRuleContext(CompoundStatementContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func assignmentOperator() -> AssignmentOperatorContext? {
				return getRuleContext(AssignmentOperatorContext.self, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func MUL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MUL.rawValue, 0)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DIV.rawValue, 0)
			}
			open
			func MOD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MOD.rawValue, 0)
			}
			open
			func ADD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD.rawValue, 0)
			}
			open
			func SUB() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB.rawValue, 0)
			}
			open
			func LT() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.LT.rawValue)
			}
			open
			func LT(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, i)
			}
			open
			func GT() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.GT.rawValue)
			}
			open
			func GT(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, i)
			}
			open
			func LE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LE.rawValue, 0)
			}
			open
			func GE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GE.rawValue, 0)
			}
			open
			func NOTEQUAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NOTEQUAL.rawValue, 0)
			}
			open
			func EQUAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func BITAND() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITAND.rawValue, 0)
			}
			open
			func BITXOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITXOR.rawValue, 0)
			}
			open
			func BITOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITOR.rawValue, 0)
			}
			open
			func AND() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AND.rawValue, 0)
			}
			open
			func OR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OR.rawValue, 0)
			}
			open
			func QUESTION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.QUESTION.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitExpression(self)
			}
		}
	}

	 public final  func expression( ) throws -> ExpressionContext   {
		return try expression(0)
	}
	@discardableResult
	private func expression(_ _p: Int) throws -> ExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: ExpressionContext
		_localctx = ExpressionContext(_ctx, _parentState)
		var _prevctx: ExpressionContext = _localctx
		let _startState: Int = 258
		try enterRecursionRule(_localctx, 258, ObjectiveCParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1506)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,197, _ctx)) {
			case 1:
				setState(1497)
				try castExpression()

				break
			case 2:
				setState(1498)
				try match(ObjectiveCParser.Tokens.LP.rawValue)
				setState(1499)
				try compoundStatement()
				setState(1500)
				try match(ObjectiveCParser.Tokens.RP.rawValue)

				break
			case 3:
				setState(1502)
				try unaryExpression()
				setState(1503)
				try assignmentOperator()
				setState(1504)
				try {
						let assignmentValue = try expression(1)
						_localctx.castdown(ExpressionContext.self).assignmentExpression = assignmentValue
				     }()


				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1552)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,201,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(1550)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,200, _ctx)) {
					case 1:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1508)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(1509)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 154)) & ~0x3f) == 0 && ((Int64(1) << (_la - 154)) & 35) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1510)
						try expression(14)

						break
					case 2:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1511)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(1512)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1513)
						try expression(13)

						break
					case 3:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1514)
						if (!(precpred(_ctx, 11))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 11)"))
						}
						setState(1519)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .LT:
							setState(1515)
							try match(ObjectiveCParser.Tokens.LT.rawValue)
							setState(1516)
							try match(ObjectiveCParser.Tokens.LT.rawValue)

							break

						case .GT:
							setState(1517)
							try match(ObjectiveCParser.Tokens.GT.rawValue)
							setState(1518)
							try match(ObjectiveCParser.Tokens.GT.rawValue)

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
						setState(1521)
						try expression(12)

						break
					case 4:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1522)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(1523)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 138)) & ~0x3f) == 0 && ((Int64(1) << (_la - 138)) & 387) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1524)
						try expression(11)

						break
					case 5:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1525)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(1526)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.EQUAL.rawValue || _la == ObjectiveCParser.Tokens.NOTEQUAL.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1527)
						try expression(10)

						break
					case 6:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1528)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(1529)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITAND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1530)
						try expression(9)

						break
					case 7:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1531)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(1532)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1533)
						try expression(8)

						break
					case 8:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1534)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(1535)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1536)
						try expression(7)

						break
					case 9:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1537)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(1538)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.AND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1539)
						try expression(6)

						break
					case 10:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1540)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(1541)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.OR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1542)
						try expression(5)

						break
					case 11:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1543)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(1544)
						try match(ObjectiveCParser.Tokens.QUESTION.rawValue)
						setState(1546)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
						if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690462269569) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
							setState(1545)
							try {
									let assignmentValue = try expression(0)
									_localctx.castdown(ExpressionContext.self).trueExpression = assignmentValue
							     }()


						}

						setState(1548)
						try match(ObjectiveCParser.Tokens.COLON.rawValue)
						setState(1549)
						try {
								let assignmentValue = try expression(4)
								_localctx.castdown(ExpressionContext.self).falseExpression = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(1554)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,201,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class AssignmentOperatorContext: ParserRuleContext {
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func MUL_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MUL_ASSIGN.rawValue, 0)
			}
			open
			func DIV_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DIV_ASSIGN.rawValue, 0)
			}
			open
			func MOD_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MOD_ASSIGN.rawValue, 0)
			}
			open
			func ADD_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD_ASSIGN.rawValue, 0)
			}
			open
			func SUB_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB_ASSIGN.rawValue, 0)
			}
			open
			func LSHIFT_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LSHIFT_ASSIGN.rawValue, 0)
			}
			open
			func RSHIFT_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RSHIFT_ASSIGN.rawValue, 0)
			}
			open
			func AND_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AND_ASSIGN.rawValue, 0)
			}
			open
			func XOR_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.XOR_ASSIGN.rawValue, 0)
			}
			open
			func OR_ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OR_ASSIGN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_assignmentOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterAssignmentOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitAssignmentOperator(self)
			}
		}
	}
	@discardableResult
	 open func assignmentOperator() throws -> AssignmentOperatorContext {
		var _localctx: AssignmentOperatorContext
		_localctx = AssignmentOperatorContext(_ctx, getState())
		try enterRule(_localctx, 260, ObjectiveCParser.RULE_assignmentOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1555)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 137)) & ~0x3f) == 0 && ((Int64(1) << (_la - 137)) & 8581545985) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CastExpressionContext: ParserRuleContext {
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func castExpression() -> CastExpressionContext? {
				return getRuleContext(CastExpressionContext.self, 0)
			}
			open
			func initializer() -> InitializerContext? {
				return getRuleContext(InitializerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_castExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterCastExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitCastExpression(self)
			}
		}
	}
	@discardableResult
	 open func castExpression() throws -> CastExpressionContext {
		var _localctx: CastExpressionContext
		_localctx = CastExpressionContext(_ctx, getState())
		try enterRule(_localctx, 262, ObjectiveCParser.RULE_castExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1566)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,203, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1557)
		 		try unaryExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1558)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1559)
		 		try typeName()
		 		setState(1560)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		setState(1564)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,202, _ctx)) {
		 		case 1:
		 			setState(1562)
		 			try castExpression()

		 			break
		 		case 2:
		 			setState(1563)
		 			try initializer()

		 			break
		 		default: break
		 		}

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InitializerContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func arrayInitializer() -> ArrayInitializerContext? {
				return getRuleContext(ArrayInitializerContext.self, 0)
			}
			open
			func structInitializer() -> StructInitializerContext? {
				return getRuleContext(StructInitializerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_initializer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterInitializer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitInitializer(self)
			}
		}
	}
	@discardableResult
	 open func initializer() throws -> InitializerContext {
		var _localctx: InitializerContext
		_localctx = InitializerContext(_ctx, getState())
		try enterRule(_localctx, 264, ObjectiveCParser.RULE_initializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1571)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,204, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1568)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1569)
		 		try arrayInitializer()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1570)
		 		try structInitializer()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConstantExpressionContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_constantExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterConstantExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitConstantExpression(self)
			}
		}
	}
	@discardableResult
	 open func constantExpression() throws -> ConstantExpressionContext {
		var _localctx: ConstantExpressionContext
		_localctx = ConstantExpressionContext(_ctx, getState())
		try enterRule(_localctx, 266, ObjectiveCParser.RULE_constantExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1575)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .BOOL:fallthrough
		 	case .Class:fallthrough
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .ID:fallthrough
		 	case .IMP:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:fallthrough
		 	case .PROTOCOL_:fallthrough
		 	case .SEL:fallthrough
		 	case .SELF:fallthrough
		 	case .SUPER:fallthrough
		 	case .ATOMIC:fallthrough
		 	case .NONATOMIC:fallthrough
		 	case .RETAIN:fallthrough
		 	case .AUTORELEASING_QUALIFIER:fallthrough
		 	case .BLOCK:fallthrough
		 	case .BRIDGE_RETAINED:fallthrough
		 	case .BRIDGE_TRANSFER:fallthrough
		 	case .COVARIANT:fallthrough
		 	case .CONTRAVARIANT:fallthrough
		 	case .DEPRECATED:fallthrough
		 	case .KINDOF:fallthrough
		 	case .UNUSED:fallthrough
		 	case .NULL_UNSPECIFIED:fallthrough
		 	case .NULLABLE:fallthrough
		 	case .NONNULL:fallthrough
		 	case .NULL_RESETTABLE:fallthrough
		 	case .NS_INLINE:fallthrough
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .ASSIGN:fallthrough
		 	case .COPY:fallthrough
		 	case .GETTER:fallthrough
		 	case .SETTER:fallthrough
		 	case .STRONG:fallthrough
		 	case .READONLY:fallthrough
		 	case .READWRITE:fallthrough
		 	case .WEAK:fallthrough
		 	case .UNSAFE_UNRETAINED:fallthrough
		 	case .IB_OUTLET:fallthrough
		 	case .IB_OUTLET_COLLECTION:fallthrough
		 	case .IB_INSPECTABLE:fallthrough
		 	case .IB_DESIGNABLE:fallthrough
		 	case .IDENTIFIER:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1573)
		 		try identifier()

		 		break
		 	case .TRUE:fallthrough
		 	case .FALSE:fallthrough
		 	case .NIL:fallthrough
		 	case .NO:fallthrough
		 	case .NULL_:fallthrough
		 	case .YES:fallthrough
		 	case .ADD:fallthrough
		 	case .SUB:fallthrough
		 	case .CHARACTER_LITERAL:fallthrough
		 	case .HEX_LITERAL:fallthrough
		 	case .OCTAL_LITERAL:fallthrough
		 	case .BINARY_LITERAL:fallthrough
		 	case .DECIMAL_LITERAL:fallthrough
		 	case .FLOATING_POINT_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1574)
		 		try constant()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class UnaryExpressionContext: ParserRuleContext {
		open var op: Token!
			open
			func postfixExpression() -> PostfixExpressionContext? {
				return getRuleContext(PostfixExpressionContext.self, 0)
			}
			open
			func SIZEOF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SIZEOF.rawValue, 0)
			}
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func INC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INC.rawValue, 0)
			}
			open
			func DEC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DEC.rawValue, 0)
			}
			open
			func unaryOperator() -> UnaryOperatorContext? {
				return getRuleContext(UnaryOperatorContext.self, 0)
			}
			open
			func castExpression() -> CastExpressionContext? {
				return getRuleContext(CastExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_unaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterUnaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitUnaryExpression(self)
			}
		}
	}
	@discardableResult
	 open func unaryExpression() throws -> UnaryExpressionContext {
		var _localctx: UnaryExpressionContext
		_localctx = UnaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 268, ObjectiveCParser.RULE_unaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1591)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,207, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1577)
		 		try postfixExpression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1578)
		 		try match(ObjectiveCParser.Tokens.SIZEOF.rawValue)
		 		setState(1584)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,206, _ctx)) {
		 		case 1:
		 			setState(1579)
		 			try unaryExpression()

		 			break
		 		case 2:
		 			setState(1580)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1581)
		 			try typeSpecifier()
		 			setState(1582)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1586)
		 		_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1587)
		 		try unaryExpression()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1588)
		 		try unaryOperator()
		 		setState(1589)
		 		try castExpression()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class UnaryOperatorContext: ParserRuleContext {
			open
			func BITAND() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BITAND.rawValue, 0)
			}
			open
			func MUL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MUL.rawValue, 0)
			}
			open
			func ADD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD.rawValue, 0)
			}
			open
			func SUB() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB.rawValue, 0)
			}
			open
			func TILDE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TILDE.rawValue, 0)
			}
			open
			func BANG() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BANG.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_unaryOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterUnaryOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitUnaryOperator(self)
			}
		}
	}
	@discardableResult
	 open func unaryOperator() throws -> UnaryOperatorContext {
		var _localctx: UnaryOperatorContext
		_localctx = UnaryOperatorContext(_ctx, getState())
		try enterRule(_localctx, 270, ObjectiveCParser.RULE_unaryOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1593)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 94211) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class PostfixExpressionContext: ParserRuleContext {
			open
			func primaryExpression() -> PrimaryExpressionContext? {
				return getRuleContext(PrimaryExpressionContext.self, 0)
			}
			open
			func `postfix`() -> [PostfixContext] {
				return getRuleContexts(PostfixContext.self)
			}
			open
			func `postfix`(_ i: Int) -> PostfixContext? {
				return getRuleContext(PostfixContext.self, i)
			}
			open
			func postfixExpression() -> PostfixExpressionContext? {
				return getRuleContext(PostfixExpressionContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func DOT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DOT.rawValue, 0)
			}
			open
			func STRUCTACCESS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRUCTACCESS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_postfixExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPostfixExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPostfixExpression(self)
			}
		}
	}

	 public final  func postfixExpression( ) throws -> PostfixExpressionContext   {
		return try postfixExpression(0)
	}
	@discardableResult
	private func postfixExpression(_ _p: Int) throws -> PostfixExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: PostfixExpressionContext
		_localctx = PostfixExpressionContext(_ctx, _parentState)
		var _prevctx: PostfixExpressionContext = _localctx
		let _startState: Int = 272
		try enterRecursionRule(_localctx, 272, ObjectiveCParser.RULE_postfixExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1596)
			try primaryExpression()
			setState(1600)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,208,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					setState(1597)
					try `postfix`()

			 
				}
				setState(1602)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,208,_ctx)
			}

			_ctx!.stop = try _input.LT(-1)
			setState(1614)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,210,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = PostfixExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_postfixExpression)
					setState(1603)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1604)
					_la = try _input.LA(1)
					if (!(_la == ObjectiveCParser.Tokens.DOT.rawValue || _la == ObjectiveCParser.Tokens.STRUCTACCESS.rawValue)) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(1605)
					try identifier()
					setState(1609)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,209,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1606)
							try `postfix`()

					 
						}
						setState(1611)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,209,_ctx)
					}

			 
				}
				setState(1616)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,210,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class PostfixContext: ParserRuleContext {
		open var _RP: Token!
		open var macroArguments: [Token] = [Token]()
		open var _tset3190: Token!
		open var op: Token!
			open
			func LBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LBRACK.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RBRACK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RBRACK.rawValue, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.RP.rawValue)
			}
			open
			func RP(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, i)
			}
			open
			func argumentExpressionList() -> ArgumentExpressionListContext? {
				return getRuleContext(ArgumentExpressionListContext.self, 0)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
			open
			func INC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INC.rawValue, 0)
			}
			open
			func DEC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DEC.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_postfix
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPostfix(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPostfix(self)
			}
		}
	}
	@discardableResult
	 open func `postfix`() throws -> PostfixContext {
		var _localctx: PostfixContext
		_localctx = PostfixContext(_ctx, getState())
		try enterRule(_localctx, 274, ObjectiveCParser.RULE_postfix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1635)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,214, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1617)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1618)
		 		try expression(0)
		 		setState(1619)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1621)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1623)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916127411120656) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 2523141690529378433) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 4363692523569) != 0)) {
		 			setState(1622)
		 			try argumentExpressionList()

		 		}

		 		setState(1625)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1626)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1629) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1629)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,212, _ctx)) {
		 			case 1:
		 				setState(1627)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 				break
		 			case 2:
		 				setState(1628)
		 				_localctx.castdown(PostfixContext.self)._tset3190 = try _input.LT(1)
		 				_la = try _input.LA(1)
		 				if (_la <= 0 || (_la == ObjectiveCParser.Tokens.RP.rawValue)) {
		 					_localctx.castdown(PostfixContext.self)._tset3190 = try _errHandler.recoverInline(self) as Token
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}
		 				_localctx.castdown(PostfixContext.self).macroArguments.append(_localctx.castdown(PostfixContext.self)._tset3190)

		 				break
		 			default: break
		 			}

		 			setState(1631); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & -2) != 0) || ((Int64((_la - 64)) & ~0x3f) == 0 && ((Int64(1) << (_la - 64)) & 9223372036854775807) != 0) || ((Int64((_la - 128)) & ~0x3f) == 0 && ((Int64(1) << (_la - 128)) & -1) != 0) || ((Int64((_la - 192)) & ~0x3f) == 0 && ((Int64(1) << (_la - 192)) & 2147483647) != 0))
		 		setState(1633)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1634)
		 		_localctx.castdown(PostfixContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(PostfixContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArgumentExpressionListContext: ParserRuleContext {
			open
			func argumentExpression() -> [ArgumentExpressionContext] {
				return getRuleContexts(ArgumentExpressionContext.self)
			}
			open
			func argumentExpression(_ i: Int) -> ArgumentExpressionContext? {
				return getRuleContext(ArgumentExpressionContext.self, i)
			}
			open
			func COMMA() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.COMMA.rawValue)
			}
			open
			func COMMA(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_argumentExpressionList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterArgumentExpressionList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitArgumentExpressionList(self)
			}
		}
	}
	@discardableResult
	 open func argumentExpressionList() throws -> ArgumentExpressionListContext {
		var _localctx: ArgumentExpressionListContext
		_localctx = ArgumentExpressionListContext(_ctx, getState())
		try enterRule(_localctx, 276, ObjectiveCParser.RULE_argumentExpressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1637)
		 	try argumentExpression()
		 	setState(1642)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1638)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1639)
		 		try argumentExpression()


		 		setState(1644)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArgumentExpressionContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_argumentExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterArgumentExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitArgumentExpression(self)
			}
		}
	}
	@discardableResult
	 open func argumentExpression() throws -> ArgumentExpressionContext {
		var _localctx: ArgumentExpressionContext
		_localctx = ArgumentExpressionContext(_ctx, getState())
		try enterRule(_localctx, 278, ObjectiveCParser.RULE_argumentExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1647)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,216, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1645)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1646)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimaryExpressionContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func constant() -> ConstantContext? {
				return getRuleContext(ConstantContext.self, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func messageExpression() -> MessageExpressionContext? {
				return getRuleContext(MessageExpressionContext.self, 0)
			}
			open
			func selectorExpression() -> SelectorExpressionContext? {
				return getRuleContext(SelectorExpressionContext.self, 0)
			}
			open
			func protocolExpression() -> ProtocolExpressionContext? {
				return getRuleContext(ProtocolExpressionContext.self, 0)
			}
			open
			func encodeExpression() -> EncodeExpressionContext? {
				return getRuleContext(EncodeExpressionContext.self, 0)
			}
			open
			func dictionaryExpression() -> DictionaryExpressionContext? {
				return getRuleContext(DictionaryExpressionContext.self, 0)
			}
			open
			func arrayExpression() -> ArrayExpressionContext? {
				return getRuleContext(ArrayExpressionContext.self, 0)
			}
			open
			func boxExpression() -> BoxExpressionContext? {
				return getRuleContext(BoxExpressionContext.self, 0)
			}
			open
			func blockExpression() -> BlockExpressionContext? {
				return getRuleContext(BlockExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_primaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterPrimaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitPrimaryExpression(self)
			}
		}
	}
	@discardableResult
	 open func primaryExpression() throws -> PrimaryExpressionContext {
		var _localctx: PrimaryExpressionContext
		_localctx = PrimaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 280, ObjectiveCParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1664)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,217, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1649)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1650)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1651)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1652)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1653)
		 		try expression(0)
		 		setState(1654)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1656)
		 		try messageExpression()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1657)
		 		try selectorExpression()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1658)
		 		try protocolExpression()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1659)
		 		try encodeExpression()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1660)
		 		try dictionaryExpression()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1661)
		 		try arrayExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1662)
		 		try boxExpression()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1663)
		 		try blockExpression()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConstantContext: ParserRuleContext {
			open
			func HEX_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue, 0)
			}
			open
			func OCTAL_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue, 0)
			}
			open
			func BINARY_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue, 0)
			}
			open
			func DECIMAL_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue, 0)
			}
			open
			func ADD() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ADD.rawValue, 0)
			}
			open
			func SUB() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUB.rawValue, 0)
			}
			open
			func FLOATING_POINT_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue, 0)
			}
			open
			func CHARACTER_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue, 0)
			}
			open
			func NIL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NIL.rawValue, 0)
			}
			open
			func NULL_() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULL_.rawValue, 0)
			}
			open
			func YES() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.YES.rawValue, 0)
			}
			open
			func NO() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NO.rawValue, 0)
			}
			open
			func TRUE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TRUE.rawValue, 0)
			}
			open
			func FALSE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FALSE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_constant
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterConstant(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitConstant(self)
			}
		}
	}
	@discardableResult
	 open func constant() throws -> ConstantContext {
		var _localctx: ConstantContext
		_localctx = ConstantContext(_ctx, getState())
		try enterRule(_localctx, 282, ObjectiveCParser.RULE_constant)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1684)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,220, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1666)
		 		try match(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1667)
		 		try match(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1668)
		 		try match(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1670)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1669)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1672)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1674)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1673)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1676)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1677)
		 		try match(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1678)
		 		try match(ObjectiveCParser.Tokens.NIL.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1679)
		 		try match(ObjectiveCParser.Tokens.NULL_.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1680)
		 		try match(ObjectiveCParser.Tokens.YES.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1681)
		 		try match(ObjectiveCParser.Tokens.NO.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1682)
		 		try match(ObjectiveCParser.Tokens.TRUE.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1683)
		 		try match(ObjectiveCParser.Tokens.FALSE.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StringLiteralContext: ParserRuleContext {
			open
			func STRING_START() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.STRING_START.rawValue)
			}
			open
			func STRING_START(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRING_START.rawValue, i)
			}
			open
			func STRING_END() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.STRING_END.rawValue)
			}
			open
			func STRING_END(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRING_END.rawValue, i)
			}
			open
			func STRING_VALUE() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.STRING_VALUE.rawValue)
			}
			open
			func STRING_VALUE(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRING_VALUE.rawValue, i)
			}
			open
			func STRING_NEWLINE() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue)
			}
			open
			func STRING_NEWLINE(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_stringLiteral
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterStringLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitStringLiteral(self)
			}
		}
	}
	@discardableResult
	 open func stringLiteral() throws -> StringLiteralContext {
		var _localctx: StringLiteralContext
		_localctx = StringLiteralContext(_ctx, getState())
		try enterRule(_localctx, 284, ObjectiveCParser.RULE_stringLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1694); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1686)
		 			try match(ObjectiveCParser.Tokens.STRING_START.rawValue)
		 			setState(1690)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue) {
		 				setState(1687)
		 				_la = try _input.LA(1)
		 				if (!(_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue)) {
		 				try _errHandler.recoverInline(self)
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}


		 				setState(1692)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1693)
		 			try match(ObjectiveCParser.Tokens.STRING_END.rawValue)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1696); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,222,_ctx)
		 	} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IdentifierContext: ParserRuleContext {
			open
			func IDENTIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IDENTIFIER.rawValue, 0)
			}
			open
			func BOOL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BOOL.rawValue, 0)
			}
			open
			func Class() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.Class.rawValue, 0)
			}
			open
			func BYCOPY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BYCOPY.rawValue, 0)
			}
			open
			func BYREF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BYREF.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ID.rawValue, 0)
			}
			open
			func IMP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IMP.rawValue, 0)
			}
			open
			func IN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IN.rawValue, 0)
			}
			open
			func INOUT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.INOUT.rawValue, 0)
			}
			open
			func ONEWAY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ONEWAY.rawValue, 0)
			}
			open
			func OUT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.OUT.rawValue, 0)
			}
			open
			func PROTOCOL_() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.PROTOCOL_.rawValue, 0)
			}
			open
			func SEL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEL.rawValue, 0)
			}
			open
			func SELF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SELF.rawValue, 0)
			}
			open
			func SUPER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SUPER.rawValue, 0)
			}
			open
			func ATOMIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ATOMIC.rawValue, 0)
			}
			open
			func NONATOMIC() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NONATOMIC.rawValue, 0)
			}
			open
			func RETAIN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RETAIN.rawValue, 0)
			}
			open
			func AUTORELEASING_QUALIFIER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.AUTORELEASING_QUALIFIER.rawValue, 0)
			}
			open
			func BLOCK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BLOCK.rawValue, 0)
			}
			open
			func BRIDGE_RETAINED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BRIDGE_RETAINED.rawValue, 0)
			}
			open
			func BRIDGE_TRANSFER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.BRIDGE_TRANSFER.rawValue, 0)
			}
			open
			func COVARIANT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COVARIANT.rawValue, 0)
			}
			open
			func CONTRAVARIANT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.CONTRAVARIANT.rawValue, 0)
			}
			open
			func DEPRECATED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DEPRECATED.rawValue, 0)
			}
			open
			func KINDOF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.KINDOF.rawValue, 0)
			}
			open
			func UNUSED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNUSED.rawValue, 0)
			}
			open
			func NS_INLINE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_INLINE.rawValue, 0)
			}
			open
			func NS_ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_ENUM.rawValue, 0)
			}
			open
			func NS_OPTIONS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_OPTIONS.rawValue, 0)
			}
			open
			func NULL_UNSPECIFIED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULL_UNSPECIFIED.rawValue, 0)
			}
			open
			func NULLABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULLABLE.rawValue, 0)
			}
			open
			func NONNULL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NONNULL.rawValue, 0)
			}
			open
			func NULL_RESETTABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NULL_RESETTABLE.rawValue, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func COPY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COPY.rawValue, 0)
			}
			open
			func GETTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GETTER.rawValue, 0)
			}
			open
			func SETTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SETTER.rawValue, 0)
			}
			open
			func STRONG() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.STRONG.rawValue, 0)
			}
			open
			func READONLY() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.READONLY.rawValue, 0)
			}
			open
			func READWRITE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.READWRITE.rawValue, 0)
			}
			open
			func WEAK() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.WEAK.rawValue, 0)
			}
			open
			func UNSAFE_UNRETAINED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue, 0)
			}
			open
			func IB_OUTLET() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_OUTLET.rawValue, 0)
			}
			open
			func IB_OUTLET_COLLECTION() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue, 0)
			}
			open
			func IB_INSPECTABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue, 0)
			}
			open
			func IB_DESIGNABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_identifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterIdentifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitIdentifier(self)
			}
		}
	}
	@discardableResult
	 open func identifier() throws -> IdentifierContext {
		var _localctx: IdentifierContext
		_localctx = IdentifierContext(_ctx, getState())
		try enterRule(_localctx, 286, ObjectiveCParser.RULE_identifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1698)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 17867063762871) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  129:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
		case  136:
			return try postfixExpression_sempred(_localctx?.castdown(PostfixExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func expression_sempred(_ _localctx: ExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 13)
		    case 1:return precpred(_ctx, 12)
		    case 2:return precpred(_ctx, 11)
		    case 3:return precpred(_ctx, 10)
		    case 4:return precpred(_ctx, 9)
		    case 5:return precpred(_ctx, 8)
		    case 6:return precpred(_ctx, 7)
		    case 7:return precpred(_ctx, 6)
		    case 8:return precpred(_ctx, 5)
		    case 9:return precpred(_ctx, 4)
		    case 10:return precpred(_ctx, 3)
		    default: return true
		}
	}
	private func postfixExpression_sempred(_ _localctx: PostfixExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 11:return precpred(_ctx, 1)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,222,1701,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
		7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,21,
		2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,27,2,28,7,28,
		2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,2,34,7,34,2,35,7,35,
		2,36,7,36,2,37,7,37,2,38,7,38,2,39,7,39,2,40,7,40,2,41,7,41,2,42,7,42,
		2,43,7,43,2,44,7,44,2,45,7,45,2,46,7,46,2,47,7,47,2,48,7,48,2,49,7,49,
		2,50,7,50,2,51,7,51,2,52,7,52,2,53,7,53,2,54,7,54,2,55,7,55,2,56,7,56,
		2,57,7,57,2,58,7,58,2,59,7,59,2,60,7,60,2,61,7,61,2,62,7,62,2,63,7,63,
		2,64,7,64,2,65,7,65,2,66,7,66,2,67,7,67,2,68,7,68,2,69,7,69,2,70,7,70,
		2,71,7,71,2,72,7,72,2,73,7,73,2,74,7,74,2,75,7,75,2,76,7,76,2,77,7,77,
		2,78,7,78,2,79,7,79,2,80,7,80,2,81,7,81,2,82,7,82,2,83,7,83,2,84,7,84,
		2,85,7,85,2,86,7,86,2,87,7,87,2,88,7,88,2,89,7,89,2,90,7,90,2,91,7,91,
		2,92,7,92,2,93,7,93,2,94,7,94,2,95,7,95,2,96,7,96,2,97,7,97,2,98,7,98,
		2,99,7,99,2,100,7,100,2,101,7,101,2,102,7,102,2,103,7,103,2,104,7,104,
		2,105,7,105,2,106,7,106,2,107,7,107,2,108,7,108,2,109,7,109,2,110,7,110,
		2,111,7,111,2,112,7,112,2,113,7,113,2,114,7,114,2,115,7,115,2,116,7,116,
		2,117,7,117,2,118,7,118,2,119,7,119,2,120,7,120,2,121,7,121,2,122,7,122,
		2,123,7,123,2,124,7,124,2,125,7,125,2,126,7,126,2,127,7,127,2,128,7,128,
		2,129,7,129,2,130,7,130,2,131,7,131,2,132,7,132,2,133,7,133,2,134,7,134,
		2,135,7,135,2,136,7,136,2,137,7,137,2,138,7,138,2,139,7,139,2,140,7,140,
		2,141,7,141,2,142,7,142,2,143,7,143,1,0,5,0,290,8,0,10,0,12,0,293,9,0,
		1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,308,8,1,1,2,1,
		2,1,2,1,2,1,3,3,3,315,8,3,1,3,1,3,1,3,1,3,3,3,321,8,3,1,3,1,3,1,3,1,3,
		3,3,327,8,3,1,3,3,3,330,8,3,1,3,3,3,333,8,3,1,3,1,3,1,4,1,4,1,4,1,4,3,
		4,341,8,4,1,4,1,4,1,4,1,4,1,4,3,4,348,8,4,1,4,3,4,351,8,4,1,4,3,4,354,
		8,4,1,4,1,4,1,5,1,5,1,5,1,5,3,5,362,8,5,1,5,3,5,365,8,5,1,5,3,5,368,8,
		5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,1,6,3,6,378,8,6,1,6,1,6,1,7,1,7,1,7,1,7,
		1,7,1,7,3,7,388,8,7,1,8,1,8,1,8,1,8,1,8,1,8,3,8,396,8,8,1,8,5,8,399,8,
		8,10,8,12,8,402,9,8,1,8,1,8,1,9,1,9,5,9,408,8,9,10,9,12,9,411,9,9,1,9,
		4,9,414,8,9,11,9,12,9,415,3,9,418,8,9,1,10,1,10,1,10,1,10,1,11,1,11,1,
		11,1,11,5,11,428,8,11,10,11,12,11,431,9,11,1,11,1,11,1,12,1,12,1,12,5,
		12,438,8,12,10,12,12,12,441,9,12,1,13,1,13,1,13,1,13,1,13,3,13,448,8,13,
		1,13,3,13,451,8,13,1,13,3,13,454,8,13,1,13,1,13,1,14,1,14,1,14,5,14,461,
		8,14,10,14,12,14,464,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
		1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,486,8,15,1,
		16,1,16,1,16,1,16,1,16,3,16,493,8,16,1,16,3,16,496,8,16,1,17,1,17,5,17,
		500,8,17,10,17,12,17,503,9,17,1,17,1,17,1,18,1,18,5,18,509,8,18,10,18,
		12,18,512,9,18,1,18,4,18,515,8,18,11,18,12,18,516,3,18,519,8,18,1,19,1,
		19,1,20,1,20,1,20,1,20,1,20,4,20,528,8,20,11,20,12,20,529,1,21,1,21,1,
		21,1,22,1,22,1,22,1,23,3,23,539,8,23,1,23,1,23,3,23,543,8,23,1,23,1,23,
		1,24,1,24,1,24,1,24,1,24,4,24,552,8,24,11,24,12,24,553,1,25,1,25,1,25,
		1,26,1,26,1,26,1,27,3,27,563,8,27,1,27,1,27,3,27,567,8,27,1,27,3,27,570,
		8,27,1,27,1,27,1,28,1,28,4,28,576,8,28,11,28,12,28,577,1,28,1,28,3,28,
		582,8,28,3,28,584,8,28,1,29,3,29,587,8,29,1,29,1,29,5,29,591,8,29,10,29,
		12,29,594,9,29,1,29,3,29,597,8,29,1,29,1,29,1,30,1,30,3,30,603,8,30,1,
		31,1,31,1,31,1,31,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,3,32,617,8,32,
		1,33,1,33,1,33,5,33,622,8,33,10,33,12,33,625,9,33,1,34,1,34,1,34,3,34,
		630,8,34,1,35,3,35,633,8,35,1,35,1,35,3,35,637,8,35,1,35,1,35,1,35,1,35,
		3,35,643,8,35,1,35,1,35,3,35,647,8,35,1,36,1,36,1,36,1,36,5,36,653,8,36,
		10,36,12,36,656,9,36,3,36,658,8,36,1,36,1,36,1,37,5,37,663,8,37,10,37,
		12,37,666,9,37,1,37,1,37,3,37,670,8,37,1,38,1,38,1,38,1,38,1,38,5,38,677,
		8,38,10,38,12,38,680,9,38,1,38,3,38,683,8,38,3,38,685,8,38,1,38,1,38,1,
		39,1,39,1,39,1,39,1,40,1,40,1,40,1,40,3,40,697,8,40,3,40,699,8,40,1,40,
		1,40,1,41,1,41,1,41,1,41,1,41,1,41,1,41,1,41,3,41,711,8,41,3,41,713,8,
		41,1,42,1,42,1,42,3,42,718,8,42,1,42,1,42,5,42,722,8,42,10,42,12,42,725,
		9,42,3,42,727,8,42,1,42,1,42,1,43,1,43,3,43,733,8,43,1,44,1,44,3,44,737,
		8,44,1,44,3,44,740,8,44,1,44,3,44,743,8,44,1,44,1,44,1,45,1,45,1,45,1,
		45,1,45,1,46,1,46,3,46,754,8,46,1,47,1,47,4,47,758,8,47,11,47,12,47,759,
		3,47,762,8,47,1,48,3,48,765,8,48,1,48,1,48,1,48,1,48,5,48,771,8,48,10,
		48,12,48,774,9,48,1,49,1,49,3,49,778,8,49,1,49,1,49,1,49,1,49,3,49,784,
		8,49,1,50,1,50,1,50,1,50,1,50,1,51,1,51,3,51,793,8,51,1,51,4,51,796,8,
		51,11,51,12,51,797,3,51,800,8,51,1,52,1,52,1,52,1,52,1,52,1,53,1,53,1,
		53,1,53,1,53,1,54,1,54,1,54,1,55,1,55,1,55,1,55,1,55,1,55,1,55,3,55,822,
		8,55,1,56,1,56,1,56,5,56,827,8,56,10,56,12,56,830,9,56,1,56,1,56,3,56,
		834,8,56,1,57,1,57,1,57,1,57,1,57,1,57,1,58,1,58,1,58,1,58,1,58,1,58,1,
		59,1,59,1,59,1,60,1,60,1,60,1,61,1,61,1,61,1,62,3,62,858,8,62,1,62,1,62,
		1,62,3,62,863,8,62,1,62,1,62,1,62,3,62,868,8,62,1,63,1,63,3,63,872,8,63,
		1,64,1,64,3,64,876,8,64,1,65,1,65,3,65,880,8,65,1,65,1,65,1,66,1,66,1,
		66,5,66,887,8,66,10,66,12,66,890,9,66,1,67,1,67,1,67,1,67,3,67,896,8,67,
		1,68,1,68,1,68,1,68,1,68,3,68,903,8,68,1,69,1,69,1,69,1,69,3,69,909,8,
		69,1,70,3,70,912,8,70,1,70,1,70,3,70,916,8,70,1,70,1,70,1,70,1,70,1,70,
		1,71,3,71,924,8,71,1,71,3,71,927,8,71,1,71,1,71,3,71,931,8,71,1,71,1,71,
		1,72,1,72,1,72,1,72,3,72,939,8,72,1,72,1,72,1,73,3,73,944,8,73,1,73,1,
		73,1,73,1,73,1,73,3,73,951,8,73,1,73,1,73,1,74,1,74,1,74,5,74,958,8,74,
		10,74,12,74,961,9,74,1,75,3,75,964,8,75,1,75,1,75,1,76,1,76,1,76,1,76,
		1,76,1,76,1,76,1,76,4,76,976,8,76,11,76,12,76,977,1,77,1,77,1,77,1,77,
		1,77,1,77,5,77,986,8,77,10,77,12,77,989,9,77,1,77,1,77,1,77,1,78,1,78,
		1,78,5,78,997,8,78,10,78,12,78,1000,9,78,1,79,1,79,1,79,3,79,1005,8,79,
		1,80,1,80,1,80,3,80,1010,8,80,1,80,1,80,4,80,1014,8,80,11,80,12,80,1015,
		1,80,1,80,3,80,1020,8,80,1,81,1,81,1,81,3,81,1025,8,81,1,81,1,81,1,82,
		1,82,1,82,1,82,1,82,1,82,4,82,1035,8,82,11,82,12,82,1036,1,83,1,83,1,83,
		1,83,1,83,1,83,3,83,1045,8,83,1,84,1,84,1,85,1,85,1,86,1,86,1,87,1,87,
		1,88,1,88,1,88,1,88,3,88,1059,8,88,1,89,1,89,1,90,1,90,1,90,1,90,1,90,
		1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,3,90,1078,8,90,3,90,
		1080,8,90,1,91,1,91,1,91,1,91,1,91,1,92,1,92,1,92,5,92,1090,8,92,10,92,
		12,92,1093,9,92,1,93,1,93,3,93,1097,8,93,1,93,1,93,3,93,1101,8,93,1,94,
		1,94,3,94,1105,8,94,1,94,1,94,3,94,1109,8,94,1,94,1,94,1,94,1,94,1,94,
		3,94,1116,8,94,1,94,1,94,1,94,1,94,3,94,1122,8,94,1,94,1,94,1,94,1,94,
		1,94,1,94,1,94,1,94,1,94,1,94,3,94,1134,8,94,1,95,1,95,1,95,5,95,1139,
		8,95,10,95,12,95,1142,9,95,1,95,3,95,1145,8,95,1,96,1,96,1,96,3,96,1150,
		8,96,1,97,1,97,3,97,1154,8,97,1,98,1,98,1,98,1,98,1,98,3,98,1161,8,98,
		1,98,5,98,1164,8,98,10,98,12,98,1167,9,98,1,98,1,98,1,98,3,98,1172,8,98,
		1,98,3,98,1175,8,98,1,98,1,98,3,98,1179,8,98,1,99,1,99,3,99,1183,8,99,
		1,99,1,99,1,100,1,100,1,100,3,100,1190,8,100,1,101,1,101,3,101,1194,8,
		101,1,101,3,101,1197,8,101,1,102,1,102,1,102,1,102,1,102,5,102,1204,8,
		102,10,102,12,102,1207,9,102,1,102,1,102,3,102,1211,8,102,1,103,1,103,
		1,103,3,103,1216,8,103,3,103,1218,8,103,1,103,1,103,1,104,1,104,1,104,
		1,104,1,104,1,104,5,104,1228,8,104,10,104,12,104,1231,9,104,1,104,3,104,
		1234,8,104,3,104,1236,8,104,1,104,1,104,1,105,1,105,1,105,5,105,1243,8,
		105,10,105,12,105,1246,9,105,1,105,3,105,1249,8,105,1,106,1,106,3,106,
		1253,8,106,1,106,3,106,1256,8,106,1,107,1,107,3,107,1260,8,107,1,107,1,
		107,3,107,1264,8,107,1,107,1,107,4,107,1268,8,107,11,107,12,107,1269,1,
		107,1,107,3,107,1274,8,107,1,107,4,107,1277,8,107,11,107,12,107,1278,3,
		107,1281,8,107,1,108,1,108,3,108,1285,8,108,1,108,1,108,1,108,3,108,1290,
		8,108,1,108,3,108,1293,8,108,1,109,1,109,1,109,5,109,1298,8,109,10,109,
		12,109,1301,9,109,1,110,1,110,1,110,1,110,3,110,1307,8,110,1,111,3,111,
		1310,8,111,1,111,1,111,1,112,1,112,3,112,1316,8,112,1,112,1,112,3,112,
		1320,8,112,1,112,1,112,3,112,1324,8,112,1,112,1,112,3,112,1328,8,112,1,
		112,1,112,3,112,1332,8,112,1,112,1,112,3,112,1336,8,112,1,112,1,112,3,
		112,1340,8,112,1,112,1,112,3,112,1344,8,112,1,112,1,112,3,112,1348,8,112,
		1,112,1,112,3,112,1352,8,112,1,112,3,112,1355,8,112,1,113,1,113,1,113,
		1,113,1,114,1,114,1,114,3,114,1364,8,114,1,115,1,115,1,115,5,115,1369,
		8,115,10,115,12,115,1372,9,115,1,115,1,115,1,116,1,116,1,116,1,116,1,116,
		1,116,1,116,3,116,1383,8,116,1,116,3,116,1386,8,116,1,117,1,117,1,117,
		1,117,1,117,1,117,1,118,1,118,5,118,1396,8,118,10,118,12,118,1399,9,118,
		1,118,1,118,1,119,4,119,1404,8,119,11,119,12,119,1405,1,119,4,119,1409,
		8,119,11,119,12,119,1410,1,120,1,120,1,120,1,120,1,120,1,120,3,120,1419,
		8,120,1,120,1,120,1,120,1,120,3,120,1425,8,120,1,121,1,121,1,121,1,121,
		3,121,1431,8,121,1,122,1,122,1,122,1,122,1,122,1,122,1,123,1,123,1,123,
		1,123,1,123,1,123,1,123,1,123,1,124,1,124,1,124,3,124,1450,8,124,1,124,
		1,124,3,124,1454,8,124,1,124,1,124,3,124,1458,8,124,1,124,1,124,1,124,
		1,125,1,125,1,125,1,125,3,125,1467,8,125,1,126,1,126,1,126,1,126,1,126,
		3,126,1474,8,126,1,126,1,126,1,126,1,127,1,127,1,127,1,127,1,127,1,127,
		3,127,1485,8,127,3,127,1487,8,127,1,128,1,128,1,128,5,128,1492,8,128,10,
		128,12,128,1495,9,128,1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,
		1,129,1,129,3,129,1507,8,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,
		1,129,1,129,1,129,1,129,3,129,1520,8,129,1,129,1,129,1,129,1,129,1,129,
		1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,
		1,129,1,129,1,129,1,129,1,129,1,129,1,129,1,129,3,129,1547,8,129,1,129,
		1,129,5,129,1551,8,129,10,129,12,129,1554,9,129,1,130,1,130,1,131,1,131,
		1,131,1,131,1,131,1,131,1,131,3,131,1565,8,131,3,131,1567,8,131,1,132,
		1,132,1,132,3,132,1572,8,132,1,133,1,133,3,133,1576,8,133,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,3,134,1585,8,134,1,134,1,134,1,134,1,134,
		1,134,3,134,1592,8,134,1,135,1,135,1,136,1,136,1,136,5,136,1599,8,136,
		10,136,12,136,1602,9,136,1,136,1,136,1,136,1,136,5,136,1608,8,136,10,136,
		12,136,1611,9,136,5,136,1613,8,136,10,136,12,136,1616,9,136,1,137,1,137,
		1,137,1,137,1,137,1,137,3,137,1624,8,137,1,137,1,137,1,137,1,137,4,137,
		1630,8,137,11,137,12,137,1631,1,137,1,137,3,137,1636,8,137,1,138,1,138,
		1,138,5,138,1641,8,138,10,138,12,138,1644,9,138,1,139,1,139,3,139,1648,
		8,139,1,140,1,140,1,140,1,140,1,140,1,140,1,140,1,140,1,140,1,140,1,140,
		1,140,1,140,1,140,1,140,3,140,1665,8,140,1,141,1,141,1,141,1,141,3,141,
		1671,8,141,1,141,1,141,3,141,1675,8,141,1,141,1,141,1,141,1,141,1,141,
		1,141,1,141,1,141,3,141,1685,8,141,1,142,1,142,5,142,1689,8,142,10,142,
		12,142,1692,9,142,1,142,4,142,1695,8,142,11,142,12,142,1696,1,143,1,143,
		1,143,0,2,258,272,144,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,
		36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,
		84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,
		124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,
		160,162,164,166,168,170,172,174,176,178,180,182,184,186,188,190,192,194,
		196,198,200,202,204,206,208,210,212,214,216,218,220,222,224,226,228,230,
		232,234,236,238,240,242,244,246,248,250,252,254,256,258,260,262,264,266,
		268,270,272,274,276,278,280,282,284,286,0,21,2,0,70,70,75,75,1,0,90,91,
		3,0,68,68,71,71,73,74,2,0,27,27,30,30,4,0,85,85,94,94,96,96,98,98,1,0,
		99,102,4,0,1,1,12,12,20,20,26,26,4,0,17,17,86,89,93,93,103,103,3,0,42,
		43,46,47,51,52,1,0,104,105,2,0,154,155,159,159,1,0,152,153,2,0,138,139,
		145,146,2,0,144,144,147,147,2,0,137,137,160,169,1,0,150,151,3,0,140,141,
		152,154,156,156,1,0,134,135,1,0,127,127,2,0,183,183,185,185,8,0,40,47,
		51,56,81,83,85,86,88,93,97,97,99,118,125,125,1886,0,291,1,0,0,0,2,307,
		1,0,0,0,4,309,1,0,0,0,6,314,1,0,0,0,8,336,1,0,0,0,10,357,1,0,0,0,12,371,
		1,0,0,0,14,381,1,0,0,0,16,389,1,0,0,0,18,417,1,0,0,0,20,419,1,0,0,0,22,
		423,1,0,0,0,24,434,1,0,0,0,26,442,1,0,0,0,28,457,1,0,0,0,30,485,1,0,0,
		0,32,495,1,0,0,0,34,497,1,0,0,0,36,518,1,0,0,0,38,520,1,0,0,0,40,527,1,
		0,0,0,42,531,1,0,0,0,44,534,1,0,0,0,46,538,1,0,0,0,48,551,1,0,0,0,50,555,
		1,0,0,0,52,558,1,0,0,0,54,562,1,0,0,0,56,583,1,0,0,0,58,586,1,0,0,0,60,
		602,1,0,0,0,62,604,1,0,0,0,64,616,1,0,0,0,66,618,1,0,0,0,68,626,1,0,0,
		0,70,632,1,0,0,0,72,648,1,0,0,0,74,669,1,0,0,0,76,671,1,0,0,0,78,688,1,
		0,0,0,80,692,1,0,0,0,82,712,1,0,0,0,84,714,1,0,0,0,86,732,1,0,0,0,88,734,
		1,0,0,0,90,746,1,0,0,0,92,753,1,0,0,0,94,761,1,0,0,0,96,764,1,0,0,0,98,
		775,1,0,0,0,100,785,1,0,0,0,102,799,1,0,0,0,104,801,1,0,0,0,106,806,1,
		0,0,0,108,811,1,0,0,0,110,821,1,0,0,0,112,823,1,0,0,0,114,835,1,0,0,0,
		116,841,1,0,0,0,118,847,1,0,0,0,120,850,1,0,0,0,122,853,1,0,0,0,124,857,
		1,0,0,0,126,869,1,0,0,0,128,875,1,0,0,0,130,877,1,0,0,0,132,883,1,0,0,
		0,134,895,1,0,0,0,136,897,1,0,0,0,138,908,1,0,0,0,140,911,1,0,0,0,142,
		923,1,0,0,0,144,938,1,0,0,0,146,943,1,0,0,0,148,954,1,0,0,0,150,963,1,
		0,0,0,152,975,1,0,0,0,154,979,1,0,0,0,156,993,1,0,0,0,158,1001,1,0,0,0,
		160,1006,1,0,0,0,162,1021,1,0,0,0,164,1034,1,0,0,0,166,1044,1,0,0,0,168,
		1046,1,0,0,0,170,1048,1,0,0,0,172,1050,1,0,0,0,174,1052,1,0,0,0,176,1058,
		1,0,0,0,178,1060,1,0,0,0,180,1079,1,0,0,0,182,1081,1,0,0,0,184,1086,1,
		0,0,0,186,1100,1,0,0,0,188,1133,1,0,0,0,190,1135,1,0,0,0,192,1146,1,0,
		0,0,194,1153,1,0,0,0,196,1178,1,0,0,0,198,1180,1,0,0,0,200,1186,1,0,0,
		0,202,1191,1,0,0,0,204,1198,1,0,0,0,206,1212,1,0,0,0,208,1221,1,0,0,0,
		210,1239,1,0,0,0,212,1255,1,0,0,0,214,1280,1,0,0,0,216,1292,1,0,0,0,218,
		1294,1,0,0,0,220,1306,1,0,0,0,222,1309,1,0,0,0,224,1354,1,0,0,0,226,1356,
		1,0,0,0,228,1360,1,0,0,0,230,1365,1,0,0,0,232,1385,1,0,0,0,234,1387,1,
		0,0,0,236,1393,1,0,0,0,238,1403,1,0,0,0,240,1424,1,0,0,0,242,1430,1,0,
		0,0,244,1432,1,0,0,0,246,1438,1,0,0,0,248,1446,1,0,0,0,250,1466,1,0,0,
		0,252,1468,1,0,0,0,254,1486,1,0,0,0,256,1488,1,0,0,0,258,1506,1,0,0,0,
		260,1555,1,0,0,0,262,1566,1,0,0,0,264,1571,1,0,0,0,266,1575,1,0,0,0,268,
		1591,1,0,0,0,270,1593,1,0,0,0,272,1595,1,0,0,0,274,1635,1,0,0,0,276,1637,
		1,0,0,0,278,1647,1,0,0,0,280,1664,1,0,0,0,282,1684,1,0,0,0,284,1694,1,
		0,0,0,286,1698,1,0,0,0,288,290,3,2,1,0,289,288,1,0,0,0,290,293,1,0,0,0,
		291,289,1,0,0,0,291,292,1,0,0,0,292,294,1,0,0,0,293,291,1,0,0,0,294,295,
		5,0,0,1,295,1,1,0,0,0,296,308,3,4,2,0,297,308,3,120,60,0,298,308,3,138,
		69,0,299,308,3,6,3,0,300,308,3,10,5,0,301,308,3,8,4,0,302,308,3,12,6,0,
		303,308,3,16,8,0,304,308,3,20,10,0,305,308,3,22,11,0,306,308,3,122,61,
		0,307,296,1,0,0,0,307,297,1,0,0,0,307,298,1,0,0,0,307,299,1,0,0,0,307,
		300,1,0,0,0,307,301,1,0,0,0,307,302,1,0,0,0,307,303,1,0,0,0,307,304,1,
		0,0,0,307,305,1,0,0,0,307,306,1,0,0,0,308,3,1,0,0,0,309,310,5,67,0,0,310,
		311,3,286,143,0,311,312,5,132,0,0,312,5,1,0,0,0,313,315,5,118,0,0,314,
		313,1,0,0,0,314,315,1,0,0,0,315,316,1,0,0,0,316,317,5,66,0,0,317,320,3,
		14,7,0,318,319,5,143,0,0,319,321,3,286,143,0,320,318,1,0,0,0,320,321,1,
		0,0,0,321,326,1,0,0,0,322,323,5,139,0,0,323,324,3,24,12,0,324,325,5,138,
		0,0,325,327,1,0,0,0,326,322,1,0,0,0,326,327,1,0,0,0,327,329,1,0,0,0,328,
		330,3,34,17,0,329,328,1,0,0,0,329,330,1,0,0,0,330,332,1,0,0,0,331,333,
		3,40,20,0,332,331,1,0,0,0,332,333,1,0,0,0,333,334,1,0,0,0,334,335,5,63,
		0,0,335,7,1,0,0,0,336,337,5,66,0,0,337,338,3,14,7,0,338,340,5,126,0,0,
		339,341,3,286,143,0,340,339,1,0,0,0,340,341,1,0,0,0,341,342,1,0,0,0,342,
		347,5,127,0,0,343,344,5,139,0,0,344,345,3,24,12,0,345,346,5,138,0,0,346,
		348,1,0,0,0,347,343,1,0,0,0,347,348,1,0,0,0,348,350,1,0,0,0,349,351,3,
		34,17,0,350,349,1,0,0,0,350,351,1,0,0,0,351,353,1,0,0,0,352,354,3,40,20,
		0,353,352,1,0,0,0,353,354,1,0,0,0,354,355,1,0,0,0,355,356,5,63,0,0,356,
		9,1,0,0,0,357,358,5,65,0,0,358,361,3,14,7,0,359,360,5,143,0,0,360,362,
		3,286,143,0,361,359,1,0,0,0,361,362,1,0,0,0,362,364,1,0,0,0,363,365,3,
		34,17,0,364,363,1,0,0,0,364,365,1,0,0,0,365,367,1,0,0,0,366,368,3,48,24,
		0,367,366,1,0,0,0,367,368,1,0,0,0,368,369,1,0,0,0,369,370,5,63,0,0,370,
		11,1,0,0,0,371,372,5,65,0,0,372,373,3,14,7,0,373,374,5,126,0,0,374,375,
		3,286,143,0,375,377,5,127,0,0,376,378,3,48,24,0,377,376,1,0,0,0,377,378,
		1,0,0,0,378,379,1,0,0,0,379,380,5,63,0,0,380,13,1,0,0,0,381,387,3,286,
		143,0,382,383,5,139,0,0,383,384,3,24,12,0,384,385,5,138,0,0,385,388,1,
		0,0,0,386,388,3,72,36,0,387,382,1,0,0,0,387,386,1,0,0,0,387,388,1,0,0,
		0,388,15,1,0,0,0,389,390,5,69,0,0,390,395,3,32,16,0,391,392,5,139,0,0,
		392,393,3,24,12,0,393,394,5,138,0,0,394,396,1,0,0,0,395,391,1,0,0,0,395,
		396,1,0,0,0,396,400,1,0,0,0,397,399,3,18,9,0,398,397,1,0,0,0,399,402,1,
		0,0,0,400,398,1,0,0,0,400,401,1,0,0,0,401,403,1,0,0,0,402,400,1,0,0,0,
		403,404,5,63,0,0,404,17,1,0,0,0,405,409,7,0,0,0,406,408,3,40,20,0,407,
		406,1,0,0,0,408,411,1,0,0,0,409,407,1,0,0,0,409,410,1,0,0,0,410,418,1,
		0,0,0,411,409,1,0,0,0,412,414,3,40,20,0,413,412,1,0,0,0,414,415,1,0,0,
		0,415,413,1,0,0,0,415,416,1,0,0,0,416,418,1,0,0,0,417,405,1,0,0,0,417,
		413,1,0,0,0,418,19,1,0,0,0,419,420,5,69,0,0,420,421,3,24,12,0,421,422,
		5,132,0,0,422,21,1,0,0,0,423,424,5,60,0,0,424,429,3,286,143,0,425,426,
		5,133,0,0,426,428,3,286,143,0,427,425,1,0,0,0,428,431,1,0,0,0,429,427,
		1,0,0,0,429,430,1,0,0,0,430,432,1,0,0,0,431,429,1,0,0,0,432,433,5,132,
		0,0,433,23,1,0,0,0,434,439,3,32,16,0,435,436,5,133,0,0,436,438,3,32,16,
		0,437,435,1,0,0,0,438,441,1,0,0,0,439,437,1,0,0,0,439,440,1,0,0,0,440,
		25,1,0,0,0,441,439,1,0,0,0,442,447,5,72,0,0,443,444,5,126,0,0,444,445,
		3,28,14,0,445,446,5,127,0,0,446,448,1,0,0,0,447,443,1,0,0,0,447,448,1,
		0,0,0,448,450,1,0,0,0,449,451,3,166,83,0,450,449,1,0,0,0,450,451,1,0,0,
		0,451,453,1,0,0,0,452,454,5,117,0,0,453,452,1,0,0,0,453,454,1,0,0,0,454,
		455,1,0,0,0,455,456,3,162,81,0,456,27,1,0,0,0,457,462,3,30,15,0,458,459,
		5,133,0,0,459,461,3,30,15,0,460,458,1,0,0,0,461,464,1,0,0,0,462,460,1,
		0,0,0,462,463,1,0,0,0,463,29,1,0,0,0,464,462,1,0,0,0,465,486,5,81,0,0,
		466,486,5,82,0,0,467,486,5,110,0,0,468,486,5,113,0,0,469,486,5,83,0,0,
		470,486,5,106,0,0,471,486,5,114,0,0,472,486,5,107,0,0,473,486,5,111,0,
		0,474,486,5,112,0,0,475,476,5,108,0,0,476,477,5,137,0,0,477,486,3,286,
		143,0,478,479,5,109,0,0,479,480,5,137,0,0,480,481,3,286,143,0,481,482,
		5,143,0,0,482,486,1,0,0,0,483,486,3,170,85,0,484,486,3,286,143,0,485,465,
		1,0,0,0,485,466,1,0,0,0,485,467,1,0,0,0,485,468,1,0,0,0,485,469,1,0,0,
		0,485,470,1,0,0,0,485,471,1,0,0,0,485,472,1,0,0,0,485,473,1,0,0,0,485,
		474,1,0,0,0,485,475,1,0,0,0,485,478,1,0,0,0,485,483,1,0,0,0,485,484,1,
		0,0,0,486,31,1,0,0,0,487,488,5,139,0,0,488,489,3,24,12,0,489,490,5,138,
		0,0,490,496,1,0,0,0,491,493,7,1,0,0,492,491,1,0,0,0,492,493,1,0,0,0,493,
		494,1,0,0,0,494,496,3,286,143,0,495,487,1,0,0,0,495,492,1,0,0,0,496,33,
		1,0,0,0,497,501,5,128,0,0,498,500,3,36,18,0,499,498,1,0,0,0,500,503,1,
		0,0,0,501,499,1,0,0,0,501,502,1,0,0,0,502,504,1,0,0,0,503,501,1,0,0,0,
		504,505,5,129,0,0,505,35,1,0,0,0,506,510,3,38,19,0,507,509,3,162,81,0,
		508,507,1,0,0,0,509,512,1,0,0,0,510,508,1,0,0,0,510,511,1,0,0,0,511,519,
		1,0,0,0,512,510,1,0,0,0,513,515,3,162,81,0,514,513,1,0,0,0,515,516,1,0,
		0,0,516,514,1,0,0,0,516,517,1,0,0,0,517,519,1,0,0,0,518,506,1,0,0,0,518,
		514,1,0,0,0,519,37,1,0,0,0,520,521,7,2,0,0,521,39,1,0,0,0,522,528,3,138,
		69,0,523,528,3,42,21,0,524,528,3,44,22,0,525,528,3,26,13,0,526,528,3,120,
		60,0,527,522,1,0,0,0,527,523,1,0,0,0,527,524,1,0,0,0,527,525,1,0,0,0,527,
		526,1,0,0,0,528,529,1,0,0,0,529,527,1,0,0,0,529,530,1,0,0,0,530,41,1,0,
		0,0,531,532,5,152,0,0,532,533,3,46,23,0,533,43,1,0,0,0,534,535,5,153,0,
		0,535,536,3,46,23,0,536,45,1,0,0,0,537,539,3,62,31,0,538,537,1,0,0,0,538,
		539,1,0,0,0,539,540,1,0,0,0,540,542,3,56,28,0,541,543,3,204,102,0,542,
		541,1,0,0,0,542,543,1,0,0,0,543,544,1,0,0,0,544,545,5,132,0,0,545,47,1,
		0,0,0,546,552,3,122,61,0,547,552,3,138,69,0,548,552,3,50,25,0,549,552,
		3,52,26,0,550,552,3,64,32,0,551,546,1,0,0,0,551,547,1,0,0,0,551,548,1,
		0,0,0,551,549,1,0,0,0,551,550,1,0,0,0,552,553,1,0,0,0,553,551,1,0,0,0,
		553,554,1,0,0,0,554,49,1,0,0,0,555,556,5,152,0,0,556,557,3,54,27,0,557,
		51,1,0,0,0,558,559,5,153,0,0,559,560,3,54,27,0,560,53,1,0,0,0,561,563,
		3,62,31,0,562,561,1,0,0,0,562,563,1,0,0,0,563,564,1,0,0,0,564,566,3,56,
		28,0,565,567,3,156,78,0,566,565,1,0,0,0,566,567,1,0,0,0,567,569,1,0,0,
		0,568,570,5,132,0,0,569,568,1,0,0,0,569,570,1,0,0,0,570,571,1,0,0,0,571,
		572,3,230,115,0,572,55,1,0,0,0,573,584,3,60,30,0,574,576,3,58,29,0,575,
		574,1,0,0,0,576,577,1,0,0,0,577,575,1,0,0,0,577,578,1,0,0,0,578,581,1,
		0,0,0,579,580,5,133,0,0,580,582,5,170,0,0,581,579,1,0,0,0,581,582,1,0,
		0,0,582,584,1,0,0,0,583,573,1,0,0,0,583,575,1,0,0,0,584,57,1,0,0,0,585,
		587,3,60,30,0,586,585,1,0,0,0,586,587,1,0,0,0,587,588,1,0,0,0,588,592,
		5,143,0,0,589,591,3,62,31,0,590,589,1,0,0,0,591,594,1,0,0,0,592,590,1,
		0,0,0,592,593,1,0,0,0,593,596,1,0,0,0,594,592,1,0,0,0,595,597,3,168,84,
		0,596,595,1,0,0,0,596,597,1,0,0,0,597,598,1,0,0,0,598,599,3,286,143,0,
		599,59,1,0,0,0,600,603,3,286,143,0,601,603,5,22,0,0,602,600,1,0,0,0,602,
		601,1,0,0,0,603,61,1,0,0,0,604,605,5,126,0,0,605,606,3,212,106,0,606,607,
		5,127,0,0,607,63,1,0,0,0,608,609,5,78,0,0,609,610,3,66,33,0,610,611,5,
		132,0,0,611,617,1,0,0,0,612,613,5,61,0,0,613,614,3,66,33,0,614,615,5,132,
		0,0,615,617,1,0,0,0,616,608,1,0,0,0,616,612,1,0,0,0,617,65,1,0,0,0,618,
		623,3,68,34,0,619,620,5,133,0,0,620,622,3,68,34,0,621,619,1,0,0,0,622,
		625,1,0,0,0,623,621,1,0,0,0,623,624,1,0,0,0,624,67,1,0,0,0,625,623,1,0,
		0,0,626,629,3,286,143,0,627,628,5,137,0,0,628,630,3,286,143,0,629,627,
		1,0,0,0,629,630,1,0,0,0,630,69,1,0,0,0,631,633,3,170,85,0,632,631,1,0,
		0,0,632,633,1,0,0,0,633,634,1,0,0,0,634,636,3,180,90,0,635,637,3,170,85,
		0,636,635,1,0,0,0,636,637,1,0,0,0,637,638,1,0,0,0,638,639,5,126,0,0,639,
		642,5,158,0,0,640,643,3,170,85,0,641,643,3,180,90,0,642,640,1,0,0,0,642,
		641,1,0,0,0,642,643,1,0,0,0,643,644,1,0,0,0,644,646,5,127,0,0,645,647,
		3,84,42,0,646,645,1,0,0,0,646,647,1,0,0,0,647,71,1,0,0,0,648,657,5,139,
		0,0,649,654,3,74,37,0,650,651,5,133,0,0,651,653,3,74,37,0,652,650,1,0,
		0,0,653,656,1,0,0,0,654,652,1,0,0,0,654,655,1,0,0,0,655,658,1,0,0,0,656,
		654,1,0,0,0,657,649,1,0,0,0,657,658,1,0,0,0,658,659,1,0,0,0,659,660,5,
		138,0,0,660,73,1,0,0,0,661,663,3,174,87,0,662,661,1,0,0,0,663,666,1,0,
		0,0,664,662,1,0,0,0,664,665,1,0,0,0,665,667,1,0,0,0,666,664,1,0,0,0,667,
		670,3,180,90,0,668,670,3,212,106,0,669,664,1,0,0,0,669,668,1,0,0,0,670,
		75,1,0,0,0,671,672,5,136,0,0,672,684,5,128,0,0,673,678,3,78,39,0,674,675,
		5,133,0,0,675,677,3,78,39,0,676,674,1,0,0,0,677,680,1,0,0,0,678,676,1,
		0,0,0,678,679,1,0,0,0,679,682,1,0,0,0,680,678,1,0,0,0,681,683,5,133,0,
		0,682,681,1,0,0,0,682,683,1,0,0,0,683,685,1,0,0,0,684,673,1,0,0,0,684,
		685,1,0,0,0,685,686,1,0,0,0,686,687,5,129,0,0,687,77,1,0,0,0,688,689,3,
		262,131,0,689,690,5,143,0,0,690,691,3,258,129,0,691,79,1,0,0,0,692,693,
		5,136,0,0,693,698,5,130,0,0,694,696,3,256,128,0,695,697,5,133,0,0,696,
		695,1,0,0,0,696,697,1,0,0,0,697,699,1,0,0,0,698,694,1,0,0,0,698,699,1,
		0,0,0,699,700,1,0,0,0,700,701,5,131,0,0,701,81,1,0,0,0,702,703,5,136,0,
		0,703,704,5,126,0,0,704,705,3,258,129,0,705,706,5,127,0,0,706,713,1,0,
		0,0,707,710,5,136,0,0,708,711,3,282,141,0,709,711,3,286,143,0,710,708,
		1,0,0,0,710,709,1,0,0,0,711,713,1,0,0,0,712,702,1,0,0,0,712,707,1,0,0,
		0,713,83,1,0,0,0,714,726,5,126,0,0,715,718,3,86,43,0,716,718,5,32,0,0,
		717,715,1,0,0,0,717,716,1,0,0,0,718,723,1,0,0,0,719,720,5,133,0,0,720,
		722,3,86,43,0,721,719,1,0,0,0,722,725,1,0,0,0,723,721,1,0,0,0,723,724,
		1,0,0,0,724,727,1,0,0,0,725,723,1,0,0,0,726,717,1,0,0,0,726,727,1,0,0,
		0,727,728,1,0,0,0,728,729,5,127,0,0,729,85,1,0,0,0,730,733,3,108,54,0,
		731,733,3,212,106,0,732,730,1,0,0,0,732,731,1,0,0,0,733,87,1,0,0,0,734,
		736,5,158,0,0,735,737,3,180,90,0,736,735,1,0,0,0,736,737,1,0,0,0,737,739,
		1,0,0,0,738,740,3,170,85,0,739,738,1,0,0,0,739,740,1,0,0,0,740,742,1,0,
		0,0,741,743,3,84,42,0,742,741,1,0,0,0,742,743,1,0,0,0,743,744,1,0,0,0,
		744,745,3,230,115,0,745,89,1,0,0,0,746,747,5,130,0,0,747,748,3,92,46,0,
		748,749,3,94,47,0,749,750,5,131,0,0,750,91,1,0,0,0,751,754,3,258,129,0,
		752,754,3,180,90,0,753,751,1,0,0,0,753,752,1,0,0,0,754,93,1,0,0,0,755,
		762,3,60,30,0,756,758,3,96,48,0,757,756,1,0,0,0,758,759,1,0,0,0,759,757,
		1,0,0,0,759,760,1,0,0,0,760,762,1,0,0,0,761,755,1,0,0,0,761,757,1,0,0,
		0,762,95,1,0,0,0,763,765,3,60,30,0,764,763,1,0,0,0,764,765,1,0,0,0,765,
		766,1,0,0,0,766,767,5,143,0,0,767,772,3,98,49,0,768,769,5,133,0,0,769,
		771,3,98,49,0,770,768,1,0,0,0,771,774,1,0,0,0,772,770,1,0,0,0,772,773,
		1,0,0,0,773,97,1,0,0,0,774,772,1,0,0,0,775,777,3,256,128,0,776,778,3,170,
		85,0,777,776,1,0,0,0,777,778,1,0,0,0,778,783,1,0,0,0,779,780,5,128,0,0,
		780,781,3,210,105,0,781,782,5,129,0,0,782,784,1,0,0,0,783,779,1,0,0,0,
		783,784,1,0,0,0,784,99,1,0,0,0,785,786,5,76,0,0,786,787,5,126,0,0,787,
		788,3,102,51,0,788,789,5,127,0,0,789,101,1,0,0,0,790,800,3,60,30,0,791,
		793,3,60,30,0,792,791,1,0,0,0,792,793,1,0,0,0,793,794,1,0,0,0,794,796,
		5,143,0,0,795,792,1,0,0,0,796,797,1,0,0,0,797,795,1,0,0,0,797,798,1,0,
		0,0,798,800,1,0,0,0,799,790,1,0,0,0,799,795,1,0,0,0,800,103,1,0,0,0,801,
		802,5,69,0,0,802,803,5,126,0,0,803,804,3,32,16,0,804,805,5,127,0,0,805,
		105,1,0,0,0,806,807,5,62,0,0,807,808,5,126,0,0,808,809,3,212,106,0,809,
		810,5,127,0,0,810,107,1,0,0,0,811,812,3,152,76,0,812,813,3,222,111,0,813,
		109,1,0,0,0,814,815,5,79,0,0,815,816,5,126,0,0,816,817,3,286,143,0,817,
		818,5,127,0,0,818,822,1,0,0,0,819,820,5,79,0,0,820,822,3,258,129,0,821,
		814,1,0,0,0,821,819,1,0,0,0,822,111,1,0,0,0,823,824,5,80,0,0,824,828,3,
		230,115,0,825,827,3,114,57,0,826,825,1,0,0,0,827,830,1,0,0,0,828,826,1,
		0,0,0,828,829,1,0,0,0,829,833,1,0,0,0,830,828,1,0,0,0,831,832,5,64,0,0,
		832,834,3,230,115,0,833,831,1,0,0,0,833,834,1,0,0,0,834,113,1,0,0,0,835,
		836,5,59,0,0,836,837,5,126,0,0,837,838,3,108,54,0,838,839,5,127,0,0,839,
		840,3,230,115,0,840,115,1,0,0,0,841,842,5,77,0,0,842,843,5,126,0,0,843,
		844,3,258,129,0,844,845,5,127,0,0,845,846,3,230,115,0,846,117,1,0,0,0,
		847,848,5,58,0,0,848,849,3,230,115,0,849,119,1,0,0,0,850,851,3,124,62,
		0,851,852,5,132,0,0,852,121,1,0,0,0,853,854,3,124,62,0,854,855,3,230,115,
		0,855,123,1,0,0,0,856,858,3,152,76,0,857,856,1,0,0,0,857,858,1,0,0,0,858,
		859,1,0,0,0,859,860,3,286,143,0,860,862,5,126,0,0,861,863,3,200,100,0,
		862,861,1,0,0,0,862,863,1,0,0,0,863,864,1,0,0,0,864,865,5,127,0,0,865,
		867,1,0,0,0,866,868,3,154,77,0,867,866,1,0,0,0,867,868,1,0,0,0,868,125,
		1,0,0,0,869,871,3,128,64,0,870,872,3,130,65,0,871,870,1,0,0,0,871,872,
		1,0,0,0,872,127,1,0,0,0,873,876,5,5,0,0,874,876,3,286,143,0,875,873,1,
		0,0,0,875,874,1,0,0,0,876,129,1,0,0,0,877,879,5,126,0,0,878,880,3,132,
		66,0,879,878,1,0,0,0,879,880,1,0,0,0,880,881,1,0,0,0,881,882,5,127,0,0,
		882,131,1,0,0,0,883,888,3,134,67,0,884,885,5,133,0,0,885,887,3,134,67,
		0,886,884,1,0,0,0,887,890,1,0,0,0,888,886,1,0,0,0,888,889,1,0,0,0,889,
		133,1,0,0,0,890,888,1,0,0,0,891,896,3,126,63,0,892,896,3,282,141,0,893,
		896,3,284,142,0,894,896,3,136,68,0,895,891,1,0,0,0,895,892,1,0,0,0,895,
		893,1,0,0,0,895,894,1,0,0,0,896,135,1,0,0,0,897,898,3,128,64,0,898,902,
		5,137,0,0,899,903,3,282,141,0,900,903,3,128,64,0,901,903,3,284,142,0,902,
		899,1,0,0,0,902,900,1,0,0,0,902,901,1,0,0,0,903,137,1,0,0,0,904,909,3,
		140,70,0,905,909,3,142,71,0,906,909,3,144,72,0,907,909,3,146,73,0,908,
		904,1,0,0,0,908,905,1,0,0,0,908,906,1,0,0,0,908,907,1,0,0,0,909,139,1,
		0,0,0,910,912,3,154,77,0,911,910,1,0,0,0,911,912,1,0,0,0,912,913,1,0,0,
		0,913,915,3,286,143,0,914,916,3,154,77,0,915,914,1,0,0,0,915,916,1,0,0,
		0,916,917,1,0,0,0,917,918,5,126,0,0,918,919,3,196,98,0,919,920,5,127,0,
		0,920,921,5,132,0,0,921,141,1,0,0,0,922,924,3,154,77,0,923,922,1,0,0,0,
		923,924,1,0,0,0,924,926,1,0,0,0,925,927,5,29,0,0,926,925,1,0,0,0,926,927,
		1,0,0,0,927,928,1,0,0,0,928,930,3,188,94,0,929,931,3,286,143,0,930,929,
		1,0,0,0,930,931,1,0,0,0,931,932,1,0,0,0,932,933,5,132,0,0,933,143,1,0,
		0,0,934,935,3,152,76,0,935,936,3,156,78,0,936,939,1,0,0,0,937,939,3,152,
		76,0,938,934,1,0,0,0,938,937,1,0,0,0,939,940,1,0,0,0,940,941,5,132,0,0,
		941,145,1,0,0,0,942,944,3,154,77,0,943,942,1,0,0,0,943,944,1,0,0,0,944,
		945,1,0,0,0,945,950,5,29,0,0,946,947,3,152,76,0,947,948,3,148,74,0,948,
		951,1,0,0,0,949,951,3,152,76,0,950,946,1,0,0,0,950,949,1,0,0,0,951,952,
		1,0,0,0,952,953,5,132,0,0,953,147,1,0,0,0,954,959,3,150,75,0,955,956,5,
		133,0,0,956,958,3,150,75,0,957,955,1,0,0,0,958,961,1,0,0,0,959,957,1,0,
		0,0,959,960,1,0,0,0,960,149,1,0,0,0,961,959,1,0,0,0,962,964,3,202,101,
		0,963,962,1,0,0,0,963,964,1,0,0,0,964,965,1,0,0,0,965,966,3,196,98,0,966,
		151,1,0,0,0,967,976,3,172,86,0,968,976,3,154,77,0,969,976,3,168,84,0,970,
		976,3,170,85,0,971,976,3,166,83,0,972,976,3,174,87,0,973,976,3,176,88,
		0,974,976,3,180,90,0,975,967,1,0,0,0,975,968,1,0,0,0,975,969,1,0,0,0,975,
		970,1,0,0,0,975,971,1,0,0,0,975,972,1,0,0,0,975,973,1,0,0,0,975,974,1,
		0,0,0,976,977,1,0,0,0,977,975,1,0,0,0,977,978,1,0,0,0,978,153,1,0,0,0,
		979,980,5,84,0,0,980,981,5,126,0,0,981,982,5,126,0,0,982,987,3,126,63,
		0,983,984,5,133,0,0,984,986,3,126,63,0,985,983,1,0,0,0,986,989,1,0,0,0,
		987,985,1,0,0,0,987,988,1,0,0,0,988,990,1,0,0,0,989,987,1,0,0,0,990,991,
		5,127,0,0,991,992,5,127,0,0,992,155,1,0,0,0,993,998,3,158,79,0,994,995,
		5,133,0,0,995,997,3,158,79,0,996,994,1,0,0,0,997,1000,1,0,0,0,998,996,
		1,0,0,0,998,999,1,0,0,0,999,157,1,0,0,0,1000,998,1,0,0,0,1001,1004,3,222,
		111,0,1002,1003,5,137,0,0,1003,1005,3,264,132,0,1004,1002,1,0,0,0,1004,
		1005,1,0,0,0,1005,159,1,0,0,0,1006,1019,7,3,0,0,1007,1020,3,286,143,0,
		1008,1010,3,286,143,0,1009,1008,1,0,0,0,1009,1010,1,0,0,0,1010,1011,1,
		0,0,0,1011,1013,5,128,0,0,1012,1014,3,162,81,0,1013,1012,1,0,0,0,1014,
		1015,1,0,0,0,1015,1013,1,0,0,0,1015,1016,1,0,0,0,1016,1017,1,0,0,0,1017,
		1018,5,129,0,0,1018,1020,1,0,0,0,1019,1007,1,0,0,0,1019,1009,1,0,0,0,1020,
		161,1,0,0,0,1021,1022,3,164,82,0,1022,1024,3,184,92,0,1023,1025,3,204,
		102,0,1024,1023,1,0,0,0,1024,1025,1,0,0,0,1025,1026,1,0,0,0,1026,1027,
		5,132,0,0,1027,163,1,0,0,0,1028,1035,3,168,84,0,1029,1035,3,170,85,0,1030,
		1035,3,166,83,0,1031,1035,3,174,87,0,1032,1035,3,176,88,0,1033,1035,3,
		180,90,0,1034,1028,1,0,0,0,1034,1029,1,0,0,0,1034,1030,1,0,0,0,1034,1031,
		1,0,0,0,1034,1032,1,0,0,0,1034,1033,1,0,0,0,1035,1036,1,0,0,0,1036,1034,
		1,0,0,0,1036,1037,1,0,0,0,1037,165,1,0,0,0,1038,1039,5,116,0,0,1039,1040,
		5,126,0,0,1040,1041,3,286,143,0,1041,1042,5,127,0,0,1042,1045,1,0,0,0,
		1043,1045,5,115,0,0,1044,1038,1,0,0,0,1044,1043,1,0,0,0,1045,167,1,0,0,
		0,1046,1047,7,4,0,0,1047,169,1,0,0,0,1048,1049,7,5,0,0,1049,171,1,0,0,
		0,1050,1051,7,6,0,0,1051,173,1,0,0,0,1052,1053,7,7,0,0,1053,175,1,0,0,
		0,1054,1059,5,5,0,0,1055,1059,5,33,0,0,1056,1059,5,21,0,0,1057,1059,3,
		178,89,0,1058,1054,1,0,0,0,1058,1055,1,0,0,0,1058,1056,1,0,0,0,1058,1057,
		1,0,0,0,1059,177,1,0,0,0,1060,1061,7,8,0,0,1061,179,1,0,0,0,1062,1080,
		5,32,0,0,1063,1080,5,4,0,0,1064,1080,5,23,0,0,1065,1080,5,18,0,0,1066,
		1080,5,19,0,0,1067,1080,5,13,0,0,1068,1080,5,9,0,0,1069,1080,5,24,0,0,
		1070,1080,5,31,0,0,1071,1080,3,182,91,0,1072,1080,3,14,7,0,1073,1080,3,
		160,80,0,1074,1080,3,188,94,0,1075,1077,3,286,143,0,1076,1078,3,202,101,
		0,1077,1076,1,0,0,0,1077,1078,1,0,0,0,1078,1080,1,0,0,0,1079,1062,1,0,
		0,0,1079,1063,1,0,0,0,1079,1064,1,0,0,0,1079,1065,1,0,0,0,1079,1066,1,
		0,0,0,1079,1067,1,0,0,0,1079,1068,1,0,0,0,1079,1069,1,0,0,0,1079,1070,
		1,0,0,0,1079,1071,1,0,0,0,1079,1072,1,0,0,0,1079,1073,1,0,0,0,1079,1074,
		1,0,0,0,1079,1075,1,0,0,0,1080,181,1,0,0,0,1081,1082,5,95,0,0,1082,1083,
		5,126,0,0,1083,1084,3,258,129,0,1084,1085,5,127,0,0,1085,183,1,0,0,0,1086,
		1091,3,186,93,0,1087,1088,5,133,0,0,1088,1090,3,186,93,0,1089,1087,1,0,
		0,0,1090,1093,1,0,0,0,1091,1089,1,0,0,0,1091,1092,1,0,0,0,1092,185,1,0,
		0,0,1093,1091,1,0,0,0,1094,1101,3,222,111,0,1095,1097,3,222,111,0,1096,
		1095,1,0,0,0,1096,1097,1,0,0,0,1097,1098,1,0,0,0,1098,1099,5,143,0,0,1099,
		1101,3,282,141,0,1100,1094,1,0,0,0,1100,1096,1,0,0,0,1101,187,1,0,0,0,
		1102,1108,5,11,0,0,1103,1105,3,286,143,0,1104,1103,1,0,0,0,1104,1105,1,
		0,0,0,1105,1106,1,0,0,0,1106,1107,5,143,0,0,1107,1109,3,212,106,0,1108,
		1104,1,0,0,0,1108,1109,1,0,0,0,1109,1121,1,0,0,0,1110,1115,3,286,143,0,
		1111,1112,5,128,0,0,1112,1113,3,190,95,0,1113,1114,5,129,0,0,1114,1116,
		1,0,0,0,1115,1111,1,0,0,0,1115,1116,1,0,0,0,1116,1122,1,0,0,0,1117,1118,
		5,128,0,0,1118,1119,3,190,95,0,1119,1120,5,129,0,0,1120,1122,1,0,0,0,1121,
		1110,1,0,0,0,1121,1117,1,0,0,0,1122,1134,1,0,0,0,1123,1124,7,9,0,0,1124,
		1125,5,126,0,0,1125,1126,3,212,106,0,1126,1127,5,133,0,0,1127,1128,3,286,
		143,0,1128,1129,5,127,0,0,1129,1130,5,128,0,0,1130,1131,3,190,95,0,1131,
		1132,5,129,0,0,1132,1134,1,0,0,0,1133,1102,1,0,0,0,1133,1123,1,0,0,0,1134,
		189,1,0,0,0,1135,1140,3,192,96,0,1136,1137,5,133,0,0,1137,1139,3,192,96,
		0,1138,1136,1,0,0,0,1139,1142,1,0,0,0,1140,1138,1,0,0,0,1140,1141,1,0,
		0,0,1141,1144,1,0,0,0,1142,1140,1,0,0,0,1143,1145,5,133,0,0,1144,1143,
		1,0,0,0,1144,1145,1,0,0,0,1145,191,1,0,0,0,1146,1149,3,194,97,0,1147,1148,
		5,137,0,0,1148,1150,3,258,129,0,1149,1147,1,0,0,0,1149,1150,1,0,0,0,1150,
		193,1,0,0,0,1151,1154,3,286,143,0,1152,1154,5,7,0,0,1153,1151,1,0,0,0,
		1153,1152,1,0,0,0,1154,195,1,0,0,0,1155,1161,3,286,143,0,1156,1157,5,126,
		0,0,1157,1158,3,222,111,0,1158,1159,5,127,0,0,1159,1161,1,0,0,0,1160,1155,
		1,0,0,0,1160,1156,1,0,0,0,1161,1165,1,0,0,0,1162,1164,3,198,99,0,1163,
		1162,1,0,0,0,1164,1167,1,0,0,0,1165,1163,1,0,0,0,1165,1166,1,0,0,0,1166,
		1179,1,0,0,0,1167,1165,1,0,0,0,1168,1169,5,126,0,0,1169,1171,5,158,0,0,
		1170,1172,3,170,85,0,1171,1170,1,0,0,0,1171,1172,1,0,0,0,1172,1174,1,0,
		0,0,1173,1175,3,286,143,0,1174,1173,1,0,0,0,1174,1175,1,0,0,0,1175,1176,
		1,0,0,0,1176,1177,5,127,0,0,1177,1179,3,84,42,0,1178,1160,1,0,0,0,1178,
		1168,1,0,0,0,1179,197,1,0,0,0,1180,1182,5,130,0,0,1181,1183,3,266,133,
		0,1182,1181,1,0,0,0,1182,1183,1,0,0,0,1183,1184,1,0,0,0,1184,1185,5,131,
		0,0,1185,199,1,0,0,0,1186,1189,3,218,109,0,1187,1188,5,133,0,0,1188,1190,
		5,170,0,0,1189,1187,1,0,0,0,1189,1190,1,0,0,0,1190,201,1,0,0,0,1191,1193,
		5,154,0,0,1192,1194,3,152,76,0,1193,1192,1,0,0,0,1193,1194,1,0,0,0,1194,
		1196,1,0,0,0,1195,1197,3,202,101,0,1196,1195,1,0,0,0,1196,1197,1,0,0,0,
		1197,203,1,0,0,0,1198,1210,3,286,143,0,1199,1200,5,126,0,0,1200,1205,3,
		280,140,0,1201,1202,5,133,0,0,1202,1204,3,280,140,0,1203,1201,1,0,0,0,
		1204,1207,1,0,0,0,1205,1203,1,0,0,0,1205,1206,1,0,0,0,1206,1208,1,0,0,
		0,1207,1205,1,0,0,0,1208,1209,5,127,0,0,1209,1211,1,0,0,0,1210,1199,1,
		0,0,0,1210,1211,1,0,0,0,1211,205,1,0,0,0,1212,1217,5,128,0,0,1213,1215,
		3,256,128,0,1214,1216,5,133,0,0,1215,1214,1,0,0,0,1215,1216,1,0,0,0,1216,
		1218,1,0,0,0,1217,1213,1,0,0,0,1217,1218,1,0,0,0,1218,1219,1,0,0,0,1219,
		1220,5,129,0,0,1220,207,1,0,0,0,1221,1235,5,128,0,0,1222,1223,5,134,0,
		0,1223,1229,3,258,129,0,1224,1225,5,133,0,0,1225,1226,5,134,0,0,1226,1228,
		3,258,129,0,1227,1224,1,0,0,0,1228,1231,1,0,0,0,1229,1227,1,0,0,0,1229,
		1230,1,0,0,0,1230,1233,1,0,0,0,1231,1229,1,0,0,0,1232,1234,5,133,0,0,1233,
		1232,1,0,0,0,1233,1234,1,0,0,0,1234,1236,1,0,0,0,1235,1222,1,0,0,0,1235,
		1236,1,0,0,0,1236,1237,1,0,0,0,1237,1238,5,129,0,0,1238,209,1,0,0,0,1239,
		1244,3,264,132,0,1240,1241,5,133,0,0,1241,1243,3,264,132,0,1242,1240,1,
		0,0,0,1243,1246,1,0,0,0,1244,1242,1,0,0,0,1244,1245,1,0,0,0,1245,1248,
		1,0,0,0,1246,1244,1,0,0,0,1247,1249,5,133,0,0,1248,1247,1,0,0,0,1248,1249,
		1,0,0,0,1249,211,1,0,0,0,1250,1252,3,164,82,0,1251,1253,3,214,107,0,1252,
		1251,1,0,0,0,1252,1253,1,0,0,0,1253,1256,1,0,0,0,1254,1256,3,70,35,0,1255,
		1250,1,0,0,0,1255,1254,1,0,0,0,1256,213,1,0,0,0,1257,1259,3,202,101,0,
		1258,1260,3,214,107,0,1259,1258,1,0,0,0,1259,1260,1,0,0,0,1260,1281,1,
		0,0,0,1261,1263,5,126,0,0,1262,1264,3,214,107,0,1263,1262,1,0,0,0,1263,
		1264,1,0,0,0,1264,1265,1,0,0,0,1265,1267,5,127,0,0,1266,1268,3,216,108,
		0,1267,1266,1,0,0,0,1268,1269,1,0,0,0,1269,1267,1,0,0,0,1269,1270,1,0,
		0,0,1270,1281,1,0,0,0,1271,1273,5,130,0,0,1272,1274,3,266,133,0,1273,1272,
		1,0,0,0,1273,1274,1,0,0,0,1274,1275,1,0,0,0,1275,1277,5,131,0,0,1276,1271,
		1,0,0,0,1277,1278,1,0,0,0,1278,1276,1,0,0,0,1278,1279,1,0,0,0,1279,1281,
		1,0,0,0,1280,1257,1,0,0,0,1280,1261,1,0,0,0,1280,1276,1,0,0,0,1281,215,
		1,0,0,0,1282,1284,5,130,0,0,1283,1285,3,266,133,0,1284,1283,1,0,0,0,1284,
		1285,1,0,0,0,1285,1286,1,0,0,0,1286,1293,5,131,0,0,1287,1289,5,126,0,0,
		1288,1290,3,218,109,0,1289,1288,1,0,0,0,1289,1290,1,0,0,0,1290,1291,1,
		0,0,0,1291,1293,5,127,0,0,1292,1282,1,0,0,0,1292,1287,1,0,0,0,1293,217,
		1,0,0,0,1294,1299,3,220,110,0,1295,1296,5,133,0,0,1296,1298,3,220,110,
		0,1297,1295,1,0,0,0,1298,1301,1,0,0,0,1299,1297,1,0,0,0,1299,1300,1,0,
		0,0,1300,219,1,0,0,0,1301,1299,1,0,0,0,1302,1303,3,152,76,0,1303,1304,
		3,222,111,0,1304,1307,1,0,0,0,1305,1307,5,32,0,0,1306,1302,1,0,0,0,1306,
		1305,1,0,0,0,1307,221,1,0,0,0,1308,1310,3,202,101,0,1309,1308,1,0,0,0,
		1309,1310,1,0,0,0,1310,1311,1,0,0,0,1311,1312,3,196,98,0,1312,223,1,0,
		0,0,1313,1315,3,226,113,0,1314,1316,5,132,0,0,1315,1314,1,0,0,0,1315,1316,
		1,0,0,0,1316,1355,1,0,0,0,1317,1319,3,230,115,0,1318,1320,5,132,0,0,1319,
		1318,1,0,0,0,1319,1320,1,0,0,0,1320,1355,1,0,0,0,1321,1323,3,232,116,0,
		1322,1324,5,132,0,0,1323,1322,1,0,0,0,1323,1324,1,0,0,0,1324,1355,1,0,
		0,0,1325,1327,3,242,121,0,1326,1328,5,132,0,0,1327,1326,1,0,0,0,1327,1328,
		1,0,0,0,1328,1355,1,0,0,0,1329,1331,3,254,127,0,1330,1332,5,132,0,0,1331,
		1330,1,0,0,0,1331,1332,1,0,0,0,1332,1355,1,0,0,0,1333,1335,3,116,58,0,
		1334,1336,5,132,0,0,1335,1334,1,0,0,0,1335,1336,1,0,0,0,1336,1355,1,0,
		0,0,1337,1339,3,118,59,0,1338,1340,5,132,0,0,1339,1338,1,0,0,0,1339,1340,
		1,0,0,0,1340,1355,1,0,0,0,1341,1343,3,110,55,0,1342,1344,5,132,0,0,1343,
		1342,1,0,0,0,1343,1344,1,0,0,0,1344,1355,1,0,0,0,1345,1347,3,112,56,0,
		1346,1348,5,132,0,0,1347,1346,1,0,0,0,1347,1348,1,0,0,0,1348,1355,1,0,
		0,0,1349,1351,3,256,128,0,1350,1352,5,132,0,0,1351,1350,1,0,0,0,1351,1352,
		1,0,0,0,1352,1355,1,0,0,0,1353,1355,5,132,0,0,1354,1313,1,0,0,0,1354,1317,
		1,0,0,0,1354,1321,1,0,0,0,1354,1325,1,0,0,0,1354,1329,1,0,0,0,1354,1333,
		1,0,0,0,1354,1337,1,0,0,0,1354,1341,1,0,0,0,1354,1345,1,0,0,0,1354,1349,
		1,0,0,0,1354,1353,1,0,0,0,1355,225,1,0,0,0,1356,1357,3,286,143,0,1357,
		1358,5,143,0,0,1358,1359,3,224,112,0,1359,227,1,0,0,0,1360,1363,3,266,
		133,0,1361,1362,5,170,0,0,1362,1364,3,266,133,0,1363,1361,1,0,0,0,1363,
		1364,1,0,0,0,1364,229,1,0,0,0,1365,1370,5,128,0,0,1366,1369,3,138,69,0,
		1367,1369,3,224,112,0,1368,1366,1,0,0,0,1368,1367,1,0,0,0,1369,1372,1,
		0,0,0,1370,1368,1,0,0,0,1370,1371,1,0,0,0,1371,1373,1,0,0,0,1372,1370,
		1,0,0,0,1373,1374,5,129,0,0,1374,231,1,0,0,0,1375,1376,5,16,0,0,1376,1377,
		5,126,0,0,1377,1378,3,258,129,0,1378,1379,5,127,0,0,1379,1382,3,224,112,
		0,1380,1381,5,10,0,0,1381,1383,3,224,112,0,1382,1380,1,0,0,0,1382,1383,
		1,0,0,0,1383,1386,1,0,0,0,1384,1386,3,234,117,0,1385,1375,1,0,0,0,1385,
		1384,1,0,0,0,1386,233,1,0,0,0,1387,1388,5,28,0,0,1388,1389,5,126,0,0,1389,
		1390,3,258,129,0,1390,1391,5,127,0,0,1391,1392,3,236,118,0,1392,235,1,
		0,0,0,1393,1397,5,128,0,0,1394,1396,3,238,119,0,1395,1394,1,0,0,0,1396,
		1399,1,0,0,0,1397,1395,1,0,0,0,1397,1398,1,0,0,0,1398,1400,1,0,0,0,1399,
		1397,1,0,0,0,1400,1401,5,129,0,0,1401,237,1,0,0,0,1402,1404,3,240,120,
		0,1403,1402,1,0,0,0,1404,1405,1,0,0,0,1405,1403,1,0,0,0,1405,1406,1,0,
		0,0,1406,1408,1,0,0,0,1407,1409,3,224,112,0,1408,1407,1,0,0,0,1409,1410,
		1,0,0,0,1410,1408,1,0,0,0,1410,1411,1,0,0,0,1411,239,1,0,0,0,1412,1418,
		5,3,0,0,1413,1419,3,228,114,0,1414,1415,5,126,0,0,1415,1416,3,228,114,
		0,1416,1417,5,127,0,0,1417,1419,1,0,0,0,1418,1413,1,0,0,0,1418,1414,1,
		0,0,0,1419,1420,1,0,0,0,1420,1421,5,143,0,0,1421,1425,1,0,0,0,1422,1423,
		5,7,0,0,1423,1425,5,143,0,0,1424,1412,1,0,0,0,1424,1422,1,0,0,0,1425,241,
		1,0,0,0,1426,1431,3,244,122,0,1427,1431,3,246,123,0,1428,1431,3,248,124,
		0,1429,1431,3,252,126,0,1430,1426,1,0,0,0,1430,1427,1,0,0,0,1430,1428,
		1,0,0,0,1430,1429,1,0,0,0,1431,243,1,0,0,0,1432,1433,5,34,0,0,1433,1434,
		5,126,0,0,1434,1435,3,258,129,0,1435,1436,5,127,0,0,1436,1437,3,224,112,
		0,1437,245,1,0,0,0,1438,1439,5,8,0,0,1439,1440,3,224,112,0,1440,1441,5,
		34,0,0,1441,1442,5,126,0,0,1442,1443,3,258,129,0,1443,1444,5,127,0,0,1444,
		1445,5,132,0,0,1445,247,1,0,0,0,1446,1447,5,14,0,0,1447,1449,5,126,0,0,
		1448,1450,3,250,125,0,1449,1448,1,0,0,0,1449,1450,1,0,0,0,1450,1451,1,
		0,0,0,1451,1453,5,132,0,0,1452,1454,3,258,129,0,1453,1452,1,0,0,0,1453,
		1454,1,0,0,0,1454,1455,1,0,0,0,1455,1457,5,132,0,0,1456,1458,3,256,128,
		0,1457,1456,1,0,0,0,1457,1458,1,0,0,0,1458,1459,1,0,0,0,1459,1460,5,127,
		0,0,1460,1461,3,224,112,0,1461,249,1,0,0,0,1462,1463,3,152,76,0,1463,1464,
		3,156,78,0,1464,1467,1,0,0,0,1465,1467,3,256,128,0,1466,1462,1,0,0,0,1466,
		1465,1,0,0,0,1467,251,1,0,0,0,1468,1469,5,14,0,0,1469,1470,5,126,0,0,1470,
		1471,3,108,54,0,1471,1473,5,46,0,0,1472,1474,3,258,129,0,1473,1472,1,0,
		0,0,1473,1474,1,0,0,0,1474,1475,1,0,0,0,1475,1476,5,127,0,0,1476,1477,
		3,224,112,0,1477,253,1,0,0,0,1478,1479,5,15,0,0,1479,1487,3,286,143,0,
		1480,1487,5,6,0,0,1481,1487,5,2,0,0,1482,1484,5,22,0,0,1483,1485,3,258,
		129,0,1484,1483,1,0,0,0,1484,1485,1,0,0,0,1485,1487,1,0,0,0,1486,1478,
		1,0,0,0,1486,1480,1,0,0,0,1486,1481,1,0,0,0,1486,1482,1,0,0,0,1487,255,
		1,0,0,0,1488,1493,3,258,129,0,1489,1490,5,133,0,0,1490,1492,3,258,129,
		0,1491,1489,1,0,0,0,1492,1495,1,0,0,0,1493,1491,1,0,0,0,1493,1494,1,0,
		0,0,1494,257,1,0,0,0,1495,1493,1,0,0,0,1496,1497,6,129,-1,0,1497,1507,
		3,262,131,0,1498,1499,5,126,0,0,1499,1500,3,230,115,0,1500,1501,5,127,
		0,0,1501,1507,1,0,0,0,1502,1503,3,268,134,0,1503,1504,3,260,130,0,1504,
		1505,3,258,129,1,1505,1507,1,0,0,0,1506,1496,1,0,0,0,1506,1498,1,0,0,0,
		1506,1502,1,0,0,0,1507,1552,1,0,0,0,1508,1509,10,13,0,0,1509,1510,7,10,
		0,0,1510,1551,3,258,129,14,1511,1512,10,12,0,0,1512,1513,7,11,0,0,1513,
		1551,3,258,129,13,1514,1519,10,11,0,0,1515,1516,5,139,0,0,1516,1520,5,
		139,0,0,1517,1518,5,138,0,0,1518,1520,5,138,0,0,1519,1515,1,0,0,0,1519,
		1517,1,0,0,0,1520,1521,1,0,0,0,1521,1551,3,258,129,12,1522,1523,10,10,
		0,0,1523,1524,7,12,0,0,1524,1551,3,258,129,11,1525,1526,10,9,0,0,1526,
		1527,7,13,0,0,1527,1551,3,258,129,10,1528,1529,10,8,0,0,1529,1530,5,156,
		0,0,1530,1551,3,258,129,9,1531,1532,10,7,0,0,1532,1533,5,158,0,0,1533,
		1551,3,258,129,8,1534,1535,10,6,0,0,1535,1536,5,157,0,0,1536,1551,3,258,
		129,7,1537,1538,10,5,0,0,1538,1539,5,148,0,0,1539,1551,3,258,129,6,1540,
		1541,10,4,0,0,1541,1542,5,149,0,0,1542,1551,3,258,129,5,1543,1544,10,3,
		0,0,1544,1546,5,142,0,0,1545,1547,3,258,129,0,1546,1545,1,0,0,0,1546,1547,
		1,0,0,0,1547,1548,1,0,0,0,1548,1549,5,143,0,0,1549,1551,3,258,129,4,1550,
		1508,1,0,0,0,1550,1511,1,0,0,0,1550,1514,1,0,0,0,1550,1522,1,0,0,0,1550,
		1525,1,0,0,0,1550,1528,1,0,0,0,1550,1531,1,0,0,0,1550,1534,1,0,0,0,1550,
		1537,1,0,0,0,1550,1540,1,0,0,0,1550,1543,1,0,0,0,1551,1554,1,0,0,0,1552,
		1550,1,0,0,0,1552,1553,1,0,0,0,1553,259,1,0,0,0,1554,1552,1,0,0,0,1555,
		1556,7,14,0,0,1556,261,1,0,0,0,1557,1567,3,268,134,0,1558,1559,5,126,0,
		0,1559,1560,3,212,106,0,1560,1561,5,127,0,0,1561,1564,1,0,0,0,1562,1565,
		3,262,131,0,1563,1565,3,264,132,0,1564,1562,1,0,0,0,1564,1563,1,0,0,0,
		1565,1567,1,0,0,0,1566,1557,1,0,0,0,1566,1558,1,0,0,0,1567,263,1,0,0,0,
		1568,1572,3,258,129,0,1569,1572,3,206,103,0,1570,1572,3,208,104,0,1571,
		1568,1,0,0,0,1571,1569,1,0,0,0,1571,1570,1,0,0,0,1572,265,1,0,0,0,1573,
		1576,3,286,143,0,1574,1576,3,282,141,0,1575,1573,1,0,0,0,1575,1574,1,0,
		0,0,1576,267,1,0,0,0,1577,1592,3,272,136,0,1578,1584,5,25,0,0,1579,1585,
		3,268,134,0,1580,1581,5,126,0,0,1581,1582,3,180,90,0,1582,1583,5,127,0,
		0,1583,1585,1,0,0,0,1584,1579,1,0,0,0,1584,1580,1,0,0,0,1585,1592,1,0,
		0,0,1586,1587,7,15,0,0,1587,1592,3,268,134,0,1588,1589,3,270,135,0,1589,
		1590,3,262,131,0,1590,1592,1,0,0,0,1591,1577,1,0,0,0,1591,1578,1,0,0,0,
		1591,1586,1,0,0,0,1591,1588,1,0,0,0,1592,269,1,0,0,0,1593,1594,7,16,0,
		0,1594,271,1,0,0,0,1595,1596,6,136,-1,0,1596,1600,3,280,140,0,1597,1599,
		3,274,137,0,1598,1597,1,0,0,0,1599,1602,1,0,0,0,1600,1598,1,0,0,0,1600,
		1601,1,0,0,0,1601,1614,1,0,0,0,1602,1600,1,0,0,0,1603,1604,10,1,0,0,1604,
		1605,7,17,0,0,1605,1609,3,286,143,0,1606,1608,3,274,137,0,1607,1606,1,
		0,0,0,1608,1611,1,0,0,0,1609,1607,1,0,0,0,1609,1610,1,0,0,0,1610,1613,
		1,0,0,0,1611,1609,1,0,0,0,1612,1603,1,0,0,0,1613,1616,1,0,0,0,1614,1612,
		1,0,0,0,1614,1615,1,0,0,0,1615,273,1,0,0,0,1616,1614,1,0,0,0,1617,1618,
		5,130,0,0,1618,1619,3,258,129,0,1619,1620,5,131,0,0,1620,1636,1,0,0,0,
		1621,1623,5,126,0,0,1622,1624,3,276,138,0,1623,1622,1,0,0,0,1623,1624,
		1,0,0,0,1624,1625,1,0,0,0,1625,1636,5,127,0,0,1626,1629,5,126,0,0,1627,
		1630,5,133,0,0,1628,1630,8,18,0,0,1629,1627,1,0,0,0,1629,1628,1,0,0,0,
		1630,1631,1,0,0,0,1631,1629,1,0,0,0,1631,1632,1,0,0,0,1632,1633,1,0,0,
		0,1633,1636,5,127,0,0,1634,1636,7,15,0,0,1635,1617,1,0,0,0,1635,1621,1,
		0,0,0,1635,1626,1,0,0,0,1635,1634,1,0,0,0,1636,275,1,0,0,0,1637,1642,3,
		278,139,0,1638,1639,5,133,0,0,1639,1641,3,278,139,0,1640,1638,1,0,0,0,
		1641,1644,1,0,0,0,1642,1640,1,0,0,0,1642,1643,1,0,0,0,1643,277,1,0,0,0,
		1644,1642,1,0,0,0,1645,1648,3,258,129,0,1646,1648,3,180,90,0,1647,1645,
		1,0,0,0,1647,1646,1,0,0,0,1648,279,1,0,0,0,1649,1665,3,286,143,0,1650,
		1665,3,282,141,0,1651,1665,3,284,142,0,1652,1653,5,126,0,0,1653,1654,3,
		258,129,0,1654,1655,5,127,0,0,1655,1665,1,0,0,0,1656,1665,3,90,45,0,1657,
		1665,3,100,50,0,1658,1665,3,104,52,0,1659,1665,3,106,53,0,1660,1665,3,
		76,38,0,1661,1665,3,80,40,0,1662,1665,3,82,41,0,1663,1665,3,88,44,0,1664,
		1649,1,0,0,0,1664,1650,1,0,0,0,1664,1651,1,0,0,0,1664,1652,1,0,0,0,1664,
		1656,1,0,0,0,1664,1657,1,0,0,0,1664,1658,1,0,0,0,1664,1659,1,0,0,0,1664,
		1660,1,0,0,0,1664,1661,1,0,0,0,1664,1662,1,0,0,0,1664,1663,1,0,0,0,1665,
		281,1,0,0,0,1666,1685,5,173,0,0,1667,1685,5,174,0,0,1668,1685,5,175,0,
		0,1669,1671,7,11,0,0,1670,1669,1,0,0,0,1670,1671,1,0,0,0,1671,1672,1,0,
		0,0,1672,1685,5,176,0,0,1673,1675,7,11,0,0,1674,1673,1,0,0,0,1674,1675,
		1,0,0,0,1675,1676,1,0,0,0,1676,1685,5,177,0,0,1677,1685,5,171,0,0,1678,
		1685,5,48,0,0,1679,1685,5,50,0,0,1680,1685,5,57,0,0,1681,1685,5,49,0,0,
		1682,1685,5,38,0,0,1683,1685,5,39,0,0,1684,1666,1,0,0,0,1684,1667,1,0,
		0,0,1684,1668,1,0,0,0,1684,1670,1,0,0,0,1684,1674,1,0,0,0,1684,1677,1,
		0,0,0,1684,1678,1,0,0,0,1684,1679,1,0,0,0,1684,1680,1,0,0,0,1684,1681,
		1,0,0,0,1684,1682,1,0,0,0,1684,1683,1,0,0,0,1685,283,1,0,0,0,1686,1690,
		5,172,0,0,1687,1689,7,19,0,0,1688,1687,1,0,0,0,1689,1692,1,0,0,0,1690,
		1688,1,0,0,0,1690,1691,1,0,0,0,1691,1693,1,0,0,0,1692,1690,1,0,0,0,1693,
		1695,5,184,0,0,1694,1686,1,0,0,0,1695,1696,1,0,0,0,1696,1694,1,0,0,0,1696,
		1697,1,0,0,0,1697,285,1,0,0,0,1698,1699,7,20,0,0,1699,287,1,0,0,0,223,
		291,307,314,320,326,329,332,340,347,350,353,361,364,367,377,387,395,400,
		409,415,417,429,439,447,450,453,462,485,492,495,501,510,516,518,527,529,
		538,542,551,553,562,566,569,577,581,583,586,592,596,602,616,623,629,632,
		636,642,646,654,657,664,669,678,682,684,696,698,710,712,717,723,726,732,
		736,739,742,753,759,761,764,772,777,783,792,797,799,821,828,833,857,862,
		867,871,875,879,888,895,902,908,911,915,923,926,930,938,943,950,959,963,
		975,977,987,998,1004,1009,1015,1019,1024,1034,1036,1044,1058,1077,1079,
		1091,1096,1100,1104,1108,1115,1121,1133,1140,1144,1149,1153,1160,1165,
		1171,1174,1178,1182,1189,1193,1196,1205,1210,1215,1217,1229,1233,1235,
		1244,1248,1252,1255,1259,1263,1269,1273,1278,1280,1284,1289,1292,1299,
		1306,1309,1315,1319,1323,1327,1331,1335,1339,1343,1347,1351,1354,1363,
		1368,1370,1382,1385,1397,1405,1410,1418,1424,1430,1449,1453,1457,1466,
		1473,1484,1486,1493,1506,1519,1546,1550,1552,1564,1566,1571,1575,1584,
		1591,1600,1609,1614,1623,1629,1631,1635,1642,1647,1664,1670,1674,1684,
		1690,1696
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
// Generated from Sources/ObjcSyntax/ObjectiveCParser.g4 by ANTLR 4.13.1
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
                 NS_ENUM = 104, NS_OPTIONS = 105, NS_SWIFT_NAME = 106, NS_NOESCAPE = 107, 
                 NS_UNAVAILABLE = 108, NS_SWIFT_UNAVAILABLE = 109, API_AVAILABLE = 110, 
                 API_UNAVAILABLE = 111, ASSIGN = 112, COPY = 113, GETTER = 114, 
                 SETTER = 115, STRONG = 116, READONLY = 117, READWRITE = 118, 
                 WEAK = 119, UNSAFE_UNRETAINED = 120, IB_OUTLET = 121, IB_OUTLET_COLLECTION = 122, 
                 IB_INSPECTABLE = 123, IB_DESIGNABLE = 124, NS_ASSUME_NONNULL_BEGIN = 125, 
                 NS_ASSUME_NONNULL_END = 126, EXTERN_SUFFIX = 127, IOS_SUFFIX = 128, 
                 MAC_SUFFIX = 129, TVOS_PROHIBITED = 130, IDENTIFIER = 131, 
                 LP = 132, RP = 133, LBRACE = 134, RBRACE = 135, LBRACK = 136, 
                 RBRACK = 137, SEMI = 138, COMMA = 139, DOT = 140, STRUCTACCESS = 141, 
                 AT = 142, UNDERSCORE = 143, ASSIGNMENT = 144, GT = 145, 
                 LT = 146, BANG = 147, TILDE = 148, QUESTION = 149, COLON = 150, 
                 EQUAL = 151, LE = 152, GE = 153, NOTEQUAL = 154, AND = 155, 
                 OR = 156, INC = 157, DEC = 158, ADD = 159, SUB = 160, MUL = 161, 
                 DIV = 162, BITAND = 163, BITOR = 164, BITXOR = 165, MOD = 166, 
                 ADD_ASSIGN = 167, SUB_ASSIGN = 168, MUL_ASSIGN = 169, DIV_ASSIGN = 170, 
                 AND_ASSIGN = 171, OR_ASSIGN = 172, XOR_ASSIGN = 173, MOD_ASSIGN = 174, 
                 LSHIFT_ASSIGN = 175, RSHIFT_ASSIGN = 176, ELIPSIS = 177, 
                 CHARACTER_LITERAL = 178, STRING_START = 179, HEX_LITERAL = 180, 
                 OCTAL_LITERAL = 181, BINARY_LITERAL = 182, DECIMAL_LITERAL = 183, 
                 FLOATING_POINT_LITERAL = 184, WS = 185, MULTI_COMMENT = 186, 
                 SINGLE_COMMENT = 187, BACKSLASH = 188, SHARP = 189, STRING_NEWLINE = 190, 
                 STRING_END = 191, STRING_VALUE = 192, DIRECTIVE_IMPORT = 193, 
                 DIRECTIVE_INCLUDE = 194, DIRECTIVE_PRAGMA = 195, DIRECTIVE_DEFINE = 196, 
                 DIRECTIVE_DEFINED = 197, DIRECTIVE_IF = 198, DIRECTIVE_ELIF = 199, 
                 DIRECTIVE_ELSE = 200, DIRECTIVE_UNDEF = 201, DIRECTIVE_IFDEF = 202, 
                 DIRECTIVE_IFNDEF = 203, DIRECTIVE_ENDIF = 204, DIRECTIVE_TRUE = 205, 
                 DIRECTIVE_FALSE = 206, DIRECTIVE_ERROR = 207, DIRECTIVE_WARNING = 208, 
                 DIRECTIVE_BANG = 209, DIRECTIVE_LP = 210, DIRECTIVE_RP = 211, 
                 DIRECTIVE_EQUAL = 212, DIRECTIVE_NOTEQUAL = 213, DIRECTIVE_AND = 214, 
                 DIRECTIVE_OR = 215, DIRECTIVE_LT = 216, DIRECTIVE_GT = 217, 
                 DIRECTIVE_LE = 218, DIRECTIVE_GE = 219, DIRECTIVE_STRING = 220, 
                 DIRECTIVE_ID = 221, DIRECTIVE_DECIMAL_LITERAL = 222, DIRECTIVE_FLOAT = 223, 
                 DIRECTIVE_NEWLINE = 224, DIRECTIVE_MULTI_COMMENT = 225, 
                 DIRECTIVE_SINGLE_COMMENT = 226, DIRECTIVE_BACKSLASH_NEWLINE = 227, 
                 DIRECTIVE_TEXT_NEWLINE = 228, DIRECTIVE_TEXT = 229
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
            RULE_macro = 102, RULE_swiftSelectorExpression = 103, RULE_swiftSelector = 104, 
            RULE_apiAvailableOsVersion = 105, RULE_version = 106, RULE_arrayInitializer = 107, 
            RULE_structInitializer = 108, RULE_initializerList = 109, RULE_typeName = 110, 
            RULE_abstractDeclarator = 111, RULE_abstractDeclaratorSuffix = 112, 
            RULE_parameterDeclarationList = 113, RULE_parameterDeclaration = 114, 
            RULE_declarator = 115, RULE_statement = 116, RULE_labeledStatement = 117, 
            RULE_rangeExpression = 118, RULE_compoundStatement = 119, RULE_selectionStatement = 120, 
            RULE_switchStatement = 121, RULE_switchBlock = 122, RULE_switchSection = 123, 
            RULE_switchLabel = 124, RULE_iterationStatement = 125, RULE_whileStatement = 126, 
            RULE_doStatement = 127, RULE_forStatement = 128, RULE_forLoopInitializer = 129, 
            RULE_forInStatement = 130, RULE_jumpStatement = 131, RULE_expressions = 132, 
            RULE_expression = 133, RULE_assignmentOperator = 134, RULE_castExpression = 135, 
            RULE_initializer = 136, RULE_constantExpression = 137, RULE_unaryExpression = 138, 
            RULE_unaryOperator = 139, RULE_postfixExpression = 140, RULE_postfix = 141, 
            RULE_argumentExpressionList = 142, RULE_argumentExpression = 143, 
            RULE_primaryExpression = 144, RULE_constant = 145, RULE_stringLiteral = 146, 
            RULE_identifier = 147

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
		"swiftSelectorExpression", "swiftSelector", "apiAvailableOsVersion", "version", 
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
		"'NS_SWIFT_NAME'", "'NS_NOESCAPE'", "'NS_UNAVAILABLE'", "'NS_SWIFT_UNAVAILABLE'", 
		"'API_AVAILABLE'", "'API_UNAVAILABLE'", "'assign'", "'copy'", "'getter'", 
		"'setter'", "'strong'", "'readonly'", "'readwrite'", "'weak'", "'unsafe_unretained'", 
		"'IBOutlet'", "'IBOutletCollection'", "'IBInspectable'", "'IB_DESIGNABLE'", 
		nil, nil, nil, nil, nil, "'__TVOS_PROHIBITED'", nil, nil, nil, "'{'", 
		"'}'", "'['", "']'", "';'", "','", "'.'", "'->'", "'@'", "'_'", "'='", 
		nil, nil, nil, "'~'", "'?'", "':'", nil, nil, nil, nil, nil, nil, "'++'", 
		"'--'", "'+'", "'-'", "'*'", "'/'", "'&'", "'|'", "'^'", "'%'", "'+='", 
		"'-='", "'*='", "'/='", "'&='", "'|='", "'^='", "'%='", "'<<='", "'>>='", 
		"'...'", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "'\\'", nil, 
		nil, nil, nil, nil, nil, nil, nil, "'defined'", nil, "'elif'", nil, "'undef'", 
		"'ifdef'", "'ifndef'", "'endif'"
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
		"NS_INLINE", "NS_ENUM", "NS_OPTIONS", "NS_SWIFT_NAME", "NS_NOESCAPE", 
		"NS_UNAVAILABLE", "NS_SWIFT_UNAVAILABLE", "API_AVAILABLE", "API_UNAVAILABLE", 
		"ASSIGN", "COPY", "GETTER", "SETTER", "STRONG", "READONLY", "READWRITE", 
		"WEAK", "UNSAFE_UNRETAINED", "IB_OUTLET", "IB_OUTLET_COLLECTION", "IB_INSPECTABLE", 
		"IB_DESIGNABLE", "NS_ASSUME_NONNULL_BEGIN", "NS_ASSUME_NONNULL_END", "EXTERN_SUFFIX", 
		"IOS_SUFFIX", "MAC_SUFFIX", "TVOS_PROHIBITED", "IDENTIFIER", "LP", "RP", 
		"LBRACE", "RBRACE", "LBRACK", "RBRACK", "SEMI", "COMMA", "DOT", "STRUCTACCESS", 
		"AT", "UNDERSCORE", "ASSIGNMENT", "GT", "LT", "BANG", "TILDE", "QUESTION", 
		"COLON", "EQUAL", "LE", "GE", "NOTEQUAL", "AND", "OR", "INC", "DEC", "ADD", 
		"SUB", "MUL", "DIV", "BITAND", "BITOR", "BITXOR", "MOD", "ADD_ASSIGN", 
		"SUB_ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", 
		"MOD_ASSIGN", "LSHIFT_ASSIGN", "RSHIFT_ASSIGN", "ELIPSIS", "CHARACTER_LITERAL", 
		"STRING_START", "HEX_LITERAL", "OCTAL_LITERAL", "BINARY_LITERAL", "DECIMAL_LITERAL", 
		"FLOATING_POINT_LITERAL", "WS", "MULTI_COMMENT", "SINGLE_COMMENT", "BACKSLASH", 
		"SHARP", "STRING_NEWLINE", "STRING_END", "STRING_VALUE", "DIRECTIVE_IMPORT", 
		"DIRECTIVE_INCLUDE", "DIRECTIVE_PRAGMA", "DIRECTIVE_DEFINE", "DIRECTIVE_DEFINED", 
		"DIRECTIVE_IF", "DIRECTIVE_ELIF", "DIRECTIVE_ELSE", "DIRECTIVE_UNDEF", 
		"DIRECTIVE_IFDEF", "DIRECTIVE_IFNDEF", "DIRECTIVE_ENDIF", "DIRECTIVE_TRUE", 
		"DIRECTIVE_FALSE", "DIRECTIVE_ERROR", "DIRECTIVE_WARNING", "DIRECTIVE_BANG", 
		"DIRECTIVE_LP", "DIRECTIVE_RP", "DIRECTIVE_EQUAL", "DIRECTIVE_NOTEQUAL", 
		"DIRECTIVE_AND", "DIRECTIVE_OR", "DIRECTIVE_LT", "DIRECTIVE_GT", "DIRECTIVE_LE", 
		"DIRECTIVE_GE", "DIRECTIVE_STRING", "DIRECTIVE_ID", "DIRECTIVE_DECIMAL_LITERAL", 
		"DIRECTIVE_FLOAT", "DIRECTIVE_NEWLINE", "DIRECTIVE_MULTI_COMMENT", "DIRECTIVE_SINGLE_COMMENT", 
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
		 	setState(299)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1295065285207669298) != 0) || ((Int64((_la - 65)) & ~0x3f) == 0 && ((Int64(1) << (_la - 65)) & 1152908310467248151) != 0) || _la == ObjectiveCParser.Tokens.IDENTIFIER.rawValue) {
		 		setState(296)
		 		try topLevelDeclaration()


		 		setState(301)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(302)
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
		 	setState(315)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(304)
		 		try importDeclaration()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(305)
		 		try functionDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(306)
		 		try declaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(307)
		 		try classInterface()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(308)
		 		try classImplementation()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(309)
		 		try categoryInterface()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(310)
		 		try categoryImplementation()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(311)
		 		try protocolDeclaration()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(312)
		 		try protocolDeclarationList()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(313)
		 		try classDeclarationList()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(314)
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
		 	setState(317)
		 	try match(ObjectiveCParser.Tokens.IMPORT.rawValue)
		 	setState(318)
		 	try identifier()
		 	setState(319)
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
		 	setState(322)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue) {
		 		setState(321)
		 		try match(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue)

		 	}

		 	setState(324)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(325)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(328)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(326)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(327)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassInterfaceContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(334)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(330)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(331)
		 		try protocolList()
		 		setState(332)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(337)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(336)
		 		try instanceVariables()

		 	}

		 	setState(340)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 585466886406274561) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(339)
		 		try interfaceDeclarationList()

		 	}

		 	setState(342)
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
		 	setState(344)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(345)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(346)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(348)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 		setState(347)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(CategoryInterfaceContext.self).categoryName = assignmentValue
		 		     }()


		 	}

		 	setState(350)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(355)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(351)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(352)
		 		try protocolList()
		 		setState(353)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(358)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(357)
		 		try instanceVariables()

		 	}

		 	setState(361)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 585466886406274561) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(360)
		 		try interfaceDeclarationList()

		 	}

		 	setState(363)
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
		 	setState(365)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(366)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(369)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(367)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(368)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassImplementationContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(372)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(371)
		 		try instanceVariables()

		 	}

		 	setState(375)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 9147920100098041) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(374)
		 		try implementationDefinitionList()

		 	}

		 	setState(377)
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
		 	setState(379)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(380)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(381)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(382)
		 	try {
		 			let assignmentValue = try identifier()
		 			_localctx.castdown(CategoryImplementationContext.self).categoryName = assignmentValue
		 	     }()

		 	setState(383)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(385)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 9147920100098041) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(384)
		 		try implementationDefinitionList()

		 	}

		 	setState(387)
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
		 	setState(389)
		 	try identifier()
		 	setState(395)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,15,_ctx)) {
		 	case 1:
		 		setState(390)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(391)
		 		try protocolList()
		 		setState(392)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)


		 		break
		 	case 2:
		 		setState(394)
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
			func macro() -> MacroContext? {
				return getRuleContext(MacroContext.self, 0)
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
		 	setState(398)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143491891371959) != 0)) {
		 		setState(397)
		 		try macro()

		 	}

		 	setState(400)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(401)
		 	try protocolName()
		 	setState(406)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(402)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(403)
		 		try protocolList()
		 		setState(404)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(411)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 70)) & ~0x3f) == 0 && ((Int64(1) << (_la - 70)) & 2341867545625098277) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(408)
		 		try protocolDeclarationSection()


		 		setState(413)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(414)
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
		 	setState(428)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .OPTIONAL:fallthrough
		 	case .REQUIRED:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(416)
		 		_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.OPTIONAL.rawValue || _la == ObjectiveCParser.Tokens.REQUIRED.rawValue)) {
		 			_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(420)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(417)
		 				try interfaceDeclarationList()

		 		 
		 			}
		 			setState(422)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(424); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(423)
		 				try interfaceDeclarationList()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(426); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,20,_ctx)
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
		 	setState(430)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(431)
		 	try protocolList()
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
		 	setState(434)
		 	try match(ObjectiveCParser.Tokens.CLASS.rawValue)
		 	setState(435)
		 	try identifier()
		 	setState(440)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(436)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(437)
		 		try identifier()


		 		setState(442)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(443)
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
		 	setState(445)
		 	try protocolName()
		 	setState(450)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(446)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(447)
		 		try protocolName()


		 		setState(452)
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
		 	setState(453)
		 	try match(ObjectiveCParser.Tokens.PROPERTY.rawValue)
		 	setState(458)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(454)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(455)
		 		try propertyAttributesList()
		 		setState(456)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	}

		 	setState(461)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,25,_ctx)) {
		 	case 1:
		 		setState(460)
		 		try ibOutletQualifier()

		 		break
		 	default: break
		 	}
		 	setState(464)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,26,_ctx)) {
		 	case 1:
		 		setState(463)
		 		try match(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(466)
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
		 	setState(468)
		 	try propertyAttribute()
		 	setState(473)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(469)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(470)
		 		try propertyAttribute()


		 		setState(475)
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
		 	setState(496)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,28, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(476)
		 		try match(ObjectiveCParser.Tokens.ATOMIC.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(477)
		 		try match(ObjectiveCParser.Tokens.NONATOMIC.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(478)
		 		try match(ObjectiveCParser.Tokens.STRONG.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(479)
		 		try match(ObjectiveCParser.Tokens.WEAK.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(480)
		 		try match(ObjectiveCParser.Tokens.RETAIN.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(481)
		 		try match(ObjectiveCParser.Tokens.ASSIGN.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(482)
		 		try match(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(483)
		 		try match(ObjectiveCParser.Tokens.COPY.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(484)
		 		try match(ObjectiveCParser.Tokens.READONLY.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(485)
		 		try match(ObjectiveCParser.Tokens.READWRITE.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(486)
		 		try match(ObjectiveCParser.Tokens.GETTER.rawValue)
		 		setState(487)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(488)
		 		try identifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(489)
		 		try match(ObjectiveCParser.Tokens.SETTER.rawValue)
		 		setState(490)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(491)
		 		try identifier()
		 		setState(492)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(494)
		 		try nullabilitySpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(495)
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
		 	setState(506)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LT:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(498)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(499)
		 		try protocolList()
		 		setState(500)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(503)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,29,_ctx)) {
		 		case 1:
		 			setState(502)
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
		 		setState(505)
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
		 	setState(508)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(512)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 68)) & ~0x3f) == 0 && ((Int64(1) << (_la - 68)) & -9079273891209224087) != 0)) {
		 		setState(509)
		 		try visibilitySection()


		 		setState(514)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(515)
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
		 	setState(529)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PACKAGE:fallthrough
		 	case .PRIVATE:fallthrough
		 	case .PROTECTED:fallthrough
		 	case .PUBLIC:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(517)
		 		try accessModifier()
		 		setState(521)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,32,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(518)
		 				try fieldDeclaration()

		 		 
		 			}
		 			setState(523)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,32,_ctx)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(525); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(524)
		 				try fieldDeclaration()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(527); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,33,_ctx)
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
		 	setState(531)
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
		 	setState(538); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(538)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,35, _ctx)) {
		 			case 1:
		 				setState(533)
		 				try declaration()

		 				break
		 			case 2:
		 				setState(534)
		 				try classMethodDeclaration()

		 				break
		 			case 3:
		 				setState(535)
		 				try instanceMethodDeclaration()

		 				break
		 			case 4:
		 				setState(536)
		 				try propertyDeclaration()

		 				break
		 			case 5:
		 				setState(537)
		 				try functionDeclaration()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(540); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,36,_ctx)
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
		 	setState(542)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(543)
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
		 	setState(545)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(546)
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
			func macro() -> [MacroContext] {
				return getRuleContexts(MacroContext.self)
			}
			open
			func macro(_ i: Int) -> MacroContext? {
				return getRuleContext(MacroContext.self, i)
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
		 	setState(549)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(548)
		 		try methodType()

		 	}

		 	setState(551)
		 	try methodSelector()
		 	setState(555)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143491891371959) != 0)) {
		 		setState(552)
		 		try macro()


		 		setState(557)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(558)
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
		 	setState(565) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(565)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,39, _ctx)) {
		 		case 1:
		 			setState(560)
		 			try functionDefinition()

		 			break
		 		case 2:
		 			setState(561)
		 			try declaration()

		 			break
		 		case 3:
		 			setState(562)
		 			try classMethodDefinition()

		 			break
		 		case 4:
		 			setState(563)
		 			try instanceMethodDefinition()

		 			break
		 		case 5:
		 			setState(564)
		 			try propertyImplementation()

		 			break
		 		default: break
		 		}

		 		setState(567); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 9147920100098041) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)

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
		 	setState(569)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(570)
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
		 	setState(572)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(573)
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
		 	setState(576)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(575)
		 		try methodType()

		 	}

		 	setState(578)
		 	try methodSelector()
		 	setState(580)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 40)) & ~0x3f) == 0 && ((Int64(1) << (_la - 40)) & -414491694415611649) != 0) || ((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 144115188480605959) != 0)) {
		 		setState(579)
		 		try initDeclaratorList()

		 	}

		 	setState(583)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(582)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 	}

		 	setState(585)
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
		 	setState(597)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,46, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(587)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(589); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(588)
		 				try keywordDeclarator()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(591); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,44,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(595)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(593)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(594)
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
		 	setState(600)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 		setState(599)
		 		try selector()

		 	}

		 	setState(602)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(606)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(603)
		 		try methodType()


		 		setState(608)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(610)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,49,_ctx)) {
		 	case 1:
		 		setState(609)
		 		try arcBehaviourSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(612)
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
		 	setState(616)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(614)
		 		try identifier()

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(615)
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
		 	setState(618)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(619)
		 	try typeName()
		 	setState(620)
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
		 	setState(630)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .SYNTHESIZE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(622)
		 		try match(ObjectiveCParser.Tokens.SYNTHESIZE.rawValue)
		 		setState(623)
		 		try propertySynthesizeList()
		 		setState(624)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break

		 	case .DYNAMIC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(626)
		 		try match(ObjectiveCParser.Tokens.DYNAMIC.rawValue)
		 		setState(627)
		 		try propertySynthesizeList()
		 		setState(628)
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
		 	setState(632)
		 	try propertySynthesizeItem()
		 	setState(637)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(633)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(634)
		 		try propertySynthesizeItem()


		 		setState(639)
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
		 	setState(640)
		 	try identifier()
		 	setState(643)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(641)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(642)
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
			func NS_NOESCAPE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue, 0)
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
		 	setState(646)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,54,_ctx)) {
		 	case 1:
		 		setState(645)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(648)
		 	try typeSpecifier()
		 	setState(650)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(649)
		 		try nullabilitySpecifier()

		 	}

		 	setState(652)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(654)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(653)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(656)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(659)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,57,_ctx)) {
		 	case 1:
		 		setState(657)
		 		try nullabilitySpecifier()

		 		break
		 	case 2:
		 		setState(658)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(661)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(663)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(662)
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
		 	setState(665)
		 	try match(ObjectiveCParser.Tokens.LT.rawValue)
		 	setState(674)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012512247) != 0)) {
		 		setState(666)
		 		try typeSpecifierWithPrefixes()
		 		setState(671)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(667)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(668)
		 			try typeSpecifierWithPrefixes()


		 			setState(673)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(676)
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
		 	setState(686)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,62, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(681)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(678)
		 				try typePrefix()

		 		 
		 			}
		 			setState(683)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		}
		 		setState(684)
		 		try typeSpecifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(685)
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
		 	setState(688)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(689)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(701)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(690)
		 		try dictionaryPair()
		 		setState(695)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,63,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(691)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(692)
		 				try dictionaryPair()

		 		 
		 			}
		 			setState(697)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,63,_ctx)
		 		}
		 		setState(699)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(698)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(703)
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
		 	setState(705)
		 	try castExpression()
		 	setState(706)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(707)
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
		 	setState(709)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(710)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(715)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(711)
		 		try expressions()
		 		setState(713)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(712)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(717)
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
		 	setState(729)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,69, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(719)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(720)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(721)
		 		try expression(0)
		 		setState(722)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(724)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(727)
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
		 			setState(725)
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
		 		case .NS_SWIFT_NAME:fallthrough
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
		 			setState(726)
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
		 	setState(731)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(743)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012512255) != 0)) {
		 		setState(734)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,70, _ctx)) {
		 		case 1:
		 			setState(732)
		 			try typeVariableDeclaratorOrName()

		 			break
		 		case 2:
		 			setState(733)
		 			try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 			break
		 		default: break
		 		}
		 		setState(740)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(736)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(737)
		 			try typeVariableDeclaratorOrName()


		 			setState(742)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(745)
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
		 	setState(749)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,73, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(747)
		 		try typeVariableDeclarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(748)
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
		 	setState(751)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(753)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,74,_ctx)) {
		 	case 1:
		 		setState(752)
		 		try typeSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(756)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(755)
		 		try nullabilitySpecifier()

		 	}

		 	setState(759)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(758)
		 		try blockParameters()

		 	}

		 	setState(761)
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
		 	setState(763)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(764)
		 	try receiver()
		 	setState(765)
		 	try messageSelector()
		 	setState(766)
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
		 	setState(770)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,77, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(768)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(769)
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
		 	setState(778)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,79, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(772)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(774) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(773)
		 			try keywordArgument()


		 			setState(776); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(781)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 		setState(780)
		 		try selector()

		 	}

		 	setState(783)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(784)
		 	try keywordArgumentType()
		 	setState(789)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(785)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(786)
		 		try keywordArgumentType()


		 		setState(791)
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
		 	setState(792)
		 	try expressions()
		 	setState(794)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,82,_ctx)) {
		 	case 1:
		 		setState(793)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(800)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(796)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(797)
		 		try initializerList()
		 		setState(798)
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
		 	setState(802)
		 	try match(ObjectiveCParser.Tokens.SELECTOR.rawValue)
		 	setState(803)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(804)
		 	try selectorName()
		 	setState(805)
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
			func UNDERSCORE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNDERSCORE.rawValue, 0)
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
		 	setState(817)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,86, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(807)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(808)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(813) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(810)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 				setState(809)
		 				try selector()

		 			}

		 			setState(812)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 			setState(815); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(819)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(820)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(821)
		 	try protocolName()
		 	setState(822)
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
		 	setState(824)
		 	try match(ObjectiveCParser.Tokens.ENCODE.rawValue)
		 	setState(825)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(826)
		 	try typeName()
		 	setState(827)
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
		 	setState(829)
		 	try declarationSpecifiers()
		 	setState(830)
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
		 	setState(839)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,87, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(832)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(833)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(834)
		 		try identifier()
		 		setState(835)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(837)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(838)
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
		 	setState(841)
		 	try match(ObjectiveCParser.Tokens.TRY.rawValue)
		 	setState(842)
		 	try {
		 			let assignmentValue = try compoundStatement()
		 			_localctx.castdown(TryBlockContext.self).tryStatement = assignmentValue
		 	     }()

		 	setState(846)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CATCH.rawValue) {
		 		setState(843)
		 		try catchStatement()


		 		setState(848)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(851)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.FINALLY.rawValue) {
		 		setState(849)
		 		try match(ObjectiveCParser.Tokens.FINALLY.rawValue)
		 		setState(850)
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
		 	setState(853)
		 	try match(ObjectiveCParser.Tokens.CATCH.rawValue)
		 	setState(854)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(855)
		 	try typeVariableDeclarator()
		 	setState(856)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(857)
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
		 	setState(859)
		 	try match(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue)
		 	setState(860)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(861)
		 	try expression(0)
		 	setState(862)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(863)
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
		 	setState(865)
		 	try match(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue)
		 	setState(866)
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
		 	setState(868)
		 	try functionSignature()
		 	setState(869)
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
		 	setState(871)
		 	try functionSignature()
		 	setState(872)
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
		 	setState(875)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,90,_ctx)) {
		 	case 1:
		 		setState(874)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(877)
		 	try identifier()

		 	setState(878)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(880)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012512255) != 0)) {
		 		setState(879)
		 		try parameterList()

		 	}

		 	setState(882)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	setState(885)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(884)
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
		 	setState(887)
		 	try attributeName()
		 	setState(889)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(888)
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
		 	setState(893)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(891)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(892)
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
		 	setState(895)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(897)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804832) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || ((Int64((_la - 159)) & ~0x3f) == 0 && ((Int64(1) << (_la - 159)) & 66584579) != 0)) {
		 		setState(896)
		 		try attributeParameterList()

		 	}

		 	setState(899)
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
		 	setState(901)
		 	try attributeParameter()
		 	setState(906)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(902)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(903)
		 		try attributeParameter()


		 		setState(908)
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
		 	setState(913)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,97, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(909)
		 		try attribute()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(910)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(911)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(912)
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
		 	setState(915)
		 	try attributeName()
		 	setState(916)
		 	try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 	setState(920)
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
		 		setState(917)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(918)
		 		try attributeName()

		 		break

		 	case .STRING_START:
		 		setState(919)
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
		 	setState(926)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,99, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(922)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(923)
		 		try enumDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(924)
		 		try varDeclaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(925)
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
		 	setState(929)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(928)
		 		try attributeSpecifier()

		 	}

		 	setState(931)
		 	try identifier()
		 	setState(933)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(932)
		 		try attributeSpecifier()

		 	}

		 	setState(935)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(936)
		 	try directDeclarator()
		 	setState(937)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(938)
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
		 	setState(941)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(940)
		 		try attributeSpecifier()

		 	}

		 	setState(944)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.TYPEDEF.rawValue) {
		 		setState(943)
		 		try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)

		 	}

		 	setState(946)
		 	try enumSpecifier()
		 	setState(948)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 		setState(947)
		 		try identifier()

		 	}

		 	setState(950)
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
		 	setState(956)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,105, _ctx)) {
		 	case 1:
		 		setState(952)
		 		try declarationSpecifiers()
		 		setState(953)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		setState(955)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(958)
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
		 	setState(961)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(960)
		 		try attributeSpecifier()

		 	}

		 	setState(963)
		 	try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)
		 	setState(968)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,107, _ctx)) {
		 	case 1:
		 		setState(964)
		 		try declarationSpecifiers()
		 		setState(965)
		 		try typeDeclaratorList()

		 		break
		 	case 2:
		 		setState(967)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(970)
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
		 	setState(972)
		 	try typeDeclarator()
		 	setState(977)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(973)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(974)
		 		try typeDeclarator()


		 		setState(979)
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
		 	setState(981)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.MUL.rawValue) {
		 		setState(980)
		 		try pointer()

		 	}

		 	setState(983)
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
		 	setState(993); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(993)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,110, _ctx)) {
		 			case 1:
		 				setState(985)
		 				try storageClassSpecifier()

		 				break
		 			case 2:
		 				setState(986)
		 				try attributeSpecifier()

		 				break
		 			case 3:
		 				setState(987)
		 				try arcBehaviourSpecifier()

		 				break
		 			case 4:
		 				setState(988)
		 				try nullabilitySpecifier()

		 				break
		 			case 5:
		 				setState(989)
		 				try ibOutletQualifier()

		 				break
		 			case 6:
		 				setState(990)
		 				try typePrefix()

		 				break
		 			case 7:
		 				setState(991)
		 				try typeQualifier()

		 				break
		 			case 8:
		 				setState(992)
		 				try typeSpecifier()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(995); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,111,_ctx)
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
		 	setState(997)
		 	try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 	setState(998)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(999)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1000)
		 	try attribute()
		 	setState(1005)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1001)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1002)
		 		try attribute()


		 		setState(1007)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1008)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1009)
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
		 	setState(1011)
		 	try initDeclarator()
		 	setState(1016)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1012)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1013)
		 		try initDeclarator()


		 		setState(1018)
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
		 	setState(1019)
		 	try declarator()
		 	setState(1022)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1020)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1021)
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
		 	setState(1024)
		 	_la = try _input.LA(1)
		 	if (!(_la == ObjectiveCParser.Tokens.STRUCT.rawValue || _la == ObjectiveCParser.Tokens.UNION.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1037)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,117, _ctx)) {
		 	case 1:
		 		setState(1025)
		 		try identifier()

		 		break
		 	case 2:
		 		setState(1027)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 			setState(1026)
		 			try identifier()

		 		}

		 		setState(1029)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1031) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1030)
		 			try fieldDeclaration()


		 			setState(1033); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143779995789872) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012512247) != 0))
		 		setState(1035)
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
		 	setState(1039)
		 	try specifierQualifierList()
		 	setState(1040)
		 	try fieldDeclaratorList()
		 	setState(1042)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143491891371959) != 0)) {
		 		setState(1041)
		 		try macro()

		 	}

		 	setState(1044)
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
		 	setState(1052); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1052)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,119, _ctx)) {
		 			case 1:
		 				setState(1046)
		 				try arcBehaviourSpecifier()

		 				break
		 			case 2:
		 				setState(1047)
		 				try nullabilitySpecifier()

		 				break
		 			case 3:
		 				setState(1048)
		 				try ibOutletQualifier()

		 				break
		 			case 4:
		 				setState(1049)
		 				try typePrefix()

		 				break
		 			case 5:
		 				setState(1050)
		 				try typeQualifier()

		 				break
		 			case 6:
		 				setState(1051)
		 				try typeSpecifier()

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1054); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,120,_ctx)
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
		 	setState(1062)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IB_OUTLET_COLLECTION:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1056)
		 		try match(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue)
		 		setState(1057)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1058)
		 		try identifier()
		 		setState(1059)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break

		 	case .IB_OUTLET:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1061)
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
		 	setState(1064)
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
		 	setState(1066)
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
		 	setState(1068)
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
		 	setState(1070)
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
		 	setState(1076)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1072)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break

		 	case .VOLATILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1073)
		 		try match(ObjectiveCParser.Tokens.VOLATILE.rawValue)

		 		break

		 	case .RESTRICT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1074)
		 		try match(ObjectiveCParser.Tokens.RESTRICT.rawValue)

		 		break
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1075)
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
		 	setState(1078)
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
		 	setState(1097)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,124, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1080)
		 		try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1081)
		 		try match(ObjectiveCParser.Tokens.CHAR.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1082)
		 		try match(ObjectiveCParser.Tokens.SHORT.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1083)
		 		try match(ObjectiveCParser.Tokens.INT.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1084)
		 		try match(ObjectiveCParser.Tokens.LONG.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1085)
		 		try match(ObjectiveCParser.Tokens.FLOAT.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1086)
		 		try match(ObjectiveCParser.Tokens.DOUBLE.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1087)
		 		try match(ObjectiveCParser.Tokens.SIGNED.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1088)
		 		try match(ObjectiveCParser.Tokens.UNSIGNED.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1089)
		 		try typeofExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1090)
		 		try genericTypeSpecifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1091)
		 		try structOrUnionSpecifier()

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(1092)
		 		try enumSpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(1093)
		 		try identifier()
		 		setState(1095)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,123,_ctx)) {
		 		case 1:
		 			setState(1094)
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
		 	setState(1099)
		 	try match(ObjectiveCParser.Tokens.TYPEOF.rawValue)

		 	setState(1100)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1101)
		 	try expression(0)
		 	setState(1102)
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
		 	setState(1104)
		 	try fieldDeclarator()
		 	setState(1109)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1105)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1106)
		 		try fieldDeclarator()


		 		setState(1111)
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
		 	setState(1118)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,127, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1112)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1114)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 40)) & ~0x3f) == 0 && ((Int64(1) << (_la - 40)) & -414491694415611649) != 0) || ((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 144115188480605959) != 0)) {
		 			setState(1113)
		 			try declarator()

		 		}

		 		setState(1116)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1117)
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
		 	setState(1151)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ENUM:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1120)
		 		try match(ObjectiveCParser.Tokens.ENUM.rawValue)
		 		setState(1126)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,129,_ctx)) {
		 		case 1:
		 			setState(1122)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 				setState(1121)
		 				try identifier()

		 			}

		 			setState(1124)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 			setState(1125)
		 			try typeName()

		 			break
		 		default: break
		 		}
		 		setState(1139)
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
		 		case .NS_SWIFT_NAME:fallthrough
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
		 			setState(1128)
		 			try identifier()
		 			setState(1133)
		 			try _errHandler.sync(self)
		 			switch (try getInterpreter().adaptivePredict(_input,130,_ctx)) {
		 			case 1:
		 				setState(1129)
		 				try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 				setState(1130)
		 				try enumeratorList()
		 				setState(1131)
		 				try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 				break
		 			default: break
		 			}

		 			break

		 		case .LBRACE:
		 			setState(1135)
		 			try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 			setState(1136)
		 			try enumeratorList()
		 			setState(1137)
		 			try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}

		 		break
		 	case .NS_ENUM:fallthrough
		 	case .NS_OPTIONS:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1141)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.NS_ENUM.rawValue || _la == ObjectiveCParser.Tokens.NS_OPTIONS.rawValue)) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1142)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1143)
		 		try typeName()
		 		setState(1144)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1145)
		 		try identifier()
		 		setState(1146)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1147)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1148)
		 		try enumeratorList()
		 		setState(1149)
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
		 	setState(1153)
		 	try enumerator()
		 	setState(1158)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1154)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1155)
		 			try enumerator()

		 	 
		 		}
		 		setState(1160)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
		 	}
		 	setState(1162)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1161)
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
		 	setState(1164)
		 	try enumeratorIdentifier()
		 	setState(1167)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1165)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1166)
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
		 	setState(1171)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(1169)
		 		try identifier()

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1170)
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
		 	setState(1196)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,141, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1178)
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
		 		case .NS_SWIFT_NAME:fallthrough
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
		 			setState(1173)
		 			try identifier()

		 			break

		 		case .LP:
		 			setState(1174)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1175)
		 			try declarator()
		 			setState(1176)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1183)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1180)
		 			try declaratorSuffix()


		 			setState(1185)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1186)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1187)
		 		try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 		setState(1189)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,139,_ctx)) {
		 		case 1:
		 			setState(1188)
		 			try nullabilitySpecifier()

		 			break
		 		default: break
		 		}
		 		setState(1192)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0)) {
		 			setState(1191)
		 			try identifier()

		 		}

		 		setState(1194)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1195)
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
		 	setState(1198)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(1200)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || ((Int64((_la - 159)) & ~0x3f) == 0 && ((Int64(1) << (_la - 159)) & 65536003) != 0)) {
		 		setState(1199)
		 		try constantExpression()

		 	}

		 	setState(1202)
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
		 	setState(1204)
		 	try parameterDeclarationList()
		 	setState(1207)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1205)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1206)
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
		 	setState(1209)
		 	try match(ObjectiveCParser.Tokens.MUL.rawValue)
		 	setState(1211)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,144,_ctx)) {
		 	case 1:
		 		setState(1210)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(1214)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,145,_ctx)) {
		 	case 1:
		 		setState(1213)
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
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
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
			open
			func NS_SWIFT_NAME() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue, 0)
			}
			open
			func swiftSelectorExpression() -> SwiftSelectorExpressionContext? {
				return getRuleContext(SwiftSelectorExpressionContext.self, 0)
			}
			open
			func API_AVAILABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.API_AVAILABLE.rawValue, 0)
			}
			open
			func apiAvailableOsVersion() -> [ApiAvailableOsVersionContext] {
				return getRuleContexts(ApiAvailableOsVersionContext.self)
			}
			open
			func apiAvailableOsVersion(_ i: Int) -> ApiAvailableOsVersionContext? {
				return getRuleContext(ApiAvailableOsVersionContext.self, i)
			}
			open
			func API_UNAVAILABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.API_UNAVAILABLE.rawValue, 0)
			}
			open
			func NS_SWIFT_UNAVAILABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_SWIFT_UNAVAILABLE.rawValue, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
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
		 	setState(1264)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,150, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1216)
		 		try identifier()
		 		setState(1228)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 			setState(1217)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1218)
		 			try primaryExpression()
		 			setState(1223)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 				setState(1219)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1220)
		 				try primaryExpression()


		 				setState(1225)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1226)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1230)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue)
		 		setState(1231)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1232)
		 		try swiftSelectorExpression()
		 		setState(1233)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1235)
		 		try match(ObjectiveCParser.Tokens.API_AVAILABLE.rawValue)
		 		setState(1236)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1237)
		 		try apiAvailableOsVersion()
		 		setState(1242)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1238)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1239)
		 			try apiAvailableOsVersion()


		 			setState(1244)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1245)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1247)
		 		try match(ObjectiveCParser.Tokens.API_UNAVAILABLE.rawValue)
		 		setState(1248)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1249)
		 		try identifier()
		 		setState(1254)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1250)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1251)
		 			try identifier()


		 			setState(1256)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1257)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1259)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_UNAVAILABLE.rawValue)
		 		setState(1260)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1261)
		 		try stringLiteral()
		 		setState(1262)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

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

	public class SwiftSelectorExpressionContext: ParserRuleContext {
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
			func swiftSelector() -> [SwiftSelectorContext] {
				return getRuleContexts(SwiftSelectorContext.self)
			}
			open
			func swiftSelector(_ i: Int) -> SwiftSelectorContext? {
				return getRuleContext(SwiftSelectorContext.self, i)
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
			return ObjectiveCParser.RULE_swiftSelectorExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwiftSelectorExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwiftSelectorExpression(self)
			}
		}
	}
	@discardableResult
	 open func swiftSelectorExpression() throws -> SwiftSelectorExpressionContext {
		var _localctx: SwiftSelectorExpressionContext
		_localctx = SwiftSelectorExpressionContext(_ctx, getState())
		try enterRule(_localctx, 206, ObjectiveCParser.RULE_swiftSelectorExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1266)
		 	try identifier()
		 	setState(1267)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1273)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4612829508439711671) != 0)) {
		 		setState(1268)
		 		try swiftSelector()
		 		setState(1269)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 		setState(1275)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1276)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SwiftSelectorContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func UNDERSCORE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNDERSCORE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_swiftSelector
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwiftSelector(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwiftSelector(self)
			}
		}
	}
	@discardableResult
	 open func swiftSelector() throws -> SwiftSelectorContext {
		var _localctx: SwiftSelectorContext
		_localctx = SwiftSelectorContext(_ctx, getState())
		try enterRule(_localctx, 208, ObjectiveCParser.RULE_swiftSelector)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1280)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(1278)
		 		try identifier()

		 		break

		 	case .UNDERSCORE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1279)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

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

	public class ApiAvailableOsVersionContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func version() -> VersionContext? {
				return getRuleContext(VersionContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_apiAvailableOsVersion
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterApiAvailableOsVersion(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitApiAvailableOsVersion(self)
			}
		}
	}
	@discardableResult
	 open func apiAvailableOsVersion() throws -> ApiAvailableOsVersionContext {
		var _localctx: ApiAvailableOsVersionContext
		_localctx = ApiAvailableOsVersionContext(_ctx, getState())
		try enterRule(_localctx, 210, ObjectiveCParser.RULE_apiAvailableOsVersion)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1282)
		 	try identifier()
		 	setState(1283)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1284)
		 	try version()
		 	setState(1285)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VersionContext: ParserRuleContext {
			open
			func FLOATING_POINT_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue, 0)
			}
			open
			func DECIMAL_LITERAL() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)
			}
			open
			func DECIMAL_LITERAL(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue, i)
			}
			open
			func DOT() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.DOT.rawValue)
			}
			open
			func DOT(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DOT.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_version
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterVersion(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitVersion(self)
			}
		}
	}
	@discardableResult
	 open func version() throws -> VersionContext {
		var _localctx: VersionContext
		_localctx = VersionContext(_ctx, getState())
		try enterRule(_localctx, 212, ObjectiveCParser.RULE_version)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1296)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FLOATING_POINT_LITERAL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1287)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break

		 	case .DECIMAL_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1288)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)
		 		setState(1293)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 			setState(1289)
		 			try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 			setState(1290)
		 			try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)


		 			setState(1295)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
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
		try enterRule(_localctx, 214, ObjectiveCParser.RULE_arrayInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1298)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1303)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(1299)
		 		try expressions()
		 		setState(1301)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1300)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1305)
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
		try enterRule(_localctx, 216, ObjectiveCParser.RULE_structInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1307)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1321)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1308)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1309)
		 		try expression(0)
		 		setState(1315)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,157,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(1310)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1311)
		 				try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 				setState(1312)
		 				try expression(0)

		 		 
		 			}
		 			setState(1317)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,157,_ctx)
		 		}
		 		setState(1319)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1318)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1323)
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
		try enterRule(_localctx, 218, ObjectiveCParser.RULE_initializerList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1325)
		 	try initializer()
		 	setState(1330)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,160,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1326)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1327)
		 			try initializer()

		 	 
		 		}
		 		setState(1332)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,160,_ctx)
		 	}
		 	setState(1334)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1333)
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
		try enterRule(_localctx, 220, ObjectiveCParser.RULE_typeName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1341)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,163, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1336)
		 		try specifierQualifierList()
		 		setState(1338)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 132)) & ~0x3f) == 0 && ((Int64(1) << (_la - 132)) & 536870929) != 0)) {
		 			setState(1337)
		 			try abstractDeclarator()

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1340)
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
		try enterRule(_localctx, 222, ObjectiveCParser.RULE_abstractDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1366)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MUL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1343)
		 		try pointer()
		 		setState(1345)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 132)) & ~0x3f) == 0 && ((Int64(1) << (_la - 132)) & 536870929) != 0)) {
		 			setState(1344)
		 			try abstractDeclarator()

		 		}


		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1347)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1349)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64((_la - 132)) & ~0x3f) == 0 && ((Int64(1) << (_la - 132)) & 536870929) != 0)) {
		 			setState(1348)
		 			try abstractDeclarator()

		 		}

		 		setState(1351)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1353) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1352)
		 			try abstractDeclaratorSuffix()


		 			setState(1355); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break

		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1362) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1357)
		 			try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 			setState(1359)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || ((Int64((_la - 159)) & ~0x3f) == 0 && ((Int64(1) << (_la - 159)) & 65536003) != 0)) {
		 				setState(1358)
		 				try constantExpression()

		 			}

		 			setState(1361)
		 			try match(ObjectiveCParser.Tokens.RBRACK.rawValue)


		 			setState(1364); 
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
		try enterRule(_localctx, 224, ObjectiveCParser.RULE_abstractDeclaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1378)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1368)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1370)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0) || ((Int64((_la - 159)) & ~0x3f) == 0 && ((Int64(1) << (_la - 159)) & 65536003) != 0)) {
		 			setState(1369)
		 			try constantExpression()

		 		}

		 		setState(1372)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1373)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1375)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012512255) != 0)) {
		 			setState(1374)
		 			try parameterDeclarationList()

		 		}

		 		setState(1377)
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
		try enterRule(_localctx, 226, ObjectiveCParser.RULE_parameterDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1380)
		 	try parameterDeclaration()
		 	setState(1385)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,173,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1381)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1382)
		 			try parameterDeclaration()

		 	 
		 		}
		 		setState(1387)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,173,_ctx)
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
		try enterRule(_localctx, 228, ObjectiveCParser.RULE_parameterDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1392)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,174, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1388)
		 		try declarationSpecifiers()
		 		setState(1389)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1391)
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
		try enterRule(_localctx, 230, ObjectiveCParser.RULE_declarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1395)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.MUL.rawValue) {
		 		setState(1394)
		 		try pointer()

		 	}

		 	setState(1397)
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
		try enterRule(_localctx, 232, ObjectiveCParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1440)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,186, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1399)
		 		try labeledStatement()
		 		setState(1401)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,176,_ctx)) {
		 		case 1:
		 			setState(1400)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1403)
		 		try compoundStatement()
		 		setState(1405)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,177,_ctx)) {
		 		case 1:
		 			setState(1404)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1407)
		 		try selectionStatement()
		 		setState(1409)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,178,_ctx)) {
		 		case 1:
		 			setState(1408)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1411)
		 		try iterationStatement()
		 		setState(1413)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,179,_ctx)) {
		 		case 1:
		 			setState(1412)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1415)
		 		try jumpStatement()
		 		setState(1417)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,180,_ctx)) {
		 		case 1:
		 			setState(1416)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1419)
		 		try synchronizedStatement()
		 		setState(1421)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,181,_ctx)) {
		 		case 1:
		 			setState(1420)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1423)
		 		try autoreleaseStatement()
		 		setState(1425)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,182,_ctx)) {
		 		case 1:
		 			setState(1424)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1427)
		 		try throwStatement()
		 		setState(1429)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,183,_ctx)) {
		 		case 1:
		 			setState(1428)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1431)
		 		try tryBlock()
		 		setState(1433)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,184,_ctx)) {
		 		case 1:
		 			setState(1432)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1435)
		 		try expressions()
		 		setState(1437)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,185,_ctx)) {
		 		case 1:
		 			setState(1436)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1439)
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
		try enterRule(_localctx, 234, ObjectiveCParser.RULE_labeledStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1442)
		 	try identifier()
		 	setState(1443)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(1444)
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
		try enterRule(_localctx, 236, ObjectiveCParser.RULE_rangeExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1446)
		 	try constantExpression()
		 	setState(1449)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ELIPSIS.rawValue) {
		 		setState(1447)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)
		 		setState(1448)
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
		try enterRule(_localctx, 238, ObjectiveCParser.RULE_compoundStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1451)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1456)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146530212641654) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636945604575871) != 0) || ((Int64((_la - 134)) & ~0x3f) == 0 && ((Int64(1) << (_la - 134)) & 2234210572067093) != 0)) {
		 		setState(1454)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,188, _ctx)) {
		 		case 1:
		 			setState(1452)
		 			try declaration()

		 			break
		 		case 2:
		 			setState(1453)
		 			try statement()

		 			break
		 		default: break
		 		}

		 		setState(1458)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1459)
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
		try enterRule(_localctx, 240, ObjectiveCParser.RULE_selectionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1471)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IF:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1461)
		 		try match(ObjectiveCParser.Tokens.IF.rawValue)
		 		setState(1462)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1463)
		 		try expression(0)
		 		setState(1464)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1465)
		 		try {
		 				let assignmentValue = try statement()
		 				_localctx.castdown(SelectionStatementContext.self).ifBody = assignmentValue
		 		     }()

		 		setState(1468)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,190,_ctx)) {
		 		case 1:
		 			setState(1466)
		 			try match(ObjectiveCParser.Tokens.ELSE.rawValue)
		 			setState(1467)
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
		 		setState(1470)
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
		try enterRule(_localctx, 242, ObjectiveCParser.RULE_switchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1473)
		 	try match(ObjectiveCParser.Tokens.SWITCH.rawValue)
		 	setState(1474)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1475)
		 	try expression(0)
		 	setState(1476)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1477)
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
		try enterRule(_localctx, 244, ObjectiveCParser.RULE_switchBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1479)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1483)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue) {
		 		setState(1480)
		 		try switchSection()


		 		setState(1485)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1486)
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
		try enterRule(_localctx, 246, ObjectiveCParser.RULE_switchSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1489) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1488)
		 		try switchLabel()


		 		setState(1491); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 	setState(1494) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1493)
		 		try statement()


		 		setState(1496); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146513339072836) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376622719) != 0) || ((Int64((_la - 134)) & ~0x3f) == 0 && ((Int64(1) << (_la - 134)) & 2234210572067093) != 0))

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
		try enterRule(_localctx, 248, ObjectiveCParser.RULE_switchLabel)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1510)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CASE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1498)
		 		try match(ObjectiveCParser.Tokens.CASE.rawValue)
		 		setState(1504)
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
		 		case .NS_SWIFT_NAME:fallthrough
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
		 			setState(1499)
		 			try rangeExpression()

		 			break

		 		case .LP:
		 			setState(1500)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1501)
		 			try rangeExpression()
		 			setState(1502)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1506)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1508)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 		setState(1509)
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
		try enterRule(_localctx, 250, ObjectiveCParser.RULE_iterationStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1516)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,197, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1512)
		 		try whileStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1513)
		 		try doStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1514)
		 		try forStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1515)
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
		try enterRule(_localctx, 252, ObjectiveCParser.RULE_whileStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1518)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1519)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1520)
		 	try expression(0)
		 	setState(1521)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1522)
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
		try enterRule(_localctx, 254, ObjectiveCParser.RULE_doStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1524)
		 	try match(ObjectiveCParser.Tokens.DO.rawValue)
		 	setState(1525)
		 	try statement()
		 	setState(1526)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1527)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1528)
		 	try expression(0)
		 	setState(1529)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1530)
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
		try enterRule(_localctx, 256, ObjectiveCParser.RULE_forStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1532)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1533)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1535)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916136071445042) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636945604579199) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(1534)
		 		try forLoopInitializer()

		 	}

		 	setState(1537)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1539)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(1538)
		 		try expression(0)

		 	}

		 	setState(1541)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1543)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(1542)
		 		try expressions()

		 	}

		 	setState(1545)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1546)
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
		try enterRule(_localctx, 258, ObjectiveCParser.RULE_forLoopInitializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1552)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,201, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1548)
		 		try declarationSpecifiers()
		 		setState(1549)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1551)
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
		try enterRule(_localctx, 260, ObjectiveCParser.RULE_forInStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1554)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1555)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1556)
		 	try typeVariableDeclarator()
		 	setState(1557)
		 	try match(ObjectiveCParser.Tokens.IN.rawValue)
		 	setState(1559)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 		setState(1558)
		 		try expression(0)

		 	}

		 	setState(1561)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1562)
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
		try enterRule(_localctx, 262, ObjectiveCParser.RULE_jumpStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1572)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .GOTO:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1564)
		 		try match(ObjectiveCParser.Tokens.GOTO.rawValue)
		 		setState(1565)
		 		try identifier()

		 		break

		 	case .CONTINUE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1566)
		 		try match(ObjectiveCParser.Tokens.CONTINUE.rawValue)

		 		break

		 	case .BREAK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1567)
		 		try match(ObjectiveCParser.Tokens.BREAK.rawValue)

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1568)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)
		 		setState(1570)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,203,_ctx)) {
		 		case 1:
		 			setState(1569)
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
		try enterRule(_localctx, 264, ObjectiveCParser.RULE_expressions)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1574)
		 	try expression(0)
		 	setState(1579)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,205,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1575)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1576)
		 			try expression(0)

		 	 
		 		}
		 		setState(1581)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,205,_ctx)
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
		let _startState: Int = 266
		try enterRecursionRule(_localctx, 266, ObjectiveCParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1592)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,206, _ctx)) {
			case 1:
				setState(1583)
				try castExpression()

				break
			case 2:
				setState(1584)
				try match(ObjectiveCParser.Tokens.LP.rawValue)
				setState(1585)
				try compoundStatement()
				setState(1586)
				try match(ObjectiveCParser.Tokens.RP.rawValue)

				break
			case 3:
				setState(1588)
				try unaryExpression()
				setState(1589)
				try assignmentOperator()
				setState(1590)
				try {
						let assignmentValue = try expression(1)
						_localctx.castdown(ExpressionContext.self).assignmentExpression = assignmentValue
				     }()


				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1638)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,210,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(1636)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,209, _ctx)) {
					case 1:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1594)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(1595)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 35) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1596)
						try expression(14)

						break
					case 2:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1597)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(1598)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1599)
						try expression(13)

						break
					case 3:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1600)
						if (!(precpred(_ctx, 11))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 11)"))
						}
						setState(1605)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .LT:
							setState(1601)
							try match(ObjectiveCParser.Tokens.LT.rawValue)
							setState(1602)
							try match(ObjectiveCParser.Tokens.LT.rawValue)

							break

						case .GT:
							setState(1603)
							try match(ObjectiveCParser.Tokens.GT.rawValue)
							setState(1604)
							try match(ObjectiveCParser.Tokens.GT.rawValue)

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
						setState(1607)
						try expression(12)

						break
					case 4:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1608)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(1609)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 145)) & ~0x3f) == 0 && ((Int64(1) << (_la - 145)) & 387) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1610)
						try expression(11)

						break
					case 5:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1611)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(1612)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.EQUAL.rawValue || _la == ObjectiveCParser.Tokens.NOTEQUAL.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1613)
						try expression(10)

						break
					case 6:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1614)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(1615)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITAND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1616)
						try expression(9)

						break
					case 7:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1617)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(1618)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1619)
						try expression(8)

						break
					case 8:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1620)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(1621)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1622)
						try expression(7)

						break
					case 9:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1623)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(1624)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.AND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1625)
						try expression(6)

						break
					case 10:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1626)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(1627)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.OR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1628)
						try expression(5)

						break
					case 11:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1629)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(1630)
						try match(ObjectiveCParser.Tokens.QUESTION.rawValue)
						setState(1632)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
						if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946376626047) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
							setState(1631)
							try {
									let assignmentValue = try expression(0)
									_localctx.castdown(ExpressionContext.self).trueExpression = assignmentValue
							     }()


						}

						setState(1634)
						try match(ObjectiveCParser.Tokens.COLON.rawValue)
						setState(1635)
						try {
								let assignmentValue = try expression(4)
								_localctx.castdown(ExpressionContext.self).falseExpression = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(1640)
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
		try enterRule(_localctx, 268, ObjectiveCParser.RULE_assignmentOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1641)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 144)) & ~0x3f) == 0 && ((Int64(1) << (_la - 144)) & 8581545985) != 0))) {
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
		try enterRule(_localctx, 270, ObjectiveCParser.RULE_castExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1652)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,212, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1643)
		 		try unaryExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1644)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1645)
		 		try typeName()
		 		setState(1646)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		setState(1650)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,211, _ctx)) {
		 		case 1:
		 			setState(1648)
		 			try castExpression()

		 			break
		 		case 2:
		 			setState(1649)
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
		try enterRule(_localctx, 272, ObjectiveCParser.RULE_initializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1657)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,213, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1654)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1655)
		 		try arrayInitializer()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1656)
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
		try enterRule(_localctx, 274, ObjectiveCParser.RULE_constantExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1661)
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
		 	case .NS_SWIFT_NAME:fallthrough
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
		 		setState(1659)
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
		 		setState(1660)
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
		try enterRule(_localctx, 276, ObjectiveCParser.RULE_unaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1677)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,216, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1663)
		 		try postfixExpression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1664)
		 		try match(ObjectiveCParser.Tokens.SIZEOF.rawValue)
		 		setState(1670)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,215, _ctx)) {
		 		case 1:
		 			setState(1665)
		 			try unaryExpression()

		 			break
		 		case 2:
		 			setState(1666)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1667)
		 			try typeSpecifier()
		 			setState(1668)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1672)
		 		_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1673)
		 		try unaryExpression()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1674)
		 		try unaryOperator()
		 		setState(1675)
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
		try enterRule(_localctx, 278, ObjectiveCParser.RULE_unaryOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1679)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 147)) & ~0x3f) == 0 && ((Int64(1) << (_la - 147)) & 94211) != 0))) {
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
		let _startState: Int = 280
		try enterRecursionRule(_localctx, 280, ObjectiveCParser.RULE_postfixExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1682)
			try primaryExpression()
			setState(1686)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,217,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					setState(1683)
					try `postfix`()

			 
				}
				setState(1688)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,217,_ctx)
			}

			_ctx!.stop = try _input.LT(-1)
			setState(1700)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,219,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = PostfixExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_postfixExpression)
					setState(1689)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1690)
					_la = try _input.LA(1)
					if (!(_la == ObjectiveCParser.Tokens.DOT.rawValue || _la == ObjectiveCParser.Tokens.STRUCTACCESS.rawValue)) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(1691)
					try identifier()
					setState(1695)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,218,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1692)
							try `postfix`()

					 
						}
						setState(1697)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,218,_ctx)
					}

			 
				}
				setState(1702)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,219,_ctx)
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
		open var _tset3318: Token!
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
		try enterRule(_localctx, 282, ObjectiveCParser.RULE_postfix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1721)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,223, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1703)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1704)
		 		try expression(0)
		 		setState(1705)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1707)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1709)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916127411120656) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & -4539636946309517183) != 0) || ((Int64((_la - 136)) & ~0x3f) == 0 && ((Int64(1) << (_la - 136)) & 558552643016769) != 0)) {
		 			setState(1708)
		 			try argumentExpressionList()

		 		}

		 		setState(1711)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1712)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1715) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1715)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,221, _ctx)) {
		 			case 1:
		 				setState(1713)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 				break
		 			case 2:
		 				setState(1714)
		 				_localctx.castdown(PostfixContext.self)._tset3318 = try _input.LT(1)
		 				_la = try _input.LA(1)
		 				if (_la <= 0 || (_la == ObjectiveCParser.Tokens.RP.rawValue)) {
		 					_localctx.castdown(PostfixContext.self)._tset3318 = try _errHandler.recoverInline(self) as Token
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}
		 				_localctx.castdown(PostfixContext.self).macroArguments.append(_localctx.castdown(PostfixContext.self)._tset3318)

		 				break
		 			default: break
		 			}

		 			setState(1717); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & -2) != 0) || ((Int64((_la - 64)) & ~0x3f) == 0 && ((Int64(1) << (_la - 64)) & -1) != 0) || ((Int64((_la - 128)) & ~0x3f) == 0 && ((Int64(1) << (_la - 128)) & -33) != 0) || ((Int64((_la - 192)) & ~0x3f) == 0 && ((Int64(1) << (_la - 192)) & 274877906943) != 0))
		 		setState(1719)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1720)
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
		try enterRule(_localctx, 284, ObjectiveCParser.RULE_argumentExpressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1723)
		 	try argumentExpression()
		 	setState(1728)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1724)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1725)
		 		try argumentExpression()


		 		setState(1730)
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
		try enterRule(_localctx, 286, ObjectiveCParser.RULE_argumentExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1733)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,225, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1731)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1732)
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
		try enterRule(_localctx, 288, ObjectiveCParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1750)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,226, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1735)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1736)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1737)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1738)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1739)
		 		try expression(0)
		 		setState(1740)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1742)
		 		try messageExpression()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1743)
		 		try selectorExpression()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1744)
		 		try protocolExpression()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1745)
		 		try encodeExpression()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1746)
		 		try dictionaryExpression()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1747)
		 		try arrayExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1748)
		 		try boxExpression()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1749)
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
		try enterRule(_localctx, 290, ObjectiveCParser.RULE_constant)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1770)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,229, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1752)
		 		try match(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1753)
		 		try match(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1754)
		 		try match(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1756)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1755)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1758)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1760)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1759)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1762)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1763)
		 		try match(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1764)
		 		try match(ObjectiveCParser.Tokens.NIL.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1765)
		 		try match(ObjectiveCParser.Tokens.NULL_.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1766)
		 		try match(ObjectiveCParser.Tokens.YES.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1767)
		 		try match(ObjectiveCParser.Tokens.NO.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1768)
		 		try match(ObjectiveCParser.Tokens.TRUE.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1769)
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
		try enterRule(_localctx, 292, ObjectiveCParser.RULE_stringLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1780); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1772)
		 			try match(ObjectiveCParser.Tokens.STRING_START.rawValue)
		 			setState(1776)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue) {
		 				setState(1773)
		 				_la = try _input.LA(1)
		 				if (!(_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue)) {
		 				try _errHandler.recoverInline(self)
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}


		 				setState(1778)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1779)
		 			try match(ObjectiveCParser.Tokens.STRING_END.rawValue)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1782); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,231,_ctx)
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
			func NS_SWIFT_NAME() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue, 0)
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
		try enterRule(_localctx, 294, ObjectiveCParser.RULE_identifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1784)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 1143490012323767) != 0))) {
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
		case  133:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
		case  140:
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
		4,1,229,1787,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
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
		2,141,7,141,2,142,7,142,2,143,7,143,2,144,7,144,2,145,7,145,2,146,7,146,
		2,147,7,147,1,0,5,0,298,8,0,10,0,12,0,301,9,0,1,0,1,0,1,1,1,1,1,1,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,316,8,1,1,2,1,2,1,2,1,2,1,3,3,3,323,8,
		3,1,3,1,3,1,3,1,3,3,3,329,8,3,1,3,1,3,1,3,1,3,3,3,335,8,3,1,3,3,3,338,
		8,3,1,3,3,3,341,8,3,1,3,1,3,1,4,1,4,1,4,1,4,3,4,349,8,4,1,4,1,4,1,4,1,
		4,1,4,3,4,356,8,4,1,4,3,4,359,8,4,1,4,3,4,362,8,4,1,4,1,4,1,5,1,5,1,5,
		1,5,3,5,370,8,5,1,5,3,5,373,8,5,1,5,3,5,376,8,5,1,5,1,5,1,6,1,6,1,6,1,
		6,1,6,1,6,3,6,386,8,6,1,6,1,6,1,7,1,7,1,7,1,7,1,7,1,7,3,7,396,8,7,1,8,
		3,8,399,8,8,1,8,1,8,1,8,1,8,1,8,1,8,3,8,407,8,8,1,8,5,8,410,8,8,10,8,12,
		8,413,9,8,1,8,1,8,1,9,1,9,5,9,419,8,9,10,9,12,9,422,9,9,1,9,4,9,425,8,
		9,11,9,12,9,426,3,9,429,8,9,1,10,1,10,1,10,1,10,1,11,1,11,1,11,1,11,5,
		11,439,8,11,10,11,12,11,442,9,11,1,11,1,11,1,12,1,12,1,12,5,12,449,8,12,
		10,12,12,12,452,9,12,1,13,1,13,1,13,1,13,1,13,3,13,459,8,13,1,13,3,13,
		462,8,13,1,13,3,13,465,8,13,1,13,1,13,1,14,1,14,1,14,5,14,472,8,14,10,
		14,12,14,475,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
		15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,497,8,15,1,16,1,16,
		1,16,1,16,1,16,3,16,504,8,16,1,16,3,16,507,8,16,1,17,1,17,5,17,511,8,17,
		10,17,12,17,514,9,17,1,17,1,17,1,18,1,18,5,18,520,8,18,10,18,12,18,523,
		9,18,1,18,4,18,526,8,18,11,18,12,18,527,3,18,530,8,18,1,19,1,19,1,20,1,
		20,1,20,1,20,1,20,4,20,539,8,20,11,20,12,20,540,1,21,1,21,1,21,1,22,1,
		22,1,22,1,23,3,23,550,8,23,1,23,1,23,5,23,554,8,23,10,23,12,23,557,9,23,
		1,23,1,23,1,24,1,24,1,24,1,24,1,24,4,24,566,8,24,11,24,12,24,567,1,25,
		1,25,1,25,1,26,1,26,1,26,1,27,3,27,577,8,27,1,27,1,27,3,27,581,8,27,1,
		27,3,27,584,8,27,1,27,1,27,1,28,1,28,4,28,590,8,28,11,28,12,28,591,1,28,
		1,28,3,28,596,8,28,3,28,598,8,28,1,29,3,29,601,8,29,1,29,1,29,5,29,605,
		8,29,10,29,12,29,608,9,29,1,29,3,29,611,8,29,1,29,1,29,1,30,1,30,3,30,
		617,8,30,1,31,1,31,1,31,1,31,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,3,
		32,631,8,32,1,33,1,33,1,33,5,33,636,8,33,10,33,12,33,639,9,33,1,34,1,34,
		1,34,3,34,644,8,34,1,35,3,35,647,8,35,1,35,1,35,3,35,651,8,35,1,35,1,35,
		3,35,655,8,35,1,35,1,35,1,35,3,35,660,8,35,1,35,1,35,3,35,664,8,35,1,36,
		1,36,1,36,1,36,5,36,670,8,36,10,36,12,36,673,9,36,3,36,675,8,36,1,36,1,
		36,1,37,5,37,680,8,37,10,37,12,37,683,9,37,1,37,1,37,3,37,687,8,37,1,38,
		1,38,1,38,1,38,1,38,5,38,694,8,38,10,38,12,38,697,9,38,1,38,3,38,700,8,
		38,3,38,702,8,38,1,38,1,38,1,39,1,39,1,39,1,39,1,40,1,40,1,40,1,40,3,40,
		714,8,40,3,40,716,8,40,1,40,1,40,1,41,1,41,1,41,1,41,1,41,1,41,1,41,1,
		41,3,41,728,8,41,3,41,730,8,41,1,42,1,42,1,42,3,42,735,8,42,1,42,1,42,
		5,42,739,8,42,10,42,12,42,742,9,42,3,42,744,8,42,1,42,1,42,1,43,1,43,3,
		43,750,8,43,1,44,1,44,3,44,754,8,44,1,44,3,44,757,8,44,1,44,3,44,760,8,
		44,1,44,1,44,1,45,1,45,1,45,1,45,1,45,1,46,1,46,3,46,771,8,46,1,47,1,47,
		4,47,775,8,47,11,47,12,47,776,3,47,779,8,47,1,48,3,48,782,8,48,1,48,1,
		48,1,48,1,48,5,48,788,8,48,10,48,12,48,791,9,48,1,49,1,49,3,49,795,8,49,
		1,49,1,49,1,49,1,49,3,49,801,8,49,1,50,1,50,1,50,1,50,1,50,1,51,1,51,1,
		51,3,51,811,8,51,1,51,4,51,814,8,51,11,51,12,51,815,3,51,818,8,51,1,52,
		1,52,1,52,1,52,1,52,1,53,1,53,1,53,1,53,1,53,1,54,1,54,1,54,1,55,1,55,
		1,55,1,55,1,55,1,55,1,55,3,55,840,8,55,1,56,1,56,1,56,5,56,845,8,56,10,
		56,12,56,848,9,56,1,56,1,56,3,56,852,8,56,1,57,1,57,1,57,1,57,1,57,1,57,
		1,58,1,58,1,58,1,58,1,58,1,58,1,59,1,59,1,59,1,60,1,60,1,60,1,61,1,61,
		1,61,1,62,3,62,876,8,62,1,62,1,62,1,62,3,62,881,8,62,1,62,1,62,1,62,3,
		62,886,8,62,1,63,1,63,3,63,890,8,63,1,64,1,64,3,64,894,8,64,1,65,1,65,
		3,65,898,8,65,1,65,1,65,1,66,1,66,1,66,5,66,905,8,66,10,66,12,66,908,9,
		66,1,67,1,67,1,67,1,67,3,67,914,8,67,1,68,1,68,1,68,1,68,1,68,3,68,921,
		8,68,1,69,1,69,1,69,1,69,3,69,927,8,69,1,70,3,70,930,8,70,1,70,1,70,3,
		70,934,8,70,1,70,1,70,1,70,1,70,1,70,1,71,3,71,942,8,71,1,71,3,71,945,
		8,71,1,71,1,71,3,71,949,8,71,1,71,1,71,1,72,1,72,1,72,1,72,3,72,957,8,
		72,1,72,1,72,1,73,3,73,962,8,73,1,73,1,73,1,73,1,73,1,73,3,73,969,8,73,
		1,73,1,73,1,74,1,74,1,74,5,74,976,8,74,10,74,12,74,979,9,74,1,75,3,75,
		982,8,75,1,75,1,75,1,76,1,76,1,76,1,76,1,76,1,76,1,76,1,76,4,76,994,8,
		76,11,76,12,76,995,1,77,1,77,1,77,1,77,1,77,1,77,5,77,1004,8,77,10,77,
		12,77,1007,9,77,1,77,1,77,1,77,1,78,1,78,1,78,5,78,1015,8,78,10,78,12,
		78,1018,9,78,1,79,1,79,1,79,3,79,1023,8,79,1,80,1,80,1,80,3,80,1028,8,
		80,1,80,1,80,4,80,1032,8,80,11,80,12,80,1033,1,80,1,80,3,80,1038,8,80,
		1,81,1,81,1,81,3,81,1043,8,81,1,81,1,81,1,82,1,82,1,82,1,82,1,82,1,82,
		4,82,1053,8,82,11,82,12,82,1054,1,83,1,83,1,83,1,83,1,83,1,83,3,83,1063,
		8,83,1,84,1,84,1,85,1,85,1,86,1,86,1,87,1,87,1,88,1,88,1,88,1,88,3,88,
		1077,8,88,1,89,1,89,1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,1,90,
		1,90,1,90,1,90,1,90,1,90,3,90,1096,8,90,3,90,1098,8,90,1,91,1,91,1,91,
		1,91,1,91,1,92,1,92,1,92,5,92,1108,8,92,10,92,12,92,1111,9,92,1,93,1,93,
		3,93,1115,8,93,1,93,1,93,3,93,1119,8,93,1,94,1,94,3,94,1123,8,94,1,94,
		1,94,3,94,1127,8,94,1,94,1,94,1,94,1,94,1,94,3,94,1134,8,94,1,94,1,94,
		1,94,1,94,3,94,1140,8,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,
		1,94,3,94,1152,8,94,1,95,1,95,1,95,5,95,1157,8,95,10,95,12,95,1160,9,95,
		1,95,3,95,1163,8,95,1,96,1,96,1,96,3,96,1168,8,96,1,97,1,97,3,97,1172,
		8,97,1,98,1,98,1,98,1,98,1,98,3,98,1179,8,98,1,98,5,98,1182,8,98,10,98,
		12,98,1185,9,98,1,98,1,98,1,98,3,98,1190,8,98,1,98,3,98,1193,8,98,1,98,
		1,98,3,98,1197,8,98,1,99,1,99,3,99,1201,8,99,1,99,1,99,1,100,1,100,1,100,
		3,100,1208,8,100,1,101,1,101,3,101,1212,8,101,1,101,3,101,1215,8,101,1,
		102,1,102,1,102,1,102,1,102,5,102,1222,8,102,10,102,12,102,1225,9,102,
		1,102,1,102,3,102,1229,8,102,1,102,1,102,1,102,1,102,1,102,1,102,1,102,
		1,102,1,102,1,102,5,102,1241,8,102,10,102,12,102,1244,9,102,1,102,1,102,
		1,102,1,102,1,102,1,102,1,102,5,102,1253,8,102,10,102,12,102,1256,9,102,
		1,102,1,102,1,102,1,102,1,102,1,102,1,102,3,102,1265,8,102,1,103,1,103,
		1,103,1,103,1,103,5,103,1272,8,103,10,103,12,103,1275,9,103,1,103,1,103,
		1,104,1,104,3,104,1281,8,104,1,105,1,105,1,105,1,105,1,105,1,106,1,106,
		1,106,1,106,5,106,1292,8,106,10,106,12,106,1295,9,106,3,106,1297,8,106,
		1,107,1,107,1,107,3,107,1302,8,107,3,107,1304,8,107,1,107,1,107,1,108,
		1,108,1,108,1,108,1,108,1,108,5,108,1314,8,108,10,108,12,108,1317,9,108,
		1,108,3,108,1320,8,108,3,108,1322,8,108,1,108,1,108,1,109,1,109,1,109,
		5,109,1329,8,109,10,109,12,109,1332,9,109,1,109,3,109,1335,8,109,1,110,
		1,110,3,110,1339,8,110,1,110,3,110,1342,8,110,1,111,1,111,3,111,1346,8,
		111,1,111,1,111,3,111,1350,8,111,1,111,1,111,4,111,1354,8,111,11,111,12,
		111,1355,1,111,1,111,3,111,1360,8,111,1,111,4,111,1363,8,111,11,111,12,
		111,1364,3,111,1367,8,111,1,112,1,112,3,112,1371,8,112,1,112,1,112,1,112,
		3,112,1376,8,112,1,112,3,112,1379,8,112,1,113,1,113,1,113,5,113,1384,8,
		113,10,113,12,113,1387,9,113,1,114,1,114,1,114,1,114,3,114,1393,8,114,
		1,115,3,115,1396,8,115,1,115,1,115,1,116,1,116,3,116,1402,8,116,1,116,
		1,116,3,116,1406,8,116,1,116,1,116,3,116,1410,8,116,1,116,1,116,3,116,
		1414,8,116,1,116,1,116,3,116,1418,8,116,1,116,1,116,3,116,1422,8,116,1,
		116,1,116,3,116,1426,8,116,1,116,1,116,3,116,1430,8,116,1,116,1,116,3,
		116,1434,8,116,1,116,1,116,3,116,1438,8,116,1,116,3,116,1441,8,116,1,117,
		1,117,1,117,1,117,1,118,1,118,1,118,3,118,1450,8,118,1,119,1,119,1,119,
		5,119,1455,8,119,10,119,12,119,1458,9,119,1,119,1,119,1,120,1,120,1,120,
		1,120,1,120,1,120,1,120,3,120,1469,8,120,1,120,3,120,1472,8,120,1,121,
		1,121,1,121,1,121,1,121,1,121,1,122,1,122,5,122,1482,8,122,10,122,12,122,
		1485,9,122,1,122,1,122,1,123,4,123,1490,8,123,11,123,12,123,1491,1,123,
		4,123,1495,8,123,11,123,12,123,1496,1,124,1,124,1,124,1,124,1,124,1,124,
		3,124,1505,8,124,1,124,1,124,1,124,1,124,3,124,1511,8,124,1,125,1,125,
		1,125,1,125,3,125,1517,8,125,1,126,1,126,1,126,1,126,1,126,1,126,1,127,
		1,127,1,127,1,127,1,127,1,127,1,127,1,127,1,128,1,128,1,128,3,128,1536,
		8,128,1,128,1,128,3,128,1540,8,128,1,128,1,128,3,128,1544,8,128,1,128,
		1,128,1,128,1,129,1,129,1,129,1,129,3,129,1553,8,129,1,130,1,130,1,130,
		1,130,1,130,3,130,1560,8,130,1,130,1,130,1,130,1,131,1,131,1,131,1,131,
		1,131,1,131,3,131,1571,8,131,3,131,1573,8,131,1,132,1,132,1,132,5,132,
		1578,8,132,10,132,12,132,1581,9,132,1,133,1,133,1,133,1,133,1,133,1,133,
		1,133,1,133,1,133,1,133,3,133,1593,8,133,1,133,1,133,1,133,1,133,1,133,
		1,133,1,133,1,133,1,133,1,133,1,133,3,133,1606,8,133,1,133,1,133,1,133,
		1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,
		1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,1,133,3,133,1633,
		8,133,1,133,1,133,5,133,1637,8,133,10,133,12,133,1640,9,133,1,134,1,134,
		1,135,1,135,1,135,1,135,1,135,1,135,1,135,3,135,1651,8,135,3,135,1653,
		8,135,1,136,1,136,1,136,3,136,1658,8,136,1,137,1,137,3,137,1662,8,137,
		1,138,1,138,1,138,1,138,1,138,1,138,1,138,3,138,1671,8,138,1,138,1,138,
		1,138,1,138,1,138,3,138,1678,8,138,1,139,1,139,1,140,1,140,1,140,5,140,
		1685,8,140,10,140,12,140,1688,9,140,1,140,1,140,1,140,1,140,5,140,1694,
		8,140,10,140,12,140,1697,9,140,5,140,1699,8,140,10,140,12,140,1702,9,140,
		1,141,1,141,1,141,1,141,1,141,1,141,3,141,1710,8,141,1,141,1,141,1,141,
		1,141,4,141,1716,8,141,11,141,12,141,1717,1,141,1,141,3,141,1722,8,141,
		1,142,1,142,1,142,5,142,1727,8,142,10,142,12,142,1730,9,142,1,143,1,143,
		3,143,1734,8,143,1,144,1,144,1,144,1,144,1,144,1,144,1,144,1,144,1,144,
		1,144,1,144,1,144,1,144,1,144,1,144,3,144,1751,8,144,1,145,1,145,1,145,
		1,145,3,145,1757,8,145,1,145,1,145,3,145,1761,8,145,1,145,1,145,1,145,
		1,145,1,145,1,145,1,145,1,145,3,145,1771,8,145,1,146,1,146,5,146,1775,
		8,146,10,146,12,146,1778,9,146,1,146,4,146,1781,8,146,11,146,12,146,1782,
		1,147,1,147,1,147,0,2,266,280,148,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
		28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,
		76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,
		118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,
		154,156,158,160,162,164,166,168,170,172,174,176,178,180,182,184,186,188,
		190,192,194,196,198,200,202,204,206,208,210,212,214,216,218,220,222,224,
		226,228,230,232,234,236,238,240,242,244,246,248,250,252,254,256,258,260,
		262,264,266,268,270,272,274,276,278,280,282,284,286,288,290,292,294,0,
		21,2,0,70,70,75,75,1,0,90,91,3,0,68,68,71,71,73,74,2,0,27,27,30,30,4,0,
		85,85,94,94,96,96,98,98,1,0,99,102,4,0,1,1,12,12,20,20,26,26,4,0,17,17,
		86,89,93,93,103,103,3,0,42,43,46,47,51,52,1,0,104,105,2,0,161,162,166,
		166,1,0,159,160,2,0,145,146,152,153,2,0,151,151,154,154,2,0,144,144,167,
		176,1,0,157,158,3,0,147,148,159,161,163,163,1,0,140,141,1,0,133,133,2,
		0,190,190,192,192,9,0,40,47,51,56,81,83,85,86,88,93,97,97,99,106,112,124,
		131,131,1981,0,299,1,0,0,0,2,315,1,0,0,0,4,317,1,0,0,0,6,322,1,0,0,0,8,
		344,1,0,0,0,10,365,1,0,0,0,12,379,1,0,0,0,14,389,1,0,0,0,16,398,1,0,0,
		0,18,428,1,0,0,0,20,430,1,0,0,0,22,434,1,0,0,0,24,445,1,0,0,0,26,453,1,
		0,0,0,28,468,1,0,0,0,30,496,1,0,0,0,32,506,1,0,0,0,34,508,1,0,0,0,36,529,
		1,0,0,0,38,531,1,0,0,0,40,538,1,0,0,0,42,542,1,0,0,0,44,545,1,0,0,0,46,
		549,1,0,0,0,48,565,1,0,0,0,50,569,1,0,0,0,52,572,1,0,0,0,54,576,1,0,0,
		0,56,597,1,0,0,0,58,600,1,0,0,0,60,616,1,0,0,0,62,618,1,0,0,0,64,630,1,
		0,0,0,66,632,1,0,0,0,68,640,1,0,0,0,70,646,1,0,0,0,72,665,1,0,0,0,74,686,
		1,0,0,0,76,688,1,0,0,0,78,705,1,0,0,0,80,709,1,0,0,0,82,729,1,0,0,0,84,
		731,1,0,0,0,86,749,1,0,0,0,88,751,1,0,0,0,90,763,1,0,0,0,92,770,1,0,0,
		0,94,778,1,0,0,0,96,781,1,0,0,0,98,792,1,0,0,0,100,802,1,0,0,0,102,817,
		1,0,0,0,104,819,1,0,0,0,106,824,1,0,0,0,108,829,1,0,0,0,110,839,1,0,0,
		0,112,841,1,0,0,0,114,853,1,0,0,0,116,859,1,0,0,0,118,865,1,0,0,0,120,
		868,1,0,0,0,122,871,1,0,0,0,124,875,1,0,0,0,126,887,1,0,0,0,128,893,1,
		0,0,0,130,895,1,0,0,0,132,901,1,0,0,0,134,913,1,0,0,0,136,915,1,0,0,0,
		138,926,1,0,0,0,140,929,1,0,0,0,142,941,1,0,0,0,144,956,1,0,0,0,146,961,
		1,0,0,0,148,972,1,0,0,0,150,981,1,0,0,0,152,993,1,0,0,0,154,997,1,0,0,
		0,156,1011,1,0,0,0,158,1019,1,0,0,0,160,1024,1,0,0,0,162,1039,1,0,0,0,
		164,1052,1,0,0,0,166,1062,1,0,0,0,168,1064,1,0,0,0,170,1066,1,0,0,0,172,
		1068,1,0,0,0,174,1070,1,0,0,0,176,1076,1,0,0,0,178,1078,1,0,0,0,180,1097,
		1,0,0,0,182,1099,1,0,0,0,184,1104,1,0,0,0,186,1118,1,0,0,0,188,1151,1,
		0,0,0,190,1153,1,0,0,0,192,1164,1,0,0,0,194,1171,1,0,0,0,196,1196,1,0,
		0,0,198,1198,1,0,0,0,200,1204,1,0,0,0,202,1209,1,0,0,0,204,1264,1,0,0,
		0,206,1266,1,0,0,0,208,1280,1,0,0,0,210,1282,1,0,0,0,212,1296,1,0,0,0,
		214,1298,1,0,0,0,216,1307,1,0,0,0,218,1325,1,0,0,0,220,1341,1,0,0,0,222,
		1366,1,0,0,0,224,1378,1,0,0,0,226,1380,1,0,0,0,228,1392,1,0,0,0,230,1395,
		1,0,0,0,232,1440,1,0,0,0,234,1442,1,0,0,0,236,1446,1,0,0,0,238,1451,1,
		0,0,0,240,1471,1,0,0,0,242,1473,1,0,0,0,244,1479,1,0,0,0,246,1489,1,0,
		0,0,248,1510,1,0,0,0,250,1516,1,0,0,0,252,1518,1,0,0,0,254,1524,1,0,0,
		0,256,1532,1,0,0,0,258,1552,1,0,0,0,260,1554,1,0,0,0,262,1572,1,0,0,0,
		264,1574,1,0,0,0,266,1592,1,0,0,0,268,1641,1,0,0,0,270,1652,1,0,0,0,272,
		1657,1,0,0,0,274,1661,1,0,0,0,276,1677,1,0,0,0,278,1679,1,0,0,0,280,1681,
		1,0,0,0,282,1721,1,0,0,0,284,1723,1,0,0,0,286,1733,1,0,0,0,288,1750,1,
		0,0,0,290,1770,1,0,0,0,292,1780,1,0,0,0,294,1784,1,0,0,0,296,298,3,2,1,
		0,297,296,1,0,0,0,298,301,1,0,0,0,299,297,1,0,0,0,299,300,1,0,0,0,300,
		302,1,0,0,0,301,299,1,0,0,0,302,303,5,0,0,1,303,1,1,0,0,0,304,316,3,4,
		2,0,305,316,3,120,60,0,306,316,3,138,69,0,307,316,3,6,3,0,308,316,3,10,
		5,0,309,316,3,8,4,0,310,316,3,12,6,0,311,316,3,16,8,0,312,316,3,20,10,
		0,313,316,3,22,11,0,314,316,3,122,61,0,315,304,1,0,0,0,315,305,1,0,0,0,
		315,306,1,0,0,0,315,307,1,0,0,0,315,308,1,0,0,0,315,309,1,0,0,0,315,310,
		1,0,0,0,315,311,1,0,0,0,315,312,1,0,0,0,315,313,1,0,0,0,315,314,1,0,0,
		0,316,3,1,0,0,0,317,318,5,67,0,0,318,319,3,294,147,0,319,320,5,138,0,0,
		320,5,1,0,0,0,321,323,5,124,0,0,322,321,1,0,0,0,322,323,1,0,0,0,323,324,
		1,0,0,0,324,325,5,66,0,0,325,328,3,14,7,0,326,327,5,150,0,0,327,329,3,
		294,147,0,328,326,1,0,0,0,328,329,1,0,0,0,329,334,1,0,0,0,330,331,5,146,
		0,0,331,332,3,24,12,0,332,333,5,145,0,0,333,335,1,0,0,0,334,330,1,0,0,
		0,334,335,1,0,0,0,335,337,1,0,0,0,336,338,3,34,17,0,337,336,1,0,0,0,337,
		338,1,0,0,0,338,340,1,0,0,0,339,341,3,40,20,0,340,339,1,0,0,0,340,341,
		1,0,0,0,341,342,1,0,0,0,342,343,5,63,0,0,343,7,1,0,0,0,344,345,5,66,0,
		0,345,346,3,14,7,0,346,348,5,132,0,0,347,349,3,294,147,0,348,347,1,0,0,
		0,348,349,1,0,0,0,349,350,1,0,0,0,350,355,5,133,0,0,351,352,5,146,0,0,
		352,353,3,24,12,0,353,354,5,145,0,0,354,356,1,0,0,0,355,351,1,0,0,0,355,
		356,1,0,0,0,356,358,1,0,0,0,357,359,3,34,17,0,358,357,1,0,0,0,358,359,
		1,0,0,0,359,361,1,0,0,0,360,362,3,40,20,0,361,360,1,0,0,0,361,362,1,0,
		0,0,362,363,1,0,0,0,363,364,5,63,0,0,364,9,1,0,0,0,365,366,5,65,0,0,366,
		369,3,14,7,0,367,368,5,150,0,0,368,370,3,294,147,0,369,367,1,0,0,0,369,
		370,1,0,0,0,370,372,1,0,0,0,371,373,3,34,17,0,372,371,1,0,0,0,372,373,
		1,0,0,0,373,375,1,0,0,0,374,376,3,48,24,0,375,374,1,0,0,0,375,376,1,0,
		0,0,376,377,1,0,0,0,377,378,5,63,0,0,378,11,1,0,0,0,379,380,5,65,0,0,380,
		381,3,14,7,0,381,382,5,132,0,0,382,383,3,294,147,0,383,385,5,133,0,0,384,
		386,3,48,24,0,385,384,1,0,0,0,385,386,1,0,0,0,386,387,1,0,0,0,387,388,
		5,63,0,0,388,13,1,0,0,0,389,395,3,294,147,0,390,391,5,146,0,0,391,392,
		3,24,12,0,392,393,5,145,0,0,393,396,1,0,0,0,394,396,3,72,36,0,395,390,
		1,0,0,0,395,394,1,0,0,0,395,396,1,0,0,0,396,15,1,0,0,0,397,399,3,204,102,
		0,398,397,1,0,0,0,398,399,1,0,0,0,399,400,1,0,0,0,400,401,5,69,0,0,401,
		406,3,32,16,0,402,403,5,146,0,0,403,404,3,24,12,0,404,405,5,145,0,0,405,
		407,1,0,0,0,406,402,1,0,0,0,406,407,1,0,0,0,407,411,1,0,0,0,408,410,3,
		18,9,0,409,408,1,0,0,0,410,413,1,0,0,0,411,409,1,0,0,0,411,412,1,0,0,0,
		412,414,1,0,0,0,413,411,1,0,0,0,414,415,5,63,0,0,415,17,1,0,0,0,416,420,
		7,0,0,0,417,419,3,40,20,0,418,417,1,0,0,0,419,422,1,0,0,0,420,418,1,0,
		0,0,420,421,1,0,0,0,421,429,1,0,0,0,422,420,1,0,0,0,423,425,3,40,20,0,
		424,423,1,0,0,0,425,426,1,0,0,0,426,424,1,0,0,0,426,427,1,0,0,0,427,429,
		1,0,0,0,428,416,1,0,0,0,428,424,1,0,0,0,429,19,1,0,0,0,430,431,5,69,0,
		0,431,432,3,24,12,0,432,433,5,138,0,0,433,21,1,0,0,0,434,435,5,60,0,0,
		435,440,3,294,147,0,436,437,5,139,0,0,437,439,3,294,147,0,438,436,1,0,
		0,0,439,442,1,0,0,0,440,438,1,0,0,0,440,441,1,0,0,0,441,443,1,0,0,0,442,
		440,1,0,0,0,443,444,5,138,0,0,444,23,1,0,0,0,445,450,3,32,16,0,446,447,
		5,139,0,0,447,449,3,32,16,0,448,446,1,0,0,0,449,452,1,0,0,0,450,448,1,
		0,0,0,450,451,1,0,0,0,451,25,1,0,0,0,452,450,1,0,0,0,453,458,5,72,0,0,
		454,455,5,132,0,0,455,456,3,28,14,0,456,457,5,133,0,0,457,459,1,0,0,0,
		458,454,1,0,0,0,458,459,1,0,0,0,459,461,1,0,0,0,460,462,3,166,83,0,461,
		460,1,0,0,0,461,462,1,0,0,0,462,464,1,0,0,0,463,465,5,123,0,0,464,463,
		1,0,0,0,464,465,1,0,0,0,465,466,1,0,0,0,466,467,3,162,81,0,467,27,1,0,
		0,0,468,473,3,30,15,0,469,470,5,139,0,0,470,472,3,30,15,0,471,469,1,0,
		0,0,472,475,1,0,0,0,473,471,1,0,0,0,473,474,1,0,0,0,474,29,1,0,0,0,475,
		473,1,0,0,0,476,497,5,81,0,0,477,497,5,82,0,0,478,497,5,116,0,0,479,497,
		5,119,0,0,480,497,5,83,0,0,481,497,5,112,0,0,482,497,5,120,0,0,483,497,
		5,113,0,0,484,497,5,117,0,0,485,497,5,118,0,0,486,487,5,114,0,0,487,488,
		5,144,0,0,488,497,3,294,147,0,489,490,5,115,0,0,490,491,5,144,0,0,491,
		492,3,294,147,0,492,493,5,150,0,0,493,497,1,0,0,0,494,497,3,170,85,0,495,
		497,3,294,147,0,496,476,1,0,0,0,496,477,1,0,0,0,496,478,1,0,0,0,496,479,
		1,0,0,0,496,480,1,0,0,0,496,481,1,0,0,0,496,482,1,0,0,0,496,483,1,0,0,
		0,496,484,1,0,0,0,496,485,1,0,0,0,496,486,1,0,0,0,496,489,1,0,0,0,496,
		494,1,0,0,0,496,495,1,0,0,0,497,31,1,0,0,0,498,499,5,146,0,0,499,500,3,
		24,12,0,500,501,5,145,0,0,501,507,1,0,0,0,502,504,7,1,0,0,503,502,1,0,
		0,0,503,504,1,0,0,0,504,505,1,0,0,0,505,507,3,294,147,0,506,498,1,0,0,
		0,506,503,1,0,0,0,507,33,1,0,0,0,508,512,5,134,0,0,509,511,3,36,18,0,510,
		509,1,0,0,0,511,514,1,0,0,0,512,510,1,0,0,0,512,513,1,0,0,0,513,515,1,
		0,0,0,514,512,1,0,0,0,515,516,5,135,0,0,516,35,1,0,0,0,517,521,3,38,19,
		0,518,520,3,162,81,0,519,518,1,0,0,0,520,523,1,0,0,0,521,519,1,0,0,0,521,
		522,1,0,0,0,522,530,1,0,0,0,523,521,1,0,0,0,524,526,3,162,81,0,525,524,
		1,0,0,0,526,527,1,0,0,0,527,525,1,0,0,0,527,528,1,0,0,0,528,530,1,0,0,
		0,529,517,1,0,0,0,529,525,1,0,0,0,530,37,1,0,0,0,531,532,7,2,0,0,532,39,
		1,0,0,0,533,539,3,138,69,0,534,539,3,42,21,0,535,539,3,44,22,0,536,539,
		3,26,13,0,537,539,3,120,60,0,538,533,1,0,0,0,538,534,1,0,0,0,538,535,1,
		0,0,0,538,536,1,0,0,0,538,537,1,0,0,0,539,540,1,0,0,0,540,538,1,0,0,0,
		540,541,1,0,0,0,541,41,1,0,0,0,542,543,5,159,0,0,543,544,3,46,23,0,544,
		43,1,0,0,0,545,546,5,160,0,0,546,547,3,46,23,0,547,45,1,0,0,0,548,550,
		3,62,31,0,549,548,1,0,0,0,549,550,1,0,0,0,550,551,1,0,0,0,551,555,3,56,
		28,0,552,554,3,204,102,0,553,552,1,0,0,0,554,557,1,0,0,0,555,553,1,0,0,
		0,555,556,1,0,0,0,556,558,1,0,0,0,557,555,1,0,0,0,558,559,5,138,0,0,559,
		47,1,0,0,0,560,566,3,122,61,0,561,566,3,138,69,0,562,566,3,50,25,0,563,
		566,3,52,26,0,564,566,3,64,32,0,565,560,1,0,0,0,565,561,1,0,0,0,565,562,
		1,0,0,0,565,563,1,0,0,0,565,564,1,0,0,0,566,567,1,0,0,0,567,565,1,0,0,
		0,567,568,1,0,0,0,568,49,1,0,0,0,569,570,5,159,0,0,570,571,3,54,27,0,571,
		51,1,0,0,0,572,573,5,160,0,0,573,574,3,54,27,0,574,53,1,0,0,0,575,577,
		3,62,31,0,576,575,1,0,0,0,576,577,1,0,0,0,577,578,1,0,0,0,578,580,3,56,
		28,0,579,581,3,156,78,0,580,579,1,0,0,0,580,581,1,0,0,0,581,583,1,0,0,
		0,582,584,5,138,0,0,583,582,1,0,0,0,583,584,1,0,0,0,584,585,1,0,0,0,585,
		586,3,238,119,0,586,55,1,0,0,0,587,598,3,60,30,0,588,590,3,58,29,0,589,
		588,1,0,0,0,590,591,1,0,0,0,591,589,1,0,0,0,591,592,1,0,0,0,592,595,1,
		0,0,0,593,594,5,139,0,0,594,596,5,177,0,0,595,593,1,0,0,0,595,596,1,0,
		0,0,596,598,1,0,0,0,597,587,1,0,0,0,597,589,1,0,0,0,598,57,1,0,0,0,599,
		601,3,60,30,0,600,599,1,0,0,0,600,601,1,0,0,0,601,602,1,0,0,0,602,606,
		5,150,0,0,603,605,3,62,31,0,604,603,1,0,0,0,605,608,1,0,0,0,606,604,1,
		0,0,0,606,607,1,0,0,0,607,610,1,0,0,0,608,606,1,0,0,0,609,611,3,168,84,
		0,610,609,1,0,0,0,610,611,1,0,0,0,611,612,1,0,0,0,612,613,3,294,147,0,
		613,59,1,0,0,0,614,617,3,294,147,0,615,617,5,22,0,0,616,614,1,0,0,0,616,
		615,1,0,0,0,617,61,1,0,0,0,618,619,5,132,0,0,619,620,3,220,110,0,620,621,
		5,133,0,0,621,63,1,0,0,0,622,623,5,78,0,0,623,624,3,66,33,0,624,625,5,
		138,0,0,625,631,1,0,0,0,626,627,5,61,0,0,627,628,3,66,33,0,628,629,5,138,
		0,0,629,631,1,0,0,0,630,622,1,0,0,0,630,626,1,0,0,0,631,65,1,0,0,0,632,
		637,3,68,34,0,633,634,5,139,0,0,634,636,3,68,34,0,635,633,1,0,0,0,636,
		639,1,0,0,0,637,635,1,0,0,0,637,638,1,0,0,0,638,67,1,0,0,0,639,637,1,0,
		0,0,640,643,3,294,147,0,641,642,5,144,0,0,642,644,3,294,147,0,643,641,
		1,0,0,0,643,644,1,0,0,0,644,69,1,0,0,0,645,647,3,170,85,0,646,645,1,0,
		0,0,646,647,1,0,0,0,647,648,1,0,0,0,648,650,3,180,90,0,649,651,3,170,85,
		0,650,649,1,0,0,0,650,651,1,0,0,0,651,652,1,0,0,0,652,654,5,132,0,0,653,
		655,5,107,0,0,654,653,1,0,0,0,654,655,1,0,0,0,655,656,1,0,0,0,656,659,
		5,165,0,0,657,660,3,170,85,0,658,660,3,180,90,0,659,657,1,0,0,0,659,658,
		1,0,0,0,659,660,1,0,0,0,660,661,1,0,0,0,661,663,5,133,0,0,662,664,3,84,
		42,0,663,662,1,0,0,0,663,664,1,0,0,0,664,71,1,0,0,0,665,674,5,146,0,0,
		666,671,3,74,37,0,667,668,5,139,0,0,668,670,3,74,37,0,669,667,1,0,0,0,
		670,673,1,0,0,0,671,669,1,0,0,0,671,672,1,0,0,0,672,675,1,0,0,0,673,671,
		1,0,0,0,674,666,1,0,0,0,674,675,1,0,0,0,675,676,1,0,0,0,676,677,5,145,
		0,0,677,73,1,0,0,0,678,680,3,174,87,0,679,678,1,0,0,0,680,683,1,0,0,0,
		681,679,1,0,0,0,681,682,1,0,0,0,682,684,1,0,0,0,683,681,1,0,0,0,684,687,
		3,180,90,0,685,687,3,220,110,0,686,681,1,0,0,0,686,685,1,0,0,0,687,75,
		1,0,0,0,688,689,5,142,0,0,689,701,5,134,0,0,690,695,3,78,39,0,691,692,
		5,139,0,0,692,694,3,78,39,0,693,691,1,0,0,0,694,697,1,0,0,0,695,693,1,
		0,0,0,695,696,1,0,0,0,696,699,1,0,0,0,697,695,1,0,0,0,698,700,5,139,0,
		0,699,698,1,0,0,0,699,700,1,0,0,0,700,702,1,0,0,0,701,690,1,0,0,0,701,
		702,1,0,0,0,702,703,1,0,0,0,703,704,5,135,0,0,704,77,1,0,0,0,705,706,3,
		270,135,0,706,707,5,150,0,0,707,708,3,266,133,0,708,79,1,0,0,0,709,710,
		5,142,0,0,710,715,5,136,0,0,711,713,3,264,132,0,712,714,5,139,0,0,713,
		712,1,0,0,0,713,714,1,0,0,0,714,716,1,0,0,0,715,711,1,0,0,0,715,716,1,
		0,0,0,716,717,1,0,0,0,717,718,5,137,0,0,718,81,1,0,0,0,719,720,5,142,0,
		0,720,721,5,132,0,0,721,722,3,266,133,0,722,723,5,133,0,0,723,730,1,0,
		0,0,724,727,5,142,0,0,725,728,3,290,145,0,726,728,3,294,147,0,727,725,
		1,0,0,0,727,726,1,0,0,0,728,730,1,0,0,0,729,719,1,0,0,0,729,724,1,0,0,
		0,730,83,1,0,0,0,731,743,5,132,0,0,732,735,3,86,43,0,733,735,5,32,0,0,
		734,732,1,0,0,0,734,733,1,0,0,0,735,740,1,0,0,0,736,737,5,139,0,0,737,
		739,3,86,43,0,738,736,1,0,0,0,739,742,1,0,0,0,740,738,1,0,0,0,740,741,
		1,0,0,0,741,744,1,0,0,0,742,740,1,0,0,0,743,734,1,0,0,0,743,744,1,0,0,
		0,744,745,1,0,0,0,745,746,5,133,0,0,746,85,1,0,0,0,747,750,3,108,54,0,
		748,750,3,220,110,0,749,747,1,0,0,0,749,748,1,0,0,0,750,87,1,0,0,0,751,
		753,5,165,0,0,752,754,3,180,90,0,753,752,1,0,0,0,753,754,1,0,0,0,754,756,
		1,0,0,0,755,757,3,170,85,0,756,755,1,0,0,0,756,757,1,0,0,0,757,759,1,0,
		0,0,758,760,3,84,42,0,759,758,1,0,0,0,759,760,1,0,0,0,760,761,1,0,0,0,
		761,762,3,238,119,0,762,89,1,0,0,0,763,764,5,136,0,0,764,765,3,92,46,0,
		765,766,3,94,47,0,766,767,5,137,0,0,767,91,1,0,0,0,768,771,3,266,133,0,
		769,771,3,180,90,0,770,768,1,0,0,0,770,769,1,0,0,0,771,93,1,0,0,0,772,
		779,3,60,30,0,773,775,3,96,48,0,774,773,1,0,0,0,775,776,1,0,0,0,776,774,
		1,0,0,0,776,777,1,0,0,0,777,779,1,0,0,0,778,772,1,0,0,0,778,774,1,0,0,
		0,779,95,1,0,0,0,780,782,3,60,30,0,781,780,1,0,0,0,781,782,1,0,0,0,782,
		783,1,0,0,0,783,784,5,150,0,0,784,789,3,98,49,0,785,786,5,139,0,0,786,
		788,3,98,49,0,787,785,1,0,0,0,788,791,1,0,0,0,789,787,1,0,0,0,789,790,
		1,0,0,0,790,97,1,0,0,0,791,789,1,0,0,0,792,794,3,264,132,0,793,795,3,170,
		85,0,794,793,1,0,0,0,794,795,1,0,0,0,795,800,1,0,0,0,796,797,5,134,0,0,
		797,798,3,218,109,0,798,799,5,135,0,0,799,801,1,0,0,0,800,796,1,0,0,0,
		800,801,1,0,0,0,801,99,1,0,0,0,802,803,5,76,0,0,803,804,5,132,0,0,804,
		805,3,102,51,0,805,806,5,133,0,0,806,101,1,0,0,0,807,818,3,60,30,0,808,
		818,5,143,0,0,809,811,3,60,30,0,810,809,1,0,0,0,810,811,1,0,0,0,811,812,
		1,0,0,0,812,814,5,150,0,0,813,810,1,0,0,0,814,815,1,0,0,0,815,813,1,0,
		0,0,815,816,1,0,0,0,816,818,1,0,0,0,817,807,1,0,0,0,817,808,1,0,0,0,817,
		813,1,0,0,0,818,103,1,0,0,0,819,820,5,69,0,0,820,821,5,132,0,0,821,822,
		3,32,16,0,822,823,5,133,0,0,823,105,1,0,0,0,824,825,5,62,0,0,825,826,5,
		132,0,0,826,827,3,220,110,0,827,828,5,133,0,0,828,107,1,0,0,0,829,830,
		3,152,76,0,830,831,3,230,115,0,831,109,1,0,0,0,832,833,5,79,0,0,833,834,
		5,132,0,0,834,835,3,294,147,0,835,836,5,133,0,0,836,840,1,0,0,0,837,838,
		5,79,0,0,838,840,3,266,133,0,839,832,1,0,0,0,839,837,1,0,0,0,840,111,1,
		0,0,0,841,842,5,80,0,0,842,846,3,238,119,0,843,845,3,114,57,0,844,843,
		1,0,0,0,845,848,1,0,0,0,846,844,1,0,0,0,846,847,1,0,0,0,847,851,1,0,0,
		0,848,846,1,0,0,0,849,850,5,64,0,0,850,852,3,238,119,0,851,849,1,0,0,0,
		851,852,1,0,0,0,852,113,1,0,0,0,853,854,5,59,0,0,854,855,5,132,0,0,855,
		856,3,108,54,0,856,857,5,133,0,0,857,858,3,238,119,0,858,115,1,0,0,0,859,
		860,5,77,0,0,860,861,5,132,0,0,861,862,3,266,133,0,862,863,5,133,0,0,863,
		864,3,238,119,0,864,117,1,0,0,0,865,866,5,58,0,0,866,867,3,238,119,0,867,
		119,1,0,0,0,868,869,3,124,62,0,869,870,5,138,0,0,870,121,1,0,0,0,871,872,
		3,124,62,0,872,873,3,238,119,0,873,123,1,0,0,0,874,876,3,152,76,0,875,
		874,1,0,0,0,875,876,1,0,0,0,876,877,1,0,0,0,877,878,3,294,147,0,878,880,
		5,132,0,0,879,881,3,200,100,0,880,879,1,0,0,0,880,881,1,0,0,0,881,882,
		1,0,0,0,882,883,5,133,0,0,883,885,1,0,0,0,884,886,3,154,77,0,885,884,1,
		0,0,0,885,886,1,0,0,0,886,125,1,0,0,0,887,889,3,128,64,0,888,890,3,130,
		65,0,889,888,1,0,0,0,889,890,1,0,0,0,890,127,1,0,0,0,891,894,5,5,0,0,892,
		894,3,294,147,0,893,891,1,0,0,0,893,892,1,0,0,0,894,129,1,0,0,0,895,897,
		5,132,0,0,896,898,3,132,66,0,897,896,1,0,0,0,897,898,1,0,0,0,898,899,1,
		0,0,0,899,900,5,133,0,0,900,131,1,0,0,0,901,906,3,134,67,0,902,903,5,139,
		0,0,903,905,3,134,67,0,904,902,1,0,0,0,905,908,1,0,0,0,906,904,1,0,0,0,
		906,907,1,0,0,0,907,133,1,0,0,0,908,906,1,0,0,0,909,914,3,126,63,0,910,
		914,3,290,145,0,911,914,3,292,146,0,912,914,3,136,68,0,913,909,1,0,0,0,
		913,910,1,0,0,0,913,911,1,0,0,0,913,912,1,0,0,0,914,135,1,0,0,0,915,916,
		3,128,64,0,916,920,5,144,0,0,917,921,3,290,145,0,918,921,3,128,64,0,919,
		921,3,292,146,0,920,917,1,0,0,0,920,918,1,0,0,0,920,919,1,0,0,0,921,137,
		1,0,0,0,922,927,3,140,70,0,923,927,3,142,71,0,924,927,3,144,72,0,925,927,
		3,146,73,0,926,922,1,0,0,0,926,923,1,0,0,0,926,924,1,0,0,0,926,925,1,0,
		0,0,927,139,1,0,0,0,928,930,3,154,77,0,929,928,1,0,0,0,929,930,1,0,0,0,
		930,931,1,0,0,0,931,933,3,294,147,0,932,934,3,154,77,0,933,932,1,0,0,0,
		933,934,1,0,0,0,934,935,1,0,0,0,935,936,5,132,0,0,936,937,3,196,98,0,937,
		938,5,133,0,0,938,939,5,138,0,0,939,141,1,0,0,0,940,942,3,154,77,0,941,
		940,1,0,0,0,941,942,1,0,0,0,942,944,1,0,0,0,943,945,5,29,0,0,944,943,1,
		0,0,0,944,945,1,0,0,0,945,946,1,0,0,0,946,948,3,188,94,0,947,949,3,294,
		147,0,948,947,1,0,0,0,948,949,1,0,0,0,949,950,1,0,0,0,950,951,5,138,0,
		0,951,143,1,0,0,0,952,953,3,152,76,0,953,954,3,156,78,0,954,957,1,0,0,
		0,955,957,3,152,76,0,956,952,1,0,0,0,956,955,1,0,0,0,957,958,1,0,0,0,958,
		959,5,138,0,0,959,145,1,0,0,0,960,962,3,154,77,0,961,960,1,0,0,0,961,962,
		1,0,0,0,962,963,1,0,0,0,963,968,5,29,0,0,964,965,3,152,76,0,965,966,3,
		148,74,0,966,969,1,0,0,0,967,969,3,152,76,0,968,964,1,0,0,0,968,967,1,
		0,0,0,969,970,1,0,0,0,970,971,5,138,0,0,971,147,1,0,0,0,972,977,3,150,
		75,0,973,974,5,139,0,0,974,976,3,150,75,0,975,973,1,0,0,0,976,979,1,0,
		0,0,977,975,1,0,0,0,977,978,1,0,0,0,978,149,1,0,0,0,979,977,1,0,0,0,980,
		982,3,202,101,0,981,980,1,0,0,0,981,982,1,0,0,0,982,983,1,0,0,0,983,984,
		3,196,98,0,984,151,1,0,0,0,985,994,3,172,86,0,986,994,3,154,77,0,987,994,
		3,168,84,0,988,994,3,170,85,0,989,994,3,166,83,0,990,994,3,174,87,0,991,
		994,3,176,88,0,992,994,3,180,90,0,993,985,1,0,0,0,993,986,1,0,0,0,993,
		987,1,0,0,0,993,988,1,0,0,0,993,989,1,0,0,0,993,990,1,0,0,0,993,991,1,
		0,0,0,993,992,1,0,0,0,994,995,1,0,0,0,995,993,1,0,0,0,995,996,1,0,0,0,
		996,153,1,0,0,0,997,998,5,84,0,0,998,999,5,132,0,0,999,1000,5,132,0,0,
		1000,1005,3,126,63,0,1001,1002,5,139,0,0,1002,1004,3,126,63,0,1003,1001,
		1,0,0,0,1004,1007,1,0,0,0,1005,1003,1,0,0,0,1005,1006,1,0,0,0,1006,1008,
		1,0,0,0,1007,1005,1,0,0,0,1008,1009,5,133,0,0,1009,1010,5,133,0,0,1010,
		155,1,0,0,0,1011,1016,3,158,79,0,1012,1013,5,139,0,0,1013,1015,3,158,79,
		0,1014,1012,1,0,0,0,1015,1018,1,0,0,0,1016,1014,1,0,0,0,1016,1017,1,0,
		0,0,1017,157,1,0,0,0,1018,1016,1,0,0,0,1019,1022,3,230,115,0,1020,1021,
		5,144,0,0,1021,1023,3,272,136,0,1022,1020,1,0,0,0,1022,1023,1,0,0,0,1023,
		159,1,0,0,0,1024,1037,7,3,0,0,1025,1038,3,294,147,0,1026,1028,3,294,147,
		0,1027,1026,1,0,0,0,1027,1028,1,0,0,0,1028,1029,1,0,0,0,1029,1031,5,134,
		0,0,1030,1032,3,162,81,0,1031,1030,1,0,0,0,1032,1033,1,0,0,0,1033,1031,
		1,0,0,0,1033,1034,1,0,0,0,1034,1035,1,0,0,0,1035,1036,5,135,0,0,1036,1038,
		1,0,0,0,1037,1025,1,0,0,0,1037,1027,1,0,0,0,1038,161,1,0,0,0,1039,1040,
		3,164,82,0,1040,1042,3,184,92,0,1041,1043,3,204,102,0,1042,1041,1,0,0,
		0,1042,1043,1,0,0,0,1043,1044,1,0,0,0,1044,1045,5,138,0,0,1045,163,1,0,
		0,0,1046,1053,3,168,84,0,1047,1053,3,170,85,0,1048,1053,3,166,83,0,1049,
		1053,3,174,87,0,1050,1053,3,176,88,0,1051,1053,3,180,90,0,1052,1046,1,
		0,0,0,1052,1047,1,0,0,0,1052,1048,1,0,0,0,1052,1049,1,0,0,0,1052,1050,
		1,0,0,0,1052,1051,1,0,0,0,1053,1054,1,0,0,0,1054,1052,1,0,0,0,1054,1055,
		1,0,0,0,1055,165,1,0,0,0,1056,1057,5,122,0,0,1057,1058,5,132,0,0,1058,
		1059,3,294,147,0,1059,1060,5,133,0,0,1060,1063,1,0,0,0,1061,1063,5,121,
		0,0,1062,1056,1,0,0,0,1062,1061,1,0,0,0,1063,167,1,0,0,0,1064,1065,7,4,
		0,0,1065,169,1,0,0,0,1066,1067,7,5,0,0,1067,171,1,0,0,0,1068,1069,7,6,
		0,0,1069,173,1,0,0,0,1070,1071,7,7,0,0,1071,175,1,0,0,0,1072,1077,5,5,
		0,0,1073,1077,5,33,0,0,1074,1077,5,21,0,0,1075,1077,3,178,89,0,1076,1072,
		1,0,0,0,1076,1073,1,0,0,0,1076,1074,1,0,0,0,1076,1075,1,0,0,0,1077,177,
		1,0,0,0,1078,1079,7,8,0,0,1079,179,1,0,0,0,1080,1098,5,32,0,0,1081,1098,
		5,4,0,0,1082,1098,5,23,0,0,1083,1098,5,18,0,0,1084,1098,5,19,0,0,1085,
		1098,5,13,0,0,1086,1098,5,9,0,0,1087,1098,5,24,0,0,1088,1098,5,31,0,0,
		1089,1098,3,182,91,0,1090,1098,3,14,7,0,1091,1098,3,160,80,0,1092,1098,
		3,188,94,0,1093,1095,3,294,147,0,1094,1096,3,202,101,0,1095,1094,1,0,0,
		0,1095,1096,1,0,0,0,1096,1098,1,0,0,0,1097,1080,1,0,0,0,1097,1081,1,0,
		0,0,1097,1082,1,0,0,0,1097,1083,1,0,0,0,1097,1084,1,0,0,0,1097,1085,1,
		0,0,0,1097,1086,1,0,0,0,1097,1087,1,0,0,0,1097,1088,1,0,0,0,1097,1089,
		1,0,0,0,1097,1090,1,0,0,0,1097,1091,1,0,0,0,1097,1092,1,0,0,0,1097,1093,
		1,0,0,0,1098,181,1,0,0,0,1099,1100,5,95,0,0,1100,1101,5,132,0,0,1101,1102,
		3,266,133,0,1102,1103,5,133,0,0,1103,183,1,0,0,0,1104,1109,3,186,93,0,
		1105,1106,5,139,0,0,1106,1108,3,186,93,0,1107,1105,1,0,0,0,1108,1111,1,
		0,0,0,1109,1107,1,0,0,0,1109,1110,1,0,0,0,1110,185,1,0,0,0,1111,1109,1,
		0,0,0,1112,1119,3,230,115,0,1113,1115,3,230,115,0,1114,1113,1,0,0,0,1114,
		1115,1,0,0,0,1115,1116,1,0,0,0,1116,1117,5,150,0,0,1117,1119,3,290,145,
		0,1118,1112,1,0,0,0,1118,1114,1,0,0,0,1119,187,1,0,0,0,1120,1126,5,11,
		0,0,1121,1123,3,294,147,0,1122,1121,1,0,0,0,1122,1123,1,0,0,0,1123,1124,
		1,0,0,0,1124,1125,5,150,0,0,1125,1127,3,220,110,0,1126,1122,1,0,0,0,1126,
		1127,1,0,0,0,1127,1139,1,0,0,0,1128,1133,3,294,147,0,1129,1130,5,134,0,
		0,1130,1131,3,190,95,0,1131,1132,5,135,0,0,1132,1134,1,0,0,0,1133,1129,
		1,0,0,0,1133,1134,1,0,0,0,1134,1140,1,0,0,0,1135,1136,5,134,0,0,1136,1137,
		3,190,95,0,1137,1138,5,135,0,0,1138,1140,1,0,0,0,1139,1128,1,0,0,0,1139,
		1135,1,0,0,0,1140,1152,1,0,0,0,1141,1142,7,9,0,0,1142,1143,5,132,0,0,1143,
		1144,3,220,110,0,1144,1145,5,139,0,0,1145,1146,3,294,147,0,1146,1147,5,
		133,0,0,1147,1148,5,134,0,0,1148,1149,3,190,95,0,1149,1150,5,135,0,0,1150,
		1152,1,0,0,0,1151,1120,1,0,0,0,1151,1141,1,0,0,0,1152,189,1,0,0,0,1153,
		1158,3,192,96,0,1154,1155,5,139,0,0,1155,1157,3,192,96,0,1156,1154,1,0,
		0,0,1157,1160,1,0,0,0,1158,1156,1,0,0,0,1158,1159,1,0,0,0,1159,1162,1,
		0,0,0,1160,1158,1,0,0,0,1161,1163,5,139,0,0,1162,1161,1,0,0,0,1162,1163,
		1,0,0,0,1163,191,1,0,0,0,1164,1167,3,194,97,0,1165,1166,5,144,0,0,1166,
		1168,3,266,133,0,1167,1165,1,0,0,0,1167,1168,1,0,0,0,1168,193,1,0,0,0,
		1169,1172,3,294,147,0,1170,1172,5,7,0,0,1171,1169,1,0,0,0,1171,1170,1,
		0,0,0,1172,195,1,0,0,0,1173,1179,3,294,147,0,1174,1175,5,132,0,0,1175,
		1176,3,230,115,0,1176,1177,5,133,0,0,1177,1179,1,0,0,0,1178,1173,1,0,0,
		0,1178,1174,1,0,0,0,1179,1183,1,0,0,0,1180,1182,3,198,99,0,1181,1180,1,
		0,0,0,1182,1185,1,0,0,0,1183,1181,1,0,0,0,1183,1184,1,0,0,0,1184,1197,
		1,0,0,0,1185,1183,1,0,0,0,1186,1187,5,132,0,0,1187,1189,5,165,0,0,1188,
		1190,3,170,85,0,1189,1188,1,0,0,0,1189,1190,1,0,0,0,1190,1192,1,0,0,0,
		1191,1193,3,294,147,0,1192,1191,1,0,0,0,1192,1193,1,0,0,0,1193,1194,1,
		0,0,0,1194,1195,5,133,0,0,1195,1197,3,84,42,0,1196,1178,1,0,0,0,1196,1186,
		1,0,0,0,1197,197,1,0,0,0,1198,1200,5,136,0,0,1199,1201,3,274,137,0,1200,
		1199,1,0,0,0,1200,1201,1,0,0,0,1201,1202,1,0,0,0,1202,1203,5,137,0,0,1203,
		199,1,0,0,0,1204,1207,3,226,113,0,1205,1206,5,139,0,0,1206,1208,5,177,
		0,0,1207,1205,1,0,0,0,1207,1208,1,0,0,0,1208,201,1,0,0,0,1209,1211,5,161,
		0,0,1210,1212,3,152,76,0,1211,1210,1,0,0,0,1211,1212,1,0,0,0,1212,1214,
		1,0,0,0,1213,1215,3,202,101,0,1214,1213,1,0,0,0,1214,1215,1,0,0,0,1215,
		203,1,0,0,0,1216,1228,3,294,147,0,1217,1218,5,132,0,0,1218,1223,3,288,
		144,0,1219,1220,5,139,0,0,1220,1222,3,288,144,0,1221,1219,1,0,0,0,1222,
		1225,1,0,0,0,1223,1221,1,0,0,0,1223,1224,1,0,0,0,1224,1226,1,0,0,0,1225,
		1223,1,0,0,0,1226,1227,5,133,0,0,1227,1229,1,0,0,0,1228,1217,1,0,0,0,1228,
		1229,1,0,0,0,1229,1265,1,0,0,0,1230,1231,5,106,0,0,1231,1232,5,132,0,0,
		1232,1233,3,206,103,0,1233,1234,5,133,0,0,1234,1265,1,0,0,0,1235,1236,
		5,110,0,0,1236,1237,5,132,0,0,1237,1242,3,210,105,0,1238,1239,5,139,0,
		0,1239,1241,3,210,105,0,1240,1238,1,0,0,0,1241,1244,1,0,0,0,1242,1240,
		1,0,0,0,1242,1243,1,0,0,0,1243,1245,1,0,0,0,1244,1242,1,0,0,0,1245,1246,
		5,133,0,0,1246,1265,1,0,0,0,1247,1248,5,111,0,0,1248,1249,5,132,0,0,1249,
		1254,3,294,147,0,1250,1251,5,139,0,0,1251,1253,3,294,147,0,1252,1250,1,
		0,0,0,1253,1256,1,0,0,0,1254,1252,1,0,0,0,1254,1255,1,0,0,0,1255,1257,
		1,0,0,0,1256,1254,1,0,0,0,1257,1258,5,133,0,0,1258,1265,1,0,0,0,1259,1260,
		5,109,0,0,1260,1261,5,132,0,0,1261,1262,3,292,146,0,1262,1263,5,133,0,
		0,1263,1265,1,0,0,0,1264,1216,1,0,0,0,1264,1230,1,0,0,0,1264,1235,1,0,
		0,0,1264,1247,1,0,0,0,1264,1259,1,0,0,0,1265,205,1,0,0,0,1266,1267,3,294,
		147,0,1267,1273,5,132,0,0,1268,1269,3,208,104,0,1269,1270,5,150,0,0,1270,
		1272,1,0,0,0,1271,1268,1,0,0,0,1272,1275,1,0,0,0,1273,1271,1,0,0,0,1273,
		1274,1,0,0,0,1274,1276,1,0,0,0,1275,1273,1,0,0,0,1276,1277,5,133,0,0,1277,
		207,1,0,0,0,1278,1281,3,294,147,0,1279,1281,5,143,0,0,1280,1278,1,0,0,
		0,1280,1279,1,0,0,0,1281,209,1,0,0,0,1282,1283,3,294,147,0,1283,1284,5,
		132,0,0,1284,1285,3,212,106,0,1285,1286,5,133,0,0,1286,211,1,0,0,0,1287,
		1297,5,184,0,0,1288,1293,5,183,0,0,1289,1290,5,140,0,0,1290,1292,5,183,
		0,0,1291,1289,1,0,0,0,1292,1295,1,0,0,0,1293,1291,1,0,0,0,1293,1294,1,
		0,0,0,1294,1297,1,0,0,0,1295,1293,1,0,0,0,1296,1287,1,0,0,0,1296,1288,
		1,0,0,0,1297,213,1,0,0,0,1298,1303,5,134,0,0,1299,1301,3,264,132,0,1300,
		1302,5,139,0,0,1301,1300,1,0,0,0,1301,1302,1,0,0,0,1302,1304,1,0,0,0,1303,
		1299,1,0,0,0,1303,1304,1,0,0,0,1304,1305,1,0,0,0,1305,1306,5,135,0,0,1306,
		215,1,0,0,0,1307,1321,5,134,0,0,1308,1309,5,140,0,0,1309,1315,3,266,133,
		0,1310,1311,5,139,0,0,1311,1312,5,140,0,0,1312,1314,3,266,133,0,1313,1310,
		1,0,0,0,1314,1317,1,0,0,0,1315,1313,1,0,0,0,1315,1316,1,0,0,0,1316,1319,
		1,0,0,0,1317,1315,1,0,0,0,1318,1320,5,139,0,0,1319,1318,1,0,0,0,1319,1320,
		1,0,0,0,1320,1322,1,0,0,0,1321,1308,1,0,0,0,1321,1322,1,0,0,0,1322,1323,
		1,0,0,0,1323,1324,5,135,0,0,1324,217,1,0,0,0,1325,1330,3,272,136,0,1326,
		1327,5,139,0,0,1327,1329,3,272,136,0,1328,1326,1,0,0,0,1329,1332,1,0,0,
		0,1330,1328,1,0,0,0,1330,1331,1,0,0,0,1331,1334,1,0,0,0,1332,1330,1,0,
		0,0,1333,1335,5,139,0,0,1334,1333,1,0,0,0,1334,1335,1,0,0,0,1335,219,1,
		0,0,0,1336,1338,3,164,82,0,1337,1339,3,222,111,0,1338,1337,1,0,0,0,1338,
		1339,1,0,0,0,1339,1342,1,0,0,0,1340,1342,3,70,35,0,1341,1336,1,0,0,0,1341,
		1340,1,0,0,0,1342,221,1,0,0,0,1343,1345,3,202,101,0,1344,1346,3,222,111,
		0,1345,1344,1,0,0,0,1345,1346,1,0,0,0,1346,1367,1,0,0,0,1347,1349,5,132,
		0,0,1348,1350,3,222,111,0,1349,1348,1,0,0,0,1349,1350,1,0,0,0,1350,1351,
		1,0,0,0,1351,1353,5,133,0,0,1352,1354,3,224,112,0,1353,1352,1,0,0,0,1354,
		1355,1,0,0,0,1355,1353,1,0,0,0,1355,1356,1,0,0,0,1356,1367,1,0,0,0,1357,
		1359,5,136,0,0,1358,1360,3,274,137,0,1359,1358,1,0,0,0,1359,1360,1,0,0,
		0,1360,1361,1,0,0,0,1361,1363,5,137,0,0,1362,1357,1,0,0,0,1363,1364,1,
		0,0,0,1364,1362,1,0,0,0,1364,1365,1,0,0,0,1365,1367,1,0,0,0,1366,1343,
		1,0,0,0,1366,1347,1,0,0,0,1366,1362,1,0,0,0,1367,223,1,0,0,0,1368,1370,
		5,136,0,0,1369,1371,3,274,137,0,1370,1369,1,0,0,0,1370,1371,1,0,0,0,1371,
		1372,1,0,0,0,1372,1379,5,137,0,0,1373,1375,5,132,0,0,1374,1376,3,226,113,
		0,1375,1374,1,0,0,0,1375,1376,1,0,0,0,1376,1377,1,0,0,0,1377,1379,5,133,
		0,0,1378,1368,1,0,0,0,1378,1373,1,0,0,0,1379,225,1,0,0,0,1380,1385,3,228,
		114,0,1381,1382,5,139,0,0,1382,1384,3,228,114,0,1383,1381,1,0,0,0,1384,
		1387,1,0,0,0,1385,1383,1,0,0,0,1385,1386,1,0,0,0,1386,227,1,0,0,0,1387,
		1385,1,0,0,0,1388,1389,3,152,76,0,1389,1390,3,230,115,0,1390,1393,1,0,
		0,0,1391,1393,5,32,0,0,1392,1388,1,0,0,0,1392,1391,1,0,0,0,1393,229,1,
		0,0,0,1394,1396,3,202,101,0,1395,1394,1,0,0,0,1395,1396,1,0,0,0,1396,1397,
		1,0,0,0,1397,1398,3,196,98,0,1398,231,1,0,0,0,1399,1401,3,234,117,0,1400,
		1402,5,138,0,0,1401,1400,1,0,0,0,1401,1402,1,0,0,0,1402,1441,1,0,0,0,1403,
		1405,3,238,119,0,1404,1406,5,138,0,0,1405,1404,1,0,0,0,1405,1406,1,0,0,
		0,1406,1441,1,0,0,0,1407,1409,3,240,120,0,1408,1410,5,138,0,0,1409,1408,
		1,0,0,0,1409,1410,1,0,0,0,1410,1441,1,0,0,0,1411,1413,3,250,125,0,1412,
		1414,5,138,0,0,1413,1412,1,0,0,0,1413,1414,1,0,0,0,1414,1441,1,0,0,0,1415,
		1417,3,262,131,0,1416,1418,5,138,0,0,1417,1416,1,0,0,0,1417,1418,1,0,0,
		0,1418,1441,1,0,0,0,1419,1421,3,116,58,0,1420,1422,5,138,0,0,1421,1420,
		1,0,0,0,1421,1422,1,0,0,0,1422,1441,1,0,0,0,1423,1425,3,118,59,0,1424,
		1426,5,138,0,0,1425,1424,1,0,0,0,1425,1426,1,0,0,0,1426,1441,1,0,0,0,1427,
		1429,3,110,55,0,1428,1430,5,138,0,0,1429,1428,1,0,0,0,1429,1430,1,0,0,
		0,1430,1441,1,0,0,0,1431,1433,3,112,56,0,1432,1434,5,138,0,0,1433,1432,
		1,0,0,0,1433,1434,1,0,0,0,1434,1441,1,0,0,0,1435,1437,3,264,132,0,1436,
		1438,5,138,0,0,1437,1436,1,0,0,0,1437,1438,1,0,0,0,1438,1441,1,0,0,0,1439,
		1441,5,138,0,0,1440,1399,1,0,0,0,1440,1403,1,0,0,0,1440,1407,1,0,0,0,1440,
		1411,1,0,0,0,1440,1415,1,0,0,0,1440,1419,1,0,0,0,1440,1423,1,0,0,0,1440,
		1427,1,0,0,0,1440,1431,1,0,0,0,1440,1435,1,0,0,0,1440,1439,1,0,0,0,1441,
		233,1,0,0,0,1442,1443,3,294,147,0,1443,1444,5,150,0,0,1444,1445,3,232,
		116,0,1445,235,1,0,0,0,1446,1449,3,274,137,0,1447,1448,5,177,0,0,1448,
		1450,3,274,137,0,1449,1447,1,0,0,0,1449,1450,1,0,0,0,1450,237,1,0,0,0,
		1451,1456,5,134,0,0,1452,1455,3,138,69,0,1453,1455,3,232,116,0,1454,1452,
		1,0,0,0,1454,1453,1,0,0,0,1455,1458,1,0,0,0,1456,1454,1,0,0,0,1456,1457,
		1,0,0,0,1457,1459,1,0,0,0,1458,1456,1,0,0,0,1459,1460,5,135,0,0,1460,239,
		1,0,0,0,1461,1462,5,16,0,0,1462,1463,5,132,0,0,1463,1464,3,266,133,0,1464,
		1465,5,133,0,0,1465,1468,3,232,116,0,1466,1467,5,10,0,0,1467,1469,3,232,
		116,0,1468,1466,1,0,0,0,1468,1469,1,0,0,0,1469,1472,1,0,0,0,1470,1472,
		3,242,121,0,1471,1461,1,0,0,0,1471,1470,1,0,0,0,1472,241,1,0,0,0,1473,
		1474,5,28,0,0,1474,1475,5,132,0,0,1475,1476,3,266,133,0,1476,1477,5,133,
		0,0,1477,1478,3,244,122,0,1478,243,1,0,0,0,1479,1483,5,134,0,0,1480,1482,
		3,246,123,0,1481,1480,1,0,0,0,1482,1485,1,0,0,0,1483,1481,1,0,0,0,1483,
		1484,1,0,0,0,1484,1486,1,0,0,0,1485,1483,1,0,0,0,1486,1487,5,135,0,0,1487,
		245,1,0,0,0,1488,1490,3,248,124,0,1489,1488,1,0,0,0,1490,1491,1,0,0,0,
		1491,1489,1,0,0,0,1491,1492,1,0,0,0,1492,1494,1,0,0,0,1493,1495,3,232,
		116,0,1494,1493,1,0,0,0,1495,1496,1,0,0,0,1496,1494,1,0,0,0,1496,1497,
		1,0,0,0,1497,247,1,0,0,0,1498,1504,5,3,0,0,1499,1505,3,236,118,0,1500,
		1501,5,132,0,0,1501,1502,3,236,118,0,1502,1503,5,133,0,0,1503,1505,1,0,
		0,0,1504,1499,1,0,0,0,1504,1500,1,0,0,0,1505,1506,1,0,0,0,1506,1507,5,
		150,0,0,1507,1511,1,0,0,0,1508,1509,5,7,0,0,1509,1511,5,150,0,0,1510,1498,
		1,0,0,0,1510,1508,1,0,0,0,1511,249,1,0,0,0,1512,1517,3,252,126,0,1513,
		1517,3,254,127,0,1514,1517,3,256,128,0,1515,1517,3,260,130,0,1516,1512,
		1,0,0,0,1516,1513,1,0,0,0,1516,1514,1,0,0,0,1516,1515,1,0,0,0,1517,251,
		1,0,0,0,1518,1519,5,34,0,0,1519,1520,5,132,0,0,1520,1521,3,266,133,0,1521,
		1522,5,133,0,0,1522,1523,3,232,116,0,1523,253,1,0,0,0,1524,1525,5,8,0,
		0,1525,1526,3,232,116,0,1526,1527,5,34,0,0,1527,1528,5,132,0,0,1528,1529,
		3,266,133,0,1529,1530,5,133,0,0,1530,1531,5,138,0,0,1531,255,1,0,0,0,1532,
		1533,5,14,0,0,1533,1535,5,132,0,0,1534,1536,3,258,129,0,1535,1534,1,0,
		0,0,1535,1536,1,0,0,0,1536,1537,1,0,0,0,1537,1539,5,138,0,0,1538,1540,
		3,266,133,0,1539,1538,1,0,0,0,1539,1540,1,0,0,0,1540,1541,1,0,0,0,1541,
		1543,5,138,0,0,1542,1544,3,264,132,0,1543,1542,1,0,0,0,1543,1544,1,0,0,
		0,1544,1545,1,0,0,0,1545,1546,5,133,0,0,1546,1547,3,232,116,0,1547,257,
		1,0,0,0,1548,1549,3,152,76,0,1549,1550,3,156,78,0,1550,1553,1,0,0,0,1551,
		1553,3,264,132,0,1552,1548,1,0,0,0,1552,1551,1,0,0,0,1553,259,1,0,0,0,
		1554,1555,5,14,0,0,1555,1556,5,132,0,0,1556,1557,3,108,54,0,1557,1559,
		5,46,0,0,1558,1560,3,266,133,0,1559,1558,1,0,0,0,1559,1560,1,0,0,0,1560,
		1561,1,0,0,0,1561,1562,5,133,0,0,1562,1563,3,232,116,0,1563,261,1,0,0,
		0,1564,1565,5,15,0,0,1565,1573,3,294,147,0,1566,1573,5,6,0,0,1567,1573,
		5,2,0,0,1568,1570,5,22,0,0,1569,1571,3,266,133,0,1570,1569,1,0,0,0,1570,
		1571,1,0,0,0,1571,1573,1,0,0,0,1572,1564,1,0,0,0,1572,1566,1,0,0,0,1572,
		1567,1,0,0,0,1572,1568,1,0,0,0,1573,263,1,0,0,0,1574,1579,3,266,133,0,
		1575,1576,5,139,0,0,1576,1578,3,266,133,0,1577,1575,1,0,0,0,1578,1581,
		1,0,0,0,1579,1577,1,0,0,0,1579,1580,1,0,0,0,1580,265,1,0,0,0,1581,1579,
		1,0,0,0,1582,1583,6,133,-1,0,1583,1593,3,270,135,0,1584,1585,5,132,0,0,
		1585,1586,3,238,119,0,1586,1587,5,133,0,0,1587,1593,1,0,0,0,1588,1589,
		3,276,138,0,1589,1590,3,268,134,0,1590,1591,3,266,133,1,1591,1593,1,0,
		0,0,1592,1582,1,0,0,0,1592,1584,1,0,0,0,1592,1588,1,0,0,0,1593,1638,1,
		0,0,0,1594,1595,10,13,0,0,1595,1596,7,10,0,0,1596,1637,3,266,133,14,1597,
		1598,10,12,0,0,1598,1599,7,11,0,0,1599,1637,3,266,133,13,1600,1605,10,
		11,0,0,1601,1602,5,146,0,0,1602,1606,5,146,0,0,1603,1604,5,145,0,0,1604,
		1606,5,145,0,0,1605,1601,1,0,0,0,1605,1603,1,0,0,0,1606,1607,1,0,0,0,1607,
		1637,3,266,133,12,1608,1609,10,10,0,0,1609,1610,7,12,0,0,1610,1637,3,266,
		133,11,1611,1612,10,9,0,0,1612,1613,7,13,0,0,1613,1637,3,266,133,10,1614,
		1615,10,8,0,0,1615,1616,5,163,0,0,1616,1637,3,266,133,9,1617,1618,10,7,
		0,0,1618,1619,5,165,0,0,1619,1637,3,266,133,8,1620,1621,10,6,0,0,1621,
		1622,5,164,0,0,1622,1637,3,266,133,7,1623,1624,10,5,0,0,1624,1625,5,155,
		0,0,1625,1637,3,266,133,6,1626,1627,10,4,0,0,1627,1628,5,156,0,0,1628,
		1637,3,266,133,5,1629,1630,10,3,0,0,1630,1632,5,149,0,0,1631,1633,3,266,
		133,0,1632,1631,1,0,0,0,1632,1633,1,0,0,0,1633,1634,1,0,0,0,1634,1635,
		5,150,0,0,1635,1637,3,266,133,4,1636,1594,1,0,0,0,1636,1597,1,0,0,0,1636,
		1600,1,0,0,0,1636,1608,1,0,0,0,1636,1611,1,0,0,0,1636,1614,1,0,0,0,1636,
		1617,1,0,0,0,1636,1620,1,0,0,0,1636,1623,1,0,0,0,1636,1626,1,0,0,0,1636,
		1629,1,0,0,0,1637,1640,1,0,0,0,1638,1636,1,0,0,0,1638,1639,1,0,0,0,1639,
		267,1,0,0,0,1640,1638,1,0,0,0,1641,1642,7,14,0,0,1642,269,1,0,0,0,1643,
		1653,3,276,138,0,1644,1645,5,132,0,0,1645,1646,3,220,110,0,1646,1647,5,
		133,0,0,1647,1650,1,0,0,0,1648,1651,3,270,135,0,1649,1651,3,272,136,0,
		1650,1648,1,0,0,0,1650,1649,1,0,0,0,1651,1653,1,0,0,0,1652,1643,1,0,0,
		0,1652,1644,1,0,0,0,1653,271,1,0,0,0,1654,1658,3,266,133,0,1655,1658,3,
		214,107,0,1656,1658,3,216,108,0,1657,1654,1,0,0,0,1657,1655,1,0,0,0,1657,
		1656,1,0,0,0,1658,273,1,0,0,0,1659,1662,3,294,147,0,1660,1662,3,290,145,
		0,1661,1659,1,0,0,0,1661,1660,1,0,0,0,1662,275,1,0,0,0,1663,1678,3,280,
		140,0,1664,1670,5,25,0,0,1665,1671,3,276,138,0,1666,1667,5,132,0,0,1667,
		1668,3,180,90,0,1668,1669,5,133,0,0,1669,1671,1,0,0,0,1670,1665,1,0,0,
		0,1670,1666,1,0,0,0,1671,1678,1,0,0,0,1672,1673,7,15,0,0,1673,1678,3,276,
		138,0,1674,1675,3,278,139,0,1675,1676,3,270,135,0,1676,1678,1,0,0,0,1677,
		1663,1,0,0,0,1677,1664,1,0,0,0,1677,1672,1,0,0,0,1677,1674,1,0,0,0,1678,
		277,1,0,0,0,1679,1680,7,16,0,0,1680,279,1,0,0,0,1681,1682,6,140,-1,0,1682,
		1686,3,288,144,0,1683,1685,3,282,141,0,1684,1683,1,0,0,0,1685,1688,1,0,
		0,0,1686,1684,1,0,0,0,1686,1687,1,0,0,0,1687,1700,1,0,0,0,1688,1686,1,
		0,0,0,1689,1690,10,1,0,0,1690,1691,7,17,0,0,1691,1695,3,294,147,0,1692,
		1694,3,282,141,0,1693,1692,1,0,0,0,1694,1697,1,0,0,0,1695,1693,1,0,0,0,
		1695,1696,1,0,0,0,1696,1699,1,0,0,0,1697,1695,1,0,0,0,1698,1689,1,0,0,
		0,1699,1702,1,0,0,0,1700,1698,1,0,0,0,1700,1701,1,0,0,0,1701,281,1,0,0,
		0,1702,1700,1,0,0,0,1703,1704,5,136,0,0,1704,1705,3,266,133,0,1705,1706,
		5,137,0,0,1706,1722,1,0,0,0,1707,1709,5,132,0,0,1708,1710,3,284,142,0,
		1709,1708,1,0,0,0,1709,1710,1,0,0,0,1710,1711,1,0,0,0,1711,1722,5,133,
		0,0,1712,1715,5,132,0,0,1713,1716,5,139,0,0,1714,1716,8,18,0,0,1715,1713,
		1,0,0,0,1715,1714,1,0,0,0,1716,1717,1,0,0,0,1717,1715,1,0,0,0,1717,1718,
		1,0,0,0,1718,1719,1,0,0,0,1719,1722,5,133,0,0,1720,1722,7,15,0,0,1721,
		1703,1,0,0,0,1721,1707,1,0,0,0,1721,1712,1,0,0,0,1721,1720,1,0,0,0,1722,
		283,1,0,0,0,1723,1728,3,286,143,0,1724,1725,5,139,0,0,1725,1727,3,286,
		143,0,1726,1724,1,0,0,0,1727,1730,1,0,0,0,1728,1726,1,0,0,0,1728,1729,
		1,0,0,0,1729,285,1,0,0,0,1730,1728,1,0,0,0,1731,1734,3,266,133,0,1732,
		1734,3,180,90,0,1733,1731,1,0,0,0,1733,1732,1,0,0,0,1734,287,1,0,0,0,1735,
		1751,3,294,147,0,1736,1751,3,290,145,0,1737,1751,3,292,146,0,1738,1739,
		5,132,0,0,1739,1740,3,266,133,0,1740,1741,5,133,0,0,1741,1751,1,0,0,0,
		1742,1751,3,90,45,0,1743,1751,3,100,50,0,1744,1751,3,104,52,0,1745,1751,
		3,106,53,0,1746,1751,3,76,38,0,1747,1751,3,80,40,0,1748,1751,3,82,41,0,
		1749,1751,3,88,44,0,1750,1735,1,0,0,0,1750,1736,1,0,0,0,1750,1737,1,0,
		0,0,1750,1738,1,0,0,0,1750,1742,1,0,0,0,1750,1743,1,0,0,0,1750,1744,1,
		0,0,0,1750,1745,1,0,0,0,1750,1746,1,0,0,0,1750,1747,1,0,0,0,1750,1748,
		1,0,0,0,1750,1749,1,0,0,0,1751,289,1,0,0,0,1752,1771,5,180,0,0,1753,1771,
		5,181,0,0,1754,1771,5,182,0,0,1755,1757,7,11,0,0,1756,1755,1,0,0,0,1756,
		1757,1,0,0,0,1757,1758,1,0,0,0,1758,1771,5,183,0,0,1759,1761,7,11,0,0,
		1760,1759,1,0,0,0,1760,1761,1,0,0,0,1761,1762,1,0,0,0,1762,1771,5,184,
		0,0,1763,1771,5,178,0,0,1764,1771,5,48,0,0,1765,1771,5,50,0,0,1766,1771,
		5,57,0,0,1767,1771,5,49,0,0,1768,1771,5,38,0,0,1769,1771,5,39,0,0,1770,
		1752,1,0,0,0,1770,1753,1,0,0,0,1770,1754,1,0,0,0,1770,1756,1,0,0,0,1770,
		1760,1,0,0,0,1770,1763,1,0,0,0,1770,1764,1,0,0,0,1770,1765,1,0,0,0,1770,
		1766,1,0,0,0,1770,1767,1,0,0,0,1770,1768,1,0,0,0,1770,1769,1,0,0,0,1771,
		291,1,0,0,0,1772,1776,5,179,0,0,1773,1775,7,19,0,0,1774,1773,1,0,0,0,1775,
		1778,1,0,0,0,1776,1774,1,0,0,0,1776,1777,1,0,0,0,1777,1779,1,0,0,0,1778,
		1776,1,0,0,0,1779,1781,5,191,0,0,1780,1772,1,0,0,0,1781,1782,1,0,0,0,1782,
		1780,1,0,0,0,1782,1783,1,0,0,0,1783,293,1,0,0,0,1784,1785,7,20,0,0,1785,
		295,1,0,0,0,232,299,315,322,328,334,337,340,348,355,358,361,369,372,375,
		385,395,398,406,411,420,426,428,440,450,458,461,464,473,496,503,506,512,
		521,527,529,538,540,549,555,565,567,576,580,583,591,595,597,600,606,610,
		616,630,637,643,646,650,654,659,663,671,674,681,686,695,699,701,713,715,
		727,729,734,740,743,749,753,756,759,770,776,778,781,789,794,800,810,815,
		817,839,846,851,875,880,885,889,893,897,906,913,920,926,929,933,941,944,
		948,956,961,968,977,981,993,995,1005,1016,1022,1027,1033,1037,1042,1052,
		1054,1062,1076,1095,1097,1109,1114,1118,1122,1126,1133,1139,1151,1158,
		1162,1167,1171,1178,1183,1189,1192,1196,1200,1207,1211,1214,1223,1228,
		1242,1254,1264,1273,1280,1293,1296,1301,1303,1315,1319,1321,1330,1334,
		1338,1341,1345,1349,1355,1359,1364,1366,1370,1375,1378,1385,1392,1395,
		1401,1405,1409,1413,1417,1421,1425,1429,1433,1437,1440,1449,1454,1456,
		1468,1471,1483,1491,1496,1504,1510,1516,1535,1539,1543,1552,1559,1570,
		1572,1579,1592,1605,1632,1636,1638,1650,1652,1657,1661,1670,1677,1686,
		1695,1700,1709,1715,1717,1721,1728,1733,1750,1756,1760,1770,1776,1782
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
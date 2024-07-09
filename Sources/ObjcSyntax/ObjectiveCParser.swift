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
                 NS_ENUM = 104, NS_CLOSED_ENUM = 105, NS_ERROR_ENUM = 106, 
                 NS_OPTIONS = 107, NS_SWIFT_NAME = 108, NS_NOESCAPE = 109, 
                 NS_UNAVAILABLE = 110, NS_SWIFT_UNAVAILABLE = 111, API_AVAILABLE = 112, 
                 API_UNAVAILABLE = 113, ASSIGN = 114, COPY = 115, GETTER = 116, 
                 SETTER = 117, STRONG = 118, READONLY = 119, READWRITE = 120, 
                 WEAK = 121, UNSAFE_UNRETAINED = 122, IB_OUTLET = 123, IB_OUTLET_COLLECTION = 124, 
                 IB_INSPECTABLE = 125, IB_DESIGNABLE = 126, NS_ASSUME_NONNULL_BEGIN = 127, 
                 NS_ASSUME_NONNULL_END = 128, EXTERN_SUFFIX = 129, IOS_SUFFIX = 130, 
                 MAC_SUFFIX = 131, TVOS_PROHIBITED = 132, IDENTIFIER = 133, 
                 LP = 134, RP = 135, LBRACE = 136, RBRACE = 137, LBRACK = 138, 
                 RBRACK = 139, SEMI = 140, COMMA = 141, DOT = 142, STRUCTACCESS = 143, 
                 AT = 144, UNDERSCORE = 145, ASSIGNMENT = 146, GT = 147, 
                 LT = 148, BANG = 149, TILDE = 150, QUESTION = 151, COLON = 152, 
                 EQUAL = 153, LE = 154, GE = 155, NOTEQUAL = 156, AND = 157, 
                 OR = 158, INC = 159, DEC = 160, ADD = 161, SUB = 162, MUL = 163, 
                 DIV = 164, BITAND = 165, BITOR = 166, BITXOR = 167, MOD = 168, 
                 ADD_ASSIGN = 169, SUB_ASSIGN = 170, MUL_ASSIGN = 171, DIV_ASSIGN = 172, 
                 AND_ASSIGN = 173, OR_ASSIGN = 174, XOR_ASSIGN = 175, MOD_ASSIGN = 176, 
                 LSHIFT_ASSIGN = 177, RSHIFT_ASSIGN = 178, ELIPSIS = 179, 
                 CHARACTER_LITERAL = 180, STRING_START = 181, HEX_LITERAL = 182, 
                 OCTAL_LITERAL = 183, BINARY_LITERAL = 184, DECIMAL_LITERAL = 185, 
                 FLOATING_POINT_LITERAL = 186, WS = 187, MULTI_COMMENT = 188, 
                 SINGLE_COMMENT = 189, BACKSLASH = 190, SHARP = 191, STRING_NEWLINE = 192, 
                 STRING_END = 193, STRING_VALUE = 194, DIRECTIVE_IMPORT = 195, 
                 DIRECTIVE_INCLUDE = 196, DIRECTIVE_PRAGMA = 197, DIRECTIVE_DEFINE = 198, 
                 DIRECTIVE_DEFINED = 199, DIRECTIVE_IF = 200, DIRECTIVE_ELIF = 201, 
                 DIRECTIVE_ELSE = 202, DIRECTIVE_UNDEF = 203, DIRECTIVE_IFDEF = 204, 
                 DIRECTIVE_IFNDEF = 205, DIRECTIVE_ENDIF = 206, DIRECTIVE_TRUE = 207, 
                 DIRECTIVE_FALSE = 208, DIRECTIVE_ERROR = 209, DIRECTIVE_WARNING = 210, 
                 DIRECTIVE_BANG = 211, DIRECTIVE_LP = 212, DIRECTIVE_RP = 213, 
                 DIRECTIVE_EQUAL = 214, DIRECTIVE_NOTEQUAL = 215, DIRECTIVE_AND = 216, 
                 DIRECTIVE_OR = 217, DIRECTIVE_LT = 218, DIRECTIVE_GT = 219, 
                 DIRECTIVE_LE = 220, DIRECTIVE_GE = 221, DIRECTIVE_STRING = 222, 
                 DIRECTIVE_ID = 223, DIRECTIVE_DECIMAL_LITERAL = 224, DIRECTIVE_FLOAT = 225, 
                 DIRECTIVE_NEWLINE = 226, DIRECTIVE_MULTI_COMMENT = 227, 
                 DIRECTIVE_SINGLE_COMMENT = 228, DIRECTIVE_BACKSLASH_NEWLINE = 229, 
                 DIRECTIVE_TEXT_NEWLINE = 230, DIRECTIVE_TEXT = 231
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
            RULE_declarationSpecifiers = 75, RULE_attributeSpecifier = 76, 
            RULE_initDeclaratorList = 77, RULE_initDeclarator = 78, RULE_structOrUnionSpecifier = 79, 
            RULE_fieldDeclaration = 80, RULE_ibOutletQualifier = 81, RULE_arcBehaviourSpecifier = 82, 
            RULE_nullabilitySpecifier = 83, RULE_storageClassSpecifier = 84, 
            RULE_typePrefix = 85, RULE_typeQualifier = 86, RULE_protocolQualifier = 87, 
            RULE_typeSpecifierModifier = 88, RULE_typeSpecifier = 89, RULE_typeofExpression = 90, 
            RULE_fieldDeclaratorList = 91, RULE_fieldDeclarator = 92, RULE_enumSpecifier = 93, 
            RULE_nsEnumOrOptionSpecifier = 94, RULE_enumeratorList = 95, 
            RULE_enumerator = 96, RULE_enumeratorIdentifier = 97, RULE_declarator = 98, 
            RULE_declaratorSuffix = 99, RULE_parameterList = 100, RULE_macro = 101, 
            RULE_clangAttribute = 102, RULE_clangAttributeArgument = 103, 
            RULE_swiftAliasExpression = 104, RULE_swiftSelectorExpression = 105, 
            RULE_swiftSelector = 106, RULE_apiAvailableOsVersion = 107, 
            RULE_version = 108, RULE_arrayInitializer = 109, RULE_structInitializer = 110, 
            RULE_initializerList = 111, RULE_typeName = 112, RULE_abstractDeclarator = 113, 
            RULE_abstractDeclaratorSuffix = 114, RULE_parameterDeclarationList = 115, 
            RULE_parameterDeclaration = 116, RULE_statement = 117, RULE_labeledStatement = 118, 
            RULE_rangeExpression = 119, RULE_compoundStatement = 120, RULE_selectionStatement = 121, 
            RULE_switchStatement = 122, RULE_switchBlock = 123, RULE_switchSection = 124, 
            RULE_switchLabel = 125, RULE_iterationStatement = 126, RULE_whileStatement = 127, 
            RULE_doStatement = 128, RULE_forStatement = 129, RULE_forLoopInitializer = 130, 
            RULE_forInStatement = 131, RULE_jumpStatement = 132, RULE_expressions = 133, 
            RULE_expression = 134, RULE_assignmentOperator = 135, RULE_castExpression = 136, 
            RULE_initializer = 137, RULE_constantExpression = 138, RULE_unaryExpression = 139, 
            RULE_unaryOperator = 140, RULE_postfixExpression = 141, RULE_postfix = 142, 
            RULE_argumentExpressionList = 143, RULE_argumentExpression = 144, 
            RULE_primaryExpression = 145, RULE_constant = 146, RULE_stringLiteral = 147, 
            RULE_identifier = 148

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
		"declarationSpecifiers", "attributeSpecifier", "initDeclaratorList", "initDeclarator", 
		"structOrUnionSpecifier", "fieldDeclaration", "ibOutletQualifier", "arcBehaviourSpecifier", 
		"nullabilitySpecifier", "storageClassSpecifier", "typePrefix", "typeQualifier", 
		"protocolQualifier", "typeSpecifierModifier", "typeSpecifier", "typeofExpression", 
		"fieldDeclaratorList", "fieldDeclarator", "enumSpecifier", "nsEnumOrOptionSpecifier", 
		"enumeratorList", "enumerator", "enumeratorIdentifier", "declarator", 
		"declaratorSuffix", "parameterList", "macro", "clangAttribute", "clangAttributeArgument", 
		"swiftAliasExpression", "swiftSelectorExpression", "swiftSelector", "apiAvailableOsVersion", 
		"version", "arrayInitializer", "structInitializer", "initializerList", 
		"typeName", "abstractDeclarator", "abstractDeclaratorSuffix", "parameterDeclarationList", 
		"parameterDeclaration", "statement", "labeledStatement", "rangeExpression", 
		"compoundStatement", "selectionStatement", "switchStatement", "switchBlock", 
		"switchSection", "switchLabel", "iterationStatement", "whileStatement", 
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
		nil, nil, nil, "'null_resettable'", "'NS_INLINE'", "'NS_ENUM'", "'NS_CLOSED_ENUM'", 
		"'NS_ERROR_ENUM'", "'NS_OPTIONS'", "'NS_SWIFT_NAME'", "'NS_NOESCAPE'", 
		"'NS_UNAVAILABLE'", "'NS_SWIFT_UNAVAILABLE'", "'API_AVAILABLE'", "'API_UNAVAILABLE'", 
		"'assign'", "'copy'", "'getter'", "'setter'", "'strong'", "'readonly'", 
		"'readwrite'", "'weak'", "'unsafe_unretained'", "'IBOutlet'", "'IBOutletCollection'", 
		"'IBInspectable'", "'IB_DESIGNABLE'", nil, nil, nil, nil, nil, "'__TVOS_PROHIBITED'", 
		nil, nil, nil, "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'->'", 
		"'@'", "'_'", "'='", nil, nil, nil, "'~'", "'?'", "':'", nil, nil, nil, 
		nil, nil, nil, "'++'", "'--'", "'+'", "'-'", "'*'", "'/'", "'&'", "'|'", 
		"'^'", "'%'", "'+='", "'-='", "'*='", "'/='", "'&='", "'|='", "'^='", 
		"'%='", "'<<='", "'>>='", "'...'", nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, "'\\'", nil, nil, nil, nil, nil, nil, nil, nil, "'defined'", 
		nil, "'elif'", nil, "'undef'", "'ifdef'", "'ifndef'", "'endif'"
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
		"NS_INLINE", "NS_ENUM", "NS_CLOSED_ENUM", "NS_ERROR_ENUM", "NS_OPTIONS", 
		"NS_SWIFT_NAME", "NS_NOESCAPE", "NS_UNAVAILABLE", "NS_SWIFT_UNAVAILABLE", 
		"API_AVAILABLE", "API_UNAVAILABLE", "ASSIGN", "COPY", "GETTER", "SETTER", 
		"STRONG", "READONLY", "READWRITE", "WEAK", "UNSAFE_UNRETAINED", "IB_OUTLET", 
		"IB_OUTLET_COLLECTION", "IB_INSPECTABLE", "IB_DESIGNABLE", "NS_ASSUME_NONNULL_BEGIN", 
		"NS_ASSUME_NONNULL_END", "EXTERN_SUFFIX", "IOS_SUFFIX", "MAC_SUFFIX", 
		"TVOS_PROHIBITED", "IDENTIFIER", "LP", "RP", "LBRACE", "RBRACE", "LBRACK", 
		"RBRACK", "SEMI", "COMMA", "DOT", "STRUCTACCESS", "AT", "UNDERSCORE", 
		"ASSIGNMENT", "GT", "LT", "BANG", "TILDE", "QUESTION", "COLON", "EQUAL", 
		"LE", "GE", "NOTEQUAL", "AND", "OR", "INC", "DEC", "ADD", "SUB", "MUL", 
		"DIV", "BITAND", "BITOR", "BITXOR", "MOD", "ADD_ASSIGN", "SUB_ASSIGN", 
		"MUL_ASSIGN", "DIV_ASSIGN", "AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "MOD_ASSIGN", 
		"LSHIFT_ASSIGN", "RSHIFT_ASSIGN", "ELIPSIS", "CHARACTER_LITERAL", "STRING_START", 
		"HEX_LITERAL", "OCTAL_LITERAL", "BINARY_LITERAL", "DECIMAL_LITERAL", "FLOATING_POINT_LITERAL", 
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
		 	setState(301)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1295065285207669298) != 0) || ((Int64((_la - 65)) & ~0x3f) == 0 && ((Int64(1) << (_la - 65)) & 4611686018427322391) != 0) || _la == ObjectiveCParser.Tokens.IDENTIFIER.rawValue || _la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(298)
		 		try topLevelDeclaration()


		 		setState(303)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(304)
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
			open
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
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
		 	setState(318)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(306)
		 		try importDeclaration()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(307)
		 		try functionDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(308)
		 		try declaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(309)
		 		try classInterface()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(310)
		 		try classImplementation()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(311)
		 		try categoryInterface()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(312)
		 		try categoryImplementation()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(313)
		 		try protocolDeclaration()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(314)
		 		try protocolDeclarationList()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(315)
		 		try classDeclarationList()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(316)
		 		try functionDefinition()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(317)
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
		 	setState(320)
		 	try match(ObjectiveCParser.Tokens.IMPORT.rawValue)
		 	setState(321)
		 	try identifier()
		 	setState(322)
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
		 	setState(325)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue) {
		 		setState(324)
		 		try match(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue)

		 	}

		 	setState(327)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(328)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(331)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(329)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(330)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassInterfaceContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(337)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(333)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(334)
		 		try protocolList()
		 		setState(335)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(340)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(339)
		 		try instanceVariables()

		 	}

		 	setState(343)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 2341867683064053249) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
		 		setState(342)
		 		try interfaceDeclarationList()

		 	}

		 	setState(345)
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
		 	setState(347)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(348)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(349)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(351)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(350)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(CategoryInterfaceContext.self).categoryName = assignmentValue
		 		     }()


		 	}

		 	setState(353)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(358)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(354)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(355)
		 		try protocolList()
		 		setState(356)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(361)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(360)
		 		try instanceVariables()

		 	}

		 	setState(364)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 2341867683064053249) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
		 		setState(363)
		 		try interfaceDeclarationList()

		 	}

		 	setState(366)
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
		 	setState(368)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(369)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(372)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(370)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(371)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassImplementationContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(375)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(374)
		 		try instanceVariables()

		 	}

		 	setState(378)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 36591682547875833) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(377)
		 		try implementationDefinitionList()

		 	}

		 	setState(380)
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
		 	setState(382)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(383)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(384)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(385)
		 	try {
		 			let assignmentValue = try identifier()
		 			_localctx.castdown(CategoryImplementationContext.self).categoryName = assignmentValue
		 	     }()

		 	setState(386)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(388)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 36591682547875833) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(387)
		 		try implementationDefinitionList()

		 	}

		 	setState(390)
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
		 	setState(392)
		 	try identifier()
		 	setState(398)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,15,_ctx)) {
		 	case 1:
		 		setState(393)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(394)
		 		try protocolList()
		 		setState(395)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)


		 		break
		 	case 2:
		 		setState(397)
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
		 	setState(401)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(400)
		 		try macro()

		 	}

		 	setState(403)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(404)
		 	try protocolName()
		 	setState(409)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(405)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(406)
		 		try protocolList()
		 		setState(407)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(414)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 70)) & ~0x3f) == 0 && ((Int64(1) << (_la - 70)) & -9079273341453338587) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
		 		setState(411)
		 		try protocolDeclarationSection()


		 		setState(416)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(417)
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
		 	setState(431)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .OPTIONAL:fallthrough
		 	case .REQUIRED:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(419)
		 		_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.OPTIONAL.rawValue || _la == ObjectiveCParser.Tokens.REQUIRED.rawValue)) {
		 			_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(423)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(420)
		 				try interfaceDeclarationList()

		 		 
		 			}
		 			setState(425)
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
		 	case .NS_CLOSED_ENUM:fallthrough
		 	case .NS_ERROR_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .NS_SWIFT_NAME:fallthrough
		 	case .NS_NOESCAPE:fallthrough
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
		 	case .SEMI:fallthrough
		 	case .ADD:fallthrough
		 	case .SUB:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(427); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(426)
		 				try interfaceDeclarationList()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(429); 
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
		 	setState(433)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(434)
		 	try protocolList()
		 	setState(435)
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
			func genericTypeSpecifier() -> [GenericTypeSpecifierContext] {
				return getRuleContexts(GenericTypeSpecifierContext.self)
			}
			open
			func genericTypeSpecifier(_ i: Int) -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, i)
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
		 	setState(437)
		 	try match(ObjectiveCParser.Tokens.CLASS.rawValue)
		 	setState(438)
		 	try genericTypeSpecifier()
		 	setState(443)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(439)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(440)
		 		try genericTypeSpecifier()


		 		setState(445)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(446)
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
		 	setState(448)
		 	try protocolName()
		 	setState(453)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(449)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(450)
		 		try protocolName()


		 		setState(455)
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
		 	setState(456)
		 	try match(ObjectiveCParser.Tokens.PROPERTY.rawValue)
		 	setState(461)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(457)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(458)
		 		try propertyAttributesList()
		 		setState(459)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	}

		 	setState(464)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,25,_ctx)) {
		 	case 1:
		 		setState(463)
		 		try ibOutletQualifier()

		 		break
		 	default: break
		 	}
		 	setState(467)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,26,_ctx)) {
		 	case 1:
		 		setState(466)
		 		try match(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(469)
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
		 	setState(471)
		 	try propertyAttribute()
		 	setState(476)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(472)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(473)
		 		try propertyAttribute()


		 		setState(478)
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
		 	setState(499)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,28, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(479)
		 		try match(ObjectiveCParser.Tokens.ATOMIC.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(480)
		 		try match(ObjectiveCParser.Tokens.NONATOMIC.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(481)
		 		try match(ObjectiveCParser.Tokens.STRONG.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(482)
		 		try match(ObjectiveCParser.Tokens.WEAK.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(483)
		 		try match(ObjectiveCParser.Tokens.RETAIN.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(484)
		 		try match(ObjectiveCParser.Tokens.ASSIGN.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(485)
		 		try match(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(486)
		 		try match(ObjectiveCParser.Tokens.COPY.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(487)
		 		try match(ObjectiveCParser.Tokens.READONLY.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(488)
		 		try match(ObjectiveCParser.Tokens.READWRITE.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(489)
		 		try match(ObjectiveCParser.Tokens.GETTER.rawValue)
		 		setState(490)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(491)
		 		try identifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(492)
		 		try match(ObjectiveCParser.Tokens.SETTER.rawValue)
		 		setState(493)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(494)
		 		try identifier()
		 		setState(495)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(497)
		 		try nullabilitySpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(498)
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
		 	setState(509)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LT:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(501)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(502)
		 		try protocolList()
		 		setState(503)
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
		 		setState(506)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,29,_ctx)) {
		 		case 1:
		 			setState(505)
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
		 		setState(508)
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
		 	setState(511)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(515)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 68)) & ~0x3f) == 0 && ((Int64(1) << (_la - 68)) & 576394781605748841) != 0) || _la == ObjectiveCParser.Tokens.IDENTIFIER.rawValue) {
		 		setState(512)
		 		try visibilitySection()


		 		setState(517)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(518)
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
		 	setState(532)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PACKAGE:fallthrough
		 	case .PRIVATE:fallthrough
		 	case .PROTECTED:fallthrough
		 	case .PUBLIC:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(520)
		 		try accessModifier()
		 		setState(524)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,32,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(521)
		 				try fieldDeclaration()

		 		 
		 			}
		 			setState(526)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,32,_ctx)
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
		 	case .NS_CLOSED_ENUM:fallthrough
		 	case .NS_ERROR_ENUM:fallthrough
		 	case .NS_OPTIONS:fallthrough
		 	case .NS_SWIFT_NAME:fallthrough
		 	case .NS_NOESCAPE:fallthrough
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
		 		setState(528); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(527)
		 				try fieldDeclaration()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(530); 
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
		 	setState(534)
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
			open
			func SEMI() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.SEMI.rawValue)
			}
			open
			func SEMI(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, i)
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
		 	setState(542); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(542)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,35, _ctx)) {
		 			case 1:
		 				setState(536)
		 				try declaration()

		 				break
		 			case 2:
		 				setState(537)
		 				try classMethodDeclaration()

		 				break
		 			case 3:
		 				setState(538)
		 				try instanceMethodDeclaration()

		 				break
		 			case 4:
		 				setState(539)
		 				try propertyDeclaration()

		 				break
		 			case 5:
		 				setState(540)
		 				try functionDeclaration()

		 				break
		 			case 6:
		 				setState(541)
		 				try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(544); 
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
		 	setState(546)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(547)
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
		 	setState(549)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(550)
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
		 	setState(553)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(552)
		 		try methodType()

		 	}

		 	setState(555)
		 	try methodSelector()
		 	setState(559)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(556)
		 		try macro()


		 		setState(561)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(562)
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
		 	setState(569) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(569)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,39, _ctx)) {
		 		case 1:
		 			setState(564)
		 			try functionDefinition()

		 			break
		 		case 2:
		 			setState(565)
		 			try declaration()

		 			break
		 		case 3:
		 			setState(566)
		 			try classMethodDefinition()

		 			break
		 		case 4:
		 			setState(567)
		 			try instanceMethodDefinition()

		 			break
		 		case 5:
		 			setState(568)
		 			try propertyImplementation()

		 			break
		 		default: break
		 		}

		 		setState(571); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 36591682547875833) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)

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
		 	setState(573)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(574)
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
		 	setState(576)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(577)
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
		 	setState(580)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(579)
		 		try methodType()

		 	}

		 	setState(582)
		 	try methodSelector()
		 	setState(584)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
		 		setState(583)
		 		try initDeclaratorList()

		 	}

		 	setState(587)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(586)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 	}

		 	setState(589)
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
		 	setState(601)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,46, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(591)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(593); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(592)
		 				try keywordDeclarator()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(595); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,44,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(599)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(597)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(598)
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
		 	setState(604)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(603)
		 		try selector()

		 	}

		 	setState(606)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(610)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(607)
		 		try methodType()


		 		setState(612)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(614)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,49,_ctx)) {
		 	case 1:
		 		setState(613)
		 		try arcBehaviourSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(616)
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
		 	setState(620)
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
		 		setState(618)
		 		try identifier()

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(619)
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
		 	setState(622)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(623)
		 	try typeName()
		 	setState(624)
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
		 	setState(634)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .SYNTHESIZE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(626)
		 		try match(ObjectiveCParser.Tokens.SYNTHESIZE.rawValue)
		 		setState(627)
		 		try propertySynthesizeList()
		 		setState(628)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break

		 	case .DYNAMIC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(630)
		 		try match(ObjectiveCParser.Tokens.DYNAMIC.rawValue)
		 		setState(631)
		 		try propertySynthesizeList()
		 		setState(632)
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
		 	setState(636)
		 	try propertySynthesizeItem()
		 	setState(641)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(637)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(638)
		 		try propertySynthesizeItem()


		 		setState(643)
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
		 	setState(644)
		 	try identifier()
		 	setState(647)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(645)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(646)
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
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
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
		 	setState(650)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,54,_ctx)) {
		 	case 1:
		 		setState(649)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(652)
		 	try typeSpecifier(0)
		 	setState(654)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(653)
		 		try nullabilitySpecifier()

		 	}

		 	setState(656)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(658)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(657)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(660)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(662)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(661)
		 		try nullabilitySpecifier()

		 	}

		 	setState(664)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(666)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(665)
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
		 	setState(668)
		 	try match(ObjectiveCParser.Tokens.LT.rawValue)
		 	setState(677)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(669)
		 		try typeSpecifierWithPrefixes()
		 		setState(674)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(670)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(671)
		 			try typeSpecifierWithPrefixes()


		 			setState(676)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(679)
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
		 	setState(689)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,62, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(684)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(681)
		 				try typePrefix()

		 		 
		 			}
		 			setState(686)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,61,_ctx)
		 		}
		 		setState(687)
		 		try typeSpecifier(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(688)
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
		 	setState(691)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(692)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(704)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(693)
		 		try dictionaryPair()
		 		setState(698)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,63,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(694)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(695)
		 				try dictionaryPair()

		 		 
		 			}
		 			setState(700)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,63,_ctx)
		 		}
		 		setState(702)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(701)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(706)
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
		 	setState(708)
		 	try castExpression()
		 	setState(709)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(710)
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
		 	setState(712)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(713)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(718)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(714)
		 		try expressions()
		 		setState(716)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(715)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(720)
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
		 	setState(732)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,69, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(722)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(723)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(724)
		 		try expression(0)
		 		setState(725)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(727)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(730)
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
		 			setState(728)
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
		 			setState(729)
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
		 	setState(734)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(746)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(737)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,70, _ctx)) {
		 		case 1:
		 			setState(735)
		 			try typeVariableDeclaratorOrName()

		 			break
		 		case 2:
		 			setState(736)
		 			try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 			break
		 		default: break
		 		}
		 		setState(743)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(739)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(740)
		 			try typeVariableDeclaratorOrName()


		 			setState(745)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(748)
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
		 	setState(752)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,73, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(750)
		 		try typeVariableDeclarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(751)
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
		 	setState(754)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(756)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,74,_ctx)) {
		 	case 1:
		 		setState(755)
		 		try typeSpecifier(0)

		 		break
		 	default: break
		 	}
		 	setState(759)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(758)
		 		try nullabilitySpecifier()

		 	}

		 	setState(762)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(761)
		 		try blockParameters()

		 	}

		 	setState(764)
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
		 	setState(766)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(767)
		 	try receiver()
		 	setState(768)
		 	try messageSelector()
		 	setState(769)
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
		 	setState(773)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,77, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(771)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(772)
		 		try typeSpecifier(0)

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
		 	setState(781)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,79, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(775)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(777) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(776)
		 			try keywordArgument()


		 			setState(779); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(784)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(783)
		 		try selector()

		 	}

		 	setState(786)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(787)
		 	try keywordArgumentType()
		 	setState(792)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(788)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(789)
		 		try keywordArgumentType()


		 		setState(794)
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
		 	setState(795)
		 	try expressions()
		 	setState(797)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,82,_ctx)) {
		 	case 1:
		 		setState(796)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(803)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(799)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(800)
		 		try initializerList()
		 		setState(801)
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
		 	setState(805)
		 	try match(ObjectiveCParser.Tokens.SELECTOR.rawValue)
		 	setState(806)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(807)
		 	try selectorName()
		 	setState(808)
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
		 	setState(820)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,86, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(810)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(811)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(816) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(813)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 				setState(812)
		 				try selector()

		 			}

		 			setState(815)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 			setState(818); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763731447808) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(822)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(823)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(824)
		 	try protocolName()
		 	setState(825)
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
		 	setState(827)
		 	try match(ObjectiveCParser.Tokens.ENCODE.rawValue)
		 	setState(828)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(829)
		 	try typeName()
		 	setState(830)
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
		 	setState(832)
		 	try declarationSpecifiers()
		 	setState(833)
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
		 	setState(842)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,87, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(835)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(836)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(837)
		 		try identifier()
		 		setState(838)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(840)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(841)
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
		 	setState(844)
		 	try match(ObjectiveCParser.Tokens.TRY.rawValue)
		 	setState(845)
		 	try {
		 			let assignmentValue = try compoundStatement()
		 			_localctx.castdown(TryBlockContext.self).tryStatement = assignmentValue
		 	     }()

		 	setState(849)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CATCH.rawValue) {
		 		setState(846)
		 		try catchStatement()


		 		setState(851)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(854)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.FINALLY.rawValue) {
		 		setState(852)
		 		try match(ObjectiveCParser.Tokens.FINALLY.rawValue)
		 		setState(853)
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
		 	setState(856)
		 	try match(ObjectiveCParser.Tokens.CATCH.rawValue)
		 	setState(857)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(858)
		 	try typeVariableDeclarator()
		 	setState(859)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(860)
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
		 	setState(862)
		 	try match(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue)
		 	setState(863)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(864)
		 	try expression(0)
		 	setState(865)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
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
		 	setState(868)
		 	try match(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue)
		 	setState(869)
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
		 	setState(871)
		 	try functionSignature()
		 	setState(872)
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
		 	setState(874)
		 	try functionSignature()
		 	setState(875)
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
		 	setState(878)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,90,_ctx)) {
		 	case 1:
		 		setState(877)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(880)
		 	try identifier()

		 	setState(881)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(883)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(882)
		 		try parameterList()

		 	}

		 	setState(885)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	setState(888)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(887)
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
		 	setState(890)
		 	try attributeName()
		 	setState(892)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(891)
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
		 	setState(896)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(894)
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
		 		setState(895)
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
		 	setState(898)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(900)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804832) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 66584579) != 0)) {
		 		setState(899)
		 		try attributeParameterList()

		 	}

		 	setState(902)
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
		 	setState(904)
		 	try attributeParameter()
		 	setState(909)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(905)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(906)
		 		try attributeParameter()


		 		setState(911)
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
		 	setState(916)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,97, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(912)
		 		try attribute()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(913)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(914)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(915)
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
		 	setState(918)
		 	try attributeName()
		 	setState(919)
		 	try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 	setState(923)
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
		 		setState(920)
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
		 		setState(921)
		 		try attributeName()

		 		break

		 	case .STRING_START:
		 		setState(922)
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
			func SEMI() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SEMI.rawValue, 0)
			}
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
			open
			func macro() -> MacroContext? {
				return getRuleContext(MacroContext.self, 0)
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
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(929)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,99, _ctx)) {
		 	case 1:
		 		setState(925)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		setState(926)
		 		try enumDeclaration()

		 		break
		 	case 3:
		 		setState(927)
		 		try varDeclaration()

		 		break
		 	case 4:
		 		setState(928)
		 		try typedefDeclaration()

		 		break
		 	default: break
		 	}
		 	setState(932)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(931)
		 		try macro()

		 	}

		 	setState(934)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

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
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
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
		 	setState(937)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(936)
		 		try attributeSpecifier()

		 	}

		 	setState(939)
		 	try identifier()
		 	setState(941)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(940)
		 		try attributeSpecifier()

		 	}

		 	setState(943)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(944)
		 	try declarator()
		 	setState(945)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

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
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func nsEnumOrOptionSpecifier() -> NsEnumOrOptionSpecifierContext? {
				return getRuleContext(NsEnumOrOptionSpecifierContext.self, 0)
			}
			open
			func attributeSpecifier() -> AttributeSpecifierContext? {
				return getRuleContext(AttributeSpecifierContext.self, 0)
			}
			open
			func TYPEDEF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TYPEDEF.rawValue, 0)
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
		 	setState(948)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(947)
		 		try attributeSpecifier()

		 	}

		 	setState(951)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.TYPEDEF.rawValue) {
		 		setState(950)
		 		try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)

		 	}

		 	setState(957)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ENUM:
		 		setState(953)
		 		try enumSpecifier()
		 		setState(954)
		 		try identifier()

		 		break
		 	case .NS_ENUM:fallthrough
		 	case .NS_CLOSED_ENUM:fallthrough
		 	case .NS_ERROR_ENUM:fallthrough
		 	case .NS_OPTIONS:
		 		setState(956)
		 		try nsEnumOrOptionSpecifier()

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

	public class VarDeclarationContext: ParserRuleContext {
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
		 	setState(963)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,106, _ctx)) {
		 	case 1:
		 		setState(959)
		 		try declarationSpecifiers()
		 		setState(960)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		setState(962)
		 		try declarationSpecifiers()

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

	public class TypedefDeclarationContext: ParserRuleContext {
			open
			func TYPEDEF() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.TYPEDEF.rawValue, 0)
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
			func typeDeclaratorList() -> TypeDeclaratorListContext? {
				return getRuleContext(TypeDeclaratorListContext.self, 0)
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
		 	setState(966)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(965)
		 		try attributeSpecifier()

		 	}

		 	setState(968)
		 	try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)
		 	setState(969)
		 	try declarationSpecifiers()
		 	setState(971)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,108,_ctx)) {
		 	case 1:
		 		setState(970)
		 		try typeDeclaratorList()

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

	public class TypeDeclaratorListContext: ParserRuleContext {
			open
			func declarator() -> [DeclaratorContext] {
				return getRuleContexts(DeclaratorContext.self)
			}
			open
			func declarator(_ i: Int) -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, i)
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
		 	setState(973)
		 	try declarator()
		 	setState(978)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(974)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(975)
		 		try declarator()


		 		setState(980)
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

	public class DeclarationSpecifiersContext: ParserRuleContext {
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
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
			func NS_NOESCAPE() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)
			}
			open
			func NS_NOESCAPE(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue, i)
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
		try enterRule(_localctx, 150, ObjectiveCParser.RULE_declarationSpecifiers)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(991)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,111,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(989)
		 			try _errHandler.sync(self)
		 			switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 			case .AUTO:fallthrough
		 			case .EXTERN:fallthrough
		 			case .REGISTER:fallthrough
		 			case .STATIC:
		 				setState(981)
		 				try storageClassSpecifier()

		 				break

		 			case .ATTRIBUTE:
		 				setState(982)
		 				try attributeSpecifier()

		 				break
		 			case .AUTORELEASING_QUALIFIER:fallthrough
		 			case .STRONG_QUALIFIER:fallthrough
		 			case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
		 			case .WEAK_QUALIFIER:
		 				setState(983)
		 				try arcBehaviourSpecifier()

		 				break
		 			case .NULL_UNSPECIFIED:fallthrough
		 			case .NULLABLE:fallthrough
		 			case .NONNULL:fallthrough
		 			case .NULL_RESETTABLE:
		 				setState(984)
		 				try nullabilitySpecifier()

		 				break
		 			case .IB_OUTLET:fallthrough
		 			case .IB_OUTLET_COLLECTION:
		 				setState(985)
		 				try ibOutletQualifier()

		 				break

		 			case .NS_NOESCAPE:
		 				setState(986)
		 				try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 				break
		 			case .INLINE:fallthrough
		 			case .BLOCK:fallthrough
		 			case .BRIDGE:fallthrough
		 			case .BRIDGE_RETAINED:fallthrough
		 			case .BRIDGE_TRANSFER:fallthrough
		 			case .KINDOF:fallthrough
		 			case .NS_INLINE:
		 				setState(987)
		 				try typePrefix()

		 				break
		 			case .CONST:fallthrough
		 			case .RESTRICT:fallthrough
		 			case .VOLATILE:fallthrough
		 			case .BYCOPY:fallthrough
		 			case .BYREF:fallthrough
		 			case .IN:fallthrough
		 			case .INOUT:fallthrough
		 			case .ONEWAY:fallthrough
		 			case .OUT:
		 				setState(988)
		 				try typeQualifier()

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 	 
		 		}
		 		setState(993)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,111,_ctx)
		 	}
		 	setState(994)
		 	try typeSpecifier(0)
		 	setState(999)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,113,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(997)
		 			try _errHandler.sync(self)
		 			switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 			case .ATTRIBUTE:
		 				setState(995)
		 				try attributeSpecifier()

		 				break
		 			case .CONST:fallthrough
		 			case .RESTRICT:fallthrough
		 			case .VOLATILE:fallthrough
		 			case .BYCOPY:fallthrough
		 			case .BYREF:fallthrough
		 			case .IN:fallthrough
		 			case .INOUT:fallthrough
		 			case .ONEWAY:fallthrough
		 			case .OUT:
		 				setState(996)
		 				try typeQualifier()

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 	 
		 		}
		 		setState(1001)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,113,_ctx)
		 	}

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
		try enterRule(_localctx, 152, ObjectiveCParser.RULE_attributeSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1002)
		 	try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 	setState(1003)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1004)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1005)
		 	try attribute()
		 	setState(1010)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1006)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1007)
		 		try attribute()


		 		setState(1012)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1013)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1014)
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
		try enterRule(_localctx, 154, ObjectiveCParser.RULE_initDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1016)
		 	try initDeclarator()
		 	setState(1021)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1017)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1018)
		 		try initDeclarator()


		 		setState(1023)
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
		try enterRule(_localctx, 156, ObjectiveCParser.RULE_initDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1024)
		 	try declarator()
		 	setState(1027)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1025)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1026)
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
		try enterRule(_localctx, 158, ObjectiveCParser.RULE_structOrUnionSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1029)
		 	_la = try _input.LA(1)
		 	if (!(_la == ObjectiveCParser.Tokens.STRUCT.rawValue || _la == ObjectiveCParser.Tokens.UNION.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1042)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,119, _ctx)) {
		 	case 1:
		 		setState(1030)
		 		try identifier()

		 		break
		 	case 2:
		 		setState(1032)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1031)
		 			try identifier()

		 		}

		 		setState(1034)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1036) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1035)
		 			try fieldDeclaration()


		 			setState(1038); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0))
		 		setState(1040)
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
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
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
		try enterRule(_localctx, 160, ObjectiveCParser.RULE_fieldDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1044)
		 	try declarationSpecifiers()
		 	setState(1045)
		 	try fieldDeclaratorList()
		 	setState(1047)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(1046)
		 		try macro()

		 	}

		 	setState(1049)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)

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
		try enterRule(_localctx, 162, ObjectiveCParser.RULE_ibOutletQualifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1057)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IB_OUTLET_COLLECTION:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1051)
		 		try match(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue)
		 		setState(1052)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1053)
		 		try identifier()
		 		setState(1054)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break

		 	case .IB_OUTLET:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1056)
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
		try enterRule(_localctx, 164, ObjectiveCParser.RULE_arcBehaviourSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1059)
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
		try enterRule(_localctx, 166, ObjectiveCParser.RULE_nullabilitySpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1061)
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
		try enterRule(_localctx, 168, ObjectiveCParser.RULE_storageClassSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1063)
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
		try enterRule(_localctx, 170, ObjectiveCParser.RULE_typePrefix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1065)
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
		try enterRule(_localctx, 172, ObjectiveCParser.RULE_typeQualifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1071)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1067)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break

		 	case .VOLATILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1068)
		 		try match(ObjectiveCParser.Tokens.VOLATILE.rawValue)

		 		break

		 	case .RESTRICT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1069)
		 		try match(ObjectiveCParser.Tokens.RESTRICT.rawValue)

		 		break
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1070)
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
		try enterRule(_localctx, 174, ObjectiveCParser.RULE_protocolQualifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1073)
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

	public class TypeSpecifierModifierContext: ParserRuleContext {
			open
			func SHORT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SHORT.rawValue, 0)
			}
			open
			func LONG() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LONG.rawValue, 0)
			}
			open
			func SIGNED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.SIGNED.rawValue, 0)
			}
			open
			func UNSIGNED() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.UNSIGNED.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_typeSpecifierModifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterTypeSpecifierModifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitTypeSpecifierModifier(self)
			}
		}
	}
	@discardableResult
	 open func typeSpecifierModifier() throws -> TypeSpecifierModifierContext {
		var _localctx: TypeSpecifierModifierContext
		_localctx = TypeSpecifierModifierContext(_ctx, getState())
		try enterRule(_localctx, 176, ObjectiveCParser.RULE_typeSpecifierModifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1075)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0))) {
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
			func typeSpecifierModifier() -> [TypeSpecifierModifierContext] {
				return getRuleContexts(TypeSpecifierModifierContext.self)
			}
			open
			func typeSpecifierModifier(_ i: Int) -> TypeSpecifierModifierContext? {
				return getRuleContext(TypeSpecifierModifierContext.self, i)
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
			func typeofExpression() -> TypeofExpressionContext? {
				return getRuleContext(TypeofExpressionContext.self, 0)
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
			func nsEnumOrOptionSpecifier() -> NsEnumOrOptionSpecifierContext? {
				return getRuleContext(NsEnumOrOptionSpecifierContext.self, 0)
			}
			open
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
			}
			open
			func nullabilitySpecifier() -> NullabilitySpecifierContext? {
				return getRuleContext(NullabilitySpecifierContext.self, 0)
			}
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func typeSpecifier() -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, 0)
			}
			open
			func MUL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.MUL.rawValue, 0)
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

	 public final  func typeSpecifier( ) throws -> TypeSpecifierContext   {
		return try typeSpecifier(0)
	}
	@discardableResult
	private func typeSpecifier(_ _p: Int) throws -> TypeSpecifierContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: TypeSpecifierContext
		_localctx = TypeSpecifierContext(_ctx, _parentState)
		var _prevctx: TypeSpecifierContext = _localctx
		let _startState: Int = 178
		try enterRecursionRule(_localctx, 178, ObjectiveCParser.RULE_typeSpecifier, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1133)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,131, _ctx)) {
			case 1:
				setState(1078)
				try match(ObjectiveCParser.Tokens.VOID.rawValue)

				break
			case 2:
				setState(1082)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1079)
					try typeSpecifierModifier()


					setState(1084)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1085)
				try match(ObjectiveCParser.Tokens.CHAR.rawValue)

				break
			case 3:
				setState(1089)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,124,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1086)
						try typeSpecifierModifier()

				 
					}
					setState(1091)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,124,_ctx)
				}
				setState(1092)
				try match(ObjectiveCParser.Tokens.SHORT.rawValue)

				break
			case 4:
				setState(1096)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1093)
					try typeSpecifierModifier()


					setState(1098)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1099)
				try match(ObjectiveCParser.Tokens.INT.rawValue)

				break
			case 5:
				setState(1103)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1100)
						try typeSpecifierModifier()

				 
					}
					setState(1105)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				}
				setState(1106)
				try match(ObjectiveCParser.Tokens.LONG.rawValue)

				break
			case 6:
				setState(1110)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1107)
					try typeSpecifierModifier()


					setState(1112)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1113)
				try match(ObjectiveCParser.Tokens.FLOAT.rawValue)

				break
			case 7:
				setState(1117)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1114)
					try typeSpecifierModifier()


					setState(1119)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1120)
				try match(ObjectiveCParser.Tokens.DOUBLE.rawValue)

				break
			case 8:
				setState(1121)
				try typeofExpression()

				break
			case 9:
				setState(1122)
				try structOrUnionSpecifier()

				break
			case 10:
				setState(1123)
				try enumSpecifier()

				break
			case 11:
				setState(1124)
				try nsEnumOrOptionSpecifier()

				break
			case 12:
				setState(1125)
				try genericTypeSpecifier()
				setState(1127)
				try _errHandler.sync(self)
				switch (try getInterpreter().adaptivePredict(_input,129,_ctx)) {
				case 1:
					setState(1126)
					try nullabilitySpecifier()

					break
				default: break
				}

				break
			case 13:
				setState(1129)
				try identifier()
				setState(1131)
				try _errHandler.sync(self)
				switch (try getInterpreter().adaptivePredict(_input,130,_ctx)) {
				case 1:
					setState(1130)
					try nullabilitySpecifier()

					break
				default: break
				}

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1142)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = TypeSpecifierContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_typeSpecifier)
					setState(1135)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1136)
					try match(ObjectiveCParser.Tokens.MUL.rawValue)
					setState(1138)
					try _errHandler.sync(self)
					switch (try getInterpreter().adaptivePredict(_input,132,_ctx)) {
					case 1:
						setState(1137)
						try nullabilitySpecifier()

						break
					default: break
					}

			 
				}
				setState(1144)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
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
		try enterRule(_localctx, 180, ObjectiveCParser.RULE_typeofExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1145)
		 	try match(ObjectiveCParser.Tokens.TYPEOF.rawValue)

		 	setState(1146)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1147)
		 	try expression(0)
		 	setState(1148)
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
		try enterRule(_localctx, 182, ObjectiveCParser.RULE_fieldDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1150)
		 	try fieldDeclarator()
		 	setState(1155)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1151)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1152)
		 		try fieldDeclarator()


		 		setState(1157)
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
		try enterRule(_localctx, 184, ObjectiveCParser.RULE_fieldDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1164)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,136, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1158)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1160)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
		 			setState(1159)
		 			try declarator()

		 		}

		 		setState(1162)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1163)
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
		try enterRule(_localctx, 186, ObjectiveCParser.RULE_enumSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1166)
		 	try match(ObjectiveCParser.Tokens.ENUM.rawValue)
		 	setState(1172)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,138,_ctx)) {
		 	case 1:
		 		setState(1168)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1167)
		 			try identifier()

		 		}

		 		setState(1170)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1171)
		 		try typeName()

		 		break
		 	default: break
		 	}
		 	setState(1185)
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
		 		setState(1174)
		 		try identifier()
		 		setState(1179)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,139,_ctx)) {
		 		case 1:
		 			setState(1175)
		 			try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 			setState(1176)
		 			try enumeratorList()
		 			setState(1177)
		 			try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 			break
		 		default: break
		 		}

		 		break

		 	case .LBRACE:
		 		setState(1181)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1182)
		 		try enumeratorList()
		 		setState(1183)
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

	public class NsEnumOrOptionSpecifierContext: ParserRuleContext {
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
			open
			func COMMA() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COMMA.rawValue, 0)
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
			func NS_OPTIONS() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_OPTIONS.rawValue, 0)
			}
			open
			func NS_ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_ENUM.rawValue, 0)
			}
			open
			func NS_CLOSED_ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_CLOSED_ENUM.rawValue, 0)
			}
			open
			func NS_ERROR_ENUM() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_ERROR_ENUM.rawValue, 0)
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
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_nsEnumOrOptionSpecifier
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterNsEnumOrOptionSpecifier(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitNsEnumOrOptionSpecifier(self)
			}
		}
	}
	@discardableResult
	 open func nsEnumOrOptionSpecifier() throws -> NsEnumOrOptionSpecifierContext {
		var _localctx: NsEnumOrOptionSpecifierContext
		_localctx = NsEnumOrOptionSpecifierContext(_ctx, getState())
		try enterRule(_localctx, 188, ObjectiveCParser.RULE_nsEnumOrOptionSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1187)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 15) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1188)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1189)
		 	try typeName()
		 	setState(1190)
		 	try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 	setState(1191)
		 	try identifier()
		 	setState(1192)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1197)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,141,_ctx)) {
		 	case 1:
		 		setState(1193)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1194)
		 		try enumeratorList()
		 		setState(1195)
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
		 	setState(1199)
		 	try enumerator()
		 	setState(1204)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,142,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1200)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1201)
		 			try enumerator()

		 	 
		 		}
		 		setState(1206)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,142,_ctx)
		 	}
		 	setState(1208)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1207)
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
		 	setState(1210)
		 	try enumeratorIdentifier()
		 	setState(1213)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1211)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1212)
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
		 	setState(1217)
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
		 		setState(1215)
		 		try identifier()

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1216)
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

	public class DeclaratorContext: ParserRuleContext {
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
		try enterRule(_localctx, 196, ObjectiveCParser.RULE_declarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1242)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,150, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1224)
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
		 			setState(1219)
		 			try identifier()

		 			break

		 		case .LP:
		 			setState(1220)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1221)
		 			try declarator()
		 			setState(1222)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1229)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1226)
		 			try declaratorSuffix()


		 			setState(1231)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1232)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1233)
		 		try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 		setState(1235)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,148,_ctx)) {
		 		case 1:
		 			setState(1234)
		 			try nullabilitySpecifier()

		 			break
		 		default: break
		 		}
		 		setState(1238)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1237)
		 			try identifier()

		 		}

		 		setState(1240)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1241)
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
		 	setState(1244)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(1246)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 		setState(1245)
		 		try constantExpression()

		 	}

		 	setState(1248)
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
		 	setState(1250)
		 	try parameterDeclarationList()
		 	setState(1253)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1251)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1252)
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
			func LP() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.LP.rawValue)
			}
			open
			func LP(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, i)
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
			open
			func NS_UNAVAILABLE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_UNAVAILABLE.rawValue, 0)
			}
			open
			func NS_SWIFT_NAME() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue, 0)
			}
			open
			func swiftAliasExpression() -> SwiftAliasExpressionContext? {
				return getRuleContext(SwiftAliasExpressionContext.self, 0)
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
			open
			func ATTRIBUTE() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue, 0)
			}
			open
			func clangAttribute() -> [ClangAttributeContext] {
				return getRuleContexts(ClangAttributeContext.self)
			}
			open
			func clangAttribute(_ i: Int) -> ClangAttributeContext? {
				return getRuleContext(ClangAttributeContext.self, i)
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
		try enterRule(_localctx, 202, ObjectiveCParser.RULE_macro)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1321)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,159, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1255)
		 		try identifier()
		 		setState(1267)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 			setState(1256)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1257)
		 			try primaryExpression()
		 			setState(1262)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 				setState(1258)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1259)
		 				try primaryExpression()


		 				setState(1264)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1265)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1269)
		 		try match(ObjectiveCParser.Tokens.NS_UNAVAILABLE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1270)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue)
		 		setState(1271)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1274)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,155, _ctx)) {
		 		case 1:
		 			setState(1272)
		 			try swiftAliasExpression()

		 			break
		 		case 2:
		 			setState(1273)
		 			try swiftSelectorExpression()

		 			break
		 		default: break
		 		}
		 		setState(1276)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1278)
		 		try match(ObjectiveCParser.Tokens.API_AVAILABLE.rawValue)
		 		setState(1279)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1280)
		 		try apiAvailableOsVersion()
		 		setState(1285)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1281)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1282)
		 			try apiAvailableOsVersion()


		 			setState(1287)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1288)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1290)
		 		try match(ObjectiveCParser.Tokens.API_UNAVAILABLE.rawValue)
		 		setState(1291)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1292)
		 		try identifier()
		 		setState(1297)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1293)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1294)
		 			try identifier()


		 			setState(1299)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1300)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1302)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_UNAVAILABLE.rawValue)
		 		setState(1303)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1304)
		 		try stringLiteral()
		 		setState(1305)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1307)
		 		try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 		setState(1308)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1309)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1310)
		 		try clangAttribute()
		 		setState(1315)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1311)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1312)
		 			try clangAttribute()


		 			setState(1317)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1318)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1319)
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

	public class ClangAttributeContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func clangAttributeArgument() -> [ClangAttributeArgumentContext] {
				return getRuleContexts(ClangAttributeArgumentContext.self)
			}
			open
			func clangAttributeArgument(_ i: Int) -> ClangAttributeArgumentContext? {
				return getRuleContext(ClangAttributeArgumentContext.self, i)
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
			return ObjectiveCParser.RULE_clangAttribute
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClangAttribute(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClangAttribute(self)
			}
		}
	}
	@discardableResult
	 open func clangAttribute() throws -> ClangAttributeContext {
		var _localctx: ClangAttributeContext
		_localctx = ClangAttributeContext(_ctx, getState())
		try enterRule(_localctx, 204, ObjectiveCParser.RULE_clangAttribute)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1336)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,161, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1323)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1324)
		 		try identifier()
		 		setState(1325)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1326)
		 		try clangAttributeArgument()
		 		setState(1331)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1327)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1328)
		 			try clangAttributeArgument()


		 			setState(1333)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1334)
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

	public class ClangAttributeArgumentContext: ParserRuleContext {
			open
			func identifier() -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, 0)
			}
			open
			func DECIMAL_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue, 0)
			}
			open
			func stringLiteral() -> StringLiteralContext? {
				return getRuleContext(StringLiteralContext.self, 0)
			}
			open
			func ASSIGNMENT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue, 0)
			}
			open
			func version() -> VersionContext? {
				return getRuleContext(VersionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_clangAttributeArgument
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterClangAttributeArgument(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitClangAttributeArgument(self)
			}
		}
	}
	@discardableResult
	 open func clangAttributeArgument() throws -> ClangAttributeArgumentContext {
		var _localctx: ClangAttributeArgumentContext
		_localctx = ClangAttributeArgumentContext(_ctx, getState())
		try enterRule(_localctx, 206, ObjectiveCParser.RULE_clangAttributeArgument)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1349)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,162, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1338)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1339)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1340)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1341)
		 		try identifier()
		 		setState(1342)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1343)
		 		try version()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1345)
		 		try identifier()
		 		setState(1346)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1347)
		 		try stringLiteral()

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

	public class SwiftAliasExpressionContext: ParserRuleContext {
			open
			func identifier() -> [IdentifierContext] {
				return getRuleContexts(IdentifierContext.self)
			}
			open
			func identifier(_ i: Int) -> IdentifierContext? {
				return getRuleContext(IdentifierContext.self, i)
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
			return ObjectiveCParser.RULE_swiftAliasExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterSwiftAliasExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitSwiftAliasExpression(self)
			}
		}
	}
	@discardableResult
	 open func swiftAliasExpression() throws -> SwiftAliasExpressionContext {
		var _localctx: SwiftAliasExpressionContext
		_localctx = SwiftAliasExpressionContext(_ctx, getState())
		try enterRule(_localctx, 208, ObjectiveCParser.RULE_swiftAliasExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1351)
		 	try identifier()
		 	setState(1356)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1352)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1353)
		 		try identifier()


		 		setState(1358)
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
		try enterRule(_localctx, 210, ObjectiveCParser.RULE_swiftSelectorExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1359)
		 	try identifier()
		 	setState(1360)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1366)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727269888) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.UNDERSCORE.rawValue) {
		 		setState(1361)
		 		try swiftSelector()
		 		setState(1362)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 		setState(1368)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1369)
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
			open
			func FOR() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.FOR.rawValue, 0)
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
		try enterRule(_localctx, 212, ObjectiveCParser.RULE_swiftSelector)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1374)
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
		 		setState(1371)
		 		try identifier()

		 		break

		 	case .UNDERSCORE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1372)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break

		 	case .FOR:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1373)
		 		try match(ObjectiveCParser.Tokens.FOR.rawValue)

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
		try enterRule(_localctx, 214, ObjectiveCParser.RULE_apiAvailableOsVersion)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1376)
		 	try identifier()
		 	setState(1377)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1378)
		 	try version()
		 	setState(1379)
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
		try enterRule(_localctx, 216, ObjectiveCParser.RULE_version)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1390)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FLOATING_POINT_LITERAL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1381)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break

		 	case .DECIMAL_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1382)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)
		 		setState(1387)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 			setState(1383)
		 			try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 			setState(1384)
		 			try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)


		 			setState(1389)
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
		try enterRule(_localctx, 218, ObjectiveCParser.RULE_arrayInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1392)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1397)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1393)
		 		try expressions()
		 		setState(1395)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1394)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1399)
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
		try enterRule(_localctx, 220, ObjectiveCParser.RULE_structInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1401)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1415)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1402)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1403)
		 		try expression(0)
		 		setState(1409)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,170,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(1404)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1405)
		 				try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 				setState(1406)
		 				try expression(0)

		 		 
		 			}
		 			setState(1411)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,170,_ctx)
		 		}
		 		setState(1413)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1412)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1417)
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
		try enterRule(_localctx, 222, ObjectiveCParser.RULE_initializerList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1419)
		 	try initializer()
		 	setState(1424)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,173,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1420)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1421)
		 			try initializer()

		 	 
		 		}
		 		setState(1426)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,173,_ctx)
		 	}
		 	setState(1428)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1427)
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
			func declarationSpecifiers() -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, 0)
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
		try enterRule(_localctx, 224, ObjectiveCParser.RULE_typeName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1435)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,176, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1430)
		 		try declarationSpecifiers()
		 		setState(1432)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1431)
		 			try abstractDeclarator()

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1434)
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
			func LP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LP.rawValue, 0)
			}
			open
			func RP() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.RP.rawValue, 0)
			}
			open
			func abstractDeclarator() -> AbstractDeclaratorContext? {
				return getRuleContext(AbstractDeclaratorContext.self, 0)
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
		try enterRule(_localctx, 226, ObjectiveCParser.RULE_abstractDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1456)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LP:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1437)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1439)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1438)
		 			try abstractDeclarator()

		 		}

		 		setState(1441)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1443) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1442)
		 			try abstractDeclaratorSuffix()


		 			setState(1445); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break

		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1452) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1447)
		 			try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 			setState(1449)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 				setState(1448)
		 				try constantExpression()

		 			}

		 			setState(1451)
		 			try match(ObjectiveCParser.Tokens.RBRACK.rawValue)


		 			setState(1454); 
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
		try enterRule(_localctx, 228, ObjectiveCParser.RULE_abstractDeclaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1468)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1458)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1460)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101273804800) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 			setState(1459)
		 			try constantExpression()

		 		}

		 		setState(1462)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1463)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1465)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 			setState(1464)
		 			try parameterDeclarationList()

		 		}

		 		setState(1467)
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
		try enterRule(_localctx, 230, ObjectiveCParser.RULE_parameterDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1470)
		 	try parameterDeclaration()
		 	setState(1475)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,185,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1471)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1472)
		 			try parameterDeclaration()

		 	 
		 		}
		 		setState(1477)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,185,_ctx)
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
		try enterRule(_localctx, 232, ObjectiveCParser.RULE_parameterDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1482)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,186, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1478)
		 		try declarationSpecifiers()
		 		setState(1479)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1481)
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
		try enterRule(_localctx, 234, ObjectiveCParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1525)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,197, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1484)
		 		try labeledStatement()
		 		setState(1486)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,187,_ctx)) {
		 		case 1:
		 			setState(1485)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1488)
		 		try compoundStatement()
		 		setState(1490)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,188,_ctx)) {
		 		case 1:
		 			setState(1489)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1492)
		 		try selectionStatement()
		 		setState(1494)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,189,_ctx)) {
		 		case 1:
		 			setState(1493)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1496)
		 		try iterationStatement()
		 		setState(1498)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,190,_ctx)) {
		 		case 1:
		 			setState(1497)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1500)
		 		try jumpStatement()
		 		setState(1502)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,191,_ctx)) {
		 		case 1:
		 			setState(1501)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1504)
		 		try synchronizedStatement()
		 		setState(1506)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,192,_ctx)) {
		 		case 1:
		 			setState(1505)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1508)
		 		try autoreleaseStatement()
		 		setState(1510)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,193,_ctx)) {
		 		case 1:
		 			setState(1509)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1512)
		 		try throwStatement()
		 		setState(1514)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,194,_ctx)) {
		 		case 1:
		 			setState(1513)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1516)
		 		try tryBlock()
		 		setState(1518)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,195,_ctx)) {
		 		case 1:
		 			setState(1517)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1520)
		 		try expressions()
		 		setState(1522)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,196,_ctx)) {
		 		case 1:
		 			setState(1521)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1524)
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
		try enterRule(_localctx, 236, ObjectiveCParser.RULE_labeledStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1527)
		 	try identifier()
		 	setState(1528)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(1529)
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
		try enterRule(_localctx, 238, ObjectiveCParser.RULE_rangeExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1531)
		 	try constantExpression()
		 	setState(1534)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ELIPSIS.rawValue) {
		 		setState(1532)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)
		 		setState(1533)
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
		try enterRule(_localctx, 240, ObjectiveCParser.RULE_compoundStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1536)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1541)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146530212641654) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802877825) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536747) != 0)) {
		 		setState(1539)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,199, _ctx)) {
		 		case 1:
		 			setState(1537)
		 			try declaration()

		 			break
		 		case 2:
		 			setState(1538)
		 			try statement()

		 			break
		 		default: break
		 		}

		 		setState(1543)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1544)
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
		try enterRule(_localctx, 242, ObjectiveCParser.RULE_selectionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1556)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IF:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1546)
		 		try match(ObjectiveCParser.Tokens.IF.rawValue)
		 		setState(1547)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1548)
		 		try expression(0)
		 		setState(1549)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1550)
		 		try {
		 				let assignmentValue = try statement()
		 				_localctx.castdown(SelectionStatementContext.self).ifBody = assignmentValue
		 		     }()

		 		setState(1553)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,201,_ctx)) {
		 		case 1:
		 			setState(1551)
		 			try match(ObjectiveCParser.Tokens.ELSE.rawValue)
		 			setState(1552)
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
		 		setState(1555)
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
		try enterRule(_localctx, 244, ObjectiveCParser.RULE_switchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1558)
		 	try match(ObjectiveCParser.Tokens.SWITCH.rawValue)
		 	setState(1559)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1560)
		 	try expression(0)
		 	setState(1561)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1562)
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
		try enterRule(_localctx, 246, ObjectiveCParser.RULE_switchBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1564)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1568)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue) {
		 		setState(1565)
		 		try switchSection()


		 		setState(1570)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1571)
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
		try enterRule(_localctx, 248, ObjectiveCParser.RULE_switchSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1574) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1573)
		 		try switchLabel()


		 		setState(1576); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 	setState(1579) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1578)
		 		try statement()


		 		setState(1581); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146513339072836) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360772993) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536747) != 0))

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
		try enterRule(_localctx, 250, ObjectiveCParser.RULE_switchLabel)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1595)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CASE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1583)
		 		try match(ObjectiveCParser.Tokens.CASE.rawValue)
		 		setState(1589)
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
		 			setState(1584)
		 			try rangeExpression()

		 			break

		 		case .LP:
		 			setState(1585)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1586)
		 			try rangeExpression()
		 			setState(1587)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1591)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1593)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 		setState(1594)
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
		try enterRule(_localctx, 252, ObjectiveCParser.RULE_iterationStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1601)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,208, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1597)
		 		try whileStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1598)
		 		try doStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1599)
		 		try forStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1600)
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
		try enterRule(_localctx, 254, ObjectiveCParser.RULE_whileStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1603)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1604)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1605)
		 	try expression(0)
		 	setState(1606)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1607)
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
		try enterRule(_localctx, 256, ObjectiveCParser.RULE_doStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1609)
		 	try match(ObjectiveCParser.Tokens.DO.rawValue)
		 	setState(1610)
		 	try statement()
		 	setState(1611)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1612)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1613)
		 	try expression(0)
		 	setState(1614)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1615)
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
		try enterRule(_localctx, 258, ObjectiveCParser.RULE_forStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1617)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1618)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1620)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916136071445042) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802874497) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1619)
		 		try forLoopInitializer()

		 	}

		 	setState(1622)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1624)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1623)
		 		try expression(0)

		 	}

		 	setState(1626)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1628)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1627)
		 		try expressions()

		 	}

		 	setState(1630)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1631)
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
		try enterRule(_localctx, 260, ObjectiveCParser.RULE_forLoopInitializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1637)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,212, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1633)
		 		try declarationSpecifiers()
		 		setState(1634)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1636)
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
		try enterRule(_localctx, 262, ObjectiveCParser.RULE_forInStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1639)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1640)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1641)
		 	try typeVariableDeclarator()
		 	setState(1642)
		 	try match(ObjectiveCParser.Tokens.IN.rawValue)
		 	setState(1644)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1643)
		 		try expression(0)

		 	}

		 	setState(1646)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1647)
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
		try enterRule(_localctx, 264, ObjectiveCParser.RULE_jumpStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1657)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .GOTO:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1649)
		 		try match(ObjectiveCParser.Tokens.GOTO.rawValue)
		 		setState(1650)
		 		try identifier()

		 		break

		 	case .CONTINUE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1651)
		 		try match(ObjectiveCParser.Tokens.CONTINUE.rawValue)

		 		break

		 	case .BREAK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1652)
		 		try match(ObjectiveCParser.Tokens.BREAK.rawValue)

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1653)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)
		 		setState(1655)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,214,_ctx)) {
		 		case 1:
		 			setState(1654)
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
		try enterRule(_localctx, 266, ObjectiveCParser.RULE_expressions)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1659)
		 	try expression(0)
		 	setState(1664)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,216,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1660)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1661)
		 			try expression(0)

		 	 
		 		}
		 		setState(1666)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,216,_ctx)
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
		let _startState: Int = 268
		try enterRecursionRule(_localctx, 268, ObjectiveCParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1677)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,217, _ctx)) {
			case 1:
				setState(1668)
				try castExpression()

				break
			case 2:
				setState(1669)
				try match(ObjectiveCParser.Tokens.LP.rawValue)
				setState(1670)
				try compoundStatement()
				setState(1671)
				try match(ObjectiveCParser.Tokens.RP.rawValue)

				break
			case 3:
				setState(1673)
				try unaryExpression()
				setState(1674)
				try assignmentOperator()
				setState(1675)
				try {
						let assignmentValue = try expression(1)
						_localctx.castdown(ExpressionContext.self).assignmentExpression = assignmentValue
				     }()


				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1723)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,221,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(1721)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,220, _ctx)) {
					case 1:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1679)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(1680)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 163)) & ~0x3f) == 0 && ((Int64(1) << (_la - 163)) & 35) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1681)
						try expression(14)

						break
					case 2:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1682)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(1683)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1684)
						try expression(13)

						break
					case 3:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1685)
						if (!(precpred(_ctx, 11))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 11)"))
						}
						setState(1690)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .LT:
							setState(1686)
							try match(ObjectiveCParser.Tokens.LT.rawValue)
							setState(1687)
							try match(ObjectiveCParser.Tokens.LT.rawValue)

							break

						case .GT:
							setState(1688)
							try match(ObjectiveCParser.Tokens.GT.rawValue)
							setState(1689)
							try match(ObjectiveCParser.Tokens.GT.rawValue)

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
						setState(1692)
						try expression(12)

						break
					case 4:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1693)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(1694)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 147)) & ~0x3f) == 0 && ((Int64(1) << (_la - 147)) & 387) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1695)
						try expression(11)

						break
					case 5:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1696)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(1697)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.EQUAL.rawValue || _la == ObjectiveCParser.Tokens.NOTEQUAL.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1698)
						try expression(10)

						break
					case 6:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1699)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(1700)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITAND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1701)
						try expression(9)

						break
					case 7:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1702)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(1703)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1704)
						try expression(8)

						break
					case 8:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1705)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(1706)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1707)
						try expression(7)

						break
					case 9:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1708)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(1709)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.AND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1710)
						try expression(6)

						break
					case 10:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1711)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(1712)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.OR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1713)
						try expression(5)

						break
					case 11:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1714)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(1715)
						try match(ObjectiveCParser.Tokens.QUESTION.rawValue)
						setState(1717)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
						if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119734747136) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
							setState(1716)
							try {
									let assignmentValue = try expression(0)
									_localctx.castdown(ExpressionContext.self).trueExpression = assignmentValue
							     }()


						}

						setState(1719)
						try match(ObjectiveCParser.Tokens.COLON.rawValue)
						setState(1720)
						try {
								let assignmentValue = try expression(4)
								_localctx.castdown(ExpressionContext.self).falseExpression = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(1725)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,221,_ctx)
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
		try enterRule(_localctx, 270, ObjectiveCParser.RULE_assignmentOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1726)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 146)) & ~0x3f) == 0 && ((Int64(1) << (_la - 146)) & 8581545985) != 0))) {
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
		try enterRule(_localctx, 272, ObjectiveCParser.RULE_castExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1737)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,223, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1728)
		 		try unaryExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1729)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1730)
		 		try typeName()
		 		setState(1731)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		setState(1735)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,222, _ctx)) {
		 		case 1:
		 			setState(1733)
		 			try castExpression()

		 			break
		 		case 2:
		 			setState(1734)
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
		try enterRule(_localctx, 274, ObjectiveCParser.RULE_initializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1742)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,224, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1739)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1740)
		 		try arrayInitializer()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1741)
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
		try enterRule(_localctx, 276, ObjectiveCParser.RULE_constantExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1746)
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
		 		setState(1744)
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
		 		setState(1745)
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
		try enterRule(_localctx, 278, ObjectiveCParser.RULE_unaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1762)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,227, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1748)
		 		try postfixExpression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1749)
		 		try match(ObjectiveCParser.Tokens.SIZEOF.rawValue)
		 		setState(1755)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,226, _ctx)) {
		 		case 1:
		 			setState(1750)
		 			try unaryExpression()

		 			break
		 		case 2:
		 			setState(1751)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1752)
		 			try typeSpecifier(0)
		 			setState(1753)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1757)
		 		_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1758)
		 		try unaryExpression()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1759)
		 		try unaryOperator()
		 		setState(1760)
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
		try enterRule(_localctx, 280, ObjectiveCParser.RULE_unaryOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1764)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 149)) & ~0x3f) == 0 && ((Int64(1) << (_la - 149)) & 94211) != 0))) {
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
		let _startState: Int = 282
		try enterRecursionRule(_localctx, 282, ObjectiveCParser.RULE_postfixExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1767)
			try primaryExpression()
			setState(1771)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,228,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					setState(1768)
					try `postfix`()

			 
				}
				setState(1773)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,228,_ctx)
			}

			_ctx!.stop = try _input.LT(-1)
			setState(1785)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,230,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = PostfixExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_postfixExpression)
					setState(1774)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1775)
					_la = try _input.LA(1)
					if (!(_la == ObjectiveCParser.Tokens.DOT.rawValue || _la == ObjectiveCParser.Tokens.STRUCTACCESS.rawValue)) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(1776)
					try identifier()
					setState(1780)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,229,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1777)
							try `postfix`()

					 
						}
						setState(1782)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,229,_ctx)
					}

			 
				}
				setState(1787)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,230,_ctx)
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
		open var _tset3426: Token!
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
		try enterRule(_localctx, 284, ObjectiveCParser.RULE_postfix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1806)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,234, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1788)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1789)
		 		try expression(0)
		 		setState(1790)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1792)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1794)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916127411120656) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196290586308737) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 			setState(1793)
		 			try argumentExpressionList()

		 		}

		 		setState(1796)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1797)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1800) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1800)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,232, _ctx)) {
		 			case 1:
		 				setState(1798)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 				break
		 			case 2:
		 				setState(1799)
		 				_localctx.castdown(PostfixContext.self)._tset3426 = try _input.LT(1)
		 				_la = try _input.LA(1)
		 				if (_la <= 0 || (_la == ObjectiveCParser.Tokens.RP.rawValue)) {
		 					_localctx.castdown(PostfixContext.self)._tset3426 = try _errHandler.recoverInline(self) as Token
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}
		 				_localctx.castdown(PostfixContext.self).macroArguments.append(_localctx.castdown(PostfixContext.self)._tset3426)

		 				break
		 			default: break
		 			}

		 			setState(1802); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & -2) != 0) || ((Int64((_la - 64)) & ~0x3f) == 0 && ((Int64(1) << (_la - 64)) & -1) != 0) || ((Int64((_la - 128)) & ~0x3f) == 0 && ((Int64(1) << (_la - 128)) & -129) != 0) || ((Int64((_la - 192)) & ~0x3f) == 0 && ((Int64(1) << (_la - 192)) & 1099511627775) != 0))
		 		setState(1804)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1805)
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
		try enterRule(_localctx, 286, ObjectiveCParser.RULE_argumentExpressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1808)
		 	try argumentExpression()
		 	setState(1813)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1809)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1810)
		 		try argumentExpression()


		 		setState(1815)
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
		try enterRule(_localctx, 288, ObjectiveCParser.RULE_argumentExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1818)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,236, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1816)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1817)
		 		try typeSpecifier(0)

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
		try enterRule(_localctx, 290, ObjectiveCParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1835)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,237, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1820)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1821)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1822)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1823)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1824)
		 		try expression(0)
		 		setState(1825)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1827)
		 		try messageExpression()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1828)
		 		try selectorExpression()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1829)
		 		try protocolExpression()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1830)
		 		try encodeExpression()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1831)
		 		try dictionaryExpression()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1832)
		 		try arrayExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1833)
		 		try boxExpression()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1834)
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
		try enterRule(_localctx, 292, ObjectiveCParser.RULE_constant)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1855)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,240, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1837)
		 		try match(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1838)
		 		try match(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1839)
		 		try match(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1841)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1840)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1843)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1845)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1844)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1847)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1848)
		 		try match(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1849)
		 		try match(ObjectiveCParser.Tokens.NIL.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1850)
		 		try match(ObjectiveCParser.Tokens.NULL_.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1851)
		 		try match(ObjectiveCParser.Tokens.YES.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1852)
		 		try match(ObjectiveCParser.Tokens.NO.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1853)
		 		try match(ObjectiveCParser.Tokens.TRUE.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1854)
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
		try enterRule(_localctx, 294, ObjectiveCParser.RULE_stringLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1865); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1857)
		 			try match(ObjectiveCParser.Tokens.STRING_START.rawValue)
		 			setState(1861)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue) {
		 				setState(1858)
		 				_la = try _input.LA(1)
		 				if (!(_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue)) {
		 				try _errHandler.recoverInline(self)
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}


		 				setState(1863)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1864)
		 			try match(ObjectiveCParser.Tokens.STRING_END.rawValue)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1867); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,242,_ctx)
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
		try enterRule(_localctx, 296, ObjectiveCParser.RULE_identifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1869)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763727253504) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0))) {
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
		case  89:
			return try typeSpecifier_sempred(_localctx?.castdown(TypeSpecifierContext.self), predIndex)
		case  134:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
		case  141:
			return try postfixExpression_sempred(_localctx?.castdown(PostfixExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func typeSpecifier_sempred(_ _localctx: TypeSpecifierContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func expression_sempred(_ _localctx: ExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 1:return precpred(_ctx, 13)
		    case 2:return precpred(_ctx, 12)
		    case 3:return precpred(_ctx, 11)
		    case 4:return precpred(_ctx, 10)
		    case 5:return precpred(_ctx, 9)
		    case 6:return precpred(_ctx, 8)
		    case 7:return precpred(_ctx, 7)
		    case 8:return precpred(_ctx, 6)
		    case 9:return precpred(_ctx, 5)
		    case 10:return precpred(_ctx, 4)
		    case 11:return precpred(_ctx, 3)
		    default: return true
		}
	}
	private func postfixExpression_sempred(_ _localctx: PostfixExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 12:return precpred(_ctx, 1)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,231,1872,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
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
		2,147,7,147,2,148,7,148,1,0,5,0,300,8,0,10,0,12,0,303,9,0,1,0,1,0,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,319,8,1,1,2,1,2,1,2,1,
		2,1,3,3,3,326,8,3,1,3,1,3,1,3,1,3,3,3,332,8,3,1,3,1,3,1,3,1,3,3,3,338,
		8,3,1,3,3,3,341,8,3,1,3,3,3,344,8,3,1,3,1,3,1,4,1,4,1,4,1,4,3,4,352,8,
		4,1,4,1,4,1,4,1,4,1,4,3,4,359,8,4,1,4,3,4,362,8,4,1,4,3,4,365,8,4,1,4,
		1,4,1,5,1,5,1,5,1,5,3,5,373,8,5,1,5,3,5,376,8,5,1,5,3,5,379,8,5,1,5,1,
		5,1,6,1,6,1,6,1,6,1,6,1,6,3,6,389,8,6,1,6,1,6,1,7,1,7,1,7,1,7,1,7,1,7,
		3,7,399,8,7,1,8,3,8,402,8,8,1,8,1,8,1,8,1,8,1,8,1,8,3,8,410,8,8,1,8,5,
		8,413,8,8,10,8,12,8,416,9,8,1,8,1,8,1,9,1,9,5,9,422,8,9,10,9,12,9,425,
		9,9,1,9,4,9,428,8,9,11,9,12,9,429,3,9,432,8,9,1,10,1,10,1,10,1,10,1,11,
		1,11,1,11,1,11,5,11,442,8,11,10,11,12,11,445,9,11,1,11,1,11,1,12,1,12,
		1,12,5,12,452,8,12,10,12,12,12,455,9,12,1,13,1,13,1,13,1,13,1,13,3,13,
		462,8,13,1,13,3,13,465,8,13,1,13,3,13,468,8,13,1,13,1,13,1,14,1,14,1,14,
		5,14,475,8,14,10,14,12,14,478,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
		1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,
		500,8,15,1,16,1,16,1,16,1,16,1,16,3,16,507,8,16,1,16,3,16,510,8,16,1,17,
		1,17,5,17,514,8,17,10,17,12,17,517,9,17,1,17,1,17,1,18,1,18,5,18,523,8,
		18,10,18,12,18,526,9,18,1,18,4,18,529,8,18,11,18,12,18,530,3,18,533,8,
		18,1,19,1,19,1,20,1,20,1,20,1,20,1,20,1,20,4,20,543,8,20,11,20,12,20,544,
		1,21,1,21,1,21,1,22,1,22,1,22,1,23,3,23,554,8,23,1,23,1,23,5,23,558,8,
		23,10,23,12,23,561,9,23,1,23,1,23,1,24,1,24,1,24,1,24,1,24,4,24,570,8,
		24,11,24,12,24,571,1,25,1,25,1,25,1,26,1,26,1,26,1,27,3,27,581,8,27,1,
		27,1,27,3,27,585,8,27,1,27,3,27,588,8,27,1,27,1,27,1,28,1,28,4,28,594,
		8,28,11,28,12,28,595,1,28,1,28,3,28,600,8,28,3,28,602,8,28,1,29,3,29,605,
		8,29,1,29,1,29,5,29,609,8,29,10,29,12,29,612,9,29,1,29,3,29,615,8,29,1,
		29,1,29,1,30,1,30,3,30,621,8,30,1,31,1,31,1,31,1,31,1,32,1,32,1,32,1,32,
		1,32,1,32,1,32,1,32,3,32,635,8,32,1,33,1,33,1,33,5,33,640,8,33,10,33,12,
		33,643,9,33,1,34,1,34,1,34,3,34,648,8,34,1,35,3,35,651,8,35,1,35,1,35,
		3,35,655,8,35,1,35,1,35,3,35,659,8,35,1,35,1,35,3,35,663,8,35,1,35,1,35,
		3,35,667,8,35,1,36,1,36,1,36,1,36,5,36,673,8,36,10,36,12,36,676,9,36,3,
		36,678,8,36,1,36,1,36,1,37,5,37,683,8,37,10,37,12,37,686,9,37,1,37,1,37,
		3,37,690,8,37,1,38,1,38,1,38,1,38,1,38,5,38,697,8,38,10,38,12,38,700,9,
		38,1,38,3,38,703,8,38,3,38,705,8,38,1,38,1,38,1,39,1,39,1,39,1,39,1,40,
		1,40,1,40,1,40,3,40,717,8,40,3,40,719,8,40,1,40,1,40,1,41,1,41,1,41,1,
		41,1,41,1,41,1,41,1,41,3,41,731,8,41,3,41,733,8,41,1,42,1,42,1,42,3,42,
		738,8,42,1,42,1,42,5,42,742,8,42,10,42,12,42,745,9,42,3,42,747,8,42,1,
		42,1,42,1,43,1,43,3,43,753,8,43,1,44,1,44,3,44,757,8,44,1,44,3,44,760,
		8,44,1,44,3,44,763,8,44,1,44,1,44,1,45,1,45,1,45,1,45,1,45,1,46,1,46,3,
		46,774,8,46,1,47,1,47,4,47,778,8,47,11,47,12,47,779,3,47,782,8,47,1,48,
		3,48,785,8,48,1,48,1,48,1,48,1,48,5,48,791,8,48,10,48,12,48,794,9,48,1,
		49,1,49,3,49,798,8,49,1,49,1,49,1,49,1,49,3,49,804,8,49,1,50,1,50,1,50,
		1,50,1,50,1,51,1,51,1,51,3,51,814,8,51,1,51,4,51,817,8,51,11,51,12,51,
		818,3,51,821,8,51,1,52,1,52,1,52,1,52,1,52,1,53,1,53,1,53,1,53,1,53,1,
		54,1,54,1,54,1,55,1,55,1,55,1,55,1,55,1,55,1,55,3,55,843,8,55,1,56,1,56,
		1,56,5,56,848,8,56,10,56,12,56,851,9,56,1,56,1,56,3,56,855,8,56,1,57,1,
		57,1,57,1,57,1,57,1,57,1,58,1,58,1,58,1,58,1,58,1,58,1,59,1,59,1,59,1,
		60,1,60,1,60,1,61,1,61,1,61,1,62,3,62,879,8,62,1,62,1,62,1,62,3,62,884,
		8,62,1,62,1,62,1,62,3,62,889,8,62,1,63,1,63,3,63,893,8,63,1,64,1,64,3,
		64,897,8,64,1,65,1,65,3,65,901,8,65,1,65,1,65,1,66,1,66,1,66,5,66,908,
		8,66,10,66,12,66,911,9,66,1,67,1,67,1,67,1,67,3,67,917,8,67,1,68,1,68,
		1,68,1,68,1,68,3,68,924,8,68,1,69,1,69,1,69,1,69,3,69,930,8,69,1,69,3,
		69,933,8,69,1,69,1,69,1,70,3,70,938,8,70,1,70,1,70,3,70,942,8,70,1,70,
		1,70,1,70,1,70,1,71,3,71,949,8,71,1,71,3,71,952,8,71,1,71,1,71,1,71,1,
		71,3,71,958,8,71,1,72,1,72,1,72,1,72,3,72,964,8,72,1,73,3,73,967,8,73,
		1,73,1,73,1,73,3,73,972,8,73,1,74,1,74,1,74,5,74,977,8,74,10,74,12,74,
		980,9,74,1,75,1,75,1,75,1,75,1,75,1,75,1,75,1,75,5,75,990,8,75,10,75,12,
		75,993,9,75,1,75,1,75,1,75,5,75,998,8,75,10,75,12,75,1001,9,75,1,76,1,
		76,1,76,1,76,1,76,1,76,5,76,1009,8,76,10,76,12,76,1012,9,76,1,76,1,76,
		1,76,1,77,1,77,1,77,5,77,1020,8,77,10,77,12,77,1023,9,77,1,78,1,78,1,78,
		3,78,1028,8,78,1,79,1,79,1,79,3,79,1033,8,79,1,79,1,79,4,79,1037,8,79,
		11,79,12,79,1038,1,79,1,79,3,79,1043,8,79,1,80,1,80,1,80,3,80,1048,8,80,
		1,80,1,80,1,81,1,81,1,81,1,81,1,81,1,81,3,81,1058,8,81,1,82,1,82,1,83,
		1,83,1,84,1,84,1,85,1,85,1,86,1,86,1,86,1,86,3,86,1072,8,86,1,87,1,87,
		1,88,1,88,1,89,1,89,1,89,5,89,1081,8,89,10,89,12,89,1084,9,89,1,89,1,89,
		5,89,1088,8,89,10,89,12,89,1091,9,89,1,89,1,89,5,89,1095,8,89,10,89,12,
		89,1098,9,89,1,89,1,89,5,89,1102,8,89,10,89,12,89,1105,9,89,1,89,1,89,
		5,89,1109,8,89,10,89,12,89,1112,9,89,1,89,1,89,5,89,1116,8,89,10,89,12,
		89,1119,9,89,1,89,1,89,1,89,1,89,1,89,1,89,1,89,3,89,1128,8,89,1,89,1,
		89,3,89,1132,8,89,3,89,1134,8,89,1,89,1,89,1,89,3,89,1139,8,89,5,89,1141,
		8,89,10,89,12,89,1144,9,89,1,90,1,90,1,90,1,90,1,90,1,91,1,91,1,91,5,91,
		1154,8,91,10,91,12,91,1157,9,91,1,92,1,92,3,92,1161,8,92,1,92,1,92,3,92,
		1165,8,92,1,93,1,93,3,93,1169,8,93,1,93,1,93,3,93,1173,8,93,1,93,1,93,
		1,93,1,93,1,93,3,93,1180,8,93,1,93,1,93,1,93,1,93,3,93,1186,8,93,1,94,
		1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,3,94,1198,8,94,1,95,1,95,
		1,95,5,95,1203,8,95,10,95,12,95,1206,9,95,1,95,3,95,1209,8,95,1,96,1,96,
		1,96,3,96,1214,8,96,1,97,1,97,3,97,1218,8,97,1,98,1,98,1,98,1,98,1,98,
		3,98,1225,8,98,1,98,5,98,1228,8,98,10,98,12,98,1231,9,98,1,98,1,98,1,98,
		3,98,1236,8,98,1,98,3,98,1239,8,98,1,98,1,98,3,98,1243,8,98,1,99,1,99,
		3,99,1247,8,99,1,99,1,99,1,100,1,100,1,100,3,100,1254,8,100,1,101,1,101,
		1,101,1,101,1,101,5,101,1261,8,101,10,101,12,101,1264,9,101,1,101,1,101,
		3,101,1268,8,101,1,101,1,101,1,101,1,101,1,101,3,101,1275,8,101,1,101,
		1,101,1,101,1,101,1,101,1,101,1,101,5,101,1284,8,101,10,101,12,101,1287,
		9,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,5,101,1296,8,101,10,101,
		12,101,1299,9,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,
		1,101,1,101,1,101,1,101,5,101,1314,8,101,10,101,12,101,1317,9,101,1,101,
		1,101,1,101,3,101,1322,8,101,1,102,1,102,1,102,1,102,1,102,1,102,5,102,
		1330,8,102,10,102,12,102,1333,9,102,1,102,1,102,3,102,1337,8,102,1,103,
		1,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,3,103,1350,
		8,103,1,104,1,104,1,104,5,104,1355,8,104,10,104,12,104,1358,9,104,1,105,
		1,105,1,105,1,105,1,105,5,105,1365,8,105,10,105,12,105,1368,9,105,1,105,
		1,105,1,106,1,106,1,106,3,106,1375,8,106,1,107,1,107,1,107,1,107,1,107,
		1,108,1,108,1,108,1,108,5,108,1386,8,108,10,108,12,108,1389,9,108,3,108,
		1391,8,108,1,109,1,109,1,109,3,109,1396,8,109,3,109,1398,8,109,1,109,1,
		109,1,110,1,110,1,110,1,110,1,110,1,110,5,110,1408,8,110,10,110,12,110,
		1411,9,110,1,110,3,110,1414,8,110,3,110,1416,8,110,1,110,1,110,1,111,1,
		111,1,111,5,111,1423,8,111,10,111,12,111,1426,9,111,1,111,3,111,1429,8,
		111,1,112,1,112,3,112,1433,8,112,1,112,3,112,1436,8,112,1,113,1,113,3,
		113,1440,8,113,1,113,1,113,4,113,1444,8,113,11,113,12,113,1445,1,113,1,
		113,3,113,1450,8,113,1,113,4,113,1453,8,113,11,113,12,113,1454,3,113,1457,
		8,113,1,114,1,114,3,114,1461,8,114,1,114,1,114,1,114,3,114,1466,8,114,
		1,114,3,114,1469,8,114,1,115,1,115,1,115,5,115,1474,8,115,10,115,12,115,
		1477,9,115,1,116,1,116,1,116,1,116,3,116,1483,8,116,1,117,1,117,3,117,
		1487,8,117,1,117,1,117,3,117,1491,8,117,1,117,1,117,3,117,1495,8,117,1,
		117,1,117,3,117,1499,8,117,1,117,1,117,3,117,1503,8,117,1,117,1,117,3,
		117,1507,8,117,1,117,1,117,3,117,1511,8,117,1,117,1,117,3,117,1515,8,117,
		1,117,1,117,3,117,1519,8,117,1,117,1,117,3,117,1523,8,117,1,117,3,117,
		1526,8,117,1,118,1,118,1,118,1,118,1,119,1,119,1,119,3,119,1535,8,119,
		1,120,1,120,1,120,5,120,1540,8,120,10,120,12,120,1543,9,120,1,120,1,120,
		1,121,1,121,1,121,1,121,1,121,1,121,1,121,3,121,1554,8,121,1,121,3,121,
		1557,8,121,1,122,1,122,1,122,1,122,1,122,1,122,1,123,1,123,5,123,1567,
		8,123,10,123,12,123,1570,9,123,1,123,1,123,1,124,4,124,1575,8,124,11,124,
		12,124,1576,1,124,4,124,1580,8,124,11,124,12,124,1581,1,125,1,125,1,125,
		1,125,1,125,1,125,3,125,1590,8,125,1,125,1,125,1,125,1,125,3,125,1596,
		8,125,1,126,1,126,1,126,1,126,3,126,1602,8,126,1,127,1,127,1,127,1,127,
		1,127,1,127,1,128,1,128,1,128,1,128,1,128,1,128,1,128,1,128,1,129,1,129,
		1,129,3,129,1621,8,129,1,129,1,129,3,129,1625,8,129,1,129,1,129,3,129,
		1629,8,129,1,129,1,129,1,129,1,130,1,130,1,130,1,130,3,130,1638,8,130,
		1,131,1,131,1,131,1,131,1,131,3,131,1645,8,131,1,131,1,131,1,131,1,132,
		1,132,1,132,1,132,1,132,1,132,3,132,1656,8,132,3,132,1658,8,132,1,133,
		1,133,1,133,5,133,1663,8,133,10,133,12,133,1666,9,133,1,134,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,1,134,1,134,3,134,1678,8,134,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,3,134,1691,8,134,
		1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		1,134,3,134,1718,8,134,1,134,1,134,5,134,1722,8,134,10,134,12,134,1725,
		9,134,1,135,1,135,1,136,1,136,1,136,1,136,1,136,1,136,1,136,3,136,1736,
		8,136,3,136,1738,8,136,1,137,1,137,1,137,3,137,1743,8,137,1,138,1,138,
		3,138,1747,8,138,1,139,1,139,1,139,1,139,1,139,1,139,1,139,3,139,1756,
		8,139,1,139,1,139,1,139,1,139,1,139,3,139,1763,8,139,1,140,1,140,1,141,
		1,141,1,141,5,141,1770,8,141,10,141,12,141,1773,9,141,1,141,1,141,1,141,
		1,141,5,141,1779,8,141,10,141,12,141,1782,9,141,5,141,1784,8,141,10,141,
		12,141,1787,9,141,1,142,1,142,1,142,1,142,1,142,1,142,3,142,1795,8,142,
		1,142,1,142,1,142,1,142,4,142,1801,8,142,11,142,12,142,1802,1,142,1,142,
		3,142,1807,8,142,1,143,1,143,1,143,5,143,1812,8,143,10,143,12,143,1815,
		9,143,1,144,1,144,3,144,1819,8,144,1,145,1,145,1,145,1,145,1,145,1,145,
		1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,3,145,1836,8,145,
		1,146,1,146,1,146,1,146,3,146,1842,8,146,1,146,1,146,3,146,1846,8,146,
		1,146,1,146,1,146,1,146,1,146,1,146,1,146,1,146,3,146,1856,8,146,1,147,
		1,147,5,147,1860,8,147,10,147,12,147,1863,9,147,1,147,4,147,1866,8,147,
		11,147,12,147,1867,1,148,1,148,1,148,0,3,178,268,282,149,0,2,4,6,8,10,
		12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,
		60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,
		106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,
		142,144,146,148,150,152,154,156,158,160,162,164,166,168,170,172,174,176,
		178,180,182,184,186,188,190,192,194,196,198,200,202,204,206,208,210,212,
		214,216,218,220,222,224,226,228,230,232,234,236,238,240,242,244,246,248,
		250,252,254,256,258,260,262,264,266,268,270,272,274,276,278,280,282,284,
		286,288,290,292,294,296,0,22,2,0,70,70,75,75,1,0,90,91,3,0,68,68,71,71,
		73,74,2,0,27,27,30,30,4,0,85,85,94,94,96,96,98,98,1,0,99,102,4,0,1,1,12,
		12,20,20,26,26,4,0,17,17,86,89,93,93,103,103,3,0,42,43,46,47,51,52,3,0,
		19,19,23,24,31,31,1,0,104,107,2,0,163,164,168,168,1,0,161,162,2,0,147,
		148,154,155,2,0,153,153,156,156,2,0,146,146,169,178,1,0,159,160,3,0,149,
		150,161,163,165,165,1,0,142,143,1,0,135,135,2,0,192,192,194,194,10,0,40,
		47,51,56,81,83,85,86,88,93,97,97,99,104,107,108,114,126,133,133,2077,0,
		301,1,0,0,0,2,318,1,0,0,0,4,320,1,0,0,0,6,325,1,0,0,0,8,347,1,0,0,0,10,
		368,1,0,0,0,12,382,1,0,0,0,14,392,1,0,0,0,16,401,1,0,0,0,18,431,1,0,0,
		0,20,433,1,0,0,0,22,437,1,0,0,0,24,448,1,0,0,0,26,456,1,0,0,0,28,471,1,
		0,0,0,30,499,1,0,0,0,32,509,1,0,0,0,34,511,1,0,0,0,36,532,1,0,0,0,38,534,
		1,0,0,0,40,542,1,0,0,0,42,546,1,0,0,0,44,549,1,0,0,0,46,553,1,0,0,0,48,
		569,1,0,0,0,50,573,1,0,0,0,52,576,1,0,0,0,54,580,1,0,0,0,56,601,1,0,0,
		0,58,604,1,0,0,0,60,620,1,0,0,0,62,622,1,0,0,0,64,634,1,0,0,0,66,636,1,
		0,0,0,68,644,1,0,0,0,70,650,1,0,0,0,72,668,1,0,0,0,74,689,1,0,0,0,76,691,
		1,0,0,0,78,708,1,0,0,0,80,712,1,0,0,0,82,732,1,0,0,0,84,734,1,0,0,0,86,
		752,1,0,0,0,88,754,1,0,0,0,90,766,1,0,0,0,92,773,1,0,0,0,94,781,1,0,0,
		0,96,784,1,0,0,0,98,795,1,0,0,0,100,805,1,0,0,0,102,820,1,0,0,0,104,822,
		1,0,0,0,106,827,1,0,0,0,108,832,1,0,0,0,110,842,1,0,0,0,112,844,1,0,0,
		0,114,856,1,0,0,0,116,862,1,0,0,0,118,868,1,0,0,0,120,871,1,0,0,0,122,
		874,1,0,0,0,124,878,1,0,0,0,126,890,1,0,0,0,128,896,1,0,0,0,130,898,1,
		0,0,0,132,904,1,0,0,0,134,916,1,0,0,0,136,918,1,0,0,0,138,929,1,0,0,0,
		140,937,1,0,0,0,142,948,1,0,0,0,144,963,1,0,0,0,146,966,1,0,0,0,148,973,
		1,0,0,0,150,991,1,0,0,0,152,1002,1,0,0,0,154,1016,1,0,0,0,156,1024,1,0,
		0,0,158,1029,1,0,0,0,160,1044,1,0,0,0,162,1057,1,0,0,0,164,1059,1,0,0,
		0,166,1061,1,0,0,0,168,1063,1,0,0,0,170,1065,1,0,0,0,172,1071,1,0,0,0,
		174,1073,1,0,0,0,176,1075,1,0,0,0,178,1133,1,0,0,0,180,1145,1,0,0,0,182,
		1150,1,0,0,0,184,1164,1,0,0,0,186,1166,1,0,0,0,188,1187,1,0,0,0,190,1199,
		1,0,0,0,192,1210,1,0,0,0,194,1217,1,0,0,0,196,1242,1,0,0,0,198,1244,1,
		0,0,0,200,1250,1,0,0,0,202,1321,1,0,0,0,204,1336,1,0,0,0,206,1349,1,0,
		0,0,208,1351,1,0,0,0,210,1359,1,0,0,0,212,1374,1,0,0,0,214,1376,1,0,0,
		0,216,1390,1,0,0,0,218,1392,1,0,0,0,220,1401,1,0,0,0,222,1419,1,0,0,0,
		224,1435,1,0,0,0,226,1456,1,0,0,0,228,1468,1,0,0,0,230,1470,1,0,0,0,232,
		1482,1,0,0,0,234,1525,1,0,0,0,236,1527,1,0,0,0,238,1531,1,0,0,0,240,1536,
		1,0,0,0,242,1556,1,0,0,0,244,1558,1,0,0,0,246,1564,1,0,0,0,248,1574,1,
		0,0,0,250,1595,1,0,0,0,252,1601,1,0,0,0,254,1603,1,0,0,0,256,1609,1,0,
		0,0,258,1617,1,0,0,0,260,1637,1,0,0,0,262,1639,1,0,0,0,264,1657,1,0,0,
		0,266,1659,1,0,0,0,268,1677,1,0,0,0,270,1726,1,0,0,0,272,1737,1,0,0,0,
		274,1742,1,0,0,0,276,1746,1,0,0,0,278,1762,1,0,0,0,280,1764,1,0,0,0,282,
		1766,1,0,0,0,284,1806,1,0,0,0,286,1808,1,0,0,0,288,1818,1,0,0,0,290,1835,
		1,0,0,0,292,1855,1,0,0,0,294,1865,1,0,0,0,296,1869,1,0,0,0,298,300,3,2,
		1,0,299,298,1,0,0,0,300,303,1,0,0,0,301,299,1,0,0,0,301,302,1,0,0,0,302,
		304,1,0,0,0,303,301,1,0,0,0,304,305,5,0,0,1,305,1,1,0,0,0,306,319,3,4,
		2,0,307,319,3,120,60,0,308,319,3,138,69,0,309,319,3,6,3,0,310,319,3,10,
		5,0,311,319,3,8,4,0,312,319,3,12,6,0,313,319,3,16,8,0,314,319,3,20,10,
		0,315,319,3,22,11,0,316,319,3,122,61,0,317,319,5,140,0,0,318,306,1,0,0,
		0,318,307,1,0,0,0,318,308,1,0,0,0,318,309,1,0,0,0,318,310,1,0,0,0,318,
		311,1,0,0,0,318,312,1,0,0,0,318,313,1,0,0,0,318,314,1,0,0,0,318,315,1,
		0,0,0,318,316,1,0,0,0,318,317,1,0,0,0,319,3,1,0,0,0,320,321,5,67,0,0,321,
		322,3,296,148,0,322,323,5,140,0,0,323,5,1,0,0,0,324,326,5,126,0,0,325,
		324,1,0,0,0,325,326,1,0,0,0,326,327,1,0,0,0,327,328,5,66,0,0,328,331,3,
		14,7,0,329,330,5,152,0,0,330,332,3,296,148,0,331,329,1,0,0,0,331,332,1,
		0,0,0,332,337,1,0,0,0,333,334,5,148,0,0,334,335,3,24,12,0,335,336,5,147,
		0,0,336,338,1,0,0,0,337,333,1,0,0,0,337,338,1,0,0,0,338,340,1,0,0,0,339,
		341,3,34,17,0,340,339,1,0,0,0,340,341,1,0,0,0,341,343,1,0,0,0,342,344,
		3,40,20,0,343,342,1,0,0,0,343,344,1,0,0,0,344,345,1,0,0,0,345,346,5,63,
		0,0,346,7,1,0,0,0,347,348,5,66,0,0,348,349,3,14,7,0,349,351,5,134,0,0,
		350,352,3,296,148,0,351,350,1,0,0,0,351,352,1,0,0,0,352,353,1,0,0,0,353,
		358,5,135,0,0,354,355,5,148,0,0,355,356,3,24,12,0,356,357,5,147,0,0,357,
		359,1,0,0,0,358,354,1,0,0,0,358,359,1,0,0,0,359,361,1,0,0,0,360,362,3,
		34,17,0,361,360,1,0,0,0,361,362,1,0,0,0,362,364,1,0,0,0,363,365,3,40,20,
		0,364,363,1,0,0,0,364,365,1,0,0,0,365,366,1,0,0,0,366,367,5,63,0,0,367,
		9,1,0,0,0,368,369,5,65,0,0,369,372,3,14,7,0,370,371,5,152,0,0,371,373,
		3,296,148,0,372,370,1,0,0,0,372,373,1,0,0,0,373,375,1,0,0,0,374,376,3,
		34,17,0,375,374,1,0,0,0,375,376,1,0,0,0,376,378,1,0,0,0,377,379,3,48,24,
		0,378,377,1,0,0,0,378,379,1,0,0,0,379,380,1,0,0,0,380,381,5,63,0,0,381,
		11,1,0,0,0,382,383,5,65,0,0,383,384,3,14,7,0,384,385,5,134,0,0,385,386,
		3,296,148,0,386,388,5,135,0,0,387,389,3,48,24,0,388,387,1,0,0,0,388,389,
		1,0,0,0,389,390,1,0,0,0,390,391,5,63,0,0,391,13,1,0,0,0,392,398,3,296,
		148,0,393,394,5,148,0,0,394,395,3,24,12,0,395,396,5,147,0,0,396,399,1,
		0,0,0,397,399,3,72,36,0,398,393,1,0,0,0,398,397,1,0,0,0,398,399,1,0,0,
		0,399,15,1,0,0,0,400,402,3,202,101,0,401,400,1,0,0,0,401,402,1,0,0,0,402,
		403,1,0,0,0,403,404,5,69,0,0,404,409,3,32,16,0,405,406,5,148,0,0,406,407,
		3,24,12,0,407,408,5,147,0,0,408,410,1,0,0,0,409,405,1,0,0,0,409,410,1,
		0,0,0,410,414,1,0,0,0,411,413,3,18,9,0,412,411,1,0,0,0,413,416,1,0,0,0,
		414,412,1,0,0,0,414,415,1,0,0,0,415,417,1,0,0,0,416,414,1,0,0,0,417,418,
		5,63,0,0,418,17,1,0,0,0,419,423,7,0,0,0,420,422,3,40,20,0,421,420,1,0,
		0,0,422,425,1,0,0,0,423,421,1,0,0,0,423,424,1,0,0,0,424,432,1,0,0,0,425,
		423,1,0,0,0,426,428,3,40,20,0,427,426,1,0,0,0,428,429,1,0,0,0,429,427,
		1,0,0,0,429,430,1,0,0,0,430,432,1,0,0,0,431,419,1,0,0,0,431,427,1,0,0,
		0,432,19,1,0,0,0,433,434,5,69,0,0,434,435,3,24,12,0,435,436,5,140,0,0,
		436,21,1,0,0,0,437,438,5,60,0,0,438,443,3,14,7,0,439,440,5,141,0,0,440,
		442,3,14,7,0,441,439,1,0,0,0,442,445,1,0,0,0,443,441,1,0,0,0,443,444,1,
		0,0,0,444,446,1,0,0,0,445,443,1,0,0,0,446,447,5,140,0,0,447,23,1,0,0,0,
		448,453,3,32,16,0,449,450,5,141,0,0,450,452,3,32,16,0,451,449,1,0,0,0,
		452,455,1,0,0,0,453,451,1,0,0,0,453,454,1,0,0,0,454,25,1,0,0,0,455,453,
		1,0,0,0,456,461,5,72,0,0,457,458,5,134,0,0,458,459,3,28,14,0,459,460,5,
		135,0,0,460,462,1,0,0,0,461,457,1,0,0,0,461,462,1,0,0,0,462,464,1,0,0,
		0,463,465,3,162,81,0,464,463,1,0,0,0,464,465,1,0,0,0,465,467,1,0,0,0,466,
		468,5,125,0,0,467,466,1,0,0,0,467,468,1,0,0,0,468,469,1,0,0,0,469,470,
		3,160,80,0,470,27,1,0,0,0,471,476,3,30,15,0,472,473,5,141,0,0,473,475,
		3,30,15,0,474,472,1,0,0,0,475,478,1,0,0,0,476,474,1,0,0,0,476,477,1,0,
		0,0,477,29,1,0,0,0,478,476,1,0,0,0,479,500,5,81,0,0,480,500,5,82,0,0,481,
		500,5,118,0,0,482,500,5,121,0,0,483,500,5,83,0,0,484,500,5,114,0,0,485,
		500,5,122,0,0,486,500,5,115,0,0,487,500,5,119,0,0,488,500,5,120,0,0,489,
		490,5,116,0,0,490,491,5,146,0,0,491,500,3,296,148,0,492,493,5,117,0,0,
		493,494,5,146,0,0,494,495,3,296,148,0,495,496,5,152,0,0,496,500,1,0,0,
		0,497,500,3,166,83,0,498,500,3,296,148,0,499,479,1,0,0,0,499,480,1,0,0,
		0,499,481,1,0,0,0,499,482,1,0,0,0,499,483,1,0,0,0,499,484,1,0,0,0,499,
		485,1,0,0,0,499,486,1,0,0,0,499,487,1,0,0,0,499,488,1,0,0,0,499,489,1,
		0,0,0,499,492,1,0,0,0,499,497,1,0,0,0,499,498,1,0,0,0,500,31,1,0,0,0,501,
		502,5,148,0,0,502,503,3,24,12,0,503,504,5,147,0,0,504,510,1,0,0,0,505,
		507,7,1,0,0,506,505,1,0,0,0,506,507,1,0,0,0,507,508,1,0,0,0,508,510,3,
		296,148,0,509,501,1,0,0,0,509,506,1,0,0,0,510,33,1,0,0,0,511,515,5,136,
		0,0,512,514,3,36,18,0,513,512,1,0,0,0,514,517,1,0,0,0,515,513,1,0,0,0,
		515,516,1,0,0,0,516,518,1,0,0,0,517,515,1,0,0,0,518,519,5,137,0,0,519,
		35,1,0,0,0,520,524,3,38,19,0,521,523,3,160,80,0,522,521,1,0,0,0,523,526,
		1,0,0,0,524,522,1,0,0,0,524,525,1,0,0,0,525,533,1,0,0,0,526,524,1,0,0,
		0,527,529,3,160,80,0,528,527,1,0,0,0,529,530,1,0,0,0,530,528,1,0,0,0,530,
		531,1,0,0,0,531,533,1,0,0,0,532,520,1,0,0,0,532,528,1,0,0,0,533,37,1,0,
		0,0,534,535,7,2,0,0,535,39,1,0,0,0,536,543,3,138,69,0,537,543,3,42,21,
		0,538,543,3,44,22,0,539,543,3,26,13,0,540,543,3,120,60,0,541,543,5,140,
		0,0,542,536,1,0,0,0,542,537,1,0,0,0,542,538,1,0,0,0,542,539,1,0,0,0,542,
		540,1,0,0,0,542,541,1,0,0,0,543,544,1,0,0,0,544,542,1,0,0,0,544,545,1,
		0,0,0,545,41,1,0,0,0,546,547,5,161,0,0,547,548,3,46,23,0,548,43,1,0,0,
		0,549,550,5,162,0,0,550,551,3,46,23,0,551,45,1,0,0,0,552,554,3,62,31,0,
		553,552,1,0,0,0,553,554,1,0,0,0,554,555,1,0,0,0,555,559,3,56,28,0,556,
		558,3,202,101,0,557,556,1,0,0,0,558,561,1,0,0,0,559,557,1,0,0,0,559,560,
		1,0,0,0,560,562,1,0,0,0,561,559,1,0,0,0,562,563,5,140,0,0,563,47,1,0,0,
		0,564,570,3,122,61,0,565,570,3,138,69,0,566,570,3,50,25,0,567,570,3,52,
		26,0,568,570,3,64,32,0,569,564,1,0,0,0,569,565,1,0,0,0,569,566,1,0,0,0,
		569,567,1,0,0,0,569,568,1,0,0,0,570,571,1,0,0,0,571,569,1,0,0,0,571,572,
		1,0,0,0,572,49,1,0,0,0,573,574,5,161,0,0,574,575,3,54,27,0,575,51,1,0,
		0,0,576,577,5,162,0,0,577,578,3,54,27,0,578,53,1,0,0,0,579,581,3,62,31,
		0,580,579,1,0,0,0,580,581,1,0,0,0,581,582,1,0,0,0,582,584,3,56,28,0,583,
		585,3,154,77,0,584,583,1,0,0,0,584,585,1,0,0,0,585,587,1,0,0,0,586,588,
		5,140,0,0,587,586,1,0,0,0,587,588,1,0,0,0,588,589,1,0,0,0,589,590,3,240,
		120,0,590,55,1,0,0,0,591,602,3,60,30,0,592,594,3,58,29,0,593,592,1,0,0,
		0,594,595,1,0,0,0,595,593,1,0,0,0,595,596,1,0,0,0,596,599,1,0,0,0,597,
		598,5,141,0,0,598,600,5,179,0,0,599,597,1,0,0,0,599,600,1,0,0,0,600,602,
		1,0,0,0,601,591,1,0,0,0,601,593,1,0,0,0,602,57,1,0,0,0,603,605,3,60,30,
		0,604,603,1,0,0,0,604,605,1,0,0,0,605,606,1,0,0,0,606,610,5,152,0,0,607,
		609,3,62,31,0,608,607,1,0,0,0,609,612,1,0,0,0,610,608,1,0,0,0,610,611,
		1,0,0,0,611,614,1,0,0,0,612,610,1,0,0,0,613,615,3,164,82,0,614,613,1,0,
		0,0,614,615,1,0,0,0,615,616,1,0,0,0,616,617,3,296,148,0,617,59,1,0,0,0,
		618,621,3,296,148,0,619,621,5,22,0,0,620,618,1,0,0,0,620,619,1,0,0,0,621,
		61,1,0,0,0,622,623,5,134,0,0,623,624,3,224,112,0,624,625,5,135,0,0,625,
		63,1,0,0,0,626,627,5,78,0,0,627,628,3,66,33,0,628,629,5,140,0,0,629,635,
		1,0,0,0,630,631,5,61,0,0,631,632,3,66,33,0,632,633,5,140,0,0,633,635,1,
		0,0,0,634,626,1,0,0,0,634,630,1,0,0,0,635,65,1,0,0,0,636,641,3,68,34,0,
		637,638,5,141,0,0,638,640,3,68,34,0,639,637,1,0,0,0,640,643,1,0,0,0,641,
		639,1,0,0,0,641,642,1,0,0,0,642,67,1,0,0,0,643,641,1,0,0,0,644,647,3,296,
		148,0,645,646,5,146,0,0,646,648,3,296,148,0,647,645,1,0,0,0,647,648,1,
		0,0,0,648,69,1,0,0,0,649,651,3,166,83,0,650,649,1,0,0,0,650,651,1,0,0,
		0,651,652,1,0,0,0,652,654,3,178,89,0,653,655,3,166,83,0,654,653,1,0,0,
		0,654,655,1,0,0,0,655,656,1,0,0,0,656,658,5,134,0,0,657,659,5,109,0,0,
		658,657,1,0,0,0,658,659,1,0,0,0,659,660,1,0,0,0,660,662,5,167,0,0,661,
		663,3,166,83,0,662,661,1,0,0,0,662,663,1,0,0,0,663,664,1,0,0,0,664,666,
		5,135,0,0,665,667,3,84,42,0,666,665,1,0,0,0,666,667,1,0,0,0,667,71,1,0,
		0,0,668,677,5,148,0,0,669,674,3,74,37,0,670,671,5,141,0,0,671,673,3,74,
		37,0,672,670,1,0,0,0,673,676,1,0,0,0,674,672,1,0,0,0,674,675,1,0,0,0,675,
		678,1,0,0,0,676,674,1,0,0,0,677,669,1,0,0,0,677,678,1,0,0,0,678,679,1,
		0,0,0,679,680,5,147,0,0,680,73,1,0,0,0,681,683,3,170,85,0,682,681,1,0,
		0,0,683,686,1,0,0,0,684,682,1,0,0,0,684,685,1,0,0,0,685,687,1,0,0,0,686,
		684,1,0,0,0,687,690,3,178,89,0,688,690,3,224,112,0,689,684,1,0,0,0,689,
		688,1,0,0,0,690,75,1,0,0,0,691,692,5,144,0,0,692,704,5,136,0,0,693,698,
		3,78,39,0,694,695,5,141,0,0,695,697,3,78,39,0,696,694,1,0,0,0,697,700,
		1,0,0,0,698,696,1,0,0,0,698,699,1,0,0,0,699,702,1,0,0,0,700,698,1,0,0,
		0,701,703,5,141,0,0,702,701,1,0,0,0,702,703,1,0,0,0,703,705,1,0,0,0,704,
		693,1,0,0,0,704,705,1,0,0,0,705,706,1,0,0,0,706,707,5,137,0,0,707,77,1,
		0,0,0,708,709,3,272,136,0,709,710,5,152,0,0,710,711,3,268,134,0,711,79,
		1,0,0,0,712,713,5,144,0,0,713,718,5,138,0,0,714,716,3,266,133,0,715,717,
		5,141,0,0,716,715,1,0,0,0,716,717,1,0,0,0,717,719,1,0,0,0,718,714,1,0,
		0,0,718,719,1,0,0,0,719,720,1,0,0,0,720,721,5,139,0,0,721,81,1,0,0,0,722,
		723,5,144,0,0,723,724,5,134,0,0,724,725,3,268,134,0,725,726,5,135,0,0,
		726,733,1,0,0,0,727,730,5,144,0,0,728,731,3,292,146,0,729,731,3,296,148,
		0,730,728,1,0,0,0,730,729,1,0,0,0,731,733,1,0,0,0,732,722,1,0,0,0,732,
		727,1,0,0,0,733,83,1,0,0,0,734,746,5,134,0,0,735,738,3,86,43,0,736,738,
		5,32,0,0,737,735,1,0,0,0,737,736,1,0,0,0,738,743,1,0,0,0,739,740,5,141,
		0,0,740,742,3,86,43,0,741,739,1,0,0,0,742,745,1,0,0,0,743,741,1,0,0,0,
		743,744,1,0,0,0,744,747,1,0,0,0,745,743,1,0,0,0,746,737,1,0,0,0,746,747,
		1,0,0,0,747,748,1,0,0,0,748,749,5,135,0,0,749,85,1,0,0,0,750,753,3,108,
		54,0,751,753,3,224,112,0,752,750,1,0,0,0,752,751,1,0,0,0,753,87,1,0,0,
		0,754,756,5,167,0,0,755,757,3,178,89,0,756,755,1,0,0,0,756,757,1,0,0,0,
		757,759,1,0,0,0,758,760,3,166,83,0,759,758,1,0,0,0,759,760,1,0,0,0,760,
		762,1,0,0,0,761,763,3,84,42,0,762,761,1,0,0,0,762,763,1,0,0,0,763,764,
		1,0,0,0,764,765,3,240,120,0,765,89,1,0,0,0,766,767,5,138,0,0,767,768,3,
		92,46,0,768,769,3,94,47,0,769,770,5,139,0,0,770,91,1,0,0,0,771,774,3,268,
		134,0,772,774,3,178,89,0,773,771,1,0,0,0,773,772,1,0,0,0,774,93,1,0,0,
		0,775,782,3,60,30,0,776,778,3,96,48,0,777,776,1,0,0,0,778,779,1,0,0,0,
		779,777,1,0,0,0,779,780,1,0,0,0,780,782,1,0,0,0,781,775,1,0,0,0,781,777,
		1,0,0,0,782,95,1,0,0,0,783,785,3,60,30,0,784,783,1,0,0,0,784,785,1,0,0,
		0,785,786,1,0,0,0,786,787,5,152,0,0,787,792,3,98,49,0,788,789,5,141,0,
		0,789,791,3,98,49,0,790,788,1,0,0,0,791,794,1,0,0,0,792,790,1,0,0,0,792,
		793,1,0,0,0,793,97,1,0,0,0,794,792,1,0,0,0,795,797,3,266,133,0,796,798,
		3,166,83,0,797,796,1,0,0,0,797,798,1,0,0,0,798,803,1,0,0,0,799,800,5,136,
		0,0,800,801,3,222,111,0,801,802,5,137,0,0,802,804,1,0,0,0,803,799,1,0,
		0,0,803,804,1,0,0,0,804,99,1,0,0,0,805,806,5,76,0,0,806,807,5,134,0,0,
		807,808,3,102,51,0,808,809,5,135,0,0,809,101,1,0,0,0,810,821,3,60,30,0,
		811,821,5,145,0,0,812,814,3,60,30,0,813,812,1,0,0,0,813,814,1,0,0,0,814,
		815,1,0,0,0,815,817,5,152,0,0,816,813,1,0,0,0,817,818,1,0,0,0,818,816,
		1,0,0,0,818,819,1,0,0,0,819,821,1,0,0,0,820,810,1,0,0,0,820,811,1,0,0,
		0,820,816,1,0,0,0,821,103,1,0,0,0,822,823,5,69,0,0,823,824,5,134,0,0,824,
		825,3,32,16,0,825,826,5,135,0,0,826,105,1,0,0,0,827,828,5,62,0,0,828,829,
		5,134,0,0,829,830,3,224,112,0,830,831,5,135,0,0,831,107,1,0,0,0,832,833,
		3,150,75,0,833,834,3,196,98,0,834,109,1,0,0,0,835,836,5,79,0,0,836,837,
		5,134,0,0,837,838,3,296,148,0,838,839,5,135,0,0,839,843,1,0,0,0,840,841,
		5,79,0,0,841,843,3,268,134,0,842,835,1,0,0,0,842,840,1,0,0,0,843,111,1,
		0,0,0,844,845,5,80,0,0,845,849,3,240,120,0,846,848,3,114,57,0,847,846,
		1,0,0,0,848,851,1,0,0,0,849,847,1,0,0,0,849,850,1,0,0,0,850,854,1,0,0,
		0,851,849,1,0,0,0,852,853,5,64,0,0,853,855,3,240,120,0,854,852,1,0,0,0,
		854,855,1,0,0,0,855,113,1,0,0,0,856,857,5,59,0,0,857,858,5,134,0,0,858,
		859,3,108,54,0,859,860,5,135,0,0,860,861,3,240,120,0,861,115,1,0,0,0,862,
		863,5,77,0,0,863,864,5,134,0,0,864,865,3,268,134,0,865,866,5,135,0,0,866,
		867,3,240,120,0,867,117,1,0,0,0,868,869,5,58,0,0,869,870,3,240,120,0,870,
		119,1,0,0,0,871,872,3,124,62,0,872,873,5,140,0,0,873,121,1,0,0,0,874,875,
		3,124,62,0,875,876,3,240,120,0,876,123,1,0,0,0,877,879,3,150,75,0,878,
		877,1,0,0,0,878,879,1,0,0,0,879,880,1,0,0,0,880,881,3,296,148,0,881,883,
		5,134,0,0,882,884,3,200,100,0,883,882,1,0,0,0,883,884,1,0,0,0,884,885,
		1,0,0,0,885,886,5,135,0,0,886,888,1,0,0,0,887,889,3,152,76,0,888,887,1,
		0,0,0,888,889,1,0,0,0,889,125,1,0,0,0,890,892,3,128,64,0,891,893,3,130,
		65,0,892,891,1,0,0,0,892,893,1,0,0,0,893,127,1,0,0,0,894,897,5,5,0,0,895,
		897,3,296,148,0,896,894,1,0,0,0,896,895,1,0,0,0,897,129,1,0,0,0,898,900,
		5,134,0,0,899,901,3,132,66,0,900,899,1,0,0,0,900,901,1,0,0,0,901,902,1,
		0,0,0,902,903,5,135,0,0,903,131,1,0,0,0,904,909,3,134,67,0,905,906,5,141,
		0,0,906,908,3,134,67,0,907,905,1,0,0,0,908,911,1,0,0,0,909,907,1,0,0,0,
		909,910,1,0,0,0,910,133,1,0,0,0,911,909,1,0,0,0,912,917,3,126,63,0,913,
		917,3,292,146,0,914,917,3,294,147,0,915,917,3,136,68,0,916,912,1,0,0,0,
		916,913,1,0,0,0,916,914,1,0,0,0,916,915,1,0,0,0,917,135,1,0,0,0,918,919,
		3,128,64,0,919,923,5,146,0,0,920,924,3,292,146,0,921,924,3,128,64,0,922,
		924,3,294,147,0,923,920,1,0,0,0,923,921,1,0,0,0,923,922,1,0,0,0,924,137,
		1,0,0,0,925,930,3,140,70,0,926,930,3,142,71,0,927,930,3,144,72,0,928,930,
		3,146,73,0,929,925,1,0,0,0,929,926,1,0,0,0,929,927,1,0,0,0,929,928,1,0,
		0,0,930,932,1,0,0,0,931,933,3,202,101,0,932,931,1,0,0,0,932,933,1,0,0,
		0,933,934,1,0,0,0,934,935,5,140,0,0,935,139,1,0,0,0,936,938,3,152,76,0,
		937,936,1,0,0,0,937,938,1,0,0,0,938,939,1,0,0,0,939,941,3,296,148,0,940,
		942,3,152,76,0,941,940,1,0,0,0,941,942,1,0,0,0,942,943,1,0,0,0,943,944,
		5,134,0,0,944,945,3,196,98,0,945,946,5,135,0,0,946,141,1,0,0,0,947,949,
		3,152,76,0,948,947,1,0,0,0,948,949,1,0,0,0,949,951,1,0,0,0,950,952,5,29,
		0,0,951,950,1,0,0,0,951,952,1,0,0,0,952,957,1,0,0,0,953,954,3,186,93,0,
		954,955,3,296,148,0,955,958,1,0,0,0,956,958,3,188,94,0,957,953,1,0,0,0,
		957,956,1,0,0,0,958,143,1,0,0,0,959,960,3,150,75,0,960,961,3,154,77,0,
		961,964,1,0,0,0,962,964,3,150,75,0,963,959,1,0,0,0,963,962,1,0,0,0,964,
		145,1,0,0,0,965,967,3,152,76,0,966,965,1,0,0,0,966,967,1,0,0,0,967,968,
		1,0,0,0,968,969,5,29,0,0,969,971,3,150,75,0,970,972,3,148,74,0,971,970,
		1,0,0,0,971,972,1,0,0,0,972,147,1,0,0,0,973,978,3,196,98,0,974,975,5,141,
		0,0,975,977,3,196,98,0,976,974,1,0,0,0,977,980,1,0,0,0,978,976,1,0,0,0,
		978,979,1,0,0,0,979,149,1,0,0,0,980,978,1,0,0,0,981,990,3,168,84,0,982,
		990,3,152,76,0,983,990,3,164,82,0,984,990,3,166,83,0,985,990,3,162,81,
		0,986,990,5,109,0,0,987,990,3,170,85,0,988,990,3,172,86,0,989,981,1,0,
		0,0,989,982,1,0,0,0,989,983,1,0,0,0,989,984,1,0,0,0,989,985,1,0,0,0,989,
		986,1,0,0,0,989,987,1,0,0,0,989,988,1,0,0,0,990,993,1,0,0,0,991,989,1,
		0,0,0,991,992,1,0,0,0,992,994,1,0,0,0,993,991,1,0,0,0,994,999,3,178,89,
		0,995,998,3,152,76,0,996,998,3,172,86,0,997,995,1,0,0,0,997,996,1,0,0,
		0,998,1001,1,0,0,0,999,997,1,0,0,0,999,1000,1,0,0,0,1000,151,1,0,0,0,1001,
		999,1,0,0,0,1002,1003,5,84,0,0,1003,1004,5,134,0,0,1004,1005,5,134,0,0,
		1005,1010,3,126,63,0,1006,1007,5,141,0,0,1007,1009,3,126,63,0,1008,1006,
		1,0,0,0,1009,1012,1,0,0,0,1010,1008,1,0,0,0,1010,1011,1,0,0,0,1011,1013,
		1,0,0,0,1012,1010,1,0,0,0,1013,1014,5,135,0,0,1014,1015,5,135,0,0,1015,
		153,1,0,0,0,1016,1021,3,156,78,0,1017,1018,5,141,0,0,1018,1020,3,156,78,
		0,1019,1017,1,0,0,0,1020,1023,1,0,0,0,1021,1019,1,0,0,0,1021,1022,1,0,
		0,0,1022,155,1,0,0,0,1023,1021,1,0,0,0,1024,1027,3,196,98,0,1025,1026,
		5,146,0,0,1026,1028,3,274,137,0,1027,1025,1,0,0,0,1027,1028,1,0,0,0,1028,
		157,1,0,0,0,1029,1042,7,3,0,0,1030,1043,3,296,148,0,1031,1033,3,296,148,
		0,1032,1031,1,0,0,0,1032,1033,1,0,0,0,1033,1034,1,0,0,0,1034,1036,5,136,
		0,0,1035,1037,3,160,80,0,1036,1035,1,0,0,0,1037,1038,1,0,0,0,1038,1036,
		1,0,0,0,1038,1039,1,0,0,0,1039,1040,1,0,0,0,1040,1041,5,137,0,0,1041,1043,
		1,0,0,0,1042,1030,1,0,0,0,1042,1032,1,0,0,0,1043,159,1,0,0,0,1044,1045,
		3,150,75,0,1045,1047,3,182,91,0,1046,1048,3,202,101,0,1047,1046,1,0,0,
		0,1047,1048,1,0,0,0,1048,1049,1,0,0,0,1049,1050,5,140,0,0,1050,161,1,0,
		0,0,1051,1052,5,124,0,0,1052,1053,5,134,0,0,1053,1054,3,296,148,0,1054,
		1055,5,135,0,0,1055,1058,1,0,0,0,1056,1058,5,123,0,0,1057,1051,1,0,0,0,
		1057,1056,1,0,0,0,1058,163,1,0,0,0,1059,1060,7,4,0,0,1060,165,1,0,0,0,
		1061,1062,7,5,0,0,1062,167,1,0,0,0,1063,1064,7,6,0,0,1064,169,1,0,0,0,
		1065,1066,7,7,0,0,1066,171,1,0,0,0,1067,1072,5,5,0,0,1068,1072,5,33,0,
		0,1069,1072,5,21,0,0,1070,1072,3,174,87,0,1071,1067,1,0,0,0,1071,1068,
		1,0,0,0,1071,1069,1,0,0,0,1071,1070,1,0,0,0,1072,173,1,0,0,0,1073,1074,
		7,8,0,0,1074,175,1,0,0,0,1075,1076,7,9,0,0,1076,177,1,0,0,0,1077,1078,
		6,89,-1,0,1078,1134,5,32,0,0,1079,1081,3,176,88,0,1080,1079,1,0,0,0,1081,
		1084,1,0,0,0,1082,1080,1,0,0,0,1082,1083,1,0,0,0,1083,1085,1,0,0,0,1084,
		1082,1,0,0,0,1085,1134,5,4,0,0,1086,1088,3,176,88,0,1087,1086,1,0,0,0,
		1088,1091,1,0,0,0,1089,1087,1,0,0,0,1089,1090,1,0,0,0,1090,1092,1,0,0,
		0,1091,1089,1,0,0,0,1092,1134,5,23,0,0,1093,1095,3,176,88,0,1094,1093,
		1,0,0,0,1095,1098,1,0,0,0,1096,1094,1,0,0,0,1096,1097,1,0,0,0,1097,1099,
		1,0,0,0,1098,1096,1,0,0,0,1099,1134,5,18,0,0,1100,1102,3,176,88,0,1101,
		1100,1,0,0,0,1102,1105,1,0,0,0,1103,1101,1,0,0,0,1103,1104,1,0,0,0,1104,
		1106,1,0,0,0,1105,1103,1,0,0,0,1106,1134,5,19,0,0,1107,1109,3,176,88,0,
		1108,1107,1,0,0,0,1109,1112,1,0,0,0,1110,1108,1,0,0,0,1110,1111,1,0,0,
		0,1111,1113,1,0,0,0,1112,1110,1,0,0,0,1113,1134,5,13,0,0,1114,1116,3,176,
		88,0,1115,1114,1,0,0,0,1116,1119,1,0,0,0,1117,1115,1,0,0,0,1117,1118,1,
		0,0,0,1118,1120,1,0,0,0,1119,1117,1,0,0,0,1120,1134,5,9,0,0,1121,1134,
		3,180,90,0,1122,1134,3,158,79,0,1123,1134,3,186,93,0,1124,1134,3,188,94,
		0,1125,1127,3,14,7,0,1126,1128,3,166,83,0,1127,1126,1,0,0,0,1127,1128,
		1,0,0,0,1128,1134,1,0,0,0,1129,1131,3,296,148,0,1130,1132,3,166,83,0,1131,
		1130,1,0,0,0,1131,1132,1,0,0,0,1132,1134,1,0,0,0,1133,1077,1,0,0,0,1133,
		1082,1,0,0,0,1133,1089,1,0,0,0,1133,1096,1,0,0,0,1133,1103,1,0,0,0,1133,
		1110,1,0,0,0,1133,1117,1,0,0,0,1133,1121,1,0,0,0,1133,1122,1,0,0,0,1133,
		1123,1,0,0,0,1133,1124,1,0,0,0,1133,1125,1,0,0,0,1133,1129,1,0,0,0,1134,
		1142,1,0,0,0,1135,1136,10,1,0,0,1136,1138,5,163,0,0,1137,1139,3,166,83,
		0,1138,1137,1,0,0,0,1138,1139,1,0,0,0,1139,1141,1,0,0,0,1140,1135,1,0,
		0,0,1141,1144,1,0,0,0,1142,1140,1,0,0,0,1142,1143,1,0,0,0,1143,179,1,0,
		0,0,1144,1142,1,0,0,0,1145,1146,5,95,0,0,1146,1147,5,134,0,0,1147,1148,
		3,268,134,0,1148,1149,5,135,0,0,1149,181,1,0,0,0,1150,1155,3,184,92,0,
		1151,1152,5,141,0,0,1152,1154,3,184,92,0,1153,1151,1,0,0,0,1154,1157,1,
		0,0,0,1155,1153,1,0,0,0,1155,1156,1,0,0,0,1156,183,1,0,0,0,1157,1155,1,
		0,0,0,1158,1165,3,196,98,0,1159,1161,3,196,98,0,1160,1159,1,0,0,0,1160,
		1161,1,0,0,0,1161,1162,1,0,0,0,1162,1163,5,152,0,0,1163,1165,3,292,146,
		0,1164,1158,1,0,0,0,1164,1160,1,0,0,0,1165,185,1,0,0,0,1166,1172,5,11,
		0,0,1167,1169,3,296,148,0,1168,1167,1,0,0,0,1168,1169,1,0,0,0,1169,1170,
		1,0,0,0,1170,1171,5,152,0,0,1171,1173,3,224,112,0,1172,1168,1,0,0,0,1172,
		1173,1,0,0,0,1173,1185,1,0,0,0,1174,1179,3,296,148,0,1175,1176,5,136,0,
		0,1176,1177,3,190,95,0,1177,1178,5,137,0,0,1178,1180,1,0,0,0,1179,1175,
		1,0,0,0,1179,1180,1,0,0,0,1180,1186,1,0,0,0,1181,1182,5,136,0,0,1182,1183,
		3,190,95,0,1183,1184,5,137,0,0,1184,1186,1,0,0,0,1185,1174,1,0,0,0,1185,
		1181,1,0,0,0,1186,187,1,0,0,0,1187,1188,7,10,0,0,1188,1189,5,134,0,0,1189,
		1190,3,224,112,0,1190,1191,5,141,0,0,1191,1192,3,296,148,0,1192,1197,5,
		135,0,0,1193,1194,5,136,0,0,1194,1195,3,190,95,0,1195,1196,5,137,0,0,1196,
		1198,1,0,0,0,1197,1193,1,0,0,0,1197,1198,1,0,0,0,1198,189,1,0,0,0,1199,
		1204,3,192,96,0,1200,1201,5,141,0,0,1201,1203,3,192,96,0,1202,1200,1,0,
		0,0,1203,1206,1,0,0,0,1204,1202,1,0,0,0,1204,1205,1,0,0,0,1205,1208,1,
		0,0,0,1206,1204,1,0,0,0,1207,1209,5,141,0,0,1208,1207,1,0,0,0,1208,1209,
		1,0,0,0,1209,191,1,0,0,0,1210,1213,3,194,97,0,1211,1212,5,146,0,0,1212,
		1214,3,268,134,0,1213,1211,1,0,0,0,1213,1214,1,0,0,0,1214,193,1,0,0,0,
		1215,1218,3,296,148,0,1216,1218,5,7,0,0,1217,1215,1,0,0,0,1217,1216,1,
		0,0,0,1218,195,1,0,0,0,1219,1225,3,296,148,0,1220,1221,5,134,0,0,1221,
		1222,3,196,98,0,1222,1223,5,135,0,0,1223,1225,1,0,0,0,1224,1219,1,0,0,
		0,1224,1220,1,0,0,0,1225,1229,1,0,0,0,1226,1228,3,198,99,0,1227,1226,1,
		0,0,0,1228,1231,1,0,0,0,1229,1227,1,0,0,0,1229,1230,1,0,0,0,1230,1243,
		1,0,0,0,1231,1229,1,0,0,0,1232,1233,5,134,0,0,1233,1235,5,167,0,0,1234,
		1236,3,166,83,0,1235,1234,1,0,0,0,1235,1236,1,0,0,0,1236,1238,1,0,0,0,
		1237,1239,3,296,148,0,1238,1237,1,0,0,0,1238,1239,1,0,0,0,1239,1240,1,
		0,0,0,1240,1241,5,135,0,0,1241,1243,3,84,42,0,1242,1224,1,0,0,0,1242,1232,
		1,0,0,0,1243,197,1,0,0,0,1244,1246,5,138,0,0,1245,1247,3,276,138,0,1246,
		1245,1,0,0,0,1246,1247,1,0,0,0,1247,1248,1,0,0,0,1248,1249,5,139,0,0,1249,
		199,1,0,0,0,1250,1253,3,230,115,0,1251,1252,5,141,0,0,1252,1254,5,179,
		0,0,1253,1251,1,0,0,0,1253,1254,1,0,0,0,1254,201,1,0,0,0,1255,1267,3,296,
		148,0,1256,1257,5,134,0,0,1257,1262,3,290,145,0,1258,1259,5,141,0,0,1259,
		1261,3,290,145,0,1260,1258,1,0,0,0,1261,1264,1,0,0,0,1262,1260,1,0,0,0,
		1262,1263,1,0,0,0,1263,1265,1,0,0,0,1264,1262,1,0,0,0,1265,1266,5,135,
		0,0,1266,1268,1,0,0,0,1267,1256,1,0,0,0,1267,1268,1,0,0,0,1268,1322,1,
		0,0,0,1269,1322,5,110,0,0,1270,1271,5,108,0,0,1271,1274,5,134,0,0,1272,
		1275,3,208,104,0,1273,1275,3,210,105,0,1274,1272,1,0,0,0,1274,1273,1,0,
		0,0,1275,1276,1,0,0,0,1276,1277,5,135,0,0,1277,1322,1,0,0,0,1278,1279,
		5,112,0,0,1279,1280,5,134,0,0,1280,1285,3,214,107,0,1281,1282,5,141,0,
		0,1282,1284,3,214,107,0,1283,1281,1,0,0,0,1284,1287,1,0,0,0,1285,1283,
		1,0,0,0,1285,1286,1,0,0,0,1286,1288,1,0,0,0,1287,1285,1,0,0,0,1288,1289,
		5,135,0,0,1289,1322,1,0,0,0,1290,1291,5,113,0,0,1291,1292,5,134,0,0,1292,
		1297,3,296,148,0,1293,1294,5,141,0,0,1294,1296,3,296,148,0,1295,1293,1,
		0,0,0,1296,1299,1,0,0,0,1297,1295,1,0,0,0,1297,1298,1,0,0,0,1298,1300,
		1,0,0,0,1299,1297,1,0,0,0,1300,1301,5,135,0,0,1301,1322,1,0,0,0,1302,1303,
		5,111,0,0,1303,1304,5,134,0,0,1304,1305,3,294,147,0,1305,1306,5,135,0,
		0,1306,1322,1,0,0,0,1307,1308,5,84,0,0,1308,1309,5,134,0,0,1309,1310,5,
		134,0,0,1310,1315,3,204,102,0,1311,1312,5,141,0,0,1312,1314,3,204,102,
		0,1313,1311,1,0,0,0,1314,1317,1,0,0,0,1315,1313,1,0,0,0,1315,1316,1,0,
		0,0,1316,1318,1,0,0,0,1317,1315,1,0,0,0,1318,1319,5,135,0,0,1319,1320,
		5,135,0,0,1320,1322,1,0,0,0,1321,1255,1,0,0,0,1321,1269,1,0,0,0,1321,1270,
		1,0,0,0,1321,1278,1,0,0,0,1321,1290,1,0,0,0,1321,1302,1,0,0,0,1321,1307,
		1,0,0,0,1322,203,1,0,0,0,1323,1337,3,296,148,0,1324,1325,3,296,148,0,1325,
		1326,5,134,0,0,1326,1331,3,206,103,0,1327,1328,5,141,0,0,1328,1330,3,206,
		103,0,1329,1327,1,0,0,0,1330,1333,1,0,0,0,1331,1329,1,0,0,0,1331,1332,
		1,0,0,0,1332,1334,1,0,0,0,1333,1331,1,0,0,0,1334,1335,5,135,0,0,1335,1337,
		1,0,0,0,1336,1323,1,0,0,0,1336,1324,1,0,0,0,1337,205,1,0,0,0,1338,1350,
		3,296,148,0,1339,1350,5,185,0,0,1340,1350,3,294,147,0,1341,1342,3,296,
		148,0,1342,1343,5,146,0,0,1343,1344,3,216,108,0,1344,1350,1,0,0,0,1345,
		1346,3,296,148,0,1346,1347,5,146,0,0,1347,1348,3,294,147,0,1348,1350,1,
		0,0,0,1349,1338,1,0,0,0,1349,1339,1,0,0,0,1349,1340,1,0,0,0,1349,1341,
		1,0,0,0,1349,1345,1,0,0,0,1350,207,1,0,0,0,1351,1356,3,296,148,0,1352,
		1353,5,142,0,0,1353,1355,3,296,148,0,1354,1352,1,0,0,0,1355,1358,1,0,0,
		0,1356,1354,1,0,0,0,1356,1357,1,0,0,0,1357,209,1,0,0,0,1358,1356,1,0,0,
		0,1359,1360,3,296,148,0,1360,1366,5,134,0,0,1361,1362,3,212,106,0,1362,
		1363,5,152,0,0,1363,1365,1,0,0,0,1364,1361,1,0,0,0,1365,1368,1,0,0,0,1366,
		1364,1,0,0,0,1366,1367,1,0,0,0,1367,1369,1,0,0,0,1368,1366,1,0,0,0,1369,
		1370,5,135,0,0,1370,211,1,0,0,0,1371,1375,3,296,148,0,1372,1375,5,145,
		0,0,1373,1375,5,14,0,0,1374,1371,1,0,0,0,1374,1372,1,0,0,0,1374,1373,1,
		0,0,0,1375,213,1,0,0,0,1376,1377,3,296,148,0,1377,1378,5,134,0,0,1378,
		1379,3,216,108,0,1379,1380,5,135,0,0,1380,215,1,0,0,0,1381,1391,5,186,
		0,0,1382,1387,5,185,0,0,1383,1384,5,142,0,0,1384,1386,5,185,0,0,1385,1383,
		1,0,0,0,1386,1389,1,0,0,0,1387,1385,1,0,0,0,1387,1388,1,0,0,0,1388,1391,
		1,0,0,0,1389,1387,1,0,0,0,1390,1381,1,0,0,0,1390,1382,1,0,0,0,1391,217,
		1,0,0,0,1392,1397,5,136,0,0,1393,1395,3,266,133,0,1394,1396,5,141,0,0,
		1395,1394,1,0,0,0,1395,1396,1,0,0,0,1396,1398,1,0,0,0,1397,1393,1,0,0,
		0,1397,1398,1,0,0,0,1398,1399,1,0,0,0,1399,1400,5,137,0,0,1400,219,1,0,
		0,0,1401,1415,5,136,0,0,1402,1403,5,142,0,0,1403,1409,3,268,134,0,1404,
		1405,5,141,0,0,1405,1406,5,142,0,0,1406,1408,3,268,134,0,1407,1404,1,0,
		0,0,1408,1411,1,0,0,0,1409,1407,1,0,0,0,1409,1410,1,0,0,0,1410,1413,1,
		0,0,0,1411,1409,1,0,0,0,1412,1414,5,141,0,0,1413,1412,1,0,0,0,1413,1414,
		1,0,0,0,1414,1416,1,0,0,0,1415,1402,1,0,0,0,1415,1416,1,0,0,0,1416,1417,
		1,0,0,0,1417,1418,5,137,0,0,1418,221,1,0,0,0,1419,1424,3,274,137,0,1420,
		1421,5,141,0,0,1421,1423,3,274,137,0,1422,1420,1,0,0,0,1423,1426,1,0,0,
		0,1424,1422,1,0,0,0,1424,1425,1,0,0,0,1425,1428,1,0,0,0,1426,1424,1,0,
		0,0,1427,1429,5,141,0,0,1428,1427,1,0,0,0,1428,1429,1,0,0,0,1429,223,1,
		0,0,0,1430,1432,3,150,75,0,1431,1433,3,226,113,0,1432,1431,1,0,0,0,1432,
		1433,1,0,0,0,1433,1436,1,0,0,0,1434,1436,3,70,35,0,1435,1430,1,0,0,0,1435,
		1434,1,0,0,0,1436,225,1,0,0,0,1437,1439,5,134,0,0,1438,1440,3,226,113,
		0,1439,1438,1,0,0,0,1439,1440,1,0,0,0,1440,1441,1,0,0,0,1441,1443,5,135,
		0,0,1442,1444,3,228,114,0,1443,1442,1,0,0,0,1444,1445,1,0,0,0,1445,1443,
		1,0,0,0,1445,1446,1,0,0,0,1446,1457,1,0,0,0,1447,1449,5,138,0,0,1448,1450,
		3,276,138,0,1449,1448,1,0,0,0,1449,1450,1,0,0,0,1450,1451,1,0,0,0,1451,
		1453,5,139,0,0,1452,1447,1,0,0,0,1453,1454,1,0,0,0,1454,1452,1,0,0,0,1454,
		1455,1,0,0,0,1455,1457,1,0,0,0,1456,1437,1,0,0,0,1456,1452,1,0,0,0,1457,
		227,1,0,0,0,1458,1460,5,138,0,0,1459,1461,3,276,138,0,1460,1459,1,0,0,
		0,1460,1461,1,0,0,0,1461,1462,1,0,0,0,1462,1469,5,139,0,0,1463,1465,5,
		134,0,0,1464,1466,3,230,115,0,1465,1464,1,0,0,0,1465,1466,1,0,0,0,1466,
		1467,1,0,0,0,1467,1469,5,135,0,0,1468,1458,1,0,0,0,1468,1463,1,0,0,0,1469,
		229,1,0,0,0,1470,1475,3,232,116,0,1471,1472,5,141,0,0,1472,1474,3,232,
		116,0,1473,1471,1,0,0,0,1474,1477,1,0,0,0,1475,1473,1,0,0,0,1475,1476,
		1,0,0,0,1476,231,1,0,0,0,1477,1475,1,0,0,0,1478,1479,3,150,75,0,1479,1480,
		3,196,98,0,1480,1483,1,0,0,0,1481,1483,5,32,0,0,1482,1478,1,0,0,0,1482,
		1481,1,0,0,0,1483,233,1,0,0,0,1484,1486,3,236,118,0,1485,1487,5,140,0,
		0,1486,1485,1,0,0,0,1486,1487,1,0,0,0,1487,1526,1,0,0,0,1488,1490,3,240,
		120,0,1489,1491,5,140,0,0,1490,1489,1,0,0,0,1490,1491,1,0,0,0,1491,1526,
		1,0,0,0,1492,1494,3,242,121,0,1493,1495,5,140,0,0,1494,1493,1,0,0,0,1494,
		1495,1,0,0,0,1495,1526,1,0,0,0,1496,1498,3,252,126,0,1497,1499,5,140,0,
		0,1498,1497,1,0,0,0,1498,1499,1,0,0,0,1499,1526,1,0,0,0,1500,1502,3,264,
		132,0,1501,1503,5,140,0,0,1502,1501,1,0,0,0,1502,1503,1,0,0,0,1503,1526,
		1,0,0,0,1504,1506,3,116,58,0,1505,1507,5,140,0,0,1506,1505,1,0,0,0,1506,
		1507,1,0,0,0,1507,1526,1,0,0,0,1508,1510,3,118,59,0,1509,1511,5,140,0,
		0,1510,1509,1,0,0,0,1510,1511,1,0,0,0,1511,1526,1,0,0,0,1512,1514,3,110,
		55,0,1513,1515,5,140,0,0,1514,1513,1,0,0,0,1514,1515,1,0,0,0,1515,1526,
		1,0,0,0,1516,1518,3,112,56,0,1517,1519,5,140,0,0,1518,1517,1,0,0,0,1518,
		1519,1,0,0,0,1519,1526,1,0,0,0,1520,1522,3,266,133,0,1521,1523,5,140,0,
		0,1522,1521,1,0,0,0,1522,1523,1,0,0,0,1523,1526,1,0,0,0,1524,1526,5,140,
		0,0,1525,1484,1,0,0,0,1525,1488,1,0,0,0,1525,1492,1,0,0,0,1525,1496,1,
		0,0,0,1525,1500,1,0,0,0,1525,1504,1,0,0,0,1525,1508,1,0,0,0,1525,1512,
		1,0,0,0,1525,1516,1,0,0,0,1525,1520,1,0,0,0,1525,1524,1,0,0,0,1526,235,
		1,0,0,0,1527,1528,3,296,148,0,1528,1529,5,152,0,0,1529,1530,3,234,117,
		0,1530,237,1,0,0,0,1531,1534,3,276,138,0,1532,1533,5,179,0,0,1533,1535,
		3,276,138,0,1534,1532,1,0,0,0,1534,1535,1,0,0,0,1535,239,1,0,0,0,1536,
		1541,5,136,0,0,1537,1540,3,138,69,0,1538,1540,3,234,117,0,1539,1537,1,
		0,0,0,1539,1538,1,0,0,0,1540,1543,1,0,0,0,1541,1539,1,0,0,0,1541,1542,
		1,0,0,0,1542,1544,1,0,0,0,1543,1541,1,0,0,0,1544,1545,5,137,0,0,1545,241,
		1,0,0,0,1546,1547,5,16,0,0,1547,1548,5,134,0,0,1548,1549,3,268,134,0,1549,
		1550,5,135,0,0,1550,1553,3,234,117,0,1551,1552,5,10,0,0,1552,1554,3,234,
		117,0,1553,1551,1,0,0,0,1553,1554,1,0,0,0,1554,1557,1,0,0,0,1555,1557,
		3,244,122,0,1556,1546,1,0,0,0,1556,1555,1,0,0,0,1557,243,1,0,0,0,1558,
		1559,5,28,0,0,1559,1560,5,134,0,0,1560,1561,3,268,134,0,1561,1562,5,135,
		0,0,1562,1563,3,246,123,0,1563,245,1,0,0,0,1564,1568,5,136,0,0,1565,1567,
		3,248,124,0,1566,1565,1,0,0,0,1567,1570,1,0,0,0,1568,1566,1,0,0,0,1568,
		1569,1,0,0,0,1569,1571,1,0,0,0,1570,1568,1,0,0,0,1571,1572,5,137,0,0,1572,
		247,1,0,0,0,1573,1575,3,250,125,0,1574,1573,1,0,0,0,1575,1576,1,0,0,0,
		1576,1574,1,0,0,0,1576,1577,1,0,0,0,1577,1579,1,0,0,0,1578,1580,3,234,
		117,0,1579,1578,1,0,0,0,1580,1581,1,0,0,0,1581,1579,1,0,0,0,1581,1582,
		1,0,0,0,1582,249,1,0,0,0,1583,1589,5,3,0,0,1584,1590,3,238,119,0,1585,
		1586,5,134,0,0,1586,1587,3,238,119,0,1587,1588,5,135,0,0,1588,1590,1,0,
		0,0,1589,1584,1,0,0,0,1589,1585,1,0,0,0,1590,1591,1,0,0,0,1591,1592,5,
		152,0,0,1592,1596,1,0,0,0,1593,1594,5,7,0,0,1594,1596,5,152,0,0,1595,1583,
		1,0,0,0,1595,1593,1,0,0,0,1596,251,1,0,0,0,1597,1602,3,254,127,0,1598,
		1602,3,256,128,0,1599,1602,3,258,129,0,1600,1602,3,262,131,0,1601,1597,
		1,0,0,0,1601,1598,1,0,0,0,1601,1599,1,0,0,0,1601,1600,1,0,0,0,1602,253,
		1,0,0,0,1603,1604,5,34,0,0,1604,1605,5,134,0,0,1605,1606,3,268,134,0,1606,
		1607,5,135,0,0,1607,1608,3,234,117,0,1608,255,1,0,0,0,1609,1610,5,8,0,
		0,1610,1611,3,234,117,0,1611,1612,5,34,0,0,1612,1613,5,134,0,0,1613,1614,
		3,268,134,0,1614,1615,5,135,0,0,1615,1616,5,140,0,0,1616,257,1,0,0,0,1617,
		1618,5,14,0,0,1618,1620,5,134,0,0,1619,1621,3,260,130,0,1620,1619,1,0,
		0,0,1620,1621,1,0,0,0,1621,1622,1,0,0,0,1622,1624,5,140,0,0,1623,1625,
		3,268,134,0,1624,1623,1,0,0,0,1624,1625,1,0,0,0,1625,1626,1,0,0,0,1626,
		1628,5,140,0,0,1627,1629,3,266,133,0,1628,1627,1,0,0,0,1628,1629,1,0,0,
		0,1629,1630,1,0,0,0,1630,1631,5,135,0,0,1631,1632,3,234,117,0,1632,259,
		1,0,0,0,1633,1634,3,150,75,0,1634,1635,3,154,77,0,1635,1638,1,0,0,0,1636,
		1638,3,266,133,0,1637,1633,1,0,0,0,1637,1636,1,0,0,0,1638,261,1,0,0,0,
		1639,1640,5,14,0,0,1640,1641,5,134,0,0,1641,1642,3,108,54,0,1642,1644,
		5,46,0,0,1643,1645,3,268,134,0,1644,1643,1,0,0,0,1644,1645,1,0,0,0,1645,
		1646,1,0,0,0,1646,1647,5,135,0,0,1647,1648,3,234,117,0,1648,263,1,0,0,
		0,1649,1650,5,15,0,0,1650,1658,3,296,148,0,1651,1658,5,6,0,0,1652,1658,
		5,2,0,0,1653,1655,5,22,0,0,1654,1656,3,268,134,0,1655,1654,1,0,0,0,1655,
		1656,1,0,0,0,1656,1658,1,0,0,0,1657,1649,1,0,0,0,1657,1651,1,0,0,0,1657,
		1652,1,0,0,0,1657,1653,1,0,0,0,1658,265,1,0,0,0,1659,1664,3,268,134,0,
		1660,1661,5,141,0,0,1661,1663,3,268,134,0,1662,1660,1,0,0,0,1663,1666,
		1,0,0,0,1664,1662,1,0,0,0,1664,1665,1,0,0,0,1665,267,1,0,0,0,1666,1664,
		1,0,0,0,1667,1668,6,134,-1,0,1668,1678,3,272,136,0,1669,1670,5,134,0,0,
		1670,1671,3,240,120,0,1671,1672,5,135,0,0,1672,1678,1,0,0,0,1673,1674,
		3,278,139,0,1674,1675,3,270,135,0,1675,1676,3,268,134,1,1676,1678,1,0,
		0,0,1677,1667,1,0,0,0,1677,1669,1,0,0,0,1677,1673,1,0,0,0,1678,1723,1,
		0,0,0,1679,1680,10,13,0,0,1680,1681,7,11,0,0,1681,1722,3,268,134,14,1682,
		1683,10,12,0,0,1683,1684,7,12,0,0,1684,1722,3,268,134,13,1685,1690,10,
		11,0,0,1686,1687,5,148,0,0,1687,1691,5,148,0,0,1688,1689,5,147,0,0,1689,
		1691,5,147,0,0,1690,1686,1,0,0,0,1690,1688,1,0,0,0,1691,1692,1,0,0,0,1692,
		1722,3,268,134,12,1693,1694,10,10,0,0,1694,1695,7,13,0,0,1695,1722,3,268,
		134,11,1696,1697,10,9,0,0,1697,1698,7,14,0,0,1698,1722,3,268,134,10,1699,
		1700,10,8,0,0,1700,1701,5,165,0,0,1701,1722,3,268,134,9,1702,1703,10,7,
		0,0,1703,1704,5,167,0,0,1704,1722,3,268,134,8,1705,1706,10,6,0,0,1706,
		1707,5,166,0,0,1707,1722,3,268,134,7,1708,1709,10,5,0,0,1709,1710,5,157,
		0,0,1710,1722,3,268,134,6,1711,1712,10,4,0,0,1712,1713,5,158,0,0,1713,
		1722,3,268,134,5,1714,1715,10,3,0,0,1715,1717,5,151,0,0,1716,1718,3,268,
		134,0,1717,1716,1,0,0,0,1717,1718,1,0,0,0,1718,1719,1,0,0,0,1719,1720,
		5,152,0,0,1720,1722,3,268,134,4,1721,1679,1,0,0,0,1721,1682,1,0,0,0,1721,
		1685,1,0,0,0,1721,1693,1,0,0,0,1721,1696,1,0,0,0,1721,1699,1,0,0,0,1721,
		1702,1,0,0,0,1721,1705,1,0,0,0,1721,1708,1,0,0,0,1721,1711,1,0,0,0,1721,
		1714,1,0,0,0,1722,1725,1,0,0,0,1723,1721,1,0,0,0,1723,1724,1,0,0,0,1724,
		269,1,0,0,0,1725,1723,1,0,0,0,1726,1727,7,15,0,0,1727,271,1,0,0,0,1728,
		1738,3,278,139,0,1729,1730,5,134,0,0,1730,1731,3,224,112,0,1731,1732,5,
		135,0,0,1732,1735,1,0,0,0,1733,1736,3,272,136,0,1734,1736,3,274,137,0,
		1735,1733,1,0,0,0,1735,1734,1,0,0,0,1736,1738,1,0,0,0,1737,1728,1,0,0,
		0,1737,1729,1,0,0,0,1738,273,1,0,0,0,1739,1743,3,268,134,0,1740,1743,3,
		218,109,0,1741,1743,3,220,110,0,1742,1739,1,0,0,0,1742,1740,1,0,0,0,1742,
		1741,1,0,0,0,1743,275,1,0,0,0,1744,1747,3,296,148,0,1745,1747,3,292,146,
		0,1746,1744,1,0,0,0,1746,1745,1,0,0,0,1747,277,1,0,0,0,1748,1763,3,282,
		141,0,1749,1755,5,25,0,0,1750,1756,3,278,139,0,1751,1752,5,134,0,0,1752,
		1753,3,178,89,0,1753,1754,5,135,0,0,1754,1756,1,0,0,0,1755,1750,1,0,0,
		0,1755,1751,1,0,0,0,1756,1763,1,0,0,0,1757,1758,7,16,0,0,1758,1763,3,278,
		139,0,1759,1760,3,280,140,0,1760,1761,3,272,136,0,1761,1763,1,0,0,0,1762,
		1748,1,0,0,0,1762,1749,1,0,0,0,1762,1757,1,0,0,0,1762,1759,1,0,0,0,1763,
		279,1,0,0,0,1764,1765,7,17,0,0,1765,281,1,0,0,0,1766,1767,6,141,-1,0,1767,
		1771,3,290,145,0,1768,1770,3,284,142,0,1769,1768,1,0,0,0,1770,1773,1,0,
		0,0,1771,1769,1,0,0,0,1771,1772,1,0,0,0,1772,1785,1,0,0,0,1773,1771,1,
		0,0,0,1774,1775,10,1,0,0,1775,1776,7,18,0,0,1776,1780,3,296,148,0,1777,
		1779,3,284,142,0,1778,1777,1,0,0,0,1779,1782,1,0,0,0,1780,1778,1,0,0,0,
		1780,1781,1,0,0,0,1781,1784,1,0,0,0,1782,1780,1,0,0,0,1783,1774,1,0,0,
		0,1784,1787,1,0,0,0,1785,1783,1,0,0,0,1785,1786,1,0,0,0,1786,283,1,0,0,
		0,1787,1785,1,0,0,0,1788,1789,5,138,0,0,1789,1790,3,268,134,0,1790,1791,
		5,139,0,0,1791,1807,1,0,0,0,1792,1794,5,134,0,0,1793,1795,3,286,143,0,
		1794,1793,1,0,0,0,1794,1795,1,0,0,0,1795,1796,1,0,0,0,1796,1807,5,135,
		0,0,1797,1800,5,134,0,0,1798,1801,5,141,0,0,1799,1801,8,19,0,0,1800,1798,
		1,0,0,0,1800,1799,1,0,0,0,1801,1802,1,0,0,0,1802,1800,1,0,0,0,1802,1803,
		1,0,0,0,1803,1804,1,0,0,0,1804,1807,5,135,0,0,1805,1807,7,16,0,0,1806,
		1788,1,0,0,0,1806,1792,1,0,0,0,1806,1797,1,0,0,0,1806,1805,1,0,0,0,1807,
		285,1,0,0,0,1808,1813,3,288,144,0,1809,1810,5,141,0,0,1810,1812,3,288,
		144,0,1811,1809,1,0,0,0,1812,1815,1,0,0,0,1813,1811,1,0,0,0,1813,1814,
		1,0,0,0,1814,287,1,0,0,0,1815,1813,1,0,0,0,1816,1819,3,268,134,0,1817,
		1819,3,178,89,0,1818,1816,1,0,0,0,1818,1817,1,0,0,0,1819,289,1,0,0,0,1820,
		1836,3,296,148,0,1821,1836,3,292,146,0,1822,1836,3,294,147,0,1823,1824,
		5,134,0,0,1824,1825,3,268,134,0,1825,1826,5,135,0,0,1826,1836,1,0,0,0,
		1827,1836,3,90,45,0,1828,1836,3,100,50,0,1829,1836,3,104,52,0,1830,1836,
		3,106,53,0,1831,1836,3,76,38,0,1832,1836,3,80,40,0,1833,1836,3,82,41,0,
		1834,1836,3,88,44,0,1835,1820,1,0,0,0,1835,1821,1,0,0,0,1835,1822,1,0,
		0,0,1835,1823,1,0,0,0,1835,1827,1,0,0,0,1835,1828,1,0,0,0,1835,1829,1,
		0,0,0,1835,1830,1,0,0,0,1835,1831,1,0,0,0,1835,1832,1,0,0,0,1835,1833,
		1,0,0,0,1835,1834,1,0,0,0,1836,291,1,0,0,0,1837,1856,5,182,0,0,1838,1856,
		5,183,0,0,1839,1856,5,184,0,0,1840,1842,7,12,0,0,1841,1840,1,0,0,0,1841,
		1842,1,0,0,0,1842,1843,1,0,0,0,1843,1856,5,185,0,0,1844,1846,7,12,0,0,
		1845,1844,1,0,0,0,1845,1846,1,0,0,0,1846,1847,1,0,0,0,1847,1856,5,186,
		0,0,1848,1856,5,180,0,0,1849,1856,5,48,0,0,1850,1856,5,50,0,0,1851,1856,
		5,57,0,0,1852,1856,5,49,0,0,1853,1856,5,38,0,0,1854,1856,5,39,0,0,1855,
		1837,1,0,0,0,1855,1838,1,0,0,0,1855,1839,1,0,0,0,1855,1841,1,0,0,0,1855,
		1845,1,0,0,0,1855,1848,1,0,0,0,1855,1849,1,0,0,0,1855,1850,1,0,0,0,1855,
		1851,1,0,0,0,1855,1852,1,0,0,0,1855,1853,1,0,0,0,1855,1854,1,0,0,0,1856,
		293,1,0,0,0,1857,1861,5,181,0,0,1858,1860,7,20,0,0,1859,1858,1,0,0,0,1860,
		1863,1,0,0,0,1861,1859,1,0,0,0,1861,1862,1,0,0,0,1862,1864,1,0,0,0,1863,
		1861,1,0,0,0,1864,1866,5,193,0,0,1865,1857,1,0,0,0,1866,1867,1,0,0,0,1867,
		1865,1,0,0,0,1867,1868,1,0,0,0,1868,295,1,0,0,0,1869,1870,7,21,0,0,1870,
		297,1,0,0,0,243,301,318,325,331,337,340,343,351,358,361,364,372,375,378,
		388,398,401,409,414,423,429,431,443,453,461,464,467,476,499,506,509,515,
		524,530,532,542,544,553,559,569,571,580,584,587,595,599,601,604,610,614,
		620,634,641,647,650,654,658,662,666,674,677,684,689,698,702,704,716,718,
		730,732,737,743,746,752,756,759,762,773,779,781,784,792,797,803,813,818,
		820,842,849,854,878,883,888,892,896,900,909,916,923,929,932,937,941,948,
		951,957,963,966,971,978,989,991,997,999,1010,1021,1027,1032,1038,1042,
		1047,1057,1071,1082,1089,1096,1103,1110,1117,1127,1131,1133,1138,1142,
		1155,1160,1164,1168,1172,1179,1185,1197,1204,1208,1213,1217,1224,1229,
		1235,1238,1242,1246,1253,1262,1267,1274,1285,1297,1315,1321,1331,1336,
		1349,1356,1366,1374,1387,1390,1395,1397,1409,1413,1415,1424,1428,1432,
		1435,1439,1445,1449,1454,1456,1460,1465,1468,1475,1482,1486,1490,1494,
		1498,1502,1506,1510,1514,1518,1522,1525,1534,1539,1541,1553,1556,1568,
		1576,1581,1589,1595,1601,1620,1624,1628,1637,1644,1655,1657,1664,1677,
		1690,1717,1721,1723,1735,1737,1742,1746,1755,1762,1771,1780,1785,1794,
		1800,1802,1806,1813,1818,1835,1841,1845,1855,1861,1867
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
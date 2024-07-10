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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
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
		 	case .REGISTER:fallthrough
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
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
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
		 	case .REGISTER:fallthrough
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
			func NS_NOESCAPE() -> [TerminalNode] {
				return getTokens(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)
			}
			open
			func NS_NOESCAPE(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue, i)
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
		 	setState(650)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(649)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(653)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,55,_ctx)) {
		 	case 1:
		 		setState(652)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(655)
		 	try typeSpecifier(0)
		 	setState(657)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(656)
		 		try nullabilitySpecifier()

		 	}

		 	setState(659)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(661)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(660)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(663)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(665)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(664)
		 		try nullabilitySpecifier()

		 	}

		 	setState(667)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(669)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(668)
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
		 	setState(671)
		 	try match(ObjectiveCParser.Tokens.LT.rawValue)
		 	setState(680)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(672)
		 		try typeSpecifierWithPrefixes()
		 		setState(677)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(673)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(674)
		 			try typeSpecifierWithPrefixes()


		 			setState(679)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(682)
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
		 	setState(692)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,63, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(687)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,62,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(684)
		 				try typePrefix()

		 		 
		 			}
		 			setState(689)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,62,_ctx)
		 		}
		 		setState(690)
		 		try typeSpecifier(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(691)
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
		 	setState(694)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(695)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(707)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(696)
		 		try dictionaryPair()
		 		setState(701)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,64,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(697)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(698)
		 				try dictionaryPair()

		 		 
		 			}
		 			setState(703)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,64,_ctx)
		 		}
		 		setState(705)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(704)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(709)
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
		 	setState(711)
		 	try castExpression()
		 	setState(712)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(713)
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
		 	setState(715)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(716)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(721)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(717)
		 		try expressions()
		 		setState(719)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(718)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(723)
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
		 	setState(735)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,70, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(725)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(726)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(727)
		 		try expression(0)
		 		setState(728)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(730)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(733)
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
		 			setState(731)
		 			try constant()

		 			break
		 		case .REGISTER:fallthrough
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
		 			setState(732)
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
		 	setState(737)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(749)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(740)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,71, _ctx)) {
		 		case 1:
		 			setState(738)
		 			try typeVariableDeclaratorOrName()

		 			break
		 		case 2:
		 			setState(739)
		 			try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 			break
		 		default: break
		 		}
		 		setState(746)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(742)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(743)
		 			try typeVariableDeclaratorOrName()


		 			setState(748)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(751)
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
		 	setState(755)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,74, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(753)
		 		try typeVariableDeclarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(754)
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
		 	setState(757)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(759)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,75,_ctx)) {
		 	case 1:
		 		setState(758)
		 		try typeSpecifier(0)

		 		break
		 	default: break
		 	}
		 	setState(762)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(761)
		 		try nullabilitySpecifier()

		 	}

		 	setState(765)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(764)
		 		try blockParameters()

		 	}

		 	setState(767)
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
		 	setState(769)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(770)
		 	try receiver()
		 	setState(771)
		 	try messageSelector()
		 	setState(772)
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
		 	setState(776)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,78, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(774)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(775)
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
		 	setState(784)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,80, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(778)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(780) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(779)
		 			try keywordArgument()


		 			setState(782); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(787)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(786)
		 		try selector()

		 	}

		 	setState(789)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(790)
		 	try keywordArgumentType()
		 	setState(795)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(791)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(792)
		 		try keywordArgumentType()


		 		setState(797)
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
		 	setState(798)
		 	try expressions()
		 	setState(800)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,83,_ctx)) {
		 	case 1:
		 		setState(799)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(806)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(802)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(803)
		 		try initializerList()
		 		setState(804)
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
		 	setState(808)
		 	try match(ObjectiveCParser.Tokens.SELECTOR.rawValue)
		 	setState(809)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(810)
		 	try selectorName()
		 	setState(811)
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
		 	setState(823)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,87, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(813)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(814)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(819) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(816)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 				setState(815)
		 				try selector()

		 			}

		 			setState(818)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 			setState(821); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.COLON.rawValue)

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
		 	setState(825)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(826)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(827)
		 	try protocolName()
		 	setState(828)
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
		 	setState(830)
		 	try match(ObjectiveCParser.Tokens.ENCODE.rawValue)
		 	setState(831)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(832)
		 	try typeName()
		 	setState(833)
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
		 	setState(835)
		 	try declarationSpecifiers()
		 	setState(836)
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
		 	setState(845)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,88, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(838)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(839)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(840)
		 		try identifier()
		 		setState(841)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(843)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(844)
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
		 	setState(847)
		 	try match(ObjectiveCParser.Tokens.TRY.rawValue)
		 	setState(848)
		 	try {
		 			let assignmentValue = try compoundStatement()
		 			_localctx.castdown(TryBlockContext.self).tryStatement = assignmentValue
		 	     }()

		 	setState(852)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CATCH.rawValue) {
		 		setState(849)
		 		try catchStatement()


		 		setState(854)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(857)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.FINALLY.rawValue) {
		 		setState(855)
		 		try match(ObjectiveCParser.Tokens.FINALLY.rawValue)
		 		setState(856)
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
		 	setState(859)
		 	try match(ObjectiveCParser.Tokens.CATCH.rawValue)
		 	setState(860)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(861)
		 	try typeVariableDeclarator()
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
		 	setState(865)
		 	try match(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue)
		 	setState(866)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(867)
		 	try expression(0)
		 	setState(868)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
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
		 	setState(871)
		 	try match(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue)
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
		 	setState(874)
		 	try functionSignature()
		 	setState(875)
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
		 	setState(877)
		 	try functionSignature()
		 	setState(878)
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
		 	setState(881)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,91,_ctx)) {
		 	case 1:
		 		setState(880)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(883)
		 	try identifier()

		 	setState(884)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(886)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(885)
		 		try parameterList()

		 	}

		 	setState(888)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	setState(891)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(890)
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
		 	setState(893)
		 	try attributeName()
		 	setState(895)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(894)
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
		 	setState(899)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(897)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break
		 	case .REGISTER:fallthrough
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
		 		setState(898)
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
		 	setState(901)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(903)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853408) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 66584579) != 0)) {
		 		setState(902)
		 		try attributeParameterList()

		 	}

		 	setState(905)
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
		 	setState(907)
		 	try attributeParameter()
		 	setState(912)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(908)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(909)
		 		try attributeParameter()


		 		setState(914)
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
		 	setState(919)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,98, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(915)
		 		try attribute()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(916)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(917)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(918)
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
		 	setState(921)
		 	try attributeName()
		 	setState(922)
		 	try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 	setState(926)
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
		 		setState(923)
		 		try constant()

		 		break
		 	case .CONST:fallthrough
		 	case .REGISTER:fallthrough
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
		 		setState(924)
		 		try attributeName()

		 		break

		 	case .STRING_START:
		 		setState(925)
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
		 	setState(932)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,100, _ctx)) {
		 	case 1:
		 		setState(928)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		setState(929)
		 		try enumDeclaration()

		 		break
		 	case 3:
		 		setState(930)
		 		try varDeclaration()

		 		break
		 	case 4:
		 		setState(931)
		 		try typedefDeclaration()

		 		break
		 	default: break
		 	}
		 	setState(935)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(934)
		 		try macro()

		 	}

		 	setState(937)
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
		 	setState(940)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(939)
		 		try attributeSpecifier()

		 	}

		 	setState(942)
		 	try identifier()
		 	setState(944)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(943)
		 		try attributeSpecifier()

		 	}

		 	setState(946)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(947)
		 	try declarator()
		 	setState(948)
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
		 	setState(951)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(950)
		 		try attributeSpecifier()

		 	}

		 	setState(954)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.TYPEDEF.rawValue) {
		 		setState(953)
		 		try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)

		 	}

		 	setState(960)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ENUM:
		 		setState(956)
		 		try enumSpecifier()
		 		setState(957)
		 		try identifier()

		 		break
		 	case .NS_ENUM:fallthrough
		 	case .NS_CLOSED_ENUM:fallthrough
		 	case .NS_ERROR_ENUM:fallthrough
		 	case .NS_OPTIONS:
		 		setState(959)
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
		 	setState(962)
		 	try declarationSpecifiers()
		 	setState(964)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,107,_ctx)) {
		 	case 1:
		 		setState(963)
		 		try initDeclaratorList()

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
		 	setState(967)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(966)
		 		try attributeSpecifier()

		 	}

		 	setState(969)
		 	try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)
		 	setState(970)
		 	try declarationSpecifiers()
		 	setState(972)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,109,_ctx)) {
		 	case 1:
		 		setState(971)
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
		 	setState(974)
		 	try declarator()
		 	setState(979)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(975)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(976)
		 		try declarator()


		 		setState(981)
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
		 	setState(992)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,112,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(990)
		 			try _errHandler.sync(self)
		 			switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 			case .AUTO:fallthrough
		 			case .EXTERN:fallthrough
		 			case .REGISTER:fallthrough
		 			case .STATIC:
		 				setState(982)
		 				try storageClassSpecifier()

		 				break

		 			case .ATTRIBUTE:
		 				setState(983)
		 				try attributeSpecifier()

		 				break
		 			case .AUTORELEASING_QUALIFIER:fallthrough
		 			case .STRONG_QUALIFIER:fallthrough
		 			case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
		 			case .WEAK_QUALIFIER:
		 				setState(984)
		 				try arcBehaviourSpecifier()

		 				break
		 			case .NULL_UNSPECIFIED:fallthrough
		 			case .NULLABLE:fallthrough
		 			case .NONNULL:fallthrough
		 			case .NULL_RESETTABLE:
		 				setState(985)
		 				try nullabilitySpecifier()

		 				break
		 			case .IB_OUTLET:fallthrough
		 			case .IB_OUTLET_COLLECTION:
		 				setState(986)
		 				try ibOutletQualifier()

		 				break

		 			case .NS_NOESCAPE:
		 				setState(987)
		 				try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 				break
		 			case .INLINE:fallthrough
		 			case .BLOCK:fallthrough
		 			case .BRIDGE:fallthrough
		 			case .BRIDGE_RETAINED:fallthrough
		 			case .BRIDGE_TRANSFER:fallthrough
		 			case .KINDOF:fallthrough
		 			case .NS_INLINE:
		 				setState(988)
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
		 				setState(989)
		 				try typeQualifier()

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 	 
		 		}
		 		setState(994)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,112,_ctx)
		 	}
		 	setState(995)
		 	try typeSpecifier(0)
		 	setState(999)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,113,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(996)
		 			try attributeSpecifier()

		 	 
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
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
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
			func typeQualifier() -> [TypeQualifierContext] {
				return getRuleContexts(TypeQualifierContext.self)
			}
			open
			func typeQualifier(_ i: Int) -> TypeQualifierContext? {
				return getRuleContext(TypeQualifierContext.self, i)
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
			setState(1185)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,140, _ctx)) {
			case 1:
				setState(1078)
				try match(ObjectiveCParser.Tokens.VOID.rawValue)
				setState(1082)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,123,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1079)
						try typeQualifier()

				 
					}
					setState(1084)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,123,_ctx)
				}

				break
			case 2:
				setState(1088)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1085)
					try typeSpecifierModifier()


					setState(1090)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1091)
				try match(ObjectiveCParser.Tokens.CHAR.rawValue)
				setState(1095)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,125,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1092)
						try typeQualifier()

				 
					}
					setState(1097)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,125,_ctx)
				}

				break
			case 3:
				setState(1101)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1098)
						try typeSpecifierModifier()

				 
					}
					setState(1103)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				}
				setState(1104)
				try match(ObjectiveCParser.Tokens.SHORT.rawValue)
				setState(1108)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,127,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1105)
						try typeQualifier()

				 
					}
					setState(1110)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,127,_ctx)
				}

				break
			case 4:
				setState(1114)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1111)
					try typeSpecifierModifier()


					setState(1116)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1117)
				try match(ObjectiveCParser.Tokens.INT.rawValue)
				setState(1121)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,129,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1118)
						try typeQualifier()

				 
					}
					setState(1123)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,129,_ctx)
				}

				break
			case 5:
				setState(1127)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,130,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1124)
						try typeSpecifierModifier()

				 
					}
					setState(1129)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,130,_ctx)
				}
				setState(1130)
				try match(ObjectiveCParser.Tokens.LONG.rawValue)
				setState(1134)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,131,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1131)
						try typeQualifier()

				 
					}
					setState(1136)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,131,_ctx)
				}

				break
			case 6:
				setState(1140)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1137)
					try typeSpecifierModifier()


					setState(1142)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1143)
				try match(ObjectiveCParser.Tokens.FLOAT.rawValue)
				setState(1147)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1144)
						try typeQualifier()

				 
					}
					setState(1149)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
				}

				break
			case 7:
				setState(1153)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1150)
					try typeSpecifierModifier()


					setState(1155)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1156)
				try match(ObjectiveCParser.Tokens.DOUBLE.rawValue)
				setState(1160)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,135,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1157)
						try typeQualifier()

				 
					}
					setState(1162)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,135,_ctx)
				}

				break
			case 8:
				setState(1163)
				try typeofExpression()

				break
			case 9:
				setState(1164)
				try structOrUnionSpecifier()

				break
			case 10:
				setState(1165)
				try enumSpecifier()

				break
			case 11:
				setState(1166)
				try nsEnumOrOptionSpecifier()

				break
			case 12:
				setState(1167)
				try genericTypeSpecifier()
				setState(1173)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,137,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1171)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .AUTORELEASING_QUALIFIER:fallthrough
						case .STRONG_QUALIFIER:fallthrough
						case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
						case .WEAK_QUALIFIER:
							setState(1168)
							try arcBehaviourSpecifier()

							break
						case .NULL_UNSPECIFIED:fallthrough
						case .NULLABLE:fallthrough
						case .NONNULL:fallthrough
						case .NULL_RESETTABLE:
							setState(1169)
							try nullabilitySpecifier()

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
							setState(1170)
							try typeQualifier()

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
				 
					}
					setState(1175)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,137,_ctx)
				}

				break
			case 13:
				setState(1176)
				try identifier()
				setState(1182)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,139,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1180)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .AUTORELEASING_QUALIFIER:fallthrough
						case .STRONG_QUALIFIER:fallthrough
						case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
						case .WEAK_QUALIFIER:
							setState(1177)
							try arcBehaviourSpecifier()

							break
						case .NULL_UNSPECIFIED:fallthrough
						case .NULLABLE:fallthrough
						case .NONNULL:fallthrough
						case .NULL_RESETTABLE:
							setState(1178)
							try nullabilitySpecifier()

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
							setState(1179)
							try typeQualifier()

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
				 
					}
					setState(1184)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,139,_ctx)
				}

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1199)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,143,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = TypeSpecifierContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_typeSpecifier)
					setState(1187)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1188)
					try match(ObjectiveCParser.Tokens.MUL.rawValue)
					setState(1194)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,142,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1192)
							try _errHandler.sync(self)
							switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
							case .AUTORELEASING_QUALIFIER:fallthrough
							case .STRONG_QUALIFIER:fallthrough
							case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
							case .WEAK_QUALIFIER:
								setState(1189)
								try arcBehaviourSpecifier()

								break
							case .NULL_UNSPECIFIED:fallthrough
							case .NULLABLE:fallthrough
							case .NONNULL:fallthrough
							case .NULL_RESETTABLE:
								setState(1190)
								try nullabilitySpecifier()

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
								setState(1191)
								try typeQualifier()

								break
							default:
								throw ANTLRException.recognition(e: NoViableAltException(self))
							}
					 
						}
						setState(1196)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,142,_ctx)
					}

			 
				}
				setState(1201)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,143,_ctx)
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
		 	setState(1202)
		 	try match(ObjectiveCParser.Tokens.TYPEOF.rawValue)

		 	setState(1203)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1204)
		 	try expression(0)
		 	setState(1205)
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
		 	setState(1207)
		 	try fieldDeclarator()
		 	setState(1212)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1208)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1209)
		 		try fieldDeclarator()


		 		setState(1214)
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
		 	setState(1221)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,146, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1215)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1217)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
		 			setState(1216)
		 			try declarator()

		 		}

		 		setState(1219)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1220)
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
		 	setState(1223)
		 	try match(ObjectiveCParser.Tokens.ENUM.rawValue)
		 	setState(1229)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,148,_ctx)) {
		 	case 1:
		 		setState(1225)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1224)
		 			try identifier()

		 		}

		 		setState(1227)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1228)
		 		try typeName()

		 		break
		 	default: break
		 	}
		 	setState(1242)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .REGISTER:fallthrough
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
		 		setState(1231)
		 		try identifier()
		 		setState(1236)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,149,_ctx)) {
		 		case 1:
		 			setState(1232)
		 			try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 			setState(1233)
		 			try enumeratorList()
		 			setState(1234)
		 			try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 			break
		 		default: break
		 		}

		 		break

		 	case .LBRACE:
		 		setState(1238)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1239)
		 		try enumeratorList()
		 		setState(1240)
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
		 	setState(1244)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 15) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1245)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1246)
		 	try typeName()
		 	setState(1247)
		 	try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 	setState(1248)
		 	try identifier()
		 	setState(1249)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1254)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,151,_ctx)) {
		 	case 1:
		 		setState(1250)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1251)
		 		try enumeratorList()
		 		setState(1252)
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
		 	setState(1256)
		 	try enumerator()
		 	setState(1261)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,152,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1257)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1258)
		 			try enumerator()

		 	 
		 		}
		 		setState(1263)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,152,_ctx)
		 	}
		 	setState(1265)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1264)
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
		 	setState(1267)
		 	try enumeratorIdentifier()
		 	setState(1270)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1268)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1269)
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
		 	setState(1274)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .REGISTER:fallthrough
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
		 		setState(1272)
		 		try identifier()

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1273)
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
		 	setState(1299)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,160, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1281)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .REGISTER:fallthrough
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
		 			setState(1276)
		 			try identifier()

		 			break

		 		case .LP:
		 			setState(1277)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1278)
		 			try declarator()
		 			setState(1279)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1286)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1283)
		 			try declaratorSuffix()


		 			setState(1288)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1289)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1290)
		 		try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 		setState(1292)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,158,_ctx)) {
		 		case 1:
		 			setState(1291)
		 			try nullabilitySpecifier()

		 			break
		 		default: break
		 		}
		 		setState(1295)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1294)
		 			try identifier()

		 		}

		 		setState(1297)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1298)
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
		 	setState(1301)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(1303)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 		setState(1302)
		 		try constantExpression()

		 	}

		 	setState(1305)
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
		 	setState(1307)
		 	try parameterDeclarationList()
		 	setState(1310)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1308)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1309)
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
		 	setState(1378)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,169, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1312)
		 		try identifier()
		 		setState(1324)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 			setState(1313)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1314)
		 			try primaryExpression()
		 			setState(1319)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 				setState(1315)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1316)
		 				try primaryExpression()


		 				setState(1321)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1322)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1326)
		 		try match(ObjectiveCParser.Tokens.NS_UNAVAILABLE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1327)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue)
		 		setState(1328)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1331)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,165, _ctx)) {
		 		case 1:
		 			setState(1329)
		 			try swiftAliasExpression()

		 			break
		 		case 2:
		 			setState(1330)
		 			try swiftSelectorExpression()

		 			break
		 		default: break
		 		}
		 		setState(1333)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1335)
		 		try match(ObjectiveCParser.Tokens.API_AVAILABLE.rawValue)
		 		setState(1336)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1337)
		 		try apiAvailableOsVersion()
		 		setState(1342)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1338)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1339)
		 			try apiAvailableOsVersion()


		 			setState(1344)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1345)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1347)
		 		try match(ObjectiveCParser.Tokens.API_UNAVAILABLE.rawValue)
		 		setState(1348)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1349)
		 		try identifier()
		 		setState(1354)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1350)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1351)
		 			try identifier()


		 			setState(1356)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1357)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1359)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_UNAVAILABLE.rawValue)
		 		setState(1360)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1361)
		 		try stringLiteral()
		 		setState(1362)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1364)
		 		try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 		setState(1365)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1366)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1367)
		 		try clangAttribute()
		 		setState(1372)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1368)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1369)
		 			try clangAttribute()


		 			setState(1374)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1375)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1376)
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
		 	setState(1393)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,171, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1380)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1381)
		 		try identifier()
		 		setState(1382)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1383)
		 		try clangAttributeArgument()
		 		setState(1388)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1384)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1385)
		 			try clangAttributeArgument()


		 			setState(1390)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1391)
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
		 	setState(1406)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,172, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1395)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1396)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1397)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1398)
		 		try identifier()
		 		setState(1399)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1400)
		 		try version()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1402)
		 		try identifier()
		 		setState(1403)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1404)
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
		 	setState(1408)
		 	try identifier()
		 	setState(1413)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1409)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1410)
		 		try identifier()


		 		setState(1415)
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
		 	setState(1416)
		 	try identifier()
		 	setState(1417)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1423)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728318464) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.UNDERSCORE.rawValue) {
		 		setState(1418)
		 		try swiftSelector()
		 		setState(1419)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 		setState(1425)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1426)
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
		 	setState(1431)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .REGISTER:fallthrough
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
		 		setState(1428)
		 		try identifier()

		 		break

		 	case .UNDERSCORE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1429)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break

		 	case .FOR:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1430)
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
		 	setState(1433)
		 	try identifier()
		 	setState(1434)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1435)
		 	try version()
		 	setState(1436)
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
		 	setState(1447)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FLOATING_POINT_LITERAL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1438)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break

		 	case .DECIMAL_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1439)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)
		 		setState(1444)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 			setState(1440)
		 			try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 			setState(1441)
		 			try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)


		 			setState(1446)
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
		 	setState(1449)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1454)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1450)
		 		try expressions()
		 		setState(1452)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1451)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1456)
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
		 	setState(1458)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1472)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1459)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1460)
		 		try expression(0)
		 		setState(1466)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,180,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(1461)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1462)
		 				try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 				setState(1463)
		 				try expression(0)

		 		 
		 			}
		 			setState(1468)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,180,_ctx)
		 		}
		 		setState(1470)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1469)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1474)
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
		 	setState(1476)
		 	try initializer()
		 	setState(1481)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,183,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1477)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1478)
		 			try initializer()

		 	 
		 		}
		 		setState(1483)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,183,_ctx)
		 	}
		 	setState(1485)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1484)
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
		 	setState(1492)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,186, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1487)
		 		try declarationSpecifiers()
		 		setState(1489)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1488)
		 			try abstractDeclarator()

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1491)
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
		 	setState(1513)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LP:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1494)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1496)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1495)
		 			try abstractDeclarator()

		 		}

		 		setState(1498)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1500) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1499)
		 			try abstractDeclaratorSuffix()


		 			setState(1502); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break

		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1509) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1504)
		 			try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 			setState(1506)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 				setState(1505)
		 				try constantExpression()

		 			}

		 			setState(1508)
		 			try match(ObjectiveCParser.Tokens.RBRACK.rawValue)


		 			setState(1511); 
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
		 	setState(1525)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1515)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1517)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 			setState(1516)
		 			try constantExpression()

		 		}

		 		setState(1519)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1520)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1522)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 			setState(1521)
		 			try parameterDeclarationList()

		 		}

		 		setState(1524)
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
		 	setState(1527)
		 	try parameterDeclaration()
		 	setState(1532)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,195,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1528)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1529)
		 			try parameterDeclaration()

		 	 
		 		}
		 		setState(1534)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,195,_ctx)
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
		 	setState(1539)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,196, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1535)
		 		try declarationSpecifiers()
		 		setState(1536)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1538)
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
		 	setState(1582)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,207, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1541)
		 		try labeledStatement()
		 		setState(1543)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,197,_ctx)) {
		 		case 1:
		 			setState(1542)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1545)
		 		try compoundStatement()
		 		setState(1547)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,198,_ctx)) {
		 		case 1:
		 			setState(1546)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1549)
		 		try selectionStatement()
		 		setState(1551)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,199,_ctx)) {
		 		case 1:
		 			setState(1550)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1553)
		 		try iterationStatement()
		 		setState(1555)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,200,_ctx)) {
		 		case 1:
		 			setState(1554)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1557)
		 		try jumpStatement()
		 		setState(1559)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,201,_ctx)) {
		 		case 1:
		 			setState(1558)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1561)
		 		try synchronizedStatement()
		 		setState(1563)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,202,_ctx)) {
		 		case 1:
		 			setState(1562)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1565)
		 		try autoreleaseStatement()
		 		setState(1567)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,203,_ctx)) {
		 		case 1:
		 			setState(1566)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1569)
		 		try throwStatement()
		 		setState(1571)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,204,_ctx)) {
		 		case 1:
		 			setState(1570)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1573)
		 		try tryBlock()
		 		setState(1575)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,205,_ctx)) {
		 		case 1:
		 			setState(1574)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1577)
		 		try expressions()
		 		setState(1579)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,206,_ctx)) {
		 		case 1:
		 			setState(1578)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1581)
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
		 	setState(1584)
		 	try identifier()
		 	setState(1585)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(1586)
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
		 	setState(1588)
		 	try constantExpression()
		 	setState(1591)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ELIPSIS.rawValue) {
		 		setState(1589)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)
		 		setState(1590)
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
		 	setState(1593)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1598)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146530212641654) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802877825) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536747) != 0)) {
		 		setState(1596)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,209, _ctx)) {
		 		case 1:
		 			setState(1594)
		 			try declaration()

		 			break
		 		case 2:
		 			setState(1595)
		 			try statement()

		 			break
		 		default: break
		 		}

		 		setState(1600)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1601)
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
		 	setState(1613)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IF:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1603)
		 		try match(ObjectiveCParser.Tokens.IF.rawValue)
		 		setState(1604)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1605)
		 		try expression(0)
		 		setState(1606)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1607)
		 		try {
		 				let assignmentValue = try statement()
		 				_localctx.castdown(SelectionStatementContext.self).ifBody = assignmentValue
		 		     }()

		 		setState(1610)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,211,_ctx)) {
		 		case 1:
		 			setState(1608)
		 			try match(ObjectiveCParser.Tokens.ELSE.rawValue)
		 			setState(1609)
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
		 		setState(1612)
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
		 	setState(1615)
		 	try match(ObjectiveCParser.Tokens.SWITCH.rawValue)
		 	setState(1616)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1617)
		 	try expression(0)
		 	setState(1618)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1619)
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
		 	setState(1621)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1625)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue) {
		 		setState(1622)
		 		try switchSection()


		 		setState(1627)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1628)
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
		 	setState(1631) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1630)
		 		try switchLabel()


		 		setState(1633); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 	setState(1636) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1635)
		 		try statement()


		 		setState(1638); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146513340121412) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360772993) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536747) != 0))

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
		 	setState(1652)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CASE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1640)
		 		try match(ObjectiveCParser.Tokens.CASE.rawValue)
		 		setState(1646)
		 		try _errHandler.sync(self)
		 		switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 		case .REGISTER:fallthrough
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
		 			setState(1641)
		 			try rangeExpression()

		 			break

		 		case .LP:
		 			setState(1642)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1643)
		 			try rangeExpression()
		 			setState(1644)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1648)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1650)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 		setState(1651)
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
		 	setState(1658)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,218, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1654)
		 		try whileStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1655)
		 		try doStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1656)
		 		try forStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1657)
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
		 	setState(1660)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1661)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1662)
		 	try expression(0)
		 	setState(1663)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1664)
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
		 	setState(1666)
		 	try match(ObjectiveCParser.Tokens.DO.rawValue)
		 	setState(1667)
		 	try statement()
		 	setState(1668)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1669)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1670)
		 	try expression(0)
		 	setState(1671)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1672)
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
		 	setState(1674)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1675)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1677)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916136071445042) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802874497) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1676)
		 		try forLoopInitializer()

		 	}

		 	setState(1679)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1681)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1680)
		 		try expression(0)

		 	}

		 	setState(1683)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1685)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1684)
		 		try expressions()

		 	}

		 	setState(1687)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1688)
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
		 	setState(1694)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,222, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1690)
		 		try declarationSpecifiers()
		 		setState(1691)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1693)
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
		 	setState(1696)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1697)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1698)
		 	try typeVariableDeclarator()
		 	setState(1699)
		 	try match(ObjectiveCParser.Tokens.IN.rawValue)
		 	setState(1701)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1700)
		 		try expression(0)

		 	}

		 	setState(1703)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1704)
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
		 	setState(1714)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .GOTO:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1706)
		 		try match(ObjectiveCParser.Tokens.GOTO.rawValue)
		 		setState(1707)
		 		try identifier()

		 		break

		 	case .CONTINUE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1708)
		 		try match(ObjectiveCParser.Tokens.CONTINUE.rawValue)

		 		break

		 	case .BREAK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1709)
		 		try match(ObjectiveCParser.Tokens.BREAK.rawValue)

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1710)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)
		 		setState(1712)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,224,_ctx)) {
		 		case 1:
		 			setState(1711)
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
		 	setState(1716)
		 	try expression(0)
		 	setState(1721)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,226,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1717)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1718)
		 			try expression(0)

		 	 
		 		}
		 		setState(1723)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,226,_ctx)
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
			setState(1734)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,227, _ctx)) {
			case 1:
				setState(1725)
				try castExpression()

				break
			case 2:
				setState(1726)
				try match(ObjectiveCParser.Tokens.LP.rawValue)
				setState(1727)
				try compoundStatement()
				setState(1728)
				try match(ObjectiveCParser.Tokens.RP.rawValue)

				break
			case 3:
				setState(1730)
				try unaryExpression()
				setState(1731)
				try assignmentOperator()
				setState(1732)
				try {
						let assignmentValue = try expression(1)
						_localctx.castdown(ExpressionContext.self).assignmentExpression = assignmentValue
				     }()


				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1780)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,231,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(1778)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,230, _ctx)) {
					case 1:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1736)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(1737)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 163)) & ~0x3f) == 0 && ((Int64(1) << (_la - 163)) & 35) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1738)
						try expression(14)

						break
					case 2:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1739)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(1740)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1741)
						try expression(13)

						break
					case 3:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1742)
						if (!(precpred(_ctx, 11))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 11)"))
						}
						setState(1747)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .LT:
							setState(1743)
							try match(ObjectiveCParser.Tokens.LT.rawValue)
							setState(1744)
							try match(ObjectiveCParser.Tokens.LT.rawValue)

							break

						case .GT:
							setState(1745)
							try match(ObjectiveCParser.Tokens.GT.rawValue)
							setState(1746)
							try match(ObjectiveCParser.Tokens.GT.rawValue)

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
						setState(1749)
						try expression(12)

						break
					case 4:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1750)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(1751)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 147)) & ~0x3f) == 0 && ((Int64(1) << (_la - 147)) & 387) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1752)
						try expression(11)

						break
					case 5:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1753)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(1754)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.EQUAL.rawValue || _la == ObjectiveCParser.Tokens.NOTEQUAL.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1755)
						try expression(10)

						break
					case 6:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1756)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(1757)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITAND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1758)
						try expression(9)

						break
					case 7:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1759)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(1760)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1761)
						try expression(8)

						break
					case 8:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1762)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(1763)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1764)
						try expression(7)

						break
					case 9:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1765)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(1766)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.AND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1767)
						try expression(6)

						break
					case 10:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1768)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(1769)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.OR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1770)
						try expression(5)

						break
					case 11:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1771)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(1772)
						try match(ObjectiveCParser.Tokens.QUESTION.rawValue)
						setState(1774)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
						if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
							setState(1773)
							try {
									let assignmentValue = try expression(0)
									_localctx.castdown(ExpressionContext.self).trueExpression = assignmentValue
							     }()


						}

						setState(1776)
						try match(ObjectiveCParser.Tokens.COLON.rawValue)
						setState(1777)
						try {
								let assignmentValue = try expression(4)
								_localctx.castdown(ExpressionContext.self).falseExpression = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(1782)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,231,_ctx)
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
		 	setState(1783)
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
		 	setState(1794)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,233, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1785)
		 		try unaryExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1786)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1787)
		 		try typeName()
		 		setState(1788)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		setState(1792)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,232, _ctx)) {
		 		case 1:
		 			setState(1790)
		 			try castExpression()

		 			break
		 		case 2:
		 			setState(1791)
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
		 	setState(1799)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,234, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1796)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1797)
		 		try arrayInitializer()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1798)
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
		 	setState(1803)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .REGISTER:fallthrough
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
		 		setState(1801)
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
		 		setState(1802)
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
		 	setState(1819)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,237, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1805)
		 		try postfixExpression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1806)
		 		try match(ObjectiveCParser.Tokens.SIZEOF.rawValue)
		 		setState(1812)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,236, _ctx)) {
		 		case 1:
		 			setState(1807)
		 			try unaryExpression()

		 			break
		 		case 2:
		 			setState(1808)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1809)
		 			try typeSpecifier(0)
		 			setState(1810)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1814)
		 		_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1815)
		 		try unaryExpression()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1816)
		 		try unaryOperator()
		 		setState(1817)
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
		 	setState(1821)
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
			setState(1824)
			try primaryExpression()
			setState(1828)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,238,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					setState(1825)
					try `postfix`()

			 
				}
				setState(1830)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,238,_ctx)
			}

			_ctx!.stop = try _input.LT(-1)
			setState(1842)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,240,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = PostfixExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_postfixExpression)
					setState(1831)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1832)
					_la = try _input.LA(1)
					if (!(_la == ObjectiveCParser.Tokens.DOT.rawValue || _la == ObjectiveCParser.Tokens.STRUCTACCESS.rawValue)) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(1833)
					try identifier()
					setState(1837)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,239,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1834)
							try `postfix`()

					 
						}
						setState(1839)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,239,_ctx)
					}

			 
				}
				setState(1844)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,240,_ctx)
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
		open var _tset3471: Token!
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
		 	setState(1863)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,244, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1845)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1846)
		 		try expression(0)
		 		setState(1847)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1849)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1851)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916127412169232) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196290586308737) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 			setState(1850)
		 			try argumentExpressionList()

		 		}

		 		setState(1853)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1854)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1857) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1857)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,242, _ctx)) {
		 			case 1:
		 				setState(1855)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 				break
		 			case 2:
		 				setState(1856)
		 				_localctx.castdown(PostfixContext.self)._tset3471 = try _input.LT(1)
		 				_la = try _input.LA(1)
		 				if (_la <= 0 || (_la == ObjectiveCParser.Tokens.RP.rawValue)) {
		 					_localctx.castdown(PostfixContext.self)._tset3471 = try _errHandler.recoverInline(self) as Token
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}
		 				_localctx.castdown(PostfixContext.self).macroArguments.append(_localctx.castdown(PostfixContext.self)._tset3471)

		 				break
		 			default: break
		 			}

		 			setState(1859); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & -2) != 0) || ((Int64((_la - 64)) & ~0x3f) == 0 && ((Int64(1) << (_la - 64)) & -1) != 0) || ((Int64((_la - 128)) & ~0x3f) == 0 && ((Int64(1) << (_la - 128)) & -129) != 0) || ((Int64((_la - 192)) & ~0x3f) == 0 && ((Int64(1) << (_la - 192)) & 1099511627775) != 0))
		 		setState(1861)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1862)
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
		 	setState(1865)
		 	try argumentExpression()
		 	setState(1870)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1866)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1867)
		 		try argumentExpression()


		 		setState(1872)
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
		 	setState(1875)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,246, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1873)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1874)
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
		 	setState(1892)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,247, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1877)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1878)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1879)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1880)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1881)
		 		try expression(0)
		 		setState(1882)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1884)
		 		try messageExpression()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1885)
		 		try selectorExpression()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1886)
		 		try protocolExpression()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1887)
		 		try encodeExpression()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1888)
		 		try dictionaryExpression()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1889)
		 		try arrayExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1890)
		 		try boxExpression()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1891)
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
		 	setState(1912)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,250, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1894)
		 		try match(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1895)
		 		try match(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1896)
		 		try match(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1898)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1897)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1900)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1902)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1901)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1904)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1905)
		 		try match(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1906)
		 		try match(ObjectiveCParser.Tokens.NIL.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1907)
		 		try match(ObjectiveCParser.Tokens.NULL_.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1908)
		 		try match(ObjectiveCParser.Tokens.YES.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1909)
		 		try match(ObjectiveCParser.Tokens.NO.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1910)
		 		try match(ObjectiveCParser.Tokens.TRUE.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1911)
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
		 	setState(1922); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1914)
		 			try match(ObjectiveCParser.Tokens.STRING_START.rawValue)
		 			setState(1918)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue) {
		 				setState(1915)
		 				_la = try _input.LA(1)
		 				if (!(_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue)) {
		 				try _errHandler.recoverInline(self)
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}


		 				setState(1920)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1921)
		 			try match(ObjectiveCParser.Tokens.STRING_END.rawValue)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1924); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,252,_ctx)
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
			func REGISTER() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.REGISTER.rawValue, 0)
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
		 	setState(1926)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0))) {
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
		4,1,231,1929,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
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
		33,643,9,33,1,34,1,34,1,34,3,34,648,8,34,1,35,3,35,651,8,35,1,35,3,35,
		654,8,35,1,35,1,35,3,35,658,8,35,1,35,1,35,3,35,662,8,35,1,35,1,35,3,35,
		666,8,35,1,35,1,35,3,35,670,8,35,1,36,1,36,1,36,1,36,5,36,676,8,36,10,
		36,12,36,679,9,36,3,36,681,8,36,1,36,1,36,1,37,5,37,686,8,37,10,37,12,
		37,689,9,37,1,37,1,37,3,37,693,8,37,1,38,1,38,1,38,1,38,1,38,5,38,700,
		8,38,10,38,12,38,703,9,38,1,38,3,38,706,8,38,3,38,708,8,38,1,38,1,38,1,
		39,1,39,1,39,1,39,1,40,1,40,1,40,1,40,3,40,720,8,40,3,40,722,8,40,1,40,
		1,40,1,41,1,41,1,41,1,41,1,41,1,41,1,41,1,41,3,41,734,8,41,3,41,736,8,
		41,1,42,1,42,1,42,3,42,741,8,42,1,42,1,42,5,42,745,8,42,10,42,12,42,748,
		9,42,3,42,750,8,42,1,42,1,42,1,43,1,43,3,43,756,8,43,1,44,1,44,3,44,760,
		8,44,1,44,3,44,763,8,44,1,44,3,44,766,8,44,1,44,1,44,1,45,1,45,1,45,1,
		45,1,45,1,46,1,46,3,46,777,8,46,1,47,1,47,4,47,781,8,47,11,47,12,47,782,
		3,47,785,8,47,1,48,3,48,788,8,48,1,48,1,48,1,48,1,48,5,48,794,8,48,10,
		48,12,48,797,9,48,1,49,1,49,3,49,801,8,49,1,49,1,49,1,49,1,49,3,49,807,
		8,49,1,50,1,50,1,50,1,50,1,50,1,51,1,51,1,51,3,51,817,8,51,1,51,4,51,820,
		8,51,11,51,12,51,821,3,51,824,8,51,1,52,1,52,1,52,1,52,1,52,1,53,1,53,
		1,53,1,53,1,53,1,54,1,54,1,54,1,55,1,55,1,55,1,55,1,55,1,55,1,55,3,55,
		846,8,55,1,56,1,56,1,56,5,56,851,8,56,10,56,12,56,854,9,56,1,56,1,56,3,
		56,858,8,56,1,57,1,57,1,57,1,57,1,57,1,57,1,58,1,58,1,58,1,58,1,58,1,58,
		1,59,1,59,1,59,1,60,1,60,1,60,1,61,1,61,1,61,1,62,3,62,882,8,62,1,62,1,
		62,1,62,3,62,887,8,62,1,62,1,62,1,62,3,62,892,8,62,1,63,1,63,3,63,896,
		8,63,1,64,1,64,3,64,900,8,64,1,65,1,65,3,65,904,8,65,1,65,1,65,1,66,1,
		66,1,66,5,66,911,8,66,10,66,12,66,914,9,66,1,67,1,67,1,67,1,67,3,67,920,
		8,67,1,68,1,68,1,68,1,68,1,68,3,68,927,8,68,1,69,1,69,1,69,1,69,3,69,933,
		8,69,1,69,3,69,936,8,69,1,69,1,69,1,70,3,70,941,8,70,1,70,1,70,3,70,945,
		8,70,1,70,1,70,1,70,1,70,1,71,3,71,952,8,71,1,71,3,71,955,8,71,1,71,1,
		71,1,71,1,71,3,71,961,8,71,1,72,1,72,3,72,965,8,72,1,73,3,73,968,8,73,
		1,73,1,73,1,73,3,73,973,8,73,1,74,1,74,1,74,5,74,978,8,74,10,74,12,74,
		981,9,74,1,75,1,75,1,75,1,75,1,75,1,75,1,75,1,75,5,75,991,8,75,10,75,12,
		75,994,9,75,1,75,1,75,5,75,998,8,75,10,75,12,75,1001,9,75,1,76,1,76,1,
		76,1,76,1,76,1,76,5,76,1009,8,76,10,76,12,76,1012,9,76,1,76,1,76,1,76,
		1,77,1,77,1,77,5,77,1020,8,77,10,77,12,77,1023,9,77,1,78,1,78,1,78,3,78,
		1028,8,78,1,79,1,79,1,79,3,79,1033,8,79,1,79,1,79,4,79,1037,8,79,11,79,
		12,79,1038,1,79,1,79,3,79,1043,8,79,1,80,1,80,1,80,3,80,1048,8,80,1,80,
		1,80,1,81,1,81,1,81,1,81,1,81,1,81,3,81,1058,8,81,1,82,1,82,1,83,1,83,
		1,84,1,84,1,85,1,85,1,86,1,86,1,86,1,86,3,86,1072,8,86,1,87,1,87,1,88,
		1,88,1,89,1,89,1,89,5,89,1081,8,89,10,89,12,89,1084,9,89,1,89,5,89,1087,
		8,89,10,89,12,89,1090,9,89,1,89,1,89,5,89,1094,8,89,10,89,12,89,1097,9,
		89,1,89,5,89,1100,8,89,10,89,12,89,1103,9,89,1,89,1,89,5,89,1107,8,89,
		10,89,12,89,1110,9,89,1,89,5,89,1113,8,89,10,89,12,89,1116,9,89,1,89,1,
		89,5,89,1120,8,89,10,89,12,89,1123,9,89,1,89,5,89,1126,8,89,10,89,12,89,
		1129,9,89,1,89,1,89,5,89,1133,8,89,10,89,12,89,1136,9,89,1,89,5,89,1139,
		8,89,10,89,12,89,1142,9,89,1,89,1,89,5,89,1146,8,89,10,89,12,89,1149,9,
		89,1,89,5,89,1152,8,89,10,89,12,89,1155,9,89,1,89,1,89,5,89,1159,8,89,
		10,89,12,89,1162,9,89,1,89,1,89,1,89,1,89,1,89,1,89,1,89,1,89,5,89,1172,
		8,89,10,89,12,89,1175,9,89,1,89,1,89,1,89,1,89,5,89,1181,8,89,10,89,12,
		89,1184,9,89,3,89,1186,8,89,1,89,1,89,1,89,1,89,1,89,5,89,1193,8,89,10,
		89,12,89,1196,9,89,5,89,1198,8,89,10,89,12,89,1201,9,89,1,90,1,90,1,90,
		1,90,1,90,1,91,1,91,1,91,5,91,1211,8,91,10,91,12,91,1214,9,91,1,92,1,92,
		3,92,1218,8,92,1,92,1,92,3,92,1222,8,92,1,93,1,93,3,93,1226,8,93,1,93,
		1,93,3,93,1230,8,93,1,93,1,93,1,93,1,93,1,93,3,93,1237,8,93,1,93,1,93,
		1,93,1,93,3,93,1243,8,93,1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,1,94,
		1,94,3,94,1255,8,94,1,95,1,95,1,95,5,95,1260,8,95,10,95,12,95,1263,9,95,
		1,95,3,95,1266,8,95,1,96,1,96,1,96,3,96,1271,8,96,1,97,1,97,3,97,1275,
		8,97,1,98,1,98,1,98,1,98,1,98,3,98,1282,8,98,1,98,5,98,1285,8,98,10,98,
		12,98,1288,9,98,1,98,1,98,1,98,3,98,1293,8,98,1,98,3,98,1296,8,98,1,98,
		1,98,3,98,1300,8,98,1,99,1,99,3,99,1304,8,99,1,99,1,99,1,100,1,100,1,100,
		3,100,1311,8,100,1,101,1,101,1,101,1,101,1,101,5,101,1318,8,101,10,101,
		12,101,1321,9,101,1,101,1,101,3,101,1325,8,101,1,101,1,101,1,101,1,101,
		1,101,3,101,1332,8,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,5,101,
		1341,8,101,10,101,12,101,1344,9,101,1,101,1,101,1,101,1,101,1,101,1,101,
		1,101,5,101,1353,8,101,10,101,12,101,1356,9,101,1,101,1,101,1,101,1,101,
		1,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,1,101,5,101,1371,8,101,
		10,101,12,101,1374,9,101,1,101,1,101,1,101,3,101,1379,8,101,1,102,1,102,
		1,102,1,102,1,102,1,102,5,102,1387,8,102,10,102,12,102,1390,9,102,1,102,
		1,102,3,102,1394,8,102,1,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,
		1,103,1,103,1,103,3,103,1407,8,103,1,104,1,104,1,104,5,104,1412,8,104,
		10,104,12,104,1415,9,104,1,105,1,105,1,105,1,105,1,105,5,105,1422,8,105,
		10,105,12,105,1425,9,105,1,105,1,105,1,106,1,106,1,106,3,106,1432,8,106,
		1,107,1,107,1,107,1,107,1,107,1,108,1,108,1,108,1,108,5,108,1443,8,108,
		10,108,12,108,1446,9,108,3,108,1448,8,108,1,109,1,109,1,109,3,109,1453,
		8,109,3,109,1455,8,109,1,109,1,109,1,110,1,110,1,110,1,110,1,110,1,110,
		5,110,1465,8,110,10,110,12,110,1468,9,110,1,110,3,110,1471,8,110,3,110,
		1473,8,110,1,110,1,110,1,111,1,111,1,111,5,111,1480,8,111,10,111,12,111,
		1483,9,111,1,111,3,111,1486,8,111,1,112,1,112,3,112,1490,8,112,1,112,3,
		112,1493,8,112,1,113,1,113,3,113,1497,8,113,1,113,1,113,4,113,1501,8,113,
		11,113,12,113,1502,1,113,1,113,3,113,1507,8,113,1,113,4,113,1510,8,113,
		11,113,12,113,1511,3,113,1514,8,113,1,114,1,114,3,114,1518,8,114,1,114,
		1,114,1,114,3,114,1523,8,114,1,114,3,114,1526,8,114,1,115,1,115,1,115,
		5,115,1531,8,115,10,115,12,115,1534,9,115,1,116,1,116,1,116,1,116,3,116,
		1540,8,116,1,117,1,117,3,117,1544,8,117,1,117,1,117,3,117,1548,8,117,1,
		117,1,117,3,117,1552,8,117,1,117,1,117,3,117,1556,8,117,1,117,1,117,3,
		117,1560,8,117,1,117,1,117,3,117,1564,8,117,1,117,1,117,3,117,1568,8,117,
		1,117,1,117,3,117,1572,8,117,1,117,1,117,3,117,1576,8,117,1,117,1,117,
		3,117,1580,8,117,1,117,3,117,1583,8,117,1,118,1,118,1,118,1,118,1,119,
		1,119,1,119,3,119,1592,8,119,1,120,1,120,1,120,5,120,1597,8,120,10,120,
		12,120,1600,9,120,1,120,1,120,1,121,1,121,1,121,1,121,1,121,1,121,1,121,
		3,121,1611,8,121,1,121,3,121,1614,8,121,1,122,1,122,1,122,1,122,1,122,
		1,122,1,123,1,123,5,123,1624,8,123,10,123,12,123,1627,9,123,1,123,1,123,
		1,124,4,124,1632,8,124,11,124,12,124,1633,1,124,4,124,1637,8,124,11,124,
		12,124,1638,1,125,1,125,1,125,1,125,1,125,1,125,3,125,1647,8,125,1,125,
		1,125,1,125,1,125,3,125,1653,8,125,1,126,1,126,1,126,1,126,3,126,1659,
		8,126,1,127,1,127,1,127,1,127,1,127,1,127,1,128,1,128,1,128,1,128,1,128,
		1,128,1,128,1,128,1,129,1,129,1,129,3,129,1678,8,129,1,129,1,129,3,129,
		1682,8,129,1,129,1,129,3,129,1686,8,129,1,129,1,129,1,129,1,130,1,130,
		1,130,1,130,3,130,1695,8,130,1,131,1,131,1,131,1,131,1,131,3,131,1702,
		8,131,1,131,1,131,1,131,1,132,1,132,1,132,1,132,1,132,1,132,3,132,1713,
		8,132,3,132,1715,8,132,1,133,1,133,1,133,5,133,1720,8,133,10,133,12,133,
		1723,9,133,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		3,134,1735,8,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		1,134,1,134,3,134,1748,8,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,1,134,
		1,134,1,134,1,134,1,134,1,134,1,134,3,134,1775,8,134,1,134,1,134,5,134,
		1779,8,134,10,134,12,134,1782,9,134,1,135,1,135,1,136,1,136,1,136,1,136,
		1,136,1,136,1,136,3,136,1793,8,136,3,136,1795,8,136,1,137,1,137,1,137,
		3,137,1800,8,137,1,138,1,138,3,138,1804,8,138,1,139,1,139,1,139,1,139,
		1,139,1,139,1,139,3,139,1813,8,139,1,139,1,139,1,139,1,139,1,139,3,139,
		1820,8,139,1,140,1,140,1,141,1,141,1,141,5,141,1827,8,141,10,141,12,141,
		1830,9,141,1,141,1,141,1,141,1,141,5,141,1836,8,141,10,141,12,141,1839,
		9,141,5,141,1841,8,141,10,141,12,141,1844,9,141,1,142,1,142,1,142,1,142,
		1,142,1,142,3,142,1852,8,142,1,142,1,142,1,142,1,142,4,142,1858,8,142,
		11,142,12,142,1859,1,142,1,142,3,142,1864,8,142,1,143,1,143,1,143,5,143,
		1869,8,143,10,143,12,143,1872,9,143,1,144,1,144,3,144,1876,8,144,1,145,
		1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,1,145,
		1,145,1,145,3,145,1893,8,145,1,146,1,146,1,146,1,146,3,146,1899,8,146,
		1,146,1,146,3,146,1903,8,146,1,146,1,146,1,146,1,146,1,146,1,146,1,146,
		1,146,3,146,1913,8,146,1,147,1,147,5,147,1917,8,147,10,147,12,147,1920,
		9,147,1,147,4,147,1923,8,147,11,147,12,147,1924,1,148,1,148,1,148,0,3,
		178,268,282,149,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,
		40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,
		88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,
		126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,160,
		162,164,166,168,170,172,174,176,178,180,182,184,186,188,190,192,194,196,
		198,200,202,204,206,208,210,212,214,216,218,220,222,224,226,228,230,232,
		234,236,238,240,242,244,246,248,250,252,254,256,258,260,262,264,266,268,
		270,272,274,276,278,280,282,284,286,288,290,292,294,296,0,22,2,0,70,70,
		75,75,1,0,90,91,3,0,68,68,71,71,73,74,2,0,27,27,30,30,4,0,85,85,94,94,
		96,96,98,98,1,0,99,102,4,0,1,1,12,12,20,20,26,26,4,0,17,17,86,89,93,93,
		103,103,3,0,42,43,46,47,51,52,3,0,19,19,23,24,31,31,1,0,104,107,2,0,163,
		164,168,168,1,0,161,162,2,0,147,148,154,155,2,0,153,153,156,156,2,0,146,
		146,169,178,1,0,159,160,3,0,149,150,161,163,165,165,1,0,142,143,1,0,135,
		135,2,0,192,192,194,194,11,0,20,20,40,47,51,56,81,83,85,86,88,93,97,97,
		99,104,107,108,114,126,133,133,2147,0,301,1,0,0,0,2,318,1,0,0,0,4,320,
		1,0,0,0,6,325,1,0,0,0,8,347,1,0,0,0,10,368,1,0,0,0,12,382,1,0,0,0,14,392,
		1,0,0,0,16,401,1,0,0,0,18,431,1,0,0,0,20,433,1,0,0,0,22,437,1,0,0,0,24,
		448,1,0,0,0,26,456,1,0,0,0,28,471,1,0,0,0,30,499,1,0,0,0,32,509,1,0,0,
		0,34,511,1,0,0,0,36,532,1,0,0,0,38,534,1,0,0,0,40,542,1,0,0,0,42,546,1,
		0,0,0,44,549,1,0,0,0,46,553,1,0,0,0,48,569,1,0,0,0,50,573,1,0,0,0,52,576,
		1,0,0,0,54,580,1,0,0,0,56,601,1,0,0,0,58,604,1,0,0,0,60,620,1,0,0,0,62,
		622,1,0,0,0,64,634,1,0,0,0,66,636,1,0,0,0,68,644,1,0,0,0,70,650,1,0,0,
		0,72,671,1,0,0,0,74,692,1,0,0,0,76,694,1,0,0,0,78,711,1,0,0,0,80,715,1,
		0,0,0,82,735,1,0,0,0,84,737,1,0,0,0,86,755,1,0,0,0,88,757,1,0,0,0,90,769,
		1,0,0,0,92,776,1,0,0,0,94,784,1,0,0,0,96,787,1,0,0,0,98,798,1,0,0,0,100,
		808,1,0,0,0,102,823,1,0,0,0,104,825,1,0,0,0,106,830,1,0,0,0,108,835,1,
		0,0,0,110,845,1,0,0,0,112,847,1,0,0,0,114,859,1,0,0,0,116,865,1,0,0,0,
		118,871,1,0,0,0,120,874,1,0,0,0,122,877,1,0,0,0,124,881,1,0,0,0,126,893,
		1,0,0,0,128,899,1,0,0,0,130,901,1,0,0,0,132,907,1,0,0,0,134,919,1,0,0,
		0,136,921,1,0,0,0,138,932,1,0,0,0,140,940,1,0,0,0,142,951,1,0,0,0,144,
		962,1,0,0,0,146,967,1,0,0,0,148,974,1,0,0,0,150,992,1,0,0,0,152,1002,1,
		0,0,0,154,1016,1,0,0,0,156,1024,1,0,0,0,158,1029,1,0,0,0,160,1044,1,0,
		0,0,162,1057,1,0,0,0,164,1059,1,0,0,0,166,1061,1,0,0,0,168,1063,1,0,0,
		0,170,1065,1,0,0,0,172,1071,1,0,0,0,174,1073,1,0,0,0,176,1075,1,0,0,0,
		178,1185,1,0,0,0,180,1202,1,0,0,0,182,1207,1,0,0,0,184,1221,1,0,0,0,186,
		1223,1,0,0,0,188,1244,1,0,0,0,190,1256,1,0,0,0,192,1267,1,0,0,0,194,1274,
		1,0,0,0,196,1299,1,0,0,0,198,1301,1,0,0,0,200,1307,1,0,0,0,202,1378,1,
		0,0,0,204,1393,1,0,0,0,206,1406,1,0,0,0,208,1408,1,0,0,0,210,1416,1,0,
		0,0,212,1431,1,0,0,0,214,1433,1,0,0,0,216,1447,1,0,0,0,218,1449,1,0,0,
		0,220,1458,1,0,0,0,222,1476,1,0,0,0,224,1492,1,0,0,0,226,1513,1,0,0,0,
		228,1525,1,0,0,0,230,1527,1,0,0,0,232,1539,1,0,0,0,234,1582,1,0,0,0,236,
		1584,1,0,0,0,238,1588,1,0,0,0,240,1593,1,0,0,0,242,1613,1,0,0,0,244,1615,
		1,0,0,0,246,1621,1,0,0,0,248,1631,1,0,0,0,250,1652,1,0,0,0,252,1658,1,
		0,0,0,254,1660,1,0,0,0,256,1666,1,0,0,0,258,1674,1,0,0,0,260,1694,1,0,
		0,0,262,1696,1,0,0,0,264,1714,1,0,0,0,266,1716,1,0,0,0,268,1734,1,0,0,
		0,270,1783,1,0,0,0,272,1794,1,0,0,0,274,1799,1,0,0,0,276,1803,1,0,0,0,
		278,1819,1,0,0,0,280,1821,1,0,0,0,282,1823,1,0,0,0,284,1863,1,0,0,0,286,
		1865,1,0,0,0,288,1875,1,0,0,0,290,1892,1,0,0,0,292,1912,1,0,0,0,294,1922,
		1,0,0,0,296,1926,1,0,0,0,298,300,3,2,1,0,299,298,1,0,0,0,300,303,1,0,0,
		0,301,299,1,0,0,0,301,302,1,0,0,0,302,304,1,0,0,0,303,301,1,0,0,0,304,
		305,5,0,0,1,305,1,1,0,0,0,306,319,3,4,2,0,307,319,3,120,60,0,308,319,3,
		138,69,0,309,319,3,6,3,0,310,319,3,10,5,0,311,319,3,8,4,0,312,319,3,12,
		6,0,313,319,3,16,8,0,314,319,3,20,10,0,315,319,3,22,11,0,316,319,3,122,
		61,0,317,319,5,140,0,0,318,306,1,0,0,0,318,307,1,0,0,0,318,308,1,0,0,0,
		318,309,1,0,0,0,318,310,1,0,0,0,318,311,1,0,0,0,318,312,1,0,0,0,318,313,
		1,0,0,0,318,314,1,0,0,0,318,315,1,0,0,0,318,316,1,0,0,0,318,317,1,0,0,
		0,319,3,1,0,0,0,320,321,5,67,0,0,321,322,3,296,148,0,322,323,5,140,0,0,
		323,5,1,0,0,0,324,326,5,126,0,0,325,324,1,0,0,0,325,326,1,0,0,0,326,327,
		1,0,0,0,327,328,5,66,0,0,328,331,3,14,7,0,329,330,5,152,0,0,330,332,3,
		296,148,0,331,329,1,0,0,0,331,332,1,0,0,0,332,337,1,0,0,0,333,334,5,148,
		0,0,334,335,3,24,12,0,335,336,5,147,0,0,336,338,1,0,0,0,337,333,1,0,0,
		0,337,338,1,0,0,0,338,340,1,0,0,0,339,341,3,34,17,0,340,339,1,0,0,0,340,
		341,1,0,0,0,341,343,1,0,0,0,342,344,3,40,20,0,343,342,1,0,0,0,343,344,
		1,0,0,0,344,345,1,0,0,0,345,346,5,63,0,0,346,7,1,0,0,0,347,348,5,66,0,
		0,348,349,3,14,7,0,349,351,5,134,0,0,350,352,3,296,148,0,351,350,1,0,0,
		0,351,352,1,0,0,0,352,353,1,0,0,0,353,358,5,135,0,0,354,355,5,148,0,0,
		355,356,3,24,12,0,356,357,5,147,0,0,357,359,1,0,0,0,358,354,1,0,0,0,358,
		359,1,0,0,0,359,361,1,0,0,0,360,362,3,34,17,0,361,360,1,0,0,0,361,362,
		1,0,0,0,362,364,1,0,0,0,363,365,3,40,20,0,364,363,1,0,0,0,364,365,1,0,
		0,0,365,366,1,0,0,0,366,367,5,63,0,0,367,9,1,0,0,0,368,369,5,65,0,0,369,
		372,3,14,7,0,370,371,5,152,0,0,371,373,3,296,148,0,372,370,1,0,0,0,372,
		373,1,0,0,0,373,375,1,0,0,0,374,376,3,34,17,0,375,374,1,0,0,0,375,376,
		1,0,0,0,376,378,1,0,0,0,377,379,3,48,24,0,378,377,1,0,0,0,378,379,1,0,
		0,0,379,380,1,0,0,0,380,381,5,63,0,0,381,11,1,0,0,0,382,383,5,65,0,0,383,
		384,3,14,7,0,384,385,5,134,0,0,385,386,3,296,148,0,386,388,5,135,0,0,387,
		389,3,48,24,0,388,387,1,0,0,0,388,389,1,0,0,0,389,390,1,0,0,0,390,391,
		5,63,0,0,391,13,1,0,0,0,392,398,3,296,148,0,393,394,5,148,0,0,394,395,
		3,24,12,0,395,396,5,147,0,0,396,399,1,0,0,0,397,399,3,72,36,0,398,393,
		1,0,0,0,398,397,1,0,0,0,398,399,1,0,0,0,399,15,1,0,0,0,400,402,3,202,101,
		0,401,400,1,0,0,0,401,402,1,0,0,0,402,403,1,0,0,0,403,404,5,69,0,0,404,
		409,3,32,16,0,405,406,5,148,0,0,406,407,3,24,12,0,407,408,5,147,0,0,408,
		410,1,0,0,0,409,405,1,0,0,0,409,410,1,0,0,0,410,414,1,0,0,0,411,413,3,
		18,9,0,412,411,1,0,0,0,413,416,1,0,0,0,414,412,1,0,0,0,414,415,1,0,0,0,
		415,417,1,0,0,0,416,414,1,0,0,0,417,418,5,63,0,0,418,17,1,0,0,0,419,423,
		7,0,0,0,420,422,3,40,20,0,421,420,1,0,0,0,422,425,1,0,0,0,423,421,1,0,
		0,0,423,424,1,0,0,0,424,432,1,0,0,0,425,423,1,0,0,0,426,428,3,40,20,0,
		427,426,1,0,0,0,428,429,1,0,0,0,429,427,1,0,0,0,429,430,1,0,0,0,430,432,
		1,0,0,0,431,419,1,0,0,0,431,427,1,0,0,0,432,19,1,0,0,0,433,434,5,69,0,
		0,434,435,3,24,12,0,435,436,5,140,0,0,436,21,1,0,0,0,437,438,5,60,0,0,
		438,443,3,14,7,0,439,440,5,141,0,0,440,442,3,14,7,0,441,439,1,0,0,0,442,
		445,1,0,0,0,443,441,1,0,0,0,443,444,1,0,0,0,444,446,1,0,0,0,445,443,1,
		0,0,0,446,447,5,140,0,0,447,23,1,0,0,0,448,453,3,32,16,0,449,450,5,141,
		0,0,450,452,3,32,16,0,451,449,1,0,0,0,452,455,1,0,0,0,453,451,1,0,0,0,
		453,454,1,0,0,0,454,25,1,0,0,0,455,453,1,0,0,0,456,461,5,72,0,0,457,458,
		5,134,0,0,458,459,3,28,14,0,459,460,5,135,0,0,460,462,1,0,0,0,461,457,
		1,0,0,0,461,462,1,0,0,0,462,464,1,0,0,0,463,465,3,162,81,0,464,463,1,0,
		0,0,464,465,1,0,0,0,465,467,1,0,0,0,466,468,5,125,0,0,467,466,1,0,0,0,
		467,468,1,0,0,0,468,469,1,0,0,0,469,470,3,160,80,0,470,27,1,0,0,0,471,
		476,3,30,15,0,472,473,5,141,0,0,473,475,3,30,15,0,474,472,1,0,0,0,475,
		478,1,0,0,0,476,474,1,0,0,0,476,477,1,0,0,0,477,29,1,0,0,0,478,476,1,0,
		0,0,479,500,5,81,0,0,480,500,5,82,0,0,481,500,5,118,0,0,482,500,5,121,
		0,0,483,500,5,83,0,0,484,500,5,114,0,0,485,500,5,122,0,0,486,500,5,115,
		0,0,487,500,5,119,0,0,488,500,5,120,0,0,489,490,5,116,0,0,490,491,5,146,
		0,0,491,500,3,296,148,0,492,493,5,117,0,0,493,494,5,146,0,0,494,495,3,
		296,148,0,495,496,5,152,0,0,496,500,1,0,0,0,497,500,3,166,83,0,498,500,
		3,296,148,0,499,479,1,0,0,0,499,480,1,0,0,0,499,481,1,0,0,0,499,482,1,
		0,0,0,499,483,1,0,0,0,499,484,1,0,0,0,499,485,1,0,0,0,499,486,1,0,0,0,
		499,487,1,0,0,0,499,488,1,0,0,0,499,489,1,0,0,0,499,492,1,0,0,0,499,497,
		1,0,0,0,499,498,1,0,0,0,500,31,1,0,0,0,501,502,5,148,0,0,502,503,3,24,
		12,0,503,504,5,147,0,0,504,510,1,0,0,0,505,507,7,1,0,0,506,505,1,0,0,0,
		506,507,1,0,0,0,507,508,1,0,0,0,508,510,3,296,148,0,509,501,1,0,0,0,509,
		506,1,0,0,0,510,33,1,0,0,0,511,515,5,136,0,0,512,514,3,36,18,0,513,512,
		1,0,0,0,514,517,1,0,0,0,515,513,1,0,0,0,515,516,1,0,0,0,516,518,1,0,0,
		0,517,515,1,0,0,0,518,519,5,137,0,0,519,35,1,0,0,0,520,524,3,38,19,0,521,
		523,3,160,80,0,522,521,1,0,0,0,523,526,1,0,0,0,524,522,1,0,0,0,524,525,
		1,0,0,0,525,533,1,0,0,0,526,524,1,0,0,0,527,529,3,160,80,0,528,527,1,0,
		0,0,529,530,1,0,0,0,530,528,1,0,0,0,530,531,1,0,0,0,531,533,1,0,0,0,532,
		520,1,0,0,0,532,528,1,0,0,0,533,37,1,0,0,0,534,535,7,2,0,0,535,39,1,0,
		0,0,536,543,3,138,69,0,537,543,3,42,21,0,538,543,3,44,22,0,539,543,3,26,
		13,0,540,543,3,120,60,0,541,543,5,140,0,0,542,536,1,0,0,0,542,537,1,0,
		0,0,542,538,1,0,0,0,542,539,1,0,0,0,542,540,1,0,0,0,542,541,1,0,0,0,543,
		544,1,0,0,0,544,542,1,0,0,0,544,545,1,0,0,0,545,41,1,0,0,0,546,547,5,161,
		0,0,547,548,3,46,23,0,548,43,1,0,0,0,549,550,5,162,0,0,550,551,3,46,23,
		0,551,45,1,0,0,0,552,554,3,62,31,0,553,552,1,0,0,0,553,554,1,0,0,0,554,
		555,1,0,0,0,555,559,3,56,28,0,556,558,3,202,101,0,557,556,1,0,0,0,558,
		561,1,0,0,0,559,557,1,0,0,0,559,560,1,0,0,0,560,562,1,0,0,0,561,559,1,
		0,0,0,562,563,5,140,0,0,563,47,1,0,0,0,564,570,3,122,61,0,565,570,3,138,
		69,0,566,570,3,50,25,0,567,570,3,52,26,0,568,570,3,64,32,0,569,564,1,0,
		0,0,569,565,1,0,0,0,569,566,1,0,0,0,569,567,1,0,0,0,569,568,1,0,0,0,570,
		571,1,0,0,0,571,569,1,0,0,0,571,572,1,0,0,0,572,49,1,0,0,0,573,574,5,161,
		0,0,574,575,3,54,27,0,575,51,1,0,0,0,576,577,5,162,0,0,577,578,3,54,27,
		0,578,53,1,0,0,0,579,581,3,62,31,0,580,579,1,0,0,0,580,581,1,0,0,0,581,
		582,1,0,0,0,582,584,3,56,28,0,583,585,3,154,77,0,584,583,1,0,0,0,584,585,
		1,0,0,0,585,587,1,0,0,0,586,588,5,140,0,0,587,586,1,0,0,0,587,588,1,0,
		0,0,588,589,1,0,0,0,589,590,3,240,120,0,590,55,1,0,0,0,591,602,3,60,30,
		0,592,594,3,58,29,0,593,592,1,0,0,0,594,595,1,0,0,0,595,593,1,0,0,0,595,
		596,1,0,0,0,596,599,1,0,0,0,597,598,5,141,0,0,598,600,5,179,0,0,599,597,
		1,0,0,0,599,600,1,0,0,0,600,602,1,0,0,0,601,591,1,0,0,0,601,593,1,0,0,
		0,602,57,1,0,0,0,603,605,3,60,30,0,604,603,1,0,0,0,604,605,1,0,0,0,605,
		606,1,0,0,0,606,610,5,152,0,0,607,609,3,62,31,0,608,607,1,0,0,0,609,612,
		1,0,0,0,610,608,1,0,0,0,610,611,1,0,0,0,611,614,1,0,0,0,612,610,1,0,0,
		0,613,615,3,164,82,0,614,613,1,0,0,0,614,615,1,0,0,0,615,616,1,0,0,0,616,
		617,3,296,148,0,617,59,1,0,0,0,618,621,3,296,148,0,619,621,5,22,0,0,620,
		618,1,0,0,0,620,619,1,0,0,0,621,61,1,0,0,0,622,623,5,134,0,0,623,624,3,
		224,112,0,624,625,5,135,0,0,625,63,1,0,0,0,626,627,5,78,0,0,627,628,3,
		66,33,0,628,629,5,140,0,0,629,635,1,0,0,0,630,631,5,61,0,0,631,632,3,66,
		33,0,632,633,5,140,0,0,633,635,1,0,0,0,634,626,1,0,0,0,634,630,1,0,0,0,
		635,65,1,0,0,0,636,641,3,68,34,0,637,638,5,141,0,0,638,640,3,68,34,0,639,
		637,1,0,0,0,640,643,1,0,0,0,641,639,1,0,0,0,641,642,1,0,0,0,642,67,1,0,
		0,0,643,641,1,0,0,0,644,647,3,296,148,0,645,646,5,146,0,0,646,648,3,296,
		148,0,647,645,1,0,0,0,647,648,1,0,0,0,648,69,1,0,0,0,649,651,5,109,0,0,
		650,649,1,0,0,0,650,651,1,0,0,0,651,653,1,0,0,0,652,654,3,166,83,0,653,
		652,1,0,0,0,653,654,1,0,0,0,654,655,1,0,0,0,655,657,3,178,89,0,656,658,
		3,166,83,0,657,656,1,0,0,0,657,658,1,0,0,0,658,659,1,0,0,0,659,661,5,134,
		0,0,660,662,5,109,0,0,661,660,1,0,0,0,661,662,1,0,0,0,662,663,1,0,0,0,
		663,665,5,167,0,0,664,666,3,166,83,0,665,664,1,0,0,0,665,666,1,0,0,0,666,
		667,1,0,0,0,667,669,5,135,0,0,668,670,3,84,42,0,669,668,1,0,0,0,669,670,
		1,0,0,0,670,71,1,0,0,0,671,680,5,148,0,0,672,677,3,74,37,0,673,674,5,141,
		0,0,674,676,3,74,37,0,675,673,1,0,0,0,676,679,1,0,0,0,677,675,1,0,0,0,
		677,678,1,0,0,0,678,681,1,0,0,0,679,677,1,0,0,0,680,672,1,0,0,0,680,681,
		1,0,0,0,681,682,1,0,0,0,682,683,5,147,0,0,683,73,1,0,0,0,684,686,3,170,
		85,0,685,684,1,0,0,0,686,689,1,0,0,0,687,685,1,0,0,0,687,688,1,0,0,0,688,
		690,1,0,0,0,689,687,1,0,0,0,690,693,3,178,89,0,691,693,3,224,112,0,692,
		687,1,0,0,0,692,691,1,0,0,0,693,75,1,0,0,0,694,695,5,144,0,0,695,707,5,
		136,0,0,696,701,3,78,39,0,697,698,5,141,0,0,698,700,3,78,39,0,699,697,
		1,0,0,0,700,703,1,0,0,0,701,699,1,0,0,0,701,702,1,0,0,0,702,705,1,0,0,
		0,703,701,1,0,0,0,704,706,5,141,0,0,705,704,1,0,0,0,705,706,1,0,0,0,706,
		708,1,0,0,0,707,696,1,0,0,0,707,708,1,0,0,0,708,709,1,0,0,0,709,710,5,
		137,0,0,710,77,1,0,0,0,711,712,3,272,136,0,712,713,5,152,0,0,713,714,3,
		268,134,0,714,79,1,0,0,0,715,716,5,144,0,0,716,721,5,138,0,0,717,719,3,
		266,133,0,718,720,5,141,0,0,719,718,1,0,0,0,719,720,1,0,0,0,720,722,1,
		0,0,0,721,717,1,0,0,0,721,722,1,0,0,0,722,723,1,0,0,0,723,724,5,139,0,
		0,724,81,1,0,0,0,725,726,5,144,0,0,726,727,5,134,0,0,727,728,3,268,134,
		0,728,729,5,135,0,0,729,736,1,0,0,0,730,733,5,144,0,0,731,734,3,292,146,
		0,732,734,3,296,148,0,733,731,1,0,0,0,733,732,1,0,0,0,734,736,1,0,0,0,
		735,725,1,0,0,0,735,730,1,0,0,0,736,83,1,0,0,0,737,749,5,134,0,0,738,741,
		3,86,43,0,739,741,5,32,0,0,740,738,1,0,0,0,740,739,1,0,0,0,741,746,1,0,
		0,0,742,743,5,141,0,0,743,745,3,86,43,0,744,742,1,0,0,0,745,748,1,0,0,
		0,746,744,1,0,0,0,746,747,1,0,0,0,747,750,1,0,0,0,748,746,1,0,0,0,749,
		740,1,0,0,0,749,750,1,0,0,0,750,751,1,0,0,0,751,752,5,135,0,0,752,85,1,
		0,0,0,753,756,3,108,54,0,754,756,3,224,112,0,755,753,1,0,0,0,755,754,1,
		0,0,0,756,87,1,0,0,0,757,759,5,167,0,0,758,760,3,178,89,0,759,758,1,0,
		0,0,759,760,1,0,0,0,760,762,1,0,0,0,761,763,3,166,83,0,762,761,1,0,0,0,
		762,763,1,0,0,0,763,765,1,0,0,0,764,766,3,84,42,0,765,764,1,0,0,0,765,
		766,1,0,0,0,766,767,1,0,0,0,767,768,3,240,120,0,768,89,1,0,0,0,769,770,
		5,138,0,0,770,771,3,92,46,0,771,772,3,94,47,0,772,773,5,139,0,0,773,91,
		1,0,0,0,774,777,3,268,134,0,775,777,3,178,89,0,776,774,1,0,0,0,776,775,
		1,0,0,0,777,93,1,0,0,0,778,785,3,60,30,0,779,781,3,96,48,0,780,779,1,0,
		0,0,781,782,1,0,0,0,782,780,1,0,0,0,782,783,1,0,0,0,783,785,1,0,0,0,784,
		778,1,0,0,0,784,780,1,0,0,0,785,95,1,0,0,0,786,788,3,60,30,0,787,786,1,
		0,0,0,787,788,1,0,0,0,788,789,1,0,0,0,789,790,5,152,0,0,790,795,3,98,49,
		0,791,792,5,141,0,0,792,794,3,98,49,0,793,791,1,0,0,0,794,797,1,0,0,0,
		795,793,1,0,0,0,795,796,1,0,0,0,796,97,1,0,0,0,797,795,1,0,0,0,798,800,
		3,266,133,0,799,801,3,166,83,0,800,799,1,0,0,0,800,801,1,0,0,0,801,806,
		1,0,0,0,802,803,5,136,0,0,803,804,3,222,111,0,804,805,5,137,0,0,805,807,
		1,0,0,0,806,802,1,0,0,0,806,807,1,0,0,0,807,99,1,0,0,0,808,809,5,76,0,
		0,809,810,5,134,0,0,810,811,3,102,51,0,811,812,5,135,0,0,812,101,1,0,0,
		0,813,824,3,60,30,0,814,824,5,145,0,0,815,817,3,60,30,0,816,815,1,0,0,
		0,816,817,1,0,0,0,817,818,1,0,0,0,818,820,5,152,0,0,819,816,1,0,0,0,820,
		821,1,0,0,0,821,819,1,0,0,0,821,822,1,0,0,0,822,824,1,0,0,0,823,813,1,
		0,0,0,823,814,1,0,0,0,823,819,1,0,0,0,824,103,1,0,0,0,825,826,5,69,0,0,
		826,827,5,134,0,0,827,828,3,32,16,0,828,829,5,135,0,0,829,105,1,0,0,0,
		830,831,5,62,0,0,831,832,5,134,0,0,832,833,3,224,112,0,833,834,5,135,0,
		0,834,107,1,0,0,0,835,836,3,150,75,0,836,837,3,196,98,0,837,109,1,0,0,
		0,838,839,5,79,0,0,839,840,5,134,0,0,840,841,3,296,148,0,841,842,5,135,
		0,0,842,846,1,0,0,0,843,844,5,79,0,0,844,846,3,268,134,0,845,838,1,0,0,
		0,845,843,1,0,0,0,846,111,1,0,0,0,847,848,5,80,0,0,848,852,3,240,120,0,
		849,851,3,114,57,0,850,849,1,0,0,0,851,854,1,0,0,0,852,850,1,0,0,0,852,
		853,1,0,0,0,853,857,1,0,0,0,854,852,1,0,0,0,855,856,5,64,0,0,856,858,3,
		240,120,0,857,855,1,0,0,0,857,858,1,0,0,0,858,113,1,0,0,0,859,860,5,59,
		0,0,860,861,5,134,0,0,861,862,3,108,54,0,862,863,5,135,0,0,863,864,3,240,
		120,0,864,115,1,0,0,0,865,866,5,77,0,0,866,867,5,134,0,0,867,868,3,268,
		134,0,868,869,5,135,0,0,869,870,3,240,120,0,870,117,1,0,0,0,871,872,5,
		58,0,0,872,873,3,240,120,0,873,119,1,0,0,0,874,875,3,124,62,0,875,876,
		5,140,0,0,876,121,1,0,0,0,877,878,3,124,62,0,878,879,3,240,120,0,879,123,
		1,0,0,0,880,882,3,150,75,0,881,880,1,0,0,0,881,882,1,0,0,0,882,883,1,0,
		0,0,883,884,3,296,148,0,884,886,5,134,0,0,885,887,3,200,100,0,886,885,
		1,0,0,0,886,887,1,0,0,0,887,888,1,0,0,0,888,889,5,135,0,0,889,891,1,0,
		0,0,890,892,3,152,76,0,891,890,1,0,0,0,891,892,1,0,0,0,892,125,1,0,0,0,
		893,895,3,128,64,0,894,896,3,130,65,0,895,894,1,0,0,0,895,896,1,0,0,0,
		896,127,1,0,0,0,897,900,5,5,0,0,898,900,3,296,148,0,899,897,1,0,0,0,899,
		898,1,0,0,0,900,129,1,0,0,0,901,903,5,134,0,0,902,904,3,132,66,0,903,902,
		1,0,0,0,903,904,1,0,0,0,904,905,1,0,0,0,905,906,5,135,0,0,906,131,1,0,
		0,0,907,912,3,134,67,0,908,909,5,141,0,0,909,911,3,134,67,0,910,908,1,
		0,0,0,911,914,1,0,0,0,912,910,1,0,0,0,912,913,1,0,0,0,913,133,1,0,0,0,
		914,912,1,0,0,0,915,920,3,126,63,0,916,920,3,292,146,0,917,920,3,294,147,
		0,918,920,3,136,68,0,919,915,1,0,0,0,919,916,1,0,0,0,919,917,1,0,0,0,919,
		918,1,0,0,0,920,135,1,0,0,0,921,922,3,128,64,0,922,926,5,146,0,0,923,927,
		3,292,146,0,924,927,3,128,64,0,925,927,3,294,147,0,926,923,1,0,0,0,926,
		924,1,0,0,0,926,925,1,0,0,0,927,137,1,0,0,0,928,933,3,140,70,0,929,933,
		3,142,71,0,930,933,3,144,72,0,931,933,3,146,73,0,932,928,1,0,0,0,932,929,
		1,0,0,0,932,930,1,0,0,0,932,931,1,0,0,0,933,935,1,0,0,0,934,936,3,202,
		101,0,935,934,1,0,0,0,935,936,1,0,0,0,936,937,1,0,0,0,937,938,5,140,0,
		0,938,139,1,0,0,0,939,941,3,152,76,0,940,939,1,0,0,0,940,941,1,0,0,0,941,
		942,1,0,0,0,942,944,3,296,148,0,943,945,3,152,76,0,944,943,1,0,0,0,944,
		945,1,0,0,0,945,946,1,0,0,0,946,947,5,134,0,0,947,948,3,196,98,0,948,949,
		5,135,0,0,949,141,1,0,0,0,950,952,3,152,76,0,951,950,1,0,0,0,951,952,1,
		0,0,0,952,954,1,0,0,0,953,955,5,29,0,0,954,953,1,0,0,0,954,955,1,0,0,0,
		955,960,1,0,0,0,956,957,3,186,93,0,957,958,3,296,148,0,958,961,1,0,0,0,
		959,961,3,188,94,0,960,956,1,0,0,0,960,959,1,0,0,0,961,143,1,0,0,0,962,
		964,3,150,75,0,963,965,3,154,77,0,964,963,1,0,0,0,964,965,1,0,0,0,965,
		145,1,0,0,0,966,968,3,152,76,0,967,966,1,0,0,0,967,968,1,0,0,0,968,969,
		1,0,0,0,969,970,5,29,0,0,970,972,3,150,75,0,971,973,3,148,74,0,972,971,
		1,0,0,0,972,973,1,0,0,0,973,147,1,0,0,0,974,979,3,196,98,0,975,976,5,141,
		0,0,976,978,3,196,98,0,977,975,1,0,0,0,978,981,1,0,0,0,979,977,1,0,0,0,
		979,980,1,0,0,0,980,149,1,0,0,0,981,979,1,0,0,0,982,991,3,168,84,0,983,
		991,3,152,76,0,984,991,3,164,82,0,985,991,3,166,83,0,986,991,3,162,81,
		0,987,991,5,109,0,0,988,991,3,170,85,0,989,991,3,172,86,0,990,982,1,0,
		0,0,990,983,1,0,0,0,990,984,1,0,0,0,990,985,1,0,0,0,990,986,1,0,0,0,990,
		987,1,0,0,0,990,988,1,0,0,0,990,989,1,0,0,0,991,994,1,0,0,0,992,990,1,
		0,0,0,992,993,1,0,0,0,993,995,1,0,0,0,994,992,1,0,0,0,995,999,3,178,89,
		0,996,998,3,152,76,0,997,996,1,0,0,0,998,1001,1,0,0,0,999,997,1,0,0,0,
		999,1000,1,0,0,0,1000,151,1,0,0,0,1001,999,1,0,0,0,1002,1003,5,84,0,0,
		1003,1004,5,134,0,0,1004,1005,5,134,0,0,1005,1010,3,126,63,0,1006,1007,
		5,141,0,0,1007,1009,3,126,63,0,1008,1006,1,0,0,0,1009,1012,1,0,0,0,1010,
		1008,1,0,0,0,1010,1011,1,0,0,0,1011,1013,1,0,0,0,1012,1010,1,0,0,0,1013,
		1014,5,135,0,0,1014,1015,5,135,0,0,1015,153,1,0,0,0,1016,1021,3,156,78,
		0,1017,1018,5,141,0,0,1018,1020,3,156,78,0,1019,1017,1,0,0,0,1020,1023,
		1,0,0,0,1021,1019,1,0,0,0,1021,1022,1,0,0,0,1022,155,1,0,0,0,1023,1021,
		1,0,0,0,1024,1027,3,196,98,0,1025,1026,5,146,0,0,1026,1028,3,274,137,0,
		1027,1025,1,0,0,0,1027,1028,1,0,0,0,1028,157,1,0,0,0,1029,1042,7,3,0,0,
		1030,1043,3,296,148,0,1031,1033,3,296,148,0,1032,1031,1,0,0,0,1032,1033,
		1,0,0,0,1033,1034,1,0,0,0,1034,1036,5,136,0,0,1035,1037,3,160,80,0,1036,
		1035,1,0,0,0,1037,1038,1,0,0,0,1038,1036,1,0,0,0,1038,1039,1,0,0,0,1039,
		1040,1,0,0,0,1040,1041,5,137,0,0,1041,1043,1,0,0,0,1042,1030,1,0,0,0,1042,
		1032,1,0,0,0,1043,159,1,0,0,0,1044,1045,3,150,75,0,1045,1047,3,182,91,
		0,1046,1048,3,202,101,0,1047,1046,1,0,0,0,1047,1048,1,0,0,0,1048,1049,
		1,0,0,0,1049,1050,5,140,0,0,1050,161,1,0,0,0,1051,1052,5,124,0,0,1052,
		1053,5,134,0,0,1053,1054,3,296,148,0,1054,1055,5,135,0,0,1055,1058,1,0,
		0,0,1056,1058,5,123,0,0,1057,1051,1,0,0,0,1057,1056,1,0,0,0,1058,163,1,
		0,0,0,1059,1060,7,4,0,0,1060,165,1,0,0,0,1061,1062,7,5,0,0,1062,167,1,
		0,0,0,1063,1064,7,6,0,0,1064,169,1,0,0,0,1065,1066,7,7,0,0,1066,171,1,
		0,0,0,1067,1072,5,5,0,0,1068,1072,5,33,0,0,1069,1072,5,21,0,0,1070,1072,
		3,174,87,0,1071,1067,1,0,0,0,1071,1068,1,0,0,0,1071,1069,1,0,0,0,1071,
		1070,1,0,0,0,1072,173,1,0,0,0,1073,1074,7,8,0,0,1074,175,1,0,0,0,1075,
		1076,7,9,0,0,1076,177,1,0,0,0,1077,1078,6,89,-1,0,1078,1082,5,32,0,0,1079,
		1081,3,172,86,0,1080,1079,1,0,0,0,1081,1084,1,0,0,0,1082,1080,1,0,0,0,
		1082,1083,1,0,0,0,1083,1186,1,0,0,0,1084,1082,1,0,0,0,1085,1087,3,176,
		88,0,1086,1085,1,0,0,0,1087,1090,1,0,0,0,1088,1086,1,0,0,0,1088,1089,1,
		0,0,0,1089,1091,1,0,0,0,1090,1088,1,0,0,0,1091,1095,5,4,0,0,1092,1094,
		3,172,86,0,1093,1092,1,0,0,0,1094,1097,1,0,0,0,1095,1093,1,0,0,0,1095,
		1096,1,0,0,0,1096,1186,1,0,0,0,1097,1095,1,0,0,0,1098,1100,3,176,88,0,
		1099,1098,1,0,0,0,1100,1103,1,0,0,0,1101,1099,1,0,0,0,1101,1102,1,0,0,
		0,1102,1104,1,0,0,0,1103,1101,1,0,0,0,1104,1108,5,23,0,0,1105,1107,3,172,
		86,0,1106,1105,1,0,0,0,1107,1110,1,0,0,0,1108,1106,1,0,0,0,1108,1109,1,
		0,0,0,1109,1186,1,0,0,0,1110,1108,1,0,0,0,1111,1113,3,176,88,0,1112,1111,
		1,0,0,0,1113,1116,1,0,0,0,1114,1112,1,0,0,0,1114,1115,1,0,0,0,1115,1117,
		1,0,0,0,1116,1114,1,0,0,0,1117,1121,5,18,0,0,1118,1120,3,172,86,0,1119,
		1118,1,0,0,0,1120,1123,1,0,0,0,1121,1119,1,0,0,0,1121,1122,1,0,0,0,1122,
		1186,1,0,0,0,1123,1121,1,0,0,0,1124,1126,3,176,88,0,1125,1124,1,0,0,0,
		1126,1129,1,0,0,0,1127,1125,1,0,0,0,1127,1128,1,0,0,0,1128,1130,1,0,0,
		0,1129,1127,1,0,0,0,1130,1134,5,19,0,0,1131,1133,3,172,86,0,1132,1131,
		1,0,0,0,1133,1136,1,0,0,0,1134,1132,1,0,0,0,1134,1135,1,0,0,0,1135,1186,
		1,0,0,0,1136,1134,1,0,0,0,1137,1139,3,176,88,0,1138,1137,1,0,0,0,1139,
		1142,1,0,0,0,1140,1138,1,0,0,0,1140,1141,1,0,0,0,1141,1143,1,0,0,0,1142,
		1140,1,0,0,0,1143,1147,5,13,0,0,1144,1146,3,172,86,0,1145,1144,1,0,0,0,
		1146,1149,1,0,0,0,1147,1145,1,0,0,0,1147,1148,1,0,0,0,1148,1186,1,0,0,
		0,1149,1147,1,0,0,0,1150,1152,3,176,88,0,1151,1150,1,0,0,0,1152,1155,1,
		0,0,0,1153,1151,1,0,0,0,1153,1154,1,0,0,0,1154,1156,1,0,0,0,1155,1153,
		1,0,0,0,1156,1160,5,9,0,0,1157,1159,3,172,86,0,1158,1157,1,0,0,0,1159,
		1162,1,0,0,0,1160,1158,1,0,0,0,1160,1161,1,0,0,0,1161,1186,1,0,0,0,1162,
		1160,1,0,0,0,1163,1186,3,180,90,0,1164,1186,3,158,79,0,1165,1186,3,186,
		93,0,1166,1186,3,188,94,0,1167,1173,3,14,7,0,1168,1172,3,164,82,0,1169,
		1172,3,166,83,0,1170,1172,3,172,86,0,1171,1168,1,0,0,0,1171,1169,1,0,0,
		0,1171,1170,1,0,0,0,1172,1175,1,0,0,0,1173,1171,1,0,0,0,1173,1174,1,0,
		0,0,1174,1186,1,0,0,0,1175,1173,1,0,0,0,1176,1182,3,296,148,0,1177,1181,
		3,164,82,0,1178,1181,3,166,83,0,1179,1181,3,172,86,0,1180,1177,1,0,0,0,
		1180,1178,1,0,0,0,1180,1179,1,0,0,0,1181,1184,1,0,0,0,1182,1180,1,0,0,
		0,1182,1183,1,0,0,0,1183,1186,1,0,0,0,1184,1182,1,0,0,0,1185,1077,1,0,
		0,0,1185,1088,1,0,0,0,1185,1101,1,0,0,0,1185,1114,1,0,0,0,1185,1127,1,
		0,0,0,1185,1140,1,0,0,0,1185,1153,1,0,0,0,1185,1163,1,0,0,0,1185,1164,
		1,0,0,0,1185,1165,1,0,0,0,1185,1166,1,0,0,0,1185,1167,1,0,0,0,1185,1176,
		1,0,0,0,1186,1199,1,0,0,0,1187,1188,10,1,0,0,1188,1194,5,163,0,0,1189,
		1193,3,164,82,0,1190,1193,3,166,83,0,1191,1193,3,172,86,0,1192,1189,1,
		0,0,0,1192,1190,1,0,0,0,1192,1191,1,0,0,0,1193,1196,1,0,0,0,1194,1192,
		1,0,0,0,1194,1195,1,0,0,0,1195,1198,1,0,0,0,1196,1194,1,0,0,0,1197,1187,
		1,0,0,0,1198,1201,1,0,0,0,1199,1197,1,0,0,0,1199,1200,1,0,0,0,1200,179,
		1,0,0,0,1201,1199,1,0,0,0,1202,1203,5,95,0,0,1203,1204,5,134,0,0,1204,
		1205,3,268,134,0,1205,1206,5,135,0,0,1206,181,1,0,0,0,1207,1212,3,184,
		92,0,1208,1209,5,141,0,0,1209,1211,3,184,92,0,1210,1208,1,0,0,0,1211,1214,
		1,0,0,0,1212,1210,1,0,0,0,1212,1213,1,0,0,0,1213,183,1,0,0,0,1214,1212,
		1,0,0,0,1215,1222,3,196,98,0,1216,1218,3,196,98,0,1217,1216,1,0,0,0,1217,
		1218,1,0,0,0,1218,1219,1,0,0,0,1219,1220,5,152,0,0,1220,1222,3,292,146,
		0,1221,1215,1,0,0,0,1221,1217,1,0,0,0,1222,185,1,0,0,0,1223,1229,5,11,
		0,0,1224,1226,3,296,148,0,1225,1224,1,0,0,0,1225,1226,1,0,0,0,1226,1227,
		1,0,0,0,1227,1228,5,152,0,0,1228,1230,3,224,112,0,1229,1225,1,0,0,0,1229,
		1230,1,0,0,0,1230,1242,1,0,0,0,1231,1236,3,296,148,0,1232,1233,5,136,0,
		0,1233,1234,3,190,95,0,1234,1235,5,137,0,0,1235,1237,1,0,0,0,1236,1232,
		1,0,0,0,1236,1237,1,0,0,0,1237,1243,1,0,0,0,1238,1239,5,136,0,0,1239,1240,
		3,190,95,0,1240,1241,5,137,0,0,1241,1243,1,0,0,0,1242,1231,1,0,0,0,1242,
		1238,1,0,0,0,1243,187,1,0,0,0,1244,1245,7,10,0,0,1245,1246,5,134,0,0,1246,
		1247,3,224,112,0,1247,1248,5,141,0,0,1248,1249,3,296,148,0,1249,1254,5,
		135,0,0,1250,1251,5,136,0,0,1251,1252,3,190,95,0,1252,1253,5,137,0,0,1253,
		1255,1,0,0,0,1254,1250,1,0,0,0,1254,1255,1,0,0,0,1255,189,1,0,0,0,1256,
		1261,3,192,96,0,1257,1258,5,141,0,0,1258,1260,3,192,96,0,1259,1257,1,0,
		0,0,1260,1263,1,0,0,0,1261,1259,1,0,0,0,1261,1262,1,0,0,0,1262,1265,1,
		0,0,0,1263,1261,1,0,0,0,1264,1266,5,141,0,0,1265,1264,1,0,0,0,1265,1266,
		1,0,0,0,1266,191,1,0,0,0,1267,1270,3,194,97,0,1268,1269,5,146,0,0,1269,
		1271,3,268,134,0,1270,1268,1,0,0,0,1270,1271,1,0,0,0,1271,193,1,0,0,0,
		1272,1275,3,296,148,0,1273,1275,5,7,0,0,1274,1272,1,0,0,0,1274,1273,1,
		0,0,0,1275,195,1,0,0,0,1276,1282,3,296,148,0,1277,1278,5,134,0,0,1278,
		1279,3,196,98,0,1279,1280,5,135,0,0,1280,1282,1,0,0,0,1281,1276,1,0,0,
		0,1281,1277,1,0,0,0,1282,1286,1,0,0,0,1283,1285,3,198,99,0,1284,1283,1,
		0,0,0,1285,1288,1,0,0,0,1286,1284,1,0,0,0,1286,1287,1,0,0,0,1287,1300,
		1,0,0,0,1288,1286,1,0,0,0,1289,1290,5,134,0,0,1290,1292,5,167,0,0,1291,
		1293,3,166,83,0,1292,1291,1,0,0,0,1292,1293,1,0,0,0,1293,1295,1,0,0,0,
		1294,1296,3,296,148,0,1295,1294,1,0,0,0,1295,1296,1,0,0,0,1296,1297,1,
		0,0,0,1297,1298,5,135,0,0,1298,1300,3,84,42,0,1299,1281,1,0,0,0,1299,1289,
		1,0,0,0,1300,197,1,0,0,0,1301,1303,5,138,0,0,1302,1304,3,276,138,0,1303,
		1302,1,0,0,0,1303,1304,1,0,0,0,1304,1305,1,0,0,0,1305,1306,5,139,0,0,1306,
		199,1,0,0,0,1307,1310,3,230,115,0,1308,1309,5,141,0,0,1309,1311,5,179,
		0,0,1310,1308,1,0,0,0,1310,1311,1,0,0,0,1311,201,1,0,0,0,1312,1324,3,296,
		148,0,1313,1314,5,134,0,0,1314,1319,3,290,145,0,1315,1316,5,141,0,0,1316,
		1318,3,290,145,0,1317,1315,1,0,0,0,1318,1321,1,0,0,0,1319,1317,1,0,0,0,
		1319,1320,1,0,0,0,1320,1322,1,0,0,0,1321,1319,1,0,0,0,1322,1323,5,135,
		0,0,1323,1325,1,0,0,0,1324,1313,1,0,0,0,1324,1325,1,0,0,0,1325,1379,1,
		0,0,0,1326,1379,5,110,0,0,1327,1328,5,108,0,0,1328,1331,5,134,0,0,1329,
		1332,3,208,104,0,1330,1332,3,210,105,0,1331,1329,1,0,0,0,1331,1330,1,0,
		0,0,1332,1333,1,0,0,0,1333,1334,5,135,0,0,1334,1379,1,0,0,0,1335,1336,
		5,112,0,0,1336,1337,5,134,0,0,1337,1342,3,214,107,0,1338,1339,5,141,0,
		0,1339,1341,3,214,107,0,1340,1338,1,0,0,0,1341,1344,1,0,0,0,1342,1340,
		1,0,0,0,1342,1343,1,0,0,0,1343,1345,1,0,0,0,1344,1342,1,0,0,0,1345,1346,
		5,135,0,0,1346,1379,1,0,0,0,1347,1348,5,113,0,0,1348,1349,5,134,0,0,1349,
		1354,3,296,148,0,1350,1351,5,141,0,0,1351,1353,3,296,148,0,1352,1350,1,
		0,0,0,1353,1356,1,0,0,0,1354,1352,1,0,0,0,1354,1355,1,0,0,0,1355,1357,
		1,0,0,0,1356,1354,1,0,0,0,1357,1358,5,135,0,0,1358,1379,1,0,0,0,1359,1360,
		5,111,0,0,1360,1361,5,134,0,0,1361,1362,3,294,147,0,1362,1363,5,135,0,
		0,1363,1379,1,0,0,0,1364,1365,5,84,0,0,1365,1366,5,134,0,0,1366,1367,5,
		134,0,0,1367,1372,3,204,102,0,1368,1369,5,141,0,0,1369,1371,3,204,102,
		0,1370,1368,1,0,0,0,1371,1374,1,0,0,0,1372,1370,1,0,0,0,1372,1373,1,0,
		0,0,1373,1375,1,0,0,0,1374,1372,1,0,0,0,1375,1376,5,135,0,0,1376,1377,
		5,135,0,0,1377,1379,1,0,0,0,1378,1312,1,0,0,0,1378,1326,1,0,0,0,1378,1327,
		1,0,0,0,1378,1335,1,0,0,0,1378,1347,1,0,0,0,1378,1359,1,0,0,0,1378,1364,
		1,0,0,0,1379,203,1,0,0,0,1380,1394,3,296,148,0,1381,1382,3,296,148,0,1382,
		1383,5,134,0,0,1383,1388,3,206,103,0,1384,1385,5,141,0,0,1385,1387,3,206,
		103,0,1386,1384,1,0,0,0,1387,1390,1,0,0,0,1388,1386,1,0,0,0,1388,1389,
		1,0,0,0,1389,1391,1,0,0,0,1390,1388,1,0,0,0,1391,1392,5,135,0,0,1392,1394,
		1,0,0,0,1393,1380,1,0,0,0,1393,1381,1,0,0,0,1394,205,1,0,0,0,1395,1407,
		3,296,148,0,1396,1407,5,185,0,0,1397,1407,3,294,147,0,1398,1399,3,296,
		148,0,1399,1400,5,146,0,0,1400,1401,3,216,108,0,1401,1407,1,0,0,0,1402,
		1403,3,296,148,0,1403,1404,5,146,0,0,1404,1405,3,294,147,0,1405,1407,1,
		0,0,0,1406,1395,1,0,0,0,1406,1396,1,0,0,0,1406,1397,1,0,0,0,1406,1398,
		1,0,0,0,1406,1402,1,0,0,0,1407,207,1,0,0,0,1408,1413,3,296,148,0,1409,
		1410,5,142,0,0,1410,1412,3,296,148,0,1411,1409,1,0,0,0,1412,1415,1,0,0,
		0,1413,1411,1,0,0,0,1413,1414,1,0,0,0,1414,209,1,0,0,0,1415,1413,1,0,0,
		0,1416,1417,3,296,148,0,1417,1423,5,134,0,0,1418,1419,3,212,106,0,1419,
		1420,5,152,0,0,1420,1422,1,0,0,0,1421,1418,1,0,0,0,1422,1425,1,0,0,0,1423,
		1421,1,0,0,0,1423,1424,1,0,0,0,1424,1426,1,0,0,0,1425,1423,1,0,0,0,1426,
		1427,5,135,0,0,1427,211,1,0,0,0,1428,1432,3,296,148,0,1429,1432,5,145,
		0,0,1430,1432,5,14,0,0,1431,1428,1,0,0,0,1431,1429,1,0,0,0,1431,1430,1,
		0,0,0,1432,213,1,0,0,0,1433,1434,3,296,148,0,1434,1435,5,134,0,0,1435,
		1436,3,216,108,0,1436,1437,5,135,0,0,1437,215,1,0,0,0,1438,1448,5,186,
		0,0,1439,1444,5,185,0,0,1440,1441,5,142,0,0,1441,1443,5,185,0,0,1442,1440,
		1,0,0,0,1443,1446,1,0,0,0,1444,1442,1,0,0,0,1444,1445,1,0,0,0,1445,1448,
		1,0,0,0,1446,1444,1,0,0,0,1447,1438,1,0,0,0,1447,1439,1,0,0,0,1448,217,
		1,0,0,0,1449,1454,5,136,0,0,1450,1452,3,266,133,0,1451,1453,5,141,0,0,
		1452,1451,1,0,0,0,1452,1453,1,0,0,0,1453,1455,1,0,0,0,1454,1450,1,0,0,
		0,1454,1455,1,0,0,0,1455,1456,1,0,0,0,1456,1457,5,137,0,0,1457,219,1,0,
		0,0,1458,1472,5,136,0,0,1459,1460,5,142,0,0,1460,1466,3,268,134,0,1461,
		1462,5,141,0,0,1462,1463,5,142,0,0,1463,1465,3,268,134,0,1464,1461,1,0,
		0,0,1465,1468,1,0,0,0,1466,1464,1,0,0,0,1466,1467,1,0,0,0,1467,1470,1,
		0,0,0,1468,1466,1,0,0,0,1469,1471,5,141,0,0,1470,1469,1,0,0,0,1470,1471,
		1,0,0,0,1471,1473,1,0,0,0,1472,1459,1,0,0,0,1472,1473,1,0,0,0,1473,1474,
		1,0,0,0,1474,1475,5,137,0,0,1475,221,1,0,0,0,1476,1481,3,274,137,0,1477,
		1478,5,141,0,0,1478,1480,3,274,137,0,1479,1477,1,0,0,0,1480,1483,1,0,0,
		0,1481,1479,1,0,0,0,1481,1482,1,0,0,0,1482,1485,1,0,0,0,1483,1481,1,0,
		0,0,1484,1486,5,141,0,0,1485,1484,1,0,0,0,1485,1486,1,0,0,0,1486,223,1,
		0,0,0,1487,1489,3,150,75,0,1488,1490,3,226,113,0,1489,1488,1,0,0,0,1489,
		1490,1,0,0,0,1490,1493,1,0,0,0,1491,1493,3,70,35,0,1492,1487,1,0,0,0,1492,
		1491,1,0,0,0,1493,225,1,0,0,0,1494,1496,5,134,0,0,1495,1497,3,226,113,
		0,1496,1495,1,0,0,0,1496,1497,1,0,0,0,1497,1498,1,0,0,0,1498,1500,5,135,
		0,0,1499,1501,3,228,114,0,1500,1499,1,0,0,0,1501,1502,1,0,0,0,1502,1500,
		1,0,0,0,1502,1503,1,0,0,0,1503,1514,1,0,0,0,1504,1506,5,138,0,0,1505,1507,
		3,276,138,0,1506,1505,1,0,0,0,1506,1507,1,0,0,0,1507,1508,1,0,0,0,1508,
		1510,5,139,0,0,1509,1504,1,0,0,0,1510,1511,1,0,0,0,1511,1509,1,0,0,0,1511,
		1512,1,0,0,0,1512,1514,1,0,0,0,1513,1494,1,0,0,0,1513,1509,1,0,0,0,1514,
		227,1,0,0,0,1515,1517,5,138,0,0,1516,1518,3,276,138,0,1517,1516,1,0,0,
		0,1517,1518,1,0,0,0,1518,1519,1,0,0,0,1519,1526,5,139,0,0,1520,1522,5,
		134,0,0,1521,1523,3,230,115,0,1522,1521,1,0,0,0,1522,1523,1,0,0,0,1523,
		1524,1,0,0,0,1524,1526,5,135,0,0,1525,1515,1,0,0,0,1525,1520,1,0,0,0,1526,
		229,1,0,0,0,1527,1532,3,232,116,0,1528,1529,5,141,0,0,1529,1531,3,232,
		116,0,1530,1528,1,0,0,0,1531,1534,1,0,0,0,1532,1530,1,0,0,0,1532,1533,
		1,0,0,0,1533,231,1,0,0,0,1534,1532,1,0,0,0,1535,1536,3,150,75,0,1536,1537,
		3,196,98,0,1537,1540,1,0,0,0,1538,1540,5,32,0,0,1539,1535,1,0,0,0,1539,
		1538,1,0,0,0,1540,233,1,0,0,0,1541,1543,3,236,118,0,1542,1544,5,140,0,
		0,1543,1542,1,0,0,0,1543,1544,1,0,0,0,1544,1583,1,0,0,0,1545,1547,3,240,
		120,0,1546,1548,5,140,0,0,1547,1546,1,0,0,0,1547,1548,1,0,0,0,1548,1583,
		1,0,0,0,1549,1551,3,242,121,0,1550,1552,5,140,0,0,1551,1550,1,0,0,0,1551,
		1552,1,0,0,0,1552,1583,1,0,0,0,1553,1555,3,252,126,0,1554,1556,5,140,0,
		0,1555,1554,1,0,0,0,1555,1556,1,0,0,0,1556,1583,1,0,0,0,1557,1559,3,264,
		132,0,1558,1560,5,140,0,0,1559,1558,1,0,0,0,1559,1560,1,0,0,0,1560,1583,
		1,0,0,0,1561,1563,3,116,58,0,1562,1564,5,140,0,0,1563,1562,1,0,0,0,1563,
		1564,1,0,0,0,1564,1583,1,0,0,0,1565,1567,3,118,59,0,1566,1568,5,140,0,
		0,1567,1566,1,0,0,0,1567,1568,1,0,0,0,1568,1583,1,0,0,0,1569,1571,3,110,
		55,0,1570,1572,5,140,0,0,1571,1570,1,0,0,0,1571,1572,1,0,0,0,1572,1583,
		1,0,0,0,1573,1575,3,112,56,0,1574,1576,5,140,0,0,1575,1574,1,0,0,0,1575,
		1576,1,0,0,0,1576,1583,1,0,0,0,1577,1579,3,266,133,0,1578,1580,5,140,0,
		0,1579,1578,1,0,0,0,1579,1580,1,0,0,0,1580,1583,1,0,0,0,1581,1583,5,140,
		0,0,1582,1541,1,0,0,0,1582,1545,1,0,0,0,1582,1549,1,0,0,0,1582,1553,1,
		0,0,0,1582,1557,1,0,0,0,1582,1561,1,0,0,0,1582,1565,1,0,0,0,1582,1569,
		1,0,0,0,1582,1573,1,0,0,0,1582,1577,1,0,0,0,1582,1581,1,0,0,0,1583,235,
		1,0,0,0,1584,1585,3,296,148,0,1585,1586,5,152,0,0,1586,1587,3,234,117,
		0,1587,237,1,0,0,0,1588,1591,3,276,138,0,1589,1590,5,179,0,0,1590,1592,
		3,276,138,0,1591,1589,1,0,0,0,1591,1592,1,0,0,0,1592,239,1,0,0,0,1593,
		1598,5,136,0,0,1594,1597,3,138,69,0,1595,1597,3,234,117,0,1596,1594,1,
		0,0,0,1596,1595,1,0,0,0,1597,1600,1,0,0,0,1598,1596,1,0,0,0,1598,1599,
		1,0,0,0,1599,1601,1,0,0,0,1600,1598,1,0,0,0,1601,1602,5,137,0,0,1602,241,
		1,0,0,0,1603,1604,5,16,0,0,1604,1605,5,134,0,0,1605,1606,3,268,134,0,1606,
		1607,5,135,0,0,1607,1610,3,234,117,0,1608,1609,5,10,0,0,1609,1611,3,234,
		117,0,1610,1608,1,0,0,0,1610,1611,1,0,0,0,1611,1614,1,0,0,0,1612,1614,
		3,244,122,0,1613,1603,1,0,0,0,1613,1612,1,0,0,0,1614,243,1,0,0,0,1615,
		1616,5,28,0,0,1616,1617,5,134,0,0,1617,1618,3,268,134,0,1618,1619,5,135,
		0,0,1619,1620,3,246,123,0,1620,245,1,0,0,0,1621,1625,5,136,0,0,1622,1624,
		3,248,124,0,1623,1622,1,0,0,0,1624,1627,1,0,0,0,1625,1623,1,0,0,0,1625,
		1626,1,0,0,0,1626,1628,1,0,0,0,1627,1625,1,0,0,0,1628,1629,5,137,0,0,1629,
		247,1,0,0,0,1630,1632,3,250,125,0,1631,1630,1,0,0,0,1632,1633,1,0,0,0,
		1633,1631,1,0,0,0,1633,1634,1,0,0,0,1634,1636,1,0,0,0,1635,1637,3,234,
		117,0,1636,1635,1,0,0,0,1637,1638,1,0,0,0,1638,1636,1,0,0,0,1638,1639,
		1,0,0,0,1639,249,1,0,0,0,1640,1646,5,3,0,0,1641,1647,3,238,119,0,1642,
		1643,5,134,0,0,1643,1644,3,238,119,0,1644,1645,5,135,0,0,1645,1647,1,0,
		0,0,1646,1641,1,0,0,0,1646,1642,1,0,0,0,1647,1648,1,0,0,0,1648,1649,5,
		152,0,0,1649,1653,1,0,0,0,1650,1651,5,7,0,0,1651,1653,5,152,0,0,1652,1640,
		1,0,0,0,1652,1650,1,0,0,0,1653,251,1,0,0,0,1654,1659,3,254,127,0,1655,
		1659,3,256,128,0,1656,1659,3,258,129,0,1657,1659,3,262,131,0,1658,1654,
		1,0,0,0,1658,1655,1,0,0,0,1658,1656,1,0,0,0,1658,1657,1,0,0,0,1659,253,
		1,0,0,0,1660,1661,5,34,0,0,1661,1662,5,134,0,0,1662,1663,3,268,134,0,1663,
		1664,5,135,0,0,1664,1665,3,234,117,0,1665,255,1,0,0,0,1666,1667,5,8,0,
		0,1667,1668,3,234,117,0,1668,1669,5,34,0,0,1669,1670,5,134,0,0,1670,1671,
		3,268,134,0,1671,1672,5,135,0,0,1672,1673,5,140,0,0,1673,257,1,0,0,0,1674,
		1675,5,14,0,0,1675,1677,5,134,0,0,1676,1678,3,260,130,0,1677,1676,1,0,
		0,0,1677,1678,1,0,0,0,1678,1679,1,0,0,0,1679,1681,5,140,0,0,1680,1682,
		3,268,134,0,1681,1680,1,0,0,0,1681,1682,1,0,0,0,1682,1683,1,0,0,0,1683,
		1685,5,140,0,0,1684,1686,3,266,133,0,1685,1684,1,0,0,0,1685,1686,1,0,0,
		0,1686,1687,1,0,0,0,1687,1688,5,135,0,0,1688,1689,3,234,117,0,1689,259,
		1,0,0,0,1690,1691,3,150,75,0,1691,1692,3,154,77,0,1692,1695,1,0,0,0,1693,
		1695,3,266,133,0,1694,1690,1,0,0,0,1694,1693,1,0,0,0,1695,261,1,0,0,0,
		1696,1697,5,14,0,0,1697,1698,5,134,0,0,1698,1699,3,108,54,0,1699,1701,
		5,46,0,0,1700,1702,3,268,134,0,1701,1700,1,0,0,0,1701,1702,1,0,0,0,1702,
		1703,1,0,0,0,1703,1704,5,135,0,0,1704,1705,3,234,117,0,1705,263,1,0,0,
		0,1706,1707,5,15,0,0,1707,1715,3,296,148,0,1708,1715,5,6,0,0,1709,1715,
		5,2,0,0,1710,1712,5,22,0,0,1711,1713,3,268,134,0,1712,1711,1,0,0,0,1712,
		1713,1,0,0,0,1713,1715,1,0,0,0,1714,1706,1,0,0,0,1714,1708,1,0,0,0,1714,
		1709,1,0,0,0,1714,1710,1,0,0,0,1715,265,1,0,0,0,1716,1721,3,268,134,0,
		1717,1718,5,141,0,0,1718,1720,3,268,134,0,1719,1717,1,0,0,0,1720,1723,
		1,0,0,0,1721,1719,1,0,0,0,1721,1722,1,0,0,0,1722,267,1,0,0,0,1723,1721,
		1,0,0,0,1724,1725,6,134,-1,0,1725,1735,3,272,136,0,1726,1727,5,134,0,0,
		1727,1728,3,240,120,0,1728,1729,5,135,0,0,1729,1735,1,0,0,0,1730,1731,
		3,278,139,0,1731,1732,3,270,135,0,1732,1733,3,268,134,1,1733,1735,1,0,
		0,0,1734,1724,1,0,0,0,1734,1726,1,0,0,0,1734,1730,1,0,0,0,1735,1780,1,
		0,0,0,1736,1737,10,13,0,0,1737,1738,7,11,0,0,1738,1779,3,268,134,14,1739,
		1740,10,12,0,0,1740,1741,7,12,0,0,1741,1779,3,268,134,13,1742,1747,10,
		11,0,0,1743,1744,5,148,0,0,1744,1748,5,148,0,0,1745,1746,5,147,0,0,1746,
		1748,5,147,0,0,1747,1743,1,0,0,0,1747,1745,1,0,0,0,1748,1749,1,0,0,0,1749,
		1779,3,268,134,12,1750,1751,10,10,0,0,1751,1752,7,13,0,0,1752,1779,3,268,
		134,11,1753,1754,10,9,0,0,1754,1755,7,14,0,0,1755,1779,3,268,134,10,1756,
		1757,10,8,0,0,1757,1758,5,165,0,0,1758,1779,3,268,134,9,1759,1760,10,7,
		0,0,1760,1761,5,167,0,0,1761,1779,3,268,134,8,1762,1763,10,6,0,0,1763,
		1764,5,166,0,0,1764,1779,3,268,134,7,1765,1766,10,5,0,0,1766,1767,5,157,
		0,0,1767,1779,3,268,134,6,1768,1769,10,4,0,0,1769,1770,5,158,0,0,1770,
		1779,3,268,134,5,1771,1772,10,3,0,0,1772,1774,5,151,0,0,1773,1775,3,268,
		134,0,1774,1773,1,0,0,0,1774,1775,1,0,0,0,1775,1776,1,0,0,0,1776,1777,
		5,152,0,0,1777,1779,3,268,134,4,1778,1736,1,0,0,0,1778,1739,1,0,0,0,1778,
		1742,1,0,0,0,1778,1750,1,0,0,0,1778,1753,1,0,0,0,1778,1756,1,0,0,0,1778,
		1759,1,0,0,0,1778,1762,1,0,0,0,1778,1765,1,0,0,0,1778,1768,1,0,0,0,1778,
		1771,1,0,0,0,1779,1782,1,0,0,0,1780,1778,1,0,0,0,1780,1781,1,0,0,0,1781,
		269,1,0,0,0,1782,1780,1,0,0,0,1783,1784,7,15,0,0,1784,271,1,0,0,0,1785,
		1795,3,278,139,0,1786,1787,5,134,0,0,1787,1788,3,224,112,0,1788,1789,5,
		135,0,0,1789,1792,1,0,0,0,1790,1793,3,272,136,0,1791,1793,3,274,137,0,
		1792,1790,1,0,0,0,1792,1791,1,0,0,0,1793,1795,1,0,0,0,1794,1785,1,0,0,
		0,1794,1786,1,0,0,0,1795,273,1,0,0,0,1796,1800,3,268,134,0,1797,1800,3,
		218,109,0,1798,1800,3,220,110,0,1799,1796,1,0,0,0,1799,1797,1,0,0,0,1799,
		1798,1,0,0,0,1800,275,1,0,0,0,1801,1804,3,296,148,0,1802,1804,3,292,146,
		0,1803,1801,1,0,0,0,1803,1802,1,0,0,0,1804,277,1,0,0,0,1805,1820,3,282,
		141,0,1806,1812,5,25,0,0,1807,1813,3,278,139,0,1808,1809,5,134,0,0,1809,
		1810,3,178,89,0,1810,1811,5,135,0,0,1811,1813,1,0,0,0,1812,1807,1,0,0,
		0,1812,1808,1,0,0,0,1813,1820,1,0,0,0,1814,1815,7,16,0,0,1815,1820,3,278,
		139,0,1816,1817,3,280,140,0,1817,1818,3,272,136,0,1818,1820,1,0,0,0,1819,
		1805,1,0,0,0,1819,1806,1,0,0,0,1819,1814,1,0,0,0,1819,1816,1,0,0,0,1820,
		279,1,0,0,0,1821,1822,7,17,0,0,1822,281,1,0,0,0,1823,1824,6,141,-1,0,1824,
		1828,3,290,145,0,1825,1827,3,284,142,0,1826,1825,1,0,0,0,1827,1830,1,0,
		0,0,1828,1826,1,0,0,0,1828,1829,1,0,0,0,1829,1842,1,0,0,0,1830,1828,1,
		0,0,0,1831,1832,10,1,0,0,1832,1833,7,18,0,0,1833,1837,3,296,148,0,1834,
		1836,3,284,142,0,1835,1834,1,0,0,0,1836,1839,1,0,0,0,1837,1835,1,0,0,0,
		1837,1838,1,0,0,0,1838,1841,1,0,0,0,1839,1837,1,0,0,0,1840,1831,1,0,0,
		0,1841,1844,1,0,0,0,1842,1840,1,0,0,0,1842,1843,1,0,0,0,1843,283,1,0,0,
		0,1844,1842,1,0,0,0,1845,1846,5,138,0,0,1846,1847,3,268,134,0,1847,1848,
		5,139,0,0,1848,1864,1,0,0,0,1849,1851,5,134,0,0,1850,1852,3,286,143,0,
		1851,1850,1,0,0,0,1851,1852,1,0,0,0,1852,1853,1,0,0,0,1853,1864,5,135,
		0,0,1854,1857,5,134,0,0,1855,1858,5,141,0,0,1856,1858,8,19,0,0,1857,1855,
		1,0,0,0,1857,1856,1,0,0,0,1858,1859,1,0,0,0,1859,1857,1,0,0,0,1859,1860,
		1,0,0,0,1860,1861,1,0,0,0,1861,1864,5,135,0,0,1862,1864,7,16,0,0,1863,
		1845,1,0,0,0,1863,1849,1,0,0,0,1863,1854,1,0,0,0,1863,1862,1,0,0,0,1864,
		285,1,0,0,0,1865,1870,3,288,144,0,1866,1867,5,141,0,0,1867,1869,3,288,
		144,0,1868,1866,1,0,0,0,1869,1872,1,0,0,0,1870,1868,1,0,0,0,1870,1871,
		1,0,0,0,1871,287,1,0,0,0,1872,1870,1,0,0,0,1873,1876,3,268,134,0,1874,
		1876,3,178,89,0,1875,1873,1,0,0,0,1875,1874,1,0,0,0,1876,289,1,0,0,0,1877,
		1893,3,296,148,0,1878,1893,3,292,146,0,1879,1893,3,294,147,0,1880,1881,
		5,134,0,0,1881,1882,3,268,134,0,1882,1883,5,135,0,0,1883,1893,1,0,0,0,
		1884,1893,3,90,45,0,1885,1893,3,100,50,0,1886,1893,3,104,52,0,1887,1893,
		3,106,53,0,1888,1893,3,76,38,0,1889,1893,3,80,40,0,1890,1893,3,82,41,0,
		1891,1893,3,88,44,0,1892,1877,1,0,0,0,1892,1878,1,0,0,0,1892,1879,1,0,
		0,0,1892,1880,1,0,0,0,1892,1884,1,0,0,0,1892,1885,1,0,0,0,1892,1886,1,
		0,0,0,1892,1887,1,0,0,0,1892,1888,1,0,0,0,1892,1889,1,0,0,0,1892,1890,
		1,0,0,0,1892,1891,1,0,0,0,1893,291,1,0,0,0,1894,1913,5,182,0,0,1895,1913,
		5,183,0,0,1896,1913,5,184,0,0,1897,1899,7,12,0,0,1898,1897,1,0,0,0,1898,
		1899,1,0,0,0,1899,1900,1,0,0,0,1900,1913,5,185,0,0,1901,1903,7,12,0,0,
		1902,1901,1,0,0,0,1902,1903,1,0,0,0,1903,1904,1,0,0,0,1904,1913,5,186,
		0,0,1905,1913,5,180,0,0,1906,1913,5,48,0,0,1907,1913,5,50,0,0,1908,1913,
		5,57,0,0,1909,1913,5,49,0,0,1910,1913,5,38,0,0,1911,1913,5,39,0,0,1912,
		1894,1,0,0,0,1912,1895,1,0,0,0,1912,1896,1,0,0,0,1912,1898,1,0,0,0,1912,
		1902,1,0,0,0,1912,1905,1,0,0,0,1912,1906,1,0,0,0,1912,1907,1,0,0,0,1912,
		1908,1,0,0,0,1912,1909,1,0,0,0,1912,1910,1,0,0,0,1912,1911,1,0,0,0,1913,
		293,1,0,0,0,1914,1918,5,181,0,0,1915,1917,7,20,0,0,1916,1915,1,0,0,0,1917,
		1920,1,0,0,0,1918,1916,1,0,0,0,1918,1919,1,0,0,0,1919,1921,1,0,0,0,1920,
		1918,1,0,0,0,1921,1923,5,193,0,0,1922,1914,1,0,0,0,1923,1924,1,0,0,0,1924,
		1922,1,0,0,0,1924,1925,1,0,0,0,1925,295,1,0,0,0,1926,1927,7,21,0,0,1927,
		297,1,0,0,0,253,301,318,325,331,337,340,343,351,358,361,364,372,375,378,
		388,398,401,409,414,423,429,431,443,453,461,464,467,476,499,506,509,515,
		524,530,532,542,544,553,559,569,571,580,584,587,595,599,601,604,610,614,
		620,634,641,647,650,653,657,661,665,669,677,680,687,692,701,705,707,719,
		721,733,735,740,746,749,755,759,762,765,776,782,784,787,795,800,806,816,
		821,823,845,852,857,881,886,891,895,899,903,912,919,926,932,935,940,944,
		951,954,960,964,967,972,979,990,992,999,1010,1021,1027,1032,1038,1042,
		1047,1057,1071,1082,1088,1095,1101,1108,1114,1121,1127,1134,1140,1147,
		1153,1160,1171,1173,1180,1182,1185,1192,1194,1199,1212,1217,1221,1225,
		1229,1236,1242,1254,1261,1265,1270,1274,1281,1286,1292,1295,1299,1303,
		1310,1319,1324,1331,1342,1354,1372,1378,1388,1393,1406,1413,1423,1431,
		1444,1447,1452,1454,1466,1470,1472,1481,1485,1489,1492,1496,1502,1506,
		1511,1513,1517,1522,1525,1532,1539,1543,1547,1551,1555,1559,1563,1567,
		1571,1575,1579,1582,1591,1596,1598,1610,1613,1625,1633,1638,1646,1652,
		1658,1677,1681,1685,1694,1701,1712,1714,1721,1734,1747,1774,1778,1780,
		1792,1794,1799,1803,1812,1819,1828,1837,1842,1851,1857,1859,1863,1870,
		1875,1892,1898,1902,1912,1918,1924
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
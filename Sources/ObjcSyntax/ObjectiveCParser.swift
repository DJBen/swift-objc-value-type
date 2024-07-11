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
            RULE_genericConformanceList = 8, RULE_genericConformance = 9, 
            RULE_protocolDeclaration = 10, RULE_protocolDeclarationSection = 11, 
            RULE_protocolDeclarationList = 12, RULE_classDeclarationList = 13, 
            RULE_protocolList = 14, RULE_propertyDeclaration = 15, RULE_propertyAttributesList = 16, 
            RULE_propertyAttribute = 17, RULE_protocolName = 18, RULE_instanceVariables = 19, 
            RULE_visibilitySection = 20, RULE_accessModifier = 21, RULE_interfaceDeclarationList = 22, 
            RULE_classMethodDeclaration = 23, RULE_instanceMethodDeclaration = 24, 
            RULE_methodDeclaration = 25, RULE_implementationDefinitionList = 26, 
            RULE_classMethodDefinition = 27, RULE_instanceMethodDefinition = 28, 
            RULE_methodDefinition = 29, RULE_methodSelector = 30, RULE_keywordDeclarator = 31, 
            RULE_selector = 32, RULE_methodType = 33, RULE_propertyImplementation = 34, 
            RULE_propertySynthesizeList = 35, RULE_propertySynthesizeItem = 36, 
            RULE_blockType = 37, RULE_genericsSpecifierList = 38, RULE_genericsSpecifier = 39, 
            RULE_dictionaryExpression = 40, RULE_dictionaryPair = 41, RULE_arrayExpression = 42, 
            RULE_boxExpression = 43, RULE_blockParameters = 44, RULE_typeVariableDeclaratorOrName = 45, 
            RULE_blockExpression = 46, RULE_messageExpression = 47, RULE_receiver = 48, 
            RULE_messageSelector = 49, RULE_keywordArgument = 50, RULE_keywordArgumentType = 51, 
            RULE_selectorExpression = 52, RULE_selectorName = 53, RULE_protocolExpression = 54, 
            RULE_encodeExpression = 55, RULE_typeVariableDeclarator = 56, 
            RULE_throwStatement = 57, RULE_tryBlock = 58, RULE_catchStatement = 59, 
            RULE_synchronizedStatement = 60, RULE_autoreleaseStatement = 61, 
            RULE_functionDeclaration = 62, RULE_functionDefinition = 63, 
            RULE_functionSignature = 64, RULE_attribute = 65, RULE_attributeName = 66, 
            RULE_attributeParameters = 67, RULE_attributeParameterList = 68, 
            RULE_attributeParameter = 69, RULE_attributeParameterAssignment = 70, 
            RULE_declaration = 71, RULE_functionCallExpression = 72, RULE_enumDeclaration = 73, 
            RULE_varDeclaration = 74, RULE_typedefDeclaration = 75, RULE_typeDeclaratorList = 76, 
            RULE_declarationSpecifiers = 77, RULE_attributeSpecifier = 78, 
            RULE_initDeclaratorList = 79, RULE_initDeclarator = 80, RULE_structOrUnionSpecifier = 81, 
            RULE_fieldDeclaration = 82, RULE_ibOutletQualifier = 83, RULE_arcBehaviourSpecifier = 84, 
            RULE_nullabilitySpecifier = 85, RULE_storageClassSpecifier = 86, 
            RULE_typePrefix = 87, RULE_typeQualifier = 88, RULE_protocolQualifier = 89, 
            RULE_typeSpecifierModifier = 90, RULE_typeSpecifier = 91, RULE_typeofExpression = 92, 
            RULE_fieldDeclaratorList = 93, RULE_fieldDeclarator = 94, RULE_enumSpecifier = 95, 
            RULE_nsEnumOrOptionSpecifier = 96, RULE_enumeratorList = 97, 
            RULE_enumerator = 98, RULE_enumeratorIdentifier = 99, RULE_declarator = 100, 
            RULE_declaratorSuffix = 101, RULE_parameterList = 102, RULE_macro = 103, 
            RULE_clangAttribute = 104, RULE_clangAttributeArgument = 105, 
            RULE_swiftAliasExpression = 106, RULE_swiftSelectorExpression = 107, 
            RULE_swiftSelector = 108, RULE_apiAvailableOsVersion = 109, 
            RULE_version = 110, RULE_arrayInitializer = 111, RULE_structInitializer = 112, 
            RULE_initializerList = 113, RULE_typeName = 114, RULE_abstractDeclarator = 115, 
            RULE_abstractDeclaratorSuffix = 116, RULE_parameterDeclarationList = 117, 
            RULE_parameterDeclaration = 118, RULE_statement = 119, RULE_labeledStatement = 120, 
            RULE_rangeExpression = 121, RULE_compoundStatement = 122, RULE_selectionStatement = 123, 
            RULE_switchStatement = 124, RULE_switchBlock = 125, RULE_switchSection = 126, 
            RULE_switchLabel = 127, RULE_iterationStatement = 128, RULE_whileStatement = 129, 
            RULE_doStatement = 130, RULE_forStatement = 131, RULE_forLoopInitializer = 132, 
            RULE_forInStatement = 133, RULE_jumpStatement = 134, RULE_expressions = 135, 
            RULE_expression = 136, RULE_assignmentOperator = 137, RULE_castExpression = 138, 
            RULE_initializer = 139, RULE_constantExpression = 140, RULE_unaryExpression = 141, 
            RULE_unaryOperator = 142, RULE_postfixExpression = 143, RULE_postfix = 144, 
            RULE_argumentExpressionList = 145, RULE_argumentExpression = 146, 
            RULE_primaryExpression = 147, RULE_constant = 148, RULE_stringLiteral = 149, 
            RULE_identifier = 150

	public
	static let ruleNames: [String] = [
		"translationUnit", "topLevelDeclaration", "importDeclaration", "classInterface", 
		"categoryInterface", "classImplementation", "categoryImplementation", 
		"genericTypeSpecifier", "genericConformanceList", "genericConformance", 
		"protocolDeclaration", "protocolDeclarationSection", "protocolDeclarationList", 
		"classDeclarationList", "protocolList", "propertyDeclaration", "propertyAttributesList", 
		"propertyAttribute", "protocolName", "instanceVariables", "visibilitySection", 
		"accessModifier", "interfaceDeclarationList", "classMethodDeclaration", 
		"instanceMethodDeclaration", "methodDeclaration", "implementationDefinitionList", 
		"classMethodDefinition", "instanceMethodDefinition", "methodDefinition", 
		"methodSelector", "keywordDeclarator", "selector", "methodType", "propertyImplementation", 
		"propertySynthesizeList", "propertySynthesizeItem", "blockType", "genericsSpecifierList", 
		"genericsSpecifier", "dictionaryExpression", "dictionaryPair", "arrayExpression", 
		"boxExpression", "blockParameters", "typeVariableDeclaratorOrName", "blockExpression", 
		"messageExpression", "receiver", "messageSelector", "keywordArgument", 
		"keywordArgumentType", "selectorExpression", "selectorName", "protocolExpression", 
		"encodeExpression", "typeVariableDeclarator", "throwStatement", "tryBlock", 
		"catchStatement", "synchronizedStatement", "autoreleaseStatement", "functionDeclaration", 
		"functionDefinition", "functionSignature", "attribute", "attributeName", 
		"attributeParameters", "attributeParameterList", "attributeParameter", 
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
		 	setState(305)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1295065285207669298) != 0) || ((Int64((_la - 65)) & ~0x3f) == 0 && ((Int64(1) << (_la - 65)) & 4611686018427322391) != 0) || _la == ObjectiveCParser.Tokens.IDENTIFIER.rawValue || _la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(302)
		 		try topLevelDeclaration()


		 		setState(307)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(308)
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
		 	setState(322)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(310)
		 		try importDeclaration()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(311)
		 		try functionDeclaration()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(312)
		 		try declaration()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(313)
		 		try classInterface()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(314)
		 		try classImplementation()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(315)
		 		try categoryInterface()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(316)
		 		try categoryImplementation()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(317)
		 		try protocolDeclaration()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(318)
		 		try protocolDeclarationList()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(319)
		 		try classDeclarationList()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(320)
		 		try functionDefinition()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(321)
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
		 	setState(324)
		 	try match(ObjectiveCParser.Tokens.IMPORT.rawValue)
		 	setState(325)
		 	try identifier()
		 	setState(326)
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
			open
			func protocolList() -> [ProtocolListContext] {
				return getRuleContexts(ProtocolListContext.self)
			}
			open
			func protocolList(_ i: Int) -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, i)
			}
			open
			func genericConformanceList() -> [GenericConformanceListContext] {
				return getRuleContexts(GenericConformanceListContext.self)
			}
			open
			func genericConformanceList(_ i: Int) -> GenericConformanceListContext? {
				return getRuleContext(GenericConformanceListContext.self, i)
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
		 	setState(329)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue) {
		 		setState(328)
		 		try match(ObjectiveCParser.Tokens.IB_DESIGNABLE.rawValue)

		 	}

		 	setState(331)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(332)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(335)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(333)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(334)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassInterfaceContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(346)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(337)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(340)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,4, _ctx)) {
		 		case 1:
		 			setState(338)
		 			try protocolList()

		 			break
		 		case 2:
		 			setState(339)
		 			try genericConformanceList()

		 			break
		 		default: break
		 		}
		 		setState(342)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)


		 		setState(348)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
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
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 2341867683064053249) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
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
		 	setState(357)
		 	try match(ObjectiveCParser.Tokens.INTERFACE.rawValue)
		 	setState(358)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryInterfaceContext.self).className = assignmentValue
		 	     }()

		 	setState(359)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(361)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(360)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(CategoryInterfaceContext.self).categoryName = assignmentValue
		 		     }()


		 	}

		 	setState(363)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(368)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(364)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(365)
		 		try protocolList()
		 		setState(366)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(371)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(370)
		 		try instanceVariables()

		 	}

		 	setState(374)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 72)) & ~0x3f) == 0 && ((Int64(1) << (_la - 72)) & 2341867683064053249) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
		 		setState(373)
		 		try interfaceDeclarationList()

		 	}

		 	setState(376)
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
		 	setState(378)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(379)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(ClassImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(382)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(380)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(381)
		 		try {
		 				let assignmentValue = try identifier()
		 				_localctx.castdown(ClassImplementationContext.self).superclassName = assignmentValue
		 		     }()


		 	}

		 	setState(385)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(384)
		 		try instanceVariables()

		 	}

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
		 	setState(392)
		 	try match(ObjectiveCParser.Tokens.IMPLEMENTATION.rawValue)
		 	setState(393)
		 	try {
		 			let assignmentValue = try genericTypeSpecifier()
		 			_localctx.castdown(CategoryImplementationContext.self).className = assignmentValue
		 	     }()

		 	setState(394)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(395)
		 	try {
		 			let assignmentValue = try identifier()
		 			_localctx.castdown(CategoryImplementationContext.self).categoryName = assignmentValue
		 	     }()

		 	setState(396)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(398)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2447986789814516274) != 0) || ((Int64((_la - 78)) & ~0x3f) == 0 && ((Int64(1) << (_la - 78)) & 36591682547875833) != 0) || _la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 		setState(397)
		 		try implementationDefinitionList()

		 	}

		 	setState(400)
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
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func protocolList() -> ProtocolListContext? {
				return getRuleContext(ProtocolListContext.self, 0)
			}
			open
			func genericConformanceList() -> GenericConformanceListContext? {
				return getRuleContext(GenericConformanceListContext.self, 0)
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
		 	setState(402)
		 	try identifier()
		 	setState(410)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,17,_ctx)) {
		 	case 1:
		 		setState(403)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(406)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,16, _ctx)) {
		 		case 1:
		 			setState(404)
		 			try protocolList()

		 			break
		 		case 2:
		 			setState(405)
		 			try genericConformanceList()

		 			break
		 		default: break
		 		}
		 		setState(408)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

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

	public class GenericConformanceListContext: ParserRuleContext {
			open
			func genericConformance() -> [GenericConformanceContext] {
				return getRuleContexts(GenericConformanceContext.self)
			}
			open
			func genericConformance(_ i: Int) -> GenericConformanceContext? {
				return getRuleContext(GenericConformanceContext.self, i)
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
			return ObjectiveCParser.RULE_genericConformanceList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterGenericConformanceList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitGenericConformanceList(self)
			}
		}
	}
	@discardableResult
	 open func genericConformanceList() throws -> GenericConformanceListContext {
		var _localctx: GenericConformanceListContext
		_localctx = GenericConformanceListContext(_ctx, getState())
		try enterRule(_localctx, 16, ObjectiveCParser.RULE_genericConformanceList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(412)
		 	try genericConformance()
		 	setState(417)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(413)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(414)
		 		try genericConformance()


		 		setState(419)
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

	public class GenericConformanceContext: ParserRuleContext {
		open var genericsType: DeclarationSpecifiersContext!
		open var genericsParentType: DeclarationSpecifiersContext!
			open
			func declarationSpecifiers() -> [DeclarationSpecifiersContext] {
				return getRuleContexts(DeclarationSpecifiersContext.self)
			}
			open
			func declarationSpecifiers(_ i: Int) -> DeclarationSpecifiersContext? {
				return getRuleContext(DeclarationSpecifiersContext.self, i)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCParser.RULE_genericConformance
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterGenericConformance(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitGenericConformance(self)
			}
		}
	}
	@discardableResult
	 open func genericConformance() throws -> GenericConformanceContext {
		var _localctx: GenericConformanceContext
		_localctx = GenericConformanceContext(_ctx, getState())
		try enterRule(_localctx, 18, ObjectiveCParser.RULE_genericConformance)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(420)
		 	try {
		 			let assignmentValue = try declarationSpecifiers()
		 			_localctx.castdown(GenericConformanceContext.self).genericsType = assignmentValue
		 	     }()

		 	setState(423)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(421)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(422)
		 		try {
		 				let assignmentValue = try declarationSpecifiers()
		 				_localctx.castdown(GenericConformanceContext.self).genericsParentType = assignmentValue
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
		try enterRule(_localctx, 20, ObjectiveCParser.RULE_protocolDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(426)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(425)
		 		try macro()

		 	}

		 	setState(428)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(429)
		 	try protocolName()
		 	setState(434)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LT.rawValue) {
		 		setState(430)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(431)
		 		try protocolList()
		 		setState(432)
		 		try match(ObjectiveCParser.Tokens.GT.rawValue)

		 	}

		 	setState(439)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780600822322) != 0) || ((Int64((_la - 70)) & ~0x3f) == 0 && ((Int64(1) << (_la - 70)) & -9079273341453338587) != 0) || ((Int64((_la - 140)) & ~0x3f) == 0 && ((Int64(1) << (_la - 140)) & 6291457) != 0)) {
		 		setState(436)
		 		try protocolDeclarationSection()


		 		setState(441)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(442)
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
		try enterRule(_localctx, 22, ObjectiveCParser.RULE_protocolDeclarationSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(456)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .OPTIONAL:fallthrough
		 	case .REQUIRED:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(444)
		 		_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.OPTIONAL.rawValue || _la == ObjectiveCParser.Tokens.REQUIRED.rawValue)) {
		 			_localctx.castdown(ProtocolDeclarationSectionContext.self).modifier = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(448)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,23,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(445)
		 				try interfaceDeclarationList()

		 		 
		 			}
		 			setState(450)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,23,_ctx)
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
		 		setState(452); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(451)
		 				try interfaceDeclarationList()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(454); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,24,_ctx)
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
		try enterRule(_localctx, 24, ObjectiveCParser.RULE_protocolDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(458)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(459)
		 	try protocolList()
		 	setState(460)
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
		try enterRule(_localctx, 26, ObjectiveCParser.RULE_classDeclarationList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(462)
		 	try match(ObjectiveCParser.Tokens.CLASS.rawValue)
		 	setState(463)
		 	try genericTypeSpecifier()
		 	setState(468)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(464)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(465)
		 		try genericTypeSpecifier()


		 		setState(470)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(471)
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
		try enterRule(_localctx, 28, ObjectiveCParser.RULE_protocolList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(473)
		 	try protocolName()
		 	setState(478)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(474)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(475)
		 		try protocolName()


		 		setState(480)
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
		try enterRule(_localctx, 30, ObjectiveCParser.RULE_propertyDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(481)
		 	try match(ObjectiveCParser.Tokens.PROPERTY.rawValue)
		 	setState(486)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(482)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(483)
		 		try propertyAttributesList()
		 		setState(484)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	}

		 	setState(489)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,29,_ctx)) {
		 	case 1:
		 		setState(488)
		 		try ibOutletQualifier()

		 		break
		 	default: break
		 	}
		 	setState(492)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,30,_ctx)) {
		 	case 1:
		 		setState(491)
		 		try match(ObjectiveCParser.Tokens.IB_INSPECTABLE.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(494)
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
		try enterRule(_localctx, 32, ObjectiveCParser.RULE_propertyAttributesList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(496)
		 	try propertyAttribute()
		 	setState(501)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(497)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(498)
		 		try propertyAttribute()


		 		setState(503)
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
		try enterRule(_localctx, 34, ObjectiveCParser.RULE_propertyAttribute)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(524)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,32, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(504)
		 		try match(ObjectiveCParser.Tokens.ATOMIC.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(505)
		 		try match(ObjectiveCParser.Tokens.NONATOMIC.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(506)
		 		try match(ObjectiveCParser.Tokens.STRONG.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(507)
		 		try match(ObjectiveCParser.Tokens.WEAK.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(508)
		 		try match(ObjectiveCParser.Tokens.RETAIN.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(509)
		 		try match(ObjectiveCParser.Tokens.ASSIGN.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(510)
		 		try match(ObjectiveCParser.Tokens.UNSAFE_UNRETAINED.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(511)
		 		try match(ObjectiveCParser.Tokens.COPY.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(512)
		 		try match(ObjectiveCParser.Tokens.READONLY.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(513)
		 		try match(ObjectiveCParser.Tokens.READWRITE.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(514)
		 		try match(ObjectiveCParser.Tokens.GETTER.rawValue)
		 		setState(515)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(516)
		 		try identifier()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(517)
		 		try match(ObjectiveCParser.Tokens.SETTER.rawValue)
		 		setState(518)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(519)
		 		try identifier()
		 		setState(520)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break
		 	case 13:
		 		try enterOuterAlt(_localctx, 13)
		 		setState(522)
		 		try nullabilitySpecifier()

		 		break
		 	case 14:
		 		try enterOuterAlt(_localctx, 14)
		 		setState(523)
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
		try enterRule(_localctx, 36, ObjectiveCParser.RULE_protocolName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(534)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LT:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(526)
		 		try match(ObjectiveCParser.Tokens.LT.rawValue)
		 		setState(527)
		 		try protocolList()
		 		setState(528)
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
		 		setState(531)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,33,_ctx)) {
		 		case 1:
		 			setState(530)
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
		 		setState(533)
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
		try enterRule(_localctx, 38, ObjectiveCParser.RULE_instanceVariables)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(536)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(540)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 68)) & ~0x3f) == 0 && ((Int64(1) << (_la - 68)) & 576394781605748841) != 0) || _la == ObjectiveCParser.Tokens.IDENTIFIER.rawValue) {
		 		setState(537)
		 		try visibilitySection()


		 		setState(542)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(543)
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
		try enterRule(_localctx, 40, ObjectiveCParser.RULE_visibilitySection)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(557)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PACKAGE:fallthrough
		 	case .PRIVATE:fallthrough
		 	case .PROTECTED:fallthrough
		 	case .PUBLIC:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(545)
		 		try accessModifier()
		 		setState(549)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,36,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(546)
		 				try fieldDeclaration()

		 		 
		 			}
		 			setState(551)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,36,_ctx)
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
		 		setState(553); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(552)
		 				try fieldDeclaration()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(555); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,37,_ctx)
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
		try enterRule(_localctx, 42, ObjectiveCParser.RULE_accessModifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(559)
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
		try enterRule(_localctx, 44, ObjectiveCParser.RULE_interfaceDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(567); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(567)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,39, _ctx)) {
		 			case 1:
		 				setState(561)
		 				try declaration()

		 				break
		 			case 2:
		 				setState(562)
		 				try classMethodDeclaration()

		 				break
		 			case 3:
		 				setState(563)
		 				try instanceMethodDeclaration()

		 				break
		 			case 4:
		 				setState(564)
		 				try propertyDeclaration()

		 				break
		 			case 5:
		 				setState(565)
		 				try functionDeclaration()

		 				break
		 			case 6:
		 				setState(566)
		 				try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 				break
		 			default: break
		 			}

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(569); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,40,_ctx)
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
		try enterRule(_localctx, 46, ObjectiveCParser.RULE_classMethodDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(571)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(572)
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
		try enterRule(_localctx, 48, ObjectiveCParser.RULE_instanceMethodDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(574)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(575)
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
		try enterRule(_localctx, 50, ObjectiveCParser.RULE_methodDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(578)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(577)
		 		try methodType()

		 	}

		 	setState(580)
		 	try methodSelector()
		 	setState(584)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(581)
		 		try macro()


		 		setState(586)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(587)
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
		try enterRule(_localctx, 52, ObjectiveCParser.RULE_implementationDefinitionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(594) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(594)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,43, _ctx)) {
		 		case 1:
		 			setState(589)
		 			try functionDefinition()

		 			break
		 		case 2:
		 			setState(590)
		 			try declaration()

		 			break
		 		case 3:
		 			setState(591)
		 			try classMethodDefinition()

		 			break
		 		case 4:
		 			setState(592)
		 			try instanceMethodDefinition()

		 			break
		 		case 5:
		 			setState(593)
		 			try propertyImplementation()

		 			break
		 		default: break
		 		}

		 		setState(596); 
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
		try enterRule(_localctx, 54, ObjectiveCParser.RULE_classMethodDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(598)
		 	try match(ObjectiveCParser.Tokens.ADD.rawValue)
		 	setState(599)
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
		try enterRule(_localctx, 56, ObjectiveCParser.RULE_instanceMethodDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(601)
		 	try match(ObjectiveCParser.Tokens.SUB.rawValue)
		 	setState(602)
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
		try enterRule(_localctx, 58, ObjectiveCParser.RULE_methodDefinition)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(605)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(604)
		 		try methodType()

		 	}

		 	setState(607)
		 	try methodSelector()
		 	setState(609)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
		 		setState(608)
		 		try initDeclaratorList()

		 	}

		 	setState(612)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.SEMI.rawValue) {
		 		setState(611)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 	}

		 	setState(614)
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
		try enterRule(_localctx, 60, ObjectiveCParser.RULE_methodSelector)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	setState(626)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,50, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(616)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(618); 
		 		try _errHandler.sync(self)
		 		_alt = 1;
		 		repeat {
		 			switch (_alt) {
		 			case 1:
		 				setState(617)
		 				try keywordDeclarator()


		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 			setState(620); 
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,48,_ctx)
		 		} while (_alt != 2 && _alt !=  ATN.INVALID_ALT_NUMBER)
		 		setState(624)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(622)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(623)
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
		try enterRule(_localctx, 62, ObjectiveCParser.RULE_keywordDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(629)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(628)
		 		try selector()

		 	}

		 	setState(631)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(635)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(632)
		 		try methodType()


		 		setState(637)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(639)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,53,_ctx)) {
		 	case 1:
		 		setState(638)
		 		try arcBehaviourSpecifier()

		 		break
		 	default: break
		 	}
		 	setState(641)
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
		try enterRule(_localctx, 64, ObjectiveCParser.RULE_selector)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(645)
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
		 		setState(643)
		 		try identifier()

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(644)
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
		try enterRule(_localctx, 66, ObjectiveCParser.RULE_methodType)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(647)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(648)
		 	try typeName()
		 	setState(649)
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
		try enterRule(_localctx, 68, ObjectiveCParser.RULE_propertyImplementation)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(659)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .SYNTHESIZE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(651)
		 		try match(ObjectiveCParser.Tokens.SYNTHESIZE.rawValue)
		 		setState(652)
		 		try propertySynthesizeList()
		 		setState(653)
		 		try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 		break

		 	case .DYNAMIC:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(655)
		 		try match(ObjectiveCParser.Tokens.DYNAMIC.rawValue)
		 		setState(656)
		 		try propertySynthesizeList()
		 		setState(657)
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
		try enterRule(_localctx, 70, ObjectiveCParser.RULE_propertySynthesizeList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(661)
		 	try propertySynthesizeItem()
		 	setState(666)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(662)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(663)
		 		try propertySynthesizeItem()


		 		setState(668)
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
		try enterRule(_localctx, 72, ObjectiveCParser.RULE_propertySynthesizeItem)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(669)
		 	try identifier()
		 	setState(672)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(670)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(671)
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
		try enterRule(_localctx, 74, ObjectiveCParser.RULE_blockType)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(675)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(674)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(678)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,59,_ctx)) {
		 	case 1:
		 		setState(677)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(680)
		 	try typeSpecifier(0)
		 	setState(682)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(681)
		 		try nullabilitySpecifier()

		 	}

		 	setState(684)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(686)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue) {
		 		setState(685)
		 		try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 	}

		 	setState(688)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(690)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(689)
		 		try nullabilitySpecifier()

		 	}

		 	setState(692)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(694)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(693)
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

	public class GenericsSpecifierListContext: ParserRuleContext {
			open
			func LT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.LT.rawValue, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.GT.rawValue, 0)
			}
			open
			func genericsSpecifier() -> [GenericsSpecifierContext] {
				return getRuleContexts(GenericsSpecifierContext.self)
			}
			open
			func genericsSpecifier(_ i: Int) -> GenericsSpecifierContext? {
				return getRuleContext(GenericsSpecifierContext.self, i)
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
			return ObjectiveCParser.RULE_genericsSpecifierList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.enterGenericsSpecifierList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCParserListener {
				listener.exitGenericsSpecifierList(self)
			}
		}
	}
	@discardableResult
	 open func genericsSpecifierList() throws -> GenericsSpecifierListContext {
		var _localctx: GenericsSpecifierListContext
		_localctx = GenericsSpecifierListContext(_ctx, getState())
		try enterRule(_localctx, 76, ObjectiveCParser.RULE_genericsSpecifierList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(696)
		 	try match(ObjectiveCParser.Tokens.LT.rawValue)
		 	setState(705)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143771404675600) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960049876919) != 0)) {
		 		setState(697)
		 		try genericsSpecifier()
		 		setState(702)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(698)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(699)
		 			try genericsSpecifier()


		 			setState(704)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(707)
		 	try match(ObjectiveCParser.Tokens.GT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class GenericsSpecifierContext: ParserRuleContext {
		open var genericsType: TypeSpecifierContext!
		open var genericsConformanceType: TypeSpecifierContext!
			open
			func typeSpecifier() -> [TypeSpecifierContext] {
				return getRuleContexts(TypeSpecifierContext.self)
			}
			open
			func typeSpecifier(_ i: Int) -> TypeSpecifierContext? {
				return getRuleContext(TypeSpecifierContext.self, i)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.COLON.rawValue, 0)
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
		try enterRule(_localctx, 78, ObjectiveCParser.RULE_genericsSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(709)
		 	try {
		 			let assignmentValue = try typeSpecifier(0)
		 			_localctx.castdown(GenericsSpecifierContext.self).genericsType = assignmentValue
		 	     }()

		 	setState(712)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COLON.rawValue) {
		 		setState(710)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(711)
		 		try {
		 				let assignmentValue = try typeSpecifier(0)
		 				_localctx.castdown(GenericsSpecifierContext.self).genericsConformanceType = assignmentValue
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
		try enterRule(_localctx, 80, ObjectiveCParser.RULE_dictionaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(714)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(715)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(727)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(716)
		 		try dictionaryPair()
		 		setState(721)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,67,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(717)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(718)
		 				try dictionaryPair()

		 		 
		 			}
		 			setState(723)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,67,_ctx)
		 		}
		 		setState(725)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(724)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(729)
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
		try enterRule(_localctx, 82, ObjectiveCParser.RULE_dictionaryPair)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(731)
		 	try castExpression()
		 	setState(732)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(733)
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
		try enterRule(_localctx, 84, ObjectiveCParser.RULE_arrayExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(735)
		 	try match(ObjectiveCParser.Tokens.AT.rawValue)
		 	setState(736)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(741)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(737)
		 		try expressions()
		 		setState(739)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(738)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(743)
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
		try enterRule(_localctx, 86, ObjectiveCParser.RULE_boxExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(755)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,73, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(745)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(746)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(747)
		 		try expression(0)
		 		setState(748)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(750)
		 		try match(ObjectiveCParser.Tokens.AT.rawValue)
		 		setState(753)
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
		 			setState(751)
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
		 			setState(752)
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
		try enterRule(_localctx, 88, ObjectiveCParser.RULE_blockParameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(757)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(769)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(760)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,74, _ctx)) {
		 		case 1:
		 			setState(758)
		 			try typeVariableDeclaratorOrName()

		 			break
		 		case 2:
		 			setState(759)
		 			try match(ObjectiveCParser.Tokens.VOID.rawValue)

		 			break
		 		default: break
		 		}
		 		setState(766)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(762)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(763)
		 			try typeVariableDeclaratorOrName()


		 			setState(768)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 	}

		 	setState(771)
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
		try enterRule(_localctx, 90, ObjectiveCParser.RULE_typeVariableDeclaratorOrName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(775)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,77, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(773)
		 		try typeVariableDeclarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(774)
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
		try enterRule(_localctx, 92, ObjectiveCParser.RULE_blockExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(777)
		 	try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 	setState(779)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,78,_ctx)) {
		 	case 1:
		 		setState(778)
		 		try typeSpecifier(0)

		 		break
		 	default: break
		 	}
		 	setState(782)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64((_la - 99)) & ~0x3f) == 0 && ((Int64(1) << (_la - 99)) & 15) != 0)) {
		 		setState(781)
		 		try nullabilitySpecifier()

		 	}

		 	setState(785)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(784)
		 		try blockParameters()

		 	}

		 	setState(787)
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
		try enterRule(_localctx, 94, ObjectiveCParser.RULE_messageExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(789)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(790)
		 	try receiver()
		 	setState(791)
		 	try messageSelector()
		 	setState(792)
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
		try enterRule(_localctx, 96, ObjectiveCParser.RULE_receiver)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(796)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,81, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(794)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(795)
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
		try enterRule(_localctx, 98, ObjectiveCParser.RULE_messageSelector)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(804)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,83, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(798)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(800) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(799)
		 			try keywordArgument()


		 			setState(802); 
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
		try enterRule(_localctx, 100, ObjectiveCParser.RULE_keywordArgument)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(807)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 		setState(806)
		 		try selector()

		 	}

		 	setState(809)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(810)
		 	try keywordArgumentType()
		 	setState(815)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(811)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(812)
		 		try keywordArgumentType()


		 		setState(817)
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
		try enterRule(_localctx, 102, ObjectiveCParser.RULE_keywordArgumentType)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(818)
		 	try expressions()
		 	setState(820)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,86,_ctx)) {
		 	case 1:
		 		setState(819)
		 		try nullabilitySpecifier()

		 		break
		 	default: break
		 	}
		 	setState(826)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LBRACE.rawValue) {
		 		setState(822)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(823)
		 		try initializerList()
		 		setState(824)
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
		try enterRule(_localctx, 104, ObjectiveCParser.RULE_selectorExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(828)
		 	try match(ObjectiveCParser.Tokens.SELECTOR.rawValue)
		 	setState(829)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(830)
		 	try selectorName()
		 	setState(831)
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
		try enterRule(_localctx, 106, ObjectiveCParser.RULE_selectorName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(843)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,90, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(833)
		 		try selector()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(834)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(839) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(836)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763732496384) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 				setState(835)
		 				try selector()

		 			}

		 			setState(838)
		 			try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 			setState(841); 
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
		try enterRule(_localctx, 108, ObjectiveCParser.RULE_protocolExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(845)
		 	try match(ObjectiveCParser.Tokens.PROTOCOL.rawValue)
		 	setState(846)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(847)
		 	try protocolName()
		 	setState(848)
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
		try enterRule(_localctx, 110, ObjectiveCParser.RULE_encodeExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(850)
		 	try match(ObjectiveCParser.Tokens.ENCODE.rawValue)
		 	setState(851)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(852)
		 	try typeName()
		 	setState(853)
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
		try enterRule(_localctx, 112, ObjectiveCParser.RULE_typeVariableDeclarator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(855)
		 	try declarationSpecifiers()
		 	setState(856)
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
		try enterRule(_localctx, 114, ObjectiveCParser.RULE_throwStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(865)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,91, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(858)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(859)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(860)
		 		try identifier()
		 		setState(861)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(863)
		 		try match(ObjectiveCParser.Tokens.THROW.rawValue)
		 		setState(864)
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
		try enterRule(_localctx, 116, ObjectiveCParser.RULE_tryBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(867)
		 	try match(ObjectiveCParser.Tokens.TRY.rawValue)
		 	setState(868)
		 	try {
		 			let assignmentValue = try compoundStatement()
		 			_localctx.castdown(TryBlockContext.self).tryStatement = assignmentValue
		 	     }()

		 	setState(872)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CATCH.rawValue) {
		 		setState(869)
		 		try catchStatement()


		 		setState(874)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(877)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.FINALLY.rawValue) {
		 		setState(875)
		 		try match(ObjectiveCParser.Tokens.FINALLY.rawValue)
		 		setState(876)
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
		try enterRule(_localctx, 118, ObjectiveCParser.RULE_catchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(879)
		 	try match(ObjectiveCParser.Tokens.CATCH.rawValue)
		 	setState(880)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(881)
		 	try typeVariableDeclarator()
		 	setState(882)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(883)
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
		try enterRule(_localctx, 120, ObjectiveCParser.RULE_synchronizedStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(885)
		 	try match(ObjectiveCParser.Tokens.SYNCHRONIZED.rawValue)
		 	setState(886)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(887)
		 	try expression(0)
		 	setState(888)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(889)
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
		try enterRule(_localctx, 122, ObjectiveCParser.RULE_autoreleaseStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(891)
		 	try match(ObjectiveCParser.Tokens.AUTORELEASEPOOL.rawValue)
		 	setState(892)
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
		try enterRule(_localctx, 124, ObjectiveCParser.RULE_functionDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(894)
		 	try functionSignature()
		 	setState(895)
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
		try enterRule(_localctx, 126, ObjectiveCParser.RULE_functionDefinition)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(897)
		 	try functionSignature()
		 	setState(898)
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
		try enterRule(_localctx, 128, ObjectiveCParser.RULE_functionSignature)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(901)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,94,_ctx)) {
		 	case 1:
		 		setState(900)
		 		try declarationSpecifiers()

		 		break
		 	default: break
		 	}
		 	setState(903)
		 	try identifier()

		 	setState(904)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(906)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 		setState(905)
		 		try parameterList()

		 	}

		 	setState(908)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)

		 	setState(911)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(910)
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
		try enterRule(_localctx, 130, ObjectiveCParser.RULE_attribute)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(913)
		 	try attributeName()
		 	setState(915)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 		setState(914)
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
		try enterRule(_localctx, 132, ObjectiveCParser.RULE_attributeName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(919)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(917)
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
		 		setState(918)
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
		try enterRule(_localctx, 134, ObjectiveCParser.RULE_attributeParameters)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(921)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(923)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853408) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 66584579) != 0)) {
		 		setState(922)
		 		try attributeParameterList()

		 	}

		 	setState(925)
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
		try enterRule(_localctx, 136, ObjectiveCParser.RULE_attributeParameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(927)
		 	try attributeParameter()
		 	setState(932)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(928)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(929)
		 		try attributeParameter()


		 		setState(934)
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
		try enterRule(_localctx, 138, ObjectiveCParser.RULE_attributeParameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(939)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,101, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(935)
		 		try attribute()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(936)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(937)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(938)
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
		try enterRule(_localctx, 140, ObjectiveCParser.RULE_attributeParameterAssignment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(941)
		 	try attributeName()
		 	setState(942)
		 	try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 	setState(946)
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
		 		setState(943)
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
		 		setState(944)
		 		try attributeName()

		 		break

		 	case .STRING_START:
		 		setState(945)
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
		try enterRule(_localctx, 142, ObjectiveCParser.RULE_declaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(952)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,103, _ctx)) {
		 	case 1:
		 		setState(948)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		setState(949)
		 		try enumDeclaration()

		 		break
		 	case 3:
		 		setState(950)
		 		try varDeclaration()

		 		break
		 	case 4:
		 		setState(951)
		 		try typedefDeclaration()

		 		break
		 	default: break
		 	}
		 	setState(955)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(954)
		 		try macro()

		 	}

		 	setState(957)
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
		try enterRule(_localctx, 144, ObjectiveCParser.RULE_functionCallExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(960)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(959)
		 		try attributeSpecifier()

		 	}

		 	setState(962)
		 	try identifier()
		 	setState(964)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(963)
		 		try attributeSpecifier()

		 	}

		 	setState(966)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(967)
		 	try declarator()
		 	setState(968)
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
		try enterRule(_localctx, 146, ObjectiveCParser.RULE_enumDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(971)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(970)
		 		try attributeSpecifier()

		 	}

		 	setState(974)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.TYPEDEF.rawValue) {
		 		setState(973)
		 		try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)

		 	}

		 	setState(980)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ENUM:
		 		setState(976)
		 		try enumSpecifier()
		 		setState(977)
		 		try identifier()

		 		break
		 	case .NS_ENUM:fallthrough
		 	case .NS_CLOSED_ENUM:fallthrough
		 	case .NS_ERROR_ENUM:fallthrough
		 	case .NS_OPTIONS:
		 		setState(979)
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
		try enterRule(_localctx, 148, ObjectiveCParser.RULE_varDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(982)
		 	try declarationSpecifiers()
		 	setState(984)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,110,_ctx)) {
		 	case 1:
		 		setState(983)
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
		try enterRule(_localctx, 150, ObjectiveCParser.RULE_typedefDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(987)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ATTRIBUTE.rawValue) {
		 		setState(986)
		 		try attributeSpecifier()

		 	}

		 	setState(989)
		 	try match(ObjectiveCParser.Tokens.TYPEDEF.rawValue)
		 	setState(990)
		 	try declarationSpecifiers()
		 	setState(992)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,112,_ctx)) {
		 	case 1:
		 		setState(991)
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
		try enterRule(_localctx, 152, ObjectiveCParser.RULE_typeDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(994)
		 	try declarator()
		 	setState(999)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(995)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(996)
		 		try declarator()


		 		setState(1001)
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
		try enterRule(_localctx, 154, ObjectiveCParser.RULE_declarationSpecifiers)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1012)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,115,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1010)
		 			try _errHandler.sync(self)
		 			switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 			case .AUTO:fallthrough
		 			case .EXTERN:fallthrough
		 			case .REGISTER:fallthrough
		 			case .STATIC:
		 				setState(1002)
		 				try storageClassSpecifier()

		 				break

		 			case .ATTRIBUTE:
		 				setState(1003)
		 				try attributeSpecifier()

		 				break
		 			case .AUTORELEASING_QUALIFIER:fallthrough
		 			case .STRONG_QUALIFIER:fallthrough
		 			case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
		 			case .WEAK_QUALIFIER:
		 				setState(1004)
		 				try arcBehaviourSpecifier()

		 				break
		 			case .NULL_UNSPECIFIED:fallthrough
		 			case .NULLABLE:fallthrough
		 			case .NONNULL:fallthrough
		 			case .NULL_RESETTABLE:
		 				setState(1005)
		 				try nullabilitySpecifier()

		 				break
		 			case .IB_OUTLET:fallthrough
		 			case .IB_OUTLET_COLLECTION:
		 				setState(1006)
		 				try ibOutletQualifier()

		 				break

		 			case .NS_NOESCAPE:
		 				setState(1007)
		 				try match(ObjectiveCParser.Tokens.NS_NOESCAPE.rawValue)

		 				break
		 			case .INLINE:fallthrough
		 			case .BLOCK:fallthrough
		 			case .BRIDGE:fallthrough
		 			case .BRIDGE_RETAINED:fallthrough
		 			case .BRIDGE_TRANSFER:fallthrough
		 			case .KINDOF:fallthrough
		 			case .NS_INLINE:
		 				setState(1008)
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
		 				setState(1009)
		 				try typeQualifier()

		 				break
		 			default:
		 				throw ANTLRException.recognition(e: NoViableAltException(self))
		 			}
		 	 
		 		}
		 		setState(1014)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,115,_ctx)
		 	}
		 	setState(1015)
		 	try typeSpecifier(0)
		 	setState(1019)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,116,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1016)
		 			try attributeSpecifier()

		 	 
		 		}
		 		setState(1021)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,116,_ctx)
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
		try enterRule(_localctx, 156, ObjectiveCParser.RULE_attributeSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1022)
		 	try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 	setState(1023)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1024)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1025)
		 	try attribute()
		 	setState(1030)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1026)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1027)
		 		try attribute()


		 		setState(1032)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1033)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1034)
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
		try enterRule(_localctx, 158, ObjectiveCParser.RULE_initDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1036)
		 	try initDeclarator()
		 	setState(1041)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1037)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1038)
		 		try initDeclarator()


		 		setState(1043)
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
		try enterRule(_localctx, 160, ObjectiveCParser.RULE_initDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1044)
		 	try declarator()
		 	setState(1047)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1045)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1046)
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
		try enterRule(_localctx, 162, ObjectiveCParser.RULE_structOrUnionSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1049)
		 	_la = try _input.LA(1)
		 	if (!(_la == ObjectiveCParser.Tokens.STRUCT.rawValue || _la == ObjectiveCParser.Tokens.UNION.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1062)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,122, _ctx)) {
		 	case 1:
		 		setState(1050)
		 		try identifier()

		 		break
		 	case 2:
		 		setState(1052)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1051)
		 			try identifier()

		 		}

		 		setState(1054)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1056) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1055)
		 			try fieldDeclaration()


		 			setState(1058); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0))
		 		setState(1060)
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
		try enterRule(_localctx, 164, ObjectiveCParser.RULE_fieldDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1064)
		 	try declarationSpecifiers()
		 	setState(1065)
		 	try fieldDeclaratorList()
		 	setState(1067)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573968052592575) != 0)) {
		 		setState(1066)
		 		try macro()

		 	}

		 	setState(1069)
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
		try enterRule(_localctx, 166, ObjectiveCParser.RULE_ibOutletQualifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1077)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IB_OUTLET_COLLECTION:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1071)
		 		try match(ObjectiveCParser.Tokens.IB_OUTLET_COLLECTION.rawValue)
		 		setState(1072)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1073)
		 		try identifier()
		 		setState(1074)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break

		 	case .IB_OUTLET:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1076)
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
		 	setState(1079)
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
		 	setState(1081)
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
		 	setState(1083)
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
		 	setState(1085)
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
		 	setState(1091)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1087)
		 		try match(ObjectiveCParser.Tokens.CONST.rawValue)

		 		break

		 	case .VOLATILE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1088)
		 		try match(ObjectiveCParser.Tokens.VOLATILE.rawValue)

		 		break

		 	case .RESTRICT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1089)
		 		try match(ObjectiveCParser.Tokens.RESTRICT.rawValue)

		 		break
		 	case .BYCOPY:fallthrough
		 	case .BYREF:fallthrough
		 	case .IN:fallthrough
		 	case .INOUT:fallthrough
		 	case .ONEWAY:fallthrough
		 	case .OUT:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1090)
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
		 	setState(1093)
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
		try enterRule(_localctx, 180, ObjectiveCParser.RULE_typeSpecifierModifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1095)
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
			func ID() -> TerminalNode? {
				return getToken(ObjectiveCParser.Tokens.ID.rawValue, 0)
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
			func genericTypeSpecifier() -> GenericTypeSpecifierContext? {
				return getRuleContext(GenericTypeSpecifierContext.self, 0)
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
		let _startState: Int = 182
		try enterRecursionRule(_localctx, 182, ObjectiveCParser.RULE_typeSpecifier, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1220)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,146, _ctx)) {
			case 1:
				setState(1098)
				try match(ObjectiveCParser.Tokens.VOID.rawValue)
				setState(1102)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1099)
						try typeQualifier()

				 
					}
					setState(1104)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,126,_ctx)
				}

				break
			case 2:
				setState(1108)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1105)
					try typeSpecifierModifier()


					setState(1110)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1111)
				try match(ObjectiveCParser.Tokens.CHAR.rawValue)
				setState(1115)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,128,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1112)
						try typeQualifier()

				 
					}
					setState(1117)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,128,_ctx)
				}

				break
			case 3:
				setState(1121)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,129,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1118)
						try typeSpecifierModifier()

				 
					}
					setState(1123)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,129,_ctx)
				}
				setState(1124)
				try match(ObjectiveCParser.Tokens.SHORT.rawValue)
				setState(1128)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,130,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1125)
						try typeQualifier()

				 
					}
					setState(1130)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,130,_ctx)
				}

				break
			case 4:
				setState(1134)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1131)
					try typeSpecifierModifier()


					setState(1136)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1137)
				try match(ObjectiveCParser.Tokens.INT.rawValue)
				setState(1141)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,132,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1138)
						try typeQualifier()

				 
					}
					setState(1143)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,132,_ctx)
				}

				break
			case 5:
				setState(1147)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1144)
						try typeSpecifierModifier()

				 
					}
					setState(1149)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,133,_ctx)
				}
				setState(1150)
				try match(ObjectiveCParser.Tokens.LONG.rawValue)
				setState(1154)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,134,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1151)
						try typeQualifier()

				 
					}
					setState(1156)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,134,_ctx)
				}

				break
			case 6:
				setState(1160)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1157)
					try typeSpecifierModifier()


					setState(1162)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1163)
				try match(ObjectiveCParser.Tokens.FLOAT.rawValue)
				setState(1167)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,136,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1164)
						try typeQualifier()

				 
					}
					setState(1169)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,136,_ctx)
				}

				break
			case 7:
				setState(1173)
				try _errHandler.sync(self)
				_la = try _input.LA(1)
				while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2173173760) != 0)) {
					setState(1170)
					try typeSpecifierModifier()


					setState(1175)
					try _errHandler.sync(self)
					_la = try _input.LA(1)
				}
				setState(1176)
				try match(ObjectiveCParser.Tokens.DOUBLE.rawValue)
				setState(1180)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,138,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1177)
						try typeQualifier()

				 
					}
					setState(1182)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,138,_ctx)
				}

				break
			case 8:
				setState(1183)
				try typeofExpression()

				break
			case 9:
				setState(1184)
				try structOrUnionSpecifier()

				break
			case 10:
				setState(1185)
				try enumSpecifier()

				break
			case 11:
				setState(1186)
				try nsEnumOrOptionSpecifier()

				break
			case 12:
				setState(1187)
				try match(ObjectiveCParser.Tokens.ID.rawValue)
				setState(1192)
				try _errHandler.sync(self)
				switch (try getInterpreter().adaptivePredict(_input,139,_ctx)) {
				case 1:
					setState(1188)
					try match(ObjectiveCParser.Tokens.LT.rawValue)
					setState(1189)
					try protocolList()
					setState(1190)
					try match(ObjectiveCParser.Tokens.GT.rawValue)

					break
				default: break
				}
				setState(1199)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,141,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1197)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .AUTORELEASING_QUALIFIER:fallthrough
						case .STRONG_QUALIFIER:fallthrough
						case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
						case .WEAK_QUALIFIER:
							setState(1194)
							try arcBehaviourSpecifier()

							break
						case .NULL_UNSPECIFIED:fallthrough
						case .NULLABLE:fallthrough
						case .NONNULL:fallthrough
						case .NULL_RESETTABLE:
							setState(1195)
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
							setState(1196)
							try typeQualifier()

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
				 
					}
					setState(1201)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,141,_ctx)
				}

				break
			case 13:
				setState(1202)
				try genericTypeSpecifier()
				setState(1208)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,143,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1206)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .AUTORELEASING_QUALIFIER:fallthrough
						case .STRONG_QUALIFIER:fallthrough
						case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
						case .WEAK_QUALIFIER:
							setState(1203)
							try arcBehaviourSpecifier()

							break
						case .NULL_UNSPECIFIED:fallthrough
						case .NULLABLE:fallthrough
						case .NONNULL:fallthrough
						case .NULL_RESETTABLE:
							setState(1204)
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
							setState(1205)
							try typeQualifier()

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
				 
					}
					setState(1210)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,143,_ctx)
				}

				break
			case 14:
				setState(1211)
				try identifier()
				setState(1217)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,145,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(1215)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .AUTORELEASING_QUALIFIER:fallthrough
						case .STRONG_QUALIFIER:fallthrough
						case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
						case .WEAK_QUALIFIER:
							setState(1212)
							try arcBehaviourSpecifier()

							break
						case .NULL_UNSPECIFIED:fallthrough
						case .NULLABLE:fallthrough
						case .NONNULL:fallthrough
						case .NULL_RESETTABLE:
							setState(1213)
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
							setState(1214)
							try typeQualifier()

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
				 
					}
					setState(1219)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,145,_ctx)
				}

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1234)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,149,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = TypeSpecifierContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_typeSpecifier)
					setState(1222)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1223)
					try match(ObjectiveCParser.Tokens.MUL.rawValue)
					setState(1229)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,148,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1227)
							try _errHandler.sync(self)
							switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
							case .AUTORELEASING_QUALIFIER:fallthrough
							case .STRONG_QUALIFIER:fallthrough
							case .UNSAFE_UNRETAINED_QUALIFIER:fallthrough
							case .WEAK_QUALIFIER:
								setState(1224)
								try arcBehaviourSpecifier()

								break
							case .NULL_UNSPECIFIED:fallthrough
							case .NULLABLE:fallthrough
							case .NONNULL:fallthrough
							case .NULL_RESETTABLE:
								setState(1225)
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
								setState(1226)
								try typeQualifier()

								break
							default:
								throw ANTLRException.recognition(e: NoViableAltException(self))
							}
					 
						}
						setState(1231)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,148,_ctx)
					}

			 
				}
				setState(1236)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,149,_ctx)
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
		try enterRule(_localctx, 184, ObjectiveCParser.RULE_typeofExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1237)
		 	try match(ObjectiveCParser.Tokens.TYPEOF.rawValue)

		 	setState(1238)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1239)
		 	try expression(0)
		 	setState(1240)
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
		try enterRule(_localctx, 186, ObjectiveCParser.RULE_fieldDeclaratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1242)
		 	try fieldDeclarator()
		 	setState(1247)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1243)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1244)
		 		try fieldDeclarator()


		 		setState(1249)
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
		try enterRule(_localctx, 188, ObjectiveCParser.RULE_fieldDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1256)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,152, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1250)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1252)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 13581159254269879) != 0)) {
		 			setState(1251)
		 			try declarator()

		 		}

		 		setState(1254)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1255)
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
		try enterRule(_localctx, 190, ObjectiveCParser.RULE_enumSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1258)
		 	try match(ObjectiveCParser.Tokens.ENUM.rawValue)
		 	setState(1264)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,154,_ctx)) {
		 	case 1:
		 		setState(1260)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1259)
		 			try identifier()

		 		}

		 		setState(1262)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 		setState(1263)
		 		try typeName()

		 		break
		 	default: break
		 	}
		 	setState(1277)
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
		 		setState(1266)
		 		try identifier()
		 		setState(1271)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,155,_ctx)) {
		 		case 1:
		 			setState(1267)
		 			try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 			setState(1268)
		 			try enumeratorList()
		 			setState(1269)
		 			try match(ObjectiveCParser.Tokens.RBRACE.rawValue)

		 			break
		 		default: break
		 		}

		 		break

		 	case .LBRACE:
		 		setState(1273)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1274)
		 		try enumeratorList()
		 		setState(1275)
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
		try enterRule(_localctx, 192, ObjectiveCParser.RULE_nsEnumOrOptionSpecifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1279)
		 	_la = try _input.LA(1)
		 	if (!(((Int64((_la - 104)) & ~0x3f) == 0 && ((Int64(1) << (_la - 104)) & 15) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(1280)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1281)
		 	try typeName()
		 	setState(1282)
		 	try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 	setState(1283)
		 	try identifier()
		 	setState(1284)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1289)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,157,_ctx)) {
		 	case 1:
		 		setState(1285)
		 		try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 		setState(1286)
		 		try enumeratorList()
		 		setState(1287)
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
		try enterRule(_localctx, 194, ObjectiveCParser.RULE_enumeratorList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1291)
		 	try enumerator()
		 	setState(1296)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,158,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1292)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1293)
		 			try enumerator()

		 	 
		 		}
		 		setState(1298)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,158,_ctx)
		 	}
		 	setState(1300)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1299)
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
		try enterRule(_localctx, 196, ObjectiveCParser.RULE_enumerator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1302)
		 	try enumeratorIdentifier()
		 	setState(1305)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ASSIGNMENT.rawValue) {
		 		setState(1303)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1304)
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
		try enterRule(_localctx, 198, ObjectiveCParser.RULE_enumeratorIdentifier)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1309)
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
		 		setState(1307)
		 		try identifier()

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1308)
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
		try enterRule(_localctx, 200, ObjectiveCParser.RULE_declarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1334)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,166, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1316)
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
		 			setState(1311)
		 			try identifier()

		 			break

		 		case .LP:
		 			setState(1312)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1313)
		 			try declarator()
		 			setState(1314)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1321)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1318)
		 			try declaratorSuffix()


		 			setState(1323)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1324)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1325)
		 		try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
		 		setState(1327)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,164,_ctx)) {
		 		case 1:
		 			setState(1326)
		 			try nullabilitySpecifier()

		 			break
		 		default: break
		 		}
		 		setState(1330)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728302080) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0)) {
		 			setState(1329)
		 			try identifier()

		 		}

		 		setState(1332)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1333)
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
		try enterRule(_localctx, 202, ObjectiveCParser.RULE_declaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1336)
		 	try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 	setState(1338)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 		setState(1337)
		 		try constantExpression()

		 	}

		 	setState(1340)
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
		try enterRule(_localctx, 204, ObjectiveCParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1342)
		 	try parameterDeclarationList()
		 	setState(1345)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1343)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1344)
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
		try enterRule(_localctx, 206, ObjectiveCParser.RULE_macro)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1413)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,175, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1347)
		 		try identifier()
		 		setState(1359)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue) {
		 			setState(1348)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1349)
		 			try primaryExpression()
		 			setState(1354)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 				setState(1350)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1351)
		 				try primaryExpression()


		 				setState(1356)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1357)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1361)
		 		try match(ObjectiveCParser.Tokens.NS_UNAVAILABLE.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1362)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_NAME.rawValue)
		 		setState(1363)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1366)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,171, _ctx)) {
		 		case 1:
		 			setState(1364)
		 			try swiftAliasExpression()

		 			break
		 		case 2:
		 			setState(1365)
		 			try swiftSelectorExpression()

		 			break
		 		default: break
		 		}
		 		setState(1368)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1370)
		 		try match(ObjectiveCParser.Tokens.API_AVAILABLE.rawValue)
		 		setState(1371)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1372)
		 		try apiAvailableOsVersion()
		 		setState(1377)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1373)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1374)
		 			try apiAvailableOsVersion()


		 			setState(1379)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1380)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1382)
		 		try match(ObjectiveCParser.Tokens.API_UNAVAILABLE.rawValue)
		 		setState(1383)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1384)
		 		try identifier()
		 		setState(1389)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1385)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1386)
		 			try identifier()


		 			setState(1391)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1392)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1394)
		 		try match(ObjectiveCParser.Tokens.NS_SWIFT_UNAVAILABLE.rawValue)
		 		setState(1395)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1396)
		 		try stringLiteral()
		 		setState(1397)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1399)
		 		try match(ObjectiveCParser.Tokens.ATTRIBUTE.rawValue)
		 		setState(1400)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1401)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1402)
		 		try clangAttribute()
		 		setState(1407)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1403)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1404)
		 			try clangAttribute()


		 			setState(1409)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1410)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1411)
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
		try enterRule(_localctx, 208, ObjectiveCParser.RULE_clangAttribute)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1428)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,177, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1415)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1416)
		 		try identifier()
		 		setState(1417)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1418)
		 		try clangAttributeArgument()
		 		setState(1423)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1419)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1420)
		 			try clangAttributeArgument()


		 			setState(1425)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		}
		 		setState(1426)
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
		try enterRule(_localctx, 210, ObjectiveCParser.RULE_clangAttributeArgument)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1441)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,178, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1430)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1431)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1432)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1433)
		 		try identifier()
		 		setState(1434)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1435)
		 		try version()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1437)
		 		try identifier()
		 		setState(1438)
		 		try match(ObjectiveCParser.Tokens.ASSIGNMENT.rawValue)
		 		setState(1439)
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
		try enterRule(_localctx, 212, ObjectiveCParser.RULE_swiftAliasExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1443)
		 	try identifier()
		 	setState(1448)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1444)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1445)
		 		try identifier()


		 		setState(1450)
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
		try enterRule(_localctx, 214, ObjectiveCParser.RULE_swiftSelectorExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1451)
		 	try identifier()
		 	setState(1452)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1458)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143763728318464) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || _la == ObjectiveCParser.Tokens.UNDERSCORE.rawValue) {
		 		setState(1453)
		 		try swiftSelector()
		 		setState(1454)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)


		 		setState(1460)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1461)
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
		try enterRule(_localctx, 216, ObjectiveCParser.RULE_swiftSelector)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1466)
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
		 		setState(1463)
		 		try identifier()

		 		break

		 	case .UNDERSCORE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1464)
		 		try match(ObjectiveCParser.Tokens.UNDERSCORE.rawValue)

		 		break

		 	case .FOR:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1465)
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
		try enterRule(_localctx, 218, ObjectiveCParser.RULE_apiAvailableOsVersion)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1468)
		 	try identifier()
		 	setState(1469)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1470)
		 	try version()
		 	setState(1471)
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
		try enterRule(_localctx, 220, ObjectiveCParser.RULE_version)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1482)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .FLOATING_POINT_LITERAL:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1473)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break

		 	case .DECIMAL_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1474)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)
		 		setState(1479)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		while (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 			setState(1475)
		 			try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 			setState(1476)
		 			try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)


		 			setState(1481)
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
		try enterRule(_localctx, 222, ObjectiveCParser.RULE_arrayInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1484)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1489)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1485)
		 		try expressions()
		 		setState(1487)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1486)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1491)
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
		try enterRule(_localctx, 224, ObjectiveCParser.RULE_structInitializer)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1493)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1507)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.DOT.rawValue) {
		 		setState(1494)
		 		try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 		setState(1495)
		 		try expression(0)
		 		setState(1501)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,186,_ctx)
		 		while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 			if ( _alt==1 ) {
		 				setState(1496)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 				setState(1497)
		 				try match(ObjectiveCParser.Tokens.DOT.rawValue)
		 				setState(1498)
		 				try expression(0)

		 		 
		 			}
		 			setState(1503)
		 			try _errHandler.sync(self)
		 			_alt = try getInterpreter().adaptivePredict(_input,186,_ctx)
		 		}
		 		setState(1505)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 			setState(1504)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 		}


		 	}

		 	setState(1509)
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
		try enterRule(_localctx, 226, ObjectiveCParser.RULE_initializerList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1511)
		 	try initializer()
		 	setState(1516)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,189,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1512)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1513)
		 			try initializer()

		 	 
		 		}
		 		setState(1518)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,189,_ctx)
		 	}
		 	setState(1520)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1519)
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
		try enterRule(_localctx, 228, ObjectiveCParser.RULE_typeName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1527)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,192, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1522)
		 		try declarationSpecifiers()
		 		setState(1524)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1523)
		 			try abstractDeclarator()

		 		}


		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1526)
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
		try enterRule(_localctx, 230, ObjectiveCParser.RULE_abstractDeclarator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1548)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LP:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1529)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1531)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue) {
		 			setState(1530)
		 			try abstractDeclarator()

		 		}

		 		setState(1533)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1535) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1534)
		 			try abstractDeclaratorSuffix()


		 			setState(1537); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (_la == ObjectiveCParser.Tokens.LP.rawValue || _la == ObjectiveCParser.Tokens.LBRACK.rawValue)

		 		break

		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1544) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1539)
		 			try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 			setState(1541)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 				setState(1540)
		 				try constantExpression()

		 			}

		 			setState(1543)
		 			try match(ObjectiveCParser.Tokens.RBRACK.rawValue)


		 			setState(1546); 
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
		try enterRule(_localctx, 232, ObjectiveCParser.RULE_abstractDeclaratorSuffix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1560)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LBRACK:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1550)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1552)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 288230101274853376) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573959999528887) != 0) || ((Int64((_la - 161)) & ~0x3f) == 0 && ((Int64(1) << (_la - 161)) & 65536003) != 0)) {
		 			setState(1551)
		 			try constantExpression()

		 		}

		 		setState(1554)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break

		 	case .LP:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1555)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1557)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 142143780063951410) != 0) || ((Int64((_la - 81)) & ~0x3f) == 0 && ((Int64(1) << (_la - 81)) & 4573960318484479) != 0)) {
		 			setState(1556)
		 			try parameterDeclarationList()

		 		}

		 		setState(1559)
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
		try enterRule(_localctx, 234, ObjectiveCParser.RULE_parameterDeclarationList)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1562)
		 	try parameterDeclaration()
		 	setState(1567)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,201,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1563)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1564)
		 			try parameterDeclaration()

		 	 
		 		}
		 		setState(1569)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,201,_ctx)
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
		try enterRule(_localctx, 236, ObjectiveCParser.RULE_parameterDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1574)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,202, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1570)
		 		try declarationSpecifiers()
		 		setState(1571)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1573)
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
		try enterRule(_localctx, 238, ObjectiveCParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1617)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,213, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1576)
		 		try labeledStatement()
		 		setState(1578)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,203,_ctx)) {
		 		case 1:
		 			setState(1577)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1580)
		 		try compoundStatement()
		 		setState(1582)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,204,_ctx)) {
		 		case 1:
		 			setState(1581)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1584)
		 		try selectionStatement()
		 		setState(1586)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,205,_ctx)) {
		 		case 1:
		 			setState(1585)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1588)
		 		try iterationStatement()
		 		setState(1590)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,206,_ctx)) {
		 		case 1:
		 			setState(1589)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1592)
		 		try jumpStatement()
		 		setState(1594)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,207,_ctx)) {
		 		case 1:
		 			setState(1593)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1596)
		 		try synchronizedStatement()
		 		setState(1598)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,208,_ctx)) {
		 		case 1:
		 			setState(1597)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1600)
		 		try autoreleaseStatement()
		 		setState(1602)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,209,_ctx)) {
		 		case 1:
		 			setState(1601)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1604)
		 		try throwStatement()
		 		setState(1606)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,210,_ctx)) {
		 		case 1:
		 			setState(1605)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1608)
		 		try tryBlock()
		 		setState(1610)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,211,_ctx)) {
		 		case 1:
		 			setState(1609)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1612)
		 		try expressions()
		 		setState(1614)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,212,_ctx)) {
		 		case 1:
		 			setState(1613)
		 			try match(ObjectiveCParser.Tokens.SEMI.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1616)
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
		try enterRule(_localctx, 240, ObjectiveCParser.RULE_labeledStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1619)
		 	try identifier()
		 	setState(1620)
		 	try match(ObjectiveCParser.Tokens.COLON.rawValue)
		 	setState(1621)
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
		try enterRule(_localctx, 242, ObjectiveCParser.RULE_rangeExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1623)
		 	try constantExpression()
		 	setState(1626)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == ObjectiveCParser.Tokens.ELIPSIS.rawValue) {
		 		setState(1624)
		 		try match(ObjectiveCParser.Tokens.ELIPSIS.rawValue)
		 		setState(1625)
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
		try enterRule(_localctx, 244, ObjectiveCParser.RULE_compoundStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1628)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1633)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 5188146530212641654) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802877825) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536747) != 0)) {
		 		setState(1631)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,215, _ctx)) {
		 		case 1:
		 			setState(1629)
		 			try declaration()

		 			break
		 		case 2:
		 			setState(1630)
		 			try statement()

		 			break
		 		default: break
		 		}

		 		setState(1635)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1636)
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
		try enterRule(_localctx, 246, ObjectiveCParser.RULE_selectionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1648)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IF:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1638)
		 		try match(ObjectiveCParser.Tokens.IF.rawValue)
		 		setState(1639)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1640)
		 		try expression(0)
		 		setState(1641)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)
		 		setState(1642)
		 		try {
		 				let assignmentValue = try statement()
		 				_localctx.castdown(SelectionStatementContext.self).ifBody = assignmentValue
		 		     }()

		 		setState(1645)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,217,_ctx)) {
		 		case 1:
		 			setState(1643)
		 			try match(ObjectiveCParser.Tokens.ELSE.rawValue)
		 			setState(1644)
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
		 		setState(1647)
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
		try enterRule(_localctx, 248, ObjectiveCParser.RULE_switchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1650)
		 	try match(ObjectiveCParser.Tokens.SWITCH.rawValue)
		 	setState(1651)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1652)
		 	try expression(0)
		 	setState(1653)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1654)
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
		try enterRule(_localctx, 250, ObjectiveCParser.RULE_switchBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1656)
		 	try match(ObjectiveCParser.Tokens.LBRACE.rawValue)
		 	setState(1660)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue) {
		 		setState(1657)
		 		try switchSection()


		 		setState(1662)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(1663)
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
		try enterRule(_localctx, 252, ObjectiveCParser.RULE_switchSection)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1666) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1665)
		 		try switchLabel()


		 		setState(1668); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCParser.Tokens.CASE.rawValue || _la == ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 	setState(1671) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(1670)
		 		try statement()


		 		setState(1673); 
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
		try enterRule(_localctx, 254, ObjectiveCParser.RULE_switchLabel)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1687)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CASE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1675)
		 		try match(ObjectiveCParser.Tokens.CASE.rawValue)
		 		setState(1681)
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
		 			setState(1676)
		 			try rangeExpression()

		 			break

		 		case .LP:
		 			setState(1677)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1678)
		 			try rangeExpression()
		 			setState(1679)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1683)
		 		try match(ObjectiveCParser.Tokens.COLON.rawValue)

		 		break

		 	case .DEFAULT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1685)
		 		try match(ObjectiveCParser.Tokens.DEFAULT.rawValue)
		 		setState(1686)
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
		try enterRule(_localctx, 256, ObjectiveCParser.RULE_iterationStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1693)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,224, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1689)
		 		try whileStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1690)
		 		try doStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1691)
		 		try forStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1692)
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
		try enterRule(_localctx, 258, ObjectiveCParser.RULE_whileStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1695)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1696)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1697)
		 	try expression(0)
		 	setState(1698)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1699)
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
		try enterRule(_localctx, 260, ObjectiveCParser.RULE_doStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1701)
		 	try match(ObjectiveCParser.Tokens.DO.rawValue)
		 	setState(1702)
		 	try statement()
		 	setState(1703)
		 	try match(ObjectiveCParser.Tokens.WHILE.rawValue)
		 	setState(1704)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1705)
		 	try expression(0)
		 	setState(1706)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1707)
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
		try enterRule(_localctx, 262, ObjectiveCParser.RULE_forStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1709)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1710)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1712)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916136071445042) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288197390802874497) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1711)
		 		try forLoopInitializer()

		 	}

		 	setState(1714)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1716)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1715)
		 		try expression(0)

		 	}

		 	setState(1718)
		 	try match(ObjectiveCParser.Tokens.SEMI.rawValue)
		 	setState(1720)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1719)
		 		try expressions()

		 	}

		 	setState(1722)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1723)
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
		try enterRule(_localctx, 264, ObjectiveCParser.RULE_forLoopInitializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1729)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,228, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1725)
		 		try declarationSpecifiers()
		 		setState(1726)
		 		try initDeclaratorList()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1728)
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
		try enterRule(_localctx, 266, ObjectiveCParser.RULE_forInStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1731)
		 	try match(ObjectiveCParser.Tokens.FOR.rawValue)
		 	setState(1732)
		 	try match(ObjectiveCParser.Tokens.LP.rawValue)
		 	setState(1733)
		 	try typeVariableDeclarator()
		 	setState(1734)
		 	try match(ObjectiveCParser.Tokens.IN.rawValue)
		 	setState(1736)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 		setState(1735)
		 		try expression(0)

		 	}

		 	setState(1738)
		 	try match(ObjectiveCParser.Tokens.RP.rawValue)
		 	setState(1739)
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
		try enterRule(_localctx, 268, ObjectiveCParser.RULE_jumpStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1749)
		 	try _errHandler.sync(self)
		 	switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .GOTO:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1741)
		 		try match(ObjectiveCParser.Tokens.GOTO.rawValue)
		 		setState(1742)
		 		try identifier()

		 		break

		 	case .CONTINUE:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1743)
		 		try match(ObjectiveCParser.Tokens.CONTINUE.rawValue)

		 		break

		 	case .BREAK:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1744)
		 		try match(ObjectiveCParser.Tokens.BREAK.rawValue)

		 		break

		 	case .RETURN:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1745)
		 		try match(ObjectiveCParser.Tokens.RETURN.rawValue)
		 		setState(1747)
		 		try _errHandler.sync(self)
		 		switch (try getInterpreter().adaptivePredict(_input,230,_ctx)) {
		 		case 1:
		 			setState(1746)
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
		try enterRule(_localctx, 270, ObjectiveCParser.RULE_expressions)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1751)
		 	try expression(0)
		 	setState(1756)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,232,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(1752)
		 			try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 			setState(1753)
		 			try expression(0)

		 	 
		 		}
		 		setState(1758)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,232,_ctx)
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
		let _startState: Int = 272
		try enterRecursionRule(_localctx, 272, ObjectiveCParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1769)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,233, _ctx)) {
			case 1:
				setState(1760)
				try castExpression()

				break
			case 2:
				setState(1761)
				try match(ObjectiveCParser.Tokens.LP.rawValue)
				setState(1762)
				try compoundStatement()
				setState(1763)
				try match(ObjectiveCParser.Tokens.RP.rawValue)

				break
			case 3:
				setState(1765)
				try unaryExpression()
				setState(1766)
				try assignmentOperator()
				setState(1767)
				try {
						let assignmentValue = try expression(1)
						_localctx.castdown(ExpressionContext.self).assignmentExpression = assignmentValue
				     }()


				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(1815)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,237,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(1813)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,236, _ctx)) {
					case 1:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1771)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(1772)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 163)) & ~0x3f) == 0 && ((Int64(1) << (_la - 163)) & 35) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1773)
						try expression(14)

						break
					case 2:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1774)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(1775)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1776)
						try expression(13)

						break
					case 3:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1777)
						if (!(precpred(_ctx, 11))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 11)"))
						}
						setState(1782)
						try _errHandler.sync(self)
						switch (ObjectiveCParser.Tokens(rawValue: try _input.LA(1))!) {
						case .LT:
							setState(1778)
							try match(ObjectiveCParser.Tokens.LT.rawValue)
							setState(1779)
							try match(ObjectiveCParser.Tokens.LT.rawValue)

							break

						case .GT:
							setState(1780)
							try match(ObjectiveCParser.Tokens.GT.rawValue)
							setState(1781)
							try match(ObjectiveCParser.Tokens.GT.rawValue)

							break
						default:
							throw ANTLRException.recognition(e: NoViableAltException(self))
						}
						setState(1784)
						try expression(12)

						break
					case 4:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1785)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(1786)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 147)) & ~0x3f) == 0 && ((Int64(1) << (_la - 147)) & 387) != 0))) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1787)
						try expression(11)

						break
					case 5:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1788)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(1789)
						_localctx.castdown(ExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCParser.Tokens.EQUAL.rawValue || _la == ObjectiveCParser.Tokens.NOTEQUAL.rawValue)) {
							_localctx.castdown(ExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(1790)
						try expression(10)

						break
					case 6:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1791)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(1792)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITAND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1793)
						try expression(9)

						break
					case 7:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1794)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(1795)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITXOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1796)
						try expression(8)

						break
					case 8:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1797)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(1798)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.BITOR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1799)
						try expression(7)

						break
					case 9:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1800)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(1801)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.AND.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1802)
						try expression(6)

						break
					case 10:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1803)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(1804)
						try {
								let assignmentValue = try match(ObjectiveCParser.Tokens.OR.rawValue)
								_localctx.castdown(ExpressionContext.self).op = assignmentValue
						     }()

						setState(1805)
						try expression(5)

						break
					case 11:
						_localctx = ExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_expression)
						setState(1806)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(1807)
						try match(ObjectiveCParser.Tokens.QUESTION.rawValue)
						setState(1809)
						try _errHandler.sync(self)
						_la = try _input.LA(1)
						if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916119735795712) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196084360769665) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
							setState(1808)
							try {
									let assignmentValue = try expression(0)
									_localctx.castdown(ExpressionContext.self).trueExpression = assignmentValue
							     }()


						}

						setState(1811)
						try match(ObjectiveCParser.Tokens.COLON.rawValue)
						setState(1812)
						try {
								let assignmentValue = try expression(4)
								_localctx.castdown(ExpressionContext.self).falseExpression = assignmentValue
						     }()


						break
					default: break
					}
			 
				}
				setState(1817)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,237,_ctx)
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
		try enterRule(_localctx, 274, ObjectiveCParser.RULE_assignmentOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1818)
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
		try enterRule(_localctx, 276, ObjectiveCParser.RULE_castExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1829)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,239, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1820)
		 		try unaryExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1821)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1822)
		 		try typeName()
		 		setState(1823)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		setState(1827)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,238, _ctx)) {
		 		case 1:
		 			setState(1825)
		 			try castExpression()

		 			break
		 		case 2:
		 			setState(1826)
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
		try enterRule(_localctx, 278, ObjectiveCParser.RULE_initializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1834)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,240, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1831)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1832)
		 		try arrayInitializer()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1833)
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
		try enterRule(_localctx, 280, ObjectiveCParser.RULE_constantExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1838)
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
		 		setState(1836)
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
		 		setState(1837)
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
		try enterRule(_localctx, 282, ObjectiveCParser.RULE_unaryExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1854)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,243, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1840)
		 		try postfixExpression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1841)
		 		try match(ObjectiveCParser.Tokens.SIZEOF.rawValue)
		 		setState(1847)
		 		try _errHandler.sync(self)
		 		switch(try getInterpreter().adaptivePredict(_input,242, _ctx)) {
		 		case 1:
		 			setState(1842)
		 			try unaryExpression()

		 			break
		 		case 2:
		 			setState(1843)
		 			try match(ObjectiveCParser.Tokens.LP.rawValue)
		 			setState(1844)
		 			try typeSpecifier(0)
		 			setState(1845)
		 			try match(ObjectiveCParser.Tokens.RP.rawValue)

		 			break
		 		default: break
		 		}

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1849)
		 		_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCParser.Tokens.INC.rawValue || _la == ObjectiveCParser.Tokens.DEC.rawValue)) {
		 			_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(1850)
		 		try unaryExpression()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1851)
		 		try unaryOperator()
		 		setState(1852)
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
		try enterRule(_localctx, 284, ObjectiveCParser.RULE_unaryOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1856)
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
		let _startState: Int = 286
		try enterRecursionRule(_localctx, 286, ObjectiveCParser.RULE_postfixExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(1859)
			try primaryExpression()
			setState(1863)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,244,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					setState(1860)
					try `postfix`()

			 
				}
				setState(1865)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,244,_ctx)
			}

			_ctx!.stop = try _input.LT(-1)
			setState(1877)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,246,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = PostfixExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, ObjectiveCParser.RULE_postfixExpression)
					setState(1866)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(1867)
					_la = try _input.LA(1)
					if (!(_la == ObjectiveCParser.Tokens.DOT.rawValue || _la == ObjectiveCParser.Tokens.STRUCTACCESS.rawValue)) {
					try _errHandler.recoverInline(self)
					}
					else {
						_errHandler.reportMatch(self)
						try consume()
					}
					setState(1868)
					try identifier()
					setState(1872)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,245,_ctx)
					while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
						if ( _alt==1 ) {
							setState(1869)
							try `postfix`()

					 
						}
						setState(1874)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,245,_ctx)
					}

			 
				}
				setState(1879)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,246,_ctx)
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
		open var _tset3549: Token!
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
		try enterRule(_localctx, 288, ObjectiveCParser.RULE_postfix)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1898)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,250, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1880)
		 		try match(ObjectiveCParser.Tokens.LBRACK.rawValue)
		 		setState(1881)
		 		try expression(0)
		 		setState(1882)
		 		try match(ObjectiveCParser.Tokens.RBRACK.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1884)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1886)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4899916127412169232) != 0) || ((Int64((_la - 69)) & ~0x3f) == 0 && ((Int64(1) << (_la - 69)) & 288196290586308737) != 0) || ((Int64((_la - 133)) & ~0x3f) == 0 && ((Int64(1) << (_la - 133)) & 17873684576536611) != 0)) {
		 			setState(1885)
		 			try argumentExpressionList()

		 		}

		 		setState(1888)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1889)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1892) 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		repeat {
		 			setState(1892)
		 			try _errHandler.sync(self)
		 			switch(try getInterpreter().adaptivePredict(_input,248, _ctx)) {
		 			case 1:
		 				setState(1890)
		 				try match(ObjectiveCParser.Tokens.COMMA.rawValue)

		 				break
		 			case 2:
		 				setState(1891)
		 				_localctx.castdown(PostfixContext.self)._tset3549 = try _input.LT(1)
		 				_la = try _input.LA(1)
		 				if (_la <= 0 || (_la == ObjectiveCParser.Tokens.RP.rawValue)) {
		 					_localctx.castdown(PostfixContext.self)._tset3549 = try _errHandler.recoverInline(self) as Token
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}
		 				_localctx.castdown(PostfixContext.self).macroArguments.append(_localctx.castdown(PostfixContext.self)._tset3549)

		 				break
		 			default: break
		 			}

		 			setState(1894); 
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 		} while (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & -2) != 0) || ((Int64((_la - 64)) & ~0x3f) == 0 && ((Int64(1) << (_la - 64)) & -1) != 0) || ((Int64((_la - 128)) & ~0x3f) == 0 && ((Int64(1) << (_la - 128)) & -129) != 0) || ((Int64((_la - 192)) & ~0x3f) == 0 && ((Int64(1) << (_la - 192)) & 1099511627775) != 0))
		 		setState(1896)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1897)
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
		try enterRule(_localctx, 290, ObjectiveCParser.RULE_argumentExpressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1900)
		 	try argumentExpression()
		 	setState(1905)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == ObjectiveCParser.Tokens.COMMA.rawValue) {
		 		setState(1901)
		 		try match(ObjectiveCParser.Tokens.COMMA.rawValue)
		 		setState(1902)
		 		try argumentExpression()


		 		setState(1907)
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
		try enterRule(_localctx, 292, ObjectiveCParser.RULE_argumentExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1910)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,252, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1908)
		 		try expression(0)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1909)
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
		try enterRule(_localctx, 294, ObjectiveCParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1927)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,253, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1912)
		 		try identifier()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1913)
		 		try constant()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1914)
		 		try stringLiteral()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1915)
		 		try match(ObjectiveCParser.Tokens.LP.rawValue)
		 		setState(1916)
		 		try expression(0)
		 		setState(1917)
		 		try match(ObjectiveCParser.Tokens.RP.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1919)
		 		try messageExpression()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1920)
		 		try selectorExpression()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1921)
		 		try protocolExpression()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1922)
		 		try encodeExpression()

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1923)
		 		try dictionaryExpression()

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1924)
		 		try arrayExpression()

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1925)
		 		try boxExpression()

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1926)
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
		try enterRule(_localctx, 296, ObjectiveCParser.RULE_constant)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(1947)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,256, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(1929)
		 		try match(ObjectiveCParser.Tokens.HEX_LITERAL.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(1930)
		 		try match(ObjectiveCParser.Tokens.OCTAL_LITERAL.rawValue)

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(1931)
		 		try match(ObjectiveCParser.Tokens.BINARY_LITERAL.rawValue)

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(1933)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1932)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1935)
		 		try match(ObjectiveCParser.Tokens.DECIMAL_LITERAL.rawValue)

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(1937)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue) {
		 			setState(1936)
		 			_la = try _input.LA(1)
		 			if (!(_la == ObjectiveCParser.Tokens.ADD.rawValue || _la == ObjectiveCParser.Tokens.SUB.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 		}

		 		setState(1939)
		 		try match(ObjectiveCParser.Tokens.FLOATING_POINT_LITERAL.rawValue)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(1940)
		 		try match(ObjectiveCParser.Tokens.CHARACTER_LITERAL.rawValue)

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(1941)
		 		try match(ObjectiveCParser.Tokens.NIL.rawValue)

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(1942)
		 		try match(ObjectiveCParser.Tokens.NULL_.rawValue)

		 		break
		 	case 9:
		 		try enterOuterAlt(_localctx, 9)
		 		setState(1943)
		 		try match(ObjectiveCParser.Tokens.YES.rawValue)

		 		break
		 	case 10:
		 		try enterOuterAlt(_localctx, 10)
		 		setState(1944)
		 		try match(ObjectiveCParser.Tokens.NO.rawValue)

		 		break
		 	case 11:
		 		try enterOuterAlt(_localctx, 11)
		 		setState(1945)
		 		try match(ObjectiveCParser.Tokens.TRUE.rawValue)

		 		break
		 	case 12:
		 		try enterOuterAlt(_localctx, 12)
		 		setState(1946)
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
		try enterRule(_localctx, 298, ObjectiveCParser.RULE_stringLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1957); 
		 	try _errHandler.sync(self)
		 	_alt = 1;
		 	repeat {
		 		switch (_alt) {
		 		case 1:
		 			setState(1949)
		 			try match(ObjectiveCParser.Tokens.STRING_START.rawValue)
		 			setState(1953)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			while (_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue) {
		 				setState(1950)
		 				_la = try _input.LA(1)
		 				if (!(_la == ObjectiveCParser.Tokens.STRING_NEWLINE.rawValue || _la == ObjectiveCParser.Tokens.STRING_VALUE.rawValue)) {
		 				try _errHandler.recoverInline(self)
		 				}
		 				else {
		 					_errHandler.reportMatch(self)
		 					try consume()
		 				}


		 				setState(1955)
		 				try _errHandler.sync(self)
		 				_la = try _input.LA(1)
		 			}
		 			setState(1956)
		 			try match(ObjectiveCParser.Tokens.STRING_END.rawValue)


		 			break
		 		default:
		 			throw ANTLRException.recognition(e: NoViableAltException(self))
		 		}
		 		setState(1959); 
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,258,_ctx)
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
		try enterRule(_localctx, 300, ObjectiveCParser.RULE_identifier)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(1961)
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
		case  91:
			return try typeSpecifier_sempred(_localctx?.castdown(TypeSpecifierContext.self), predIndex)
		case  136:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
		case  143:
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
		4,1,231,1964,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,
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
		2,147,7,147,2,148,7,148,2,149,7,149,2,150,7,150,1,0,5,0,304,8,0,10,0,12,
		0,307,9,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,
		323,8,1,1,2,1,2,1,2,1,2,1,3,3,3,330,8,3,1,3,1,3,1,3,1,3,3,3,336,8,3,1,
		3,1,3,1,3,3,3,341,8,3,1,3,1,3,5,3,345,8,3,10,3,12,3,348,9,3,1,3,3,3,351,
		8,3,1,3,3,3,354,8,3,1,3,1,3,1,4,1,4,1,4,1,4,3,4,362,8,4,1,4,1,4,1,4,1,
		4,1,4,3,4,369,8,4,1,4,3,4,372,8,4,1,4,3,4,375,8,4,1,4,1,4,1,5,1,5,1,5,
		1,5,3,5,383,8,5,1,5,3,5,386,8,5,1,5,3,5,389,8,5,1,5,1,5,1,6,1,6,1,6,1,
		6,1,6,1,6,3,6,399,8,6,1,6,1,6,1,7,1,7,1,7,1,7,3,7,407,8,7,1,7,1,7,3,7,
		411,8,7,1,8,1,8,1,8,5,8,416,8,8,10,8,12,8,419,9,8,1,9,1,9,1,9,3,9,424,
		8,9,1,10,3,10,427,8,10,1,10,1,10,1,10,1,10,1,10,1,10,3,10,435,8,10,1,10,
		5,10,438,8,10,10,10,12,10,441,9,10,1,10,1,10,1,11,1,11,5,11,447,8,11,10,
		11,12,11,450,9,11,1,11,4,11,453,8,11,11,11,12,11,454,3,11,457,8,11,1,12,
		1,12,1,12,1,12,1,13,1,13,1,13,1,13,5,13,467,8,13,10,13,12,13,470,9,13,
		1,13,1,13,1,14,1,14,1,14,5,14,477,8,14,10,14,12,14,480,9,14,1,15,1,15,
		1,15,1,15,1,15,3,15,487,8,15,1,15,3,15,490,8,15,1,15,3,15,493,8,15,1,15,
		1,15,1,16,1,16,1,16,5,16,500,8,16,10,16,12,16,503,9,16,1,17,1,17,1,17,
		1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,
		1,17,1,17,1,17,3,17,525,8,17,1,18,1,18,1,18,1,18,1,18,3,18,532,8,18,1,
		18,3,18,535,8,18,1,19,1,19,5,19,539,8,19,10,19,12,19,542,9,19,1,19,1,19,
		1,20,1,20,5,20,548,8,20,10,20,12,20,551,9,20,1,20,4,20,554,8,20,11,20,
		12,20,555,3,20,558,8,20,1,21,1,21,1,22,1,22,1,22,1,22,1,22,1,22,4,22,568,
		8,22,11,22,12,22,569,1,23,1,23,1,23,1,24,1,24,1,24,1,25,3,25,579,8,25,
		1,25,1,25,5,25,583,8,25,10,25,12,25,586,9,25,1,25,1,25,1,26,1,26,1,26,
		1,26,1,26,4,26,595,8,26,11,26,12,26,596,1,27,1,27,1,27,1,28,1,28,1,28,
		1,29,3,29,606,8,29,1,29,1,29,3,29,610,8,29,1,29,3,29,613,8,29,1,29,1,29,
		1,30,1,30,4,30,619,8,30,11,30,12,30,620,1,30,1,30,3,30,625,8,30,3,30,627,
		8,30,1,31,3,31,630,8,31,1,31,1,31,5,31,634,8,31,10,31,12,31,637,9,31,1,
		31,3,31,640,8,31,1,31,1,31,1,32,1,32,3,32,646,8,32,1,33,1,33,1,33,1,33,
		1,34,1,34,1,34,1,34,1,34,1,34,1,34,1,34,3,34,660,8,34,1,35,1,35,1,35,5,
		35,665,8,35,10,35,12,35,668,9,35,1,36,1,36,1,36,3,36,673,8,36,1,37,3,37,
		676,8,37,1,37,3,37,679,8,37,1,37,1,37,3,37,683,8,37,1,37,1,37,3,37,687,
		8,37,1,37,1,37,3,37,691,8,37,1,37,1,37,3,37,695,8,37,1,38,1,38,1,38,1,
		38,5,38,701,8,38,10,38,12,38,704,9,38,3,38,706,8,38,1,38,1,38,1,39,1,39,
		1,39,3,39,713,8,39,1,40,1,40,1,40,1,40,1,40,5,40,720,8,40,10,40,12,40,
		723,9,40,1,40,3,40,726,8,40,3,40,728,8,40,1,40,1,40,1,41,1,41,1,41,1,41,
		1,42,1,42,1,42,1,42,3,42,740,8,42,3,42,742,8,42,1,42,1,42,1,43,1,43,1,
		43,1,43,1,43,1,43,1,43,1,43,3,43,754,8,43,3,43,756,8,43,1,44,1,44,1,44,
		3,44,761,8,44,1,44,1,44,5,44,765,8,44,10,44,12,44,768,9,44,3,44,770,8,
		44,1,44,1,44,1,45,1,45,3,45,776,8,45,1,46,1,46,3,46,780,8,46,1,46,3,46,
		783,8,46,1,46,3,46,786,8,46,1,46,1,46,1,47,1,47,1,47,1,47,1,47,1,48,1,
		48,3,48,797,8,48,1,49,1,49,4,49,801,8,49,11,49,12,49,802,3,49,805,8,49,
		1,50,3,50,808,8,50,1,50,1,50,1,50,1,50,5,50,814,8,50,10,50,12,50,817,9,
		50,1,51,1,51,3,51,821,8,51,1,51,1,51,1,51,1,51,3,51,827,8,51,1,52,1,52,
		1,52,1,52,1,52,1,53,1,53,1,53,3,53,837,8,53,1,53,4,53,840,8,53,11,53,12,
		53,841,3,53,844,8,53,1,54,1,54,1,54,1,54,1,54,1,55,1,55,1,55,1,55,1,55,
		1,56,1,56,1,56,1,57,1,57,1,57,1,57,1,57,1,57,1,57,3,57,866,8,57,1,58,1,
		58,1,58,5,58,871,8,58,10,58,12,58,874,9,58,1,58,1,58,3,58,878,8,58,1,59,
		1,59,1,59,1,59,1,59,1,59,1,60,1,60,1,60,1,60,1,60,1,60,1,61,1,61,1,61,
		1,62,1,62,1,62,1,63,1,63,1,63,1,64,3,64,902,8,64,1,64,1,64,1,64,3,64,907,
		8,64,1,64,1,64,1,64,3,64,912,8,64,1,65,1,65,3,65,916,8,65,1,66,1,66,3,
		66,920,8,66,1,67,1,67,3,67,924,8,67,1,67,1,67,1,68,1,68,1,68,5,68,931,
		8,68,10,68,12,68,934,9,68,1,69,1,69,1,69,1,69,3,69,940,8,69,1,70,1,70,
		1,70,1,70,1,70,3,70,947,8,70,1,71,1,71,1,71,1,71,3,71,953,8,71,1,71,3,
		71,956,8,71,1,71,1,71,1,72,3,72,961,8,72,1,72,1,72,3,72,965,8,72,1,72,
		1,72,1,72,1,72,1,73,3,73,972,8,73,1,73,3,73,975,8,73,1,73,1,73,1,73,1,
		73,3,73,981,8,73,1,74,1,74,3,74,985,8,74,1,75,3,75,988,8,75,1,75,1,75,
		1,75,3,75,993,8,75,1,76,1,76,1,76,5,76,998,8,76,10,76,12,76,1001,9,76,
		1,77,1,77,1,77,1,77,1,77,1,77,1,77,1,77,5,77,1011,8,77,10,77,12,77,1014,
		9,77,1,77,1,77,5,77,1018,8,77,10,77,12,77,1021,9,77,1,78,1,78,1,78,1,78,
		1,78,1,78,5,78,1029,8,78,10,78,12,78,1032,9,78,1,78,1,78,1,78,1,79,1,79,
		1,79,5,79,1040,8,79,10,79,12,79,1043,9,79,1,80,1,80,1,80,3,80,1048,8,80,
		1,81,1,81,1,81,3,81,1053,8,81,1,81,1,81,4,81,1057,8,81,11,81,12,81,1058,
		1,81,1,81,3,81,1063,8,81,1,82,1,82,1,82,3,82,1068,8,82,1,82,1,82,1,83,
		1,83,1,83,1,83,1,83,1,83,3,83,1078,8,83,1,84,1,84,1,85,1,85,1,86,1,86,
		1,87,1,87,1,88,1,88,1,88,1,88,3,88,1092,8,88,1,89,1,89,1,90,1,90,1,91,
		1,91,1,91,5,91,1101,8,91,10,91,12,91,1104,9,91,1,91,5,91,1107,8,91,10,
		91,12,91,1110,9,91,1,91,1,91,5,91,1114,8,91,10,91,12,91,1117,9,91,1,91,
		5,91,1120,8,91,10,91,12,91,1123,9,91,1,91,1,91,5,91,1127,8,91,10,91,12,
		91,1130,9,91,1,91,5,91,1133,8,91,10,91,12,91,1136,9,91,1,91,1,91,5,91,
		1140,8,91,10,91,12,91,1143,9,91,1,91,5,91,1146,8,91,10,91,12,91,1149,9,
		91,1,91,1,91,5,91,1153,8,91,10,91,12,91,1156,9,91,1,91,5,91,1159,8,91,
		10,91,12,91,1162,9,91,1,91,1,91,5,91,1166,8,91,10,91,12,91,1169,9,91,1,
		91,5,91,1172,8,91,10,91,12,91,1175,9,91,1,91,1,91,5,91,1179,8,91,10,91,
		12,91,1182,9,91,1,91,1,91,1,91,1,91,1,91,1,91,1,91,1,91,1,91,3,91,1193,
		8,91,1,91,1,91,1,91,5,91,1198,8,91,10,91,12,91,1201,9,91,1,91,1,91,1,91,
		1,91,5,91,1207,8,91,10,91,12,91,1210,9,91,1,91,1,91,1,91,1,91,5,91,1216,
		8,91,10,91,12,91,1219,9,91,3,91,1221,8,91,1,91,1,91,1,91,1,91,1,91,5,91,
		1228,8,91,10,91,12,91,1231,9,91,5,91,1233,8,91,10,91,12,91,1236,9,91,1,
		92,1,92,1,92,1,92,1,92,1,93,1,93,1,93,5,93,1246,8,93,10,93,12,93,1249,
		9,93,1,94,1,94,3,94,1253,8,94,1,94,1,94,3,94,1257,8,94,1,95,1,95,3,95,
		1261,8,95,1,95,1,95,3,95,1265,8,95,1,95,1,95,1,95,1,95,1,95,3,95,1272,
		8,95,1,95,1,95,1,95,1,95,3,95,1278,8,95,1,96,1,96,1,96,1,96,1,96,1,96,
		1,96,1,96,1,96,1,96,3,96,1290,8,96,1,97,1,97,1,97,5,97,1295,8,97,10,97,
		12,97,1298,9,97,1,97,3,97,1301,8,97,1,98,1,98,1,98,3,98,1306,8,98,1,99,
		1,99,3,99,1310,8,99,1,100,1,100,1,100,1,100,1,100,3,100,1317,8,100,1,100,
		5,100,1320,8,100,10,100,12,100,1323,9,100,1,100,1,100,1,100,3,100,1328,
		8,100,1,100,3,100,1331,8,100,1,100,1,100,3,100,1335,8,100,1,101,1,101,
		3,101,1339,8,101,1,101,1,101,1,102,1,102,1,102,3,102,1346,8,102,1,103,
		1,103,1,103,1,103,1,103,5,103,1353,8,103,10,103,12,103,1356,9,103,1,103,
		1,103,3,103,1360,8,103,1,103,1,103,1,103,1,103,1,103,3,103,1367,8,103,
		1,103,1,103,1,103,1,103,1,103,1,103,1,103,5,103,1376,8,103,10,103,12,103,
		1379,9,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,5,103,1388,8,103,
		10,103,12,103,1391,9,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,1,103,
		1,103,1,103,1,103,1,103,1,103,5,103,1406,8,103,10,103,12,103,1409,9,103,
		1,103,1,103,1,103,3,103,1414,8,103,1,104,1,104,1,104,1,104,1,104,1,104,
		5,104,1422,8,104,10,104,12,104,1425,9,104,1,104,1,104,3,104,1429,8,104,
		1,105,1,105,1,105,1,105,1,105,1,105,1,105,1,105,1,105,1,105,1,105,3,105,
		1442,8,105,1,106,1,106,1,106,5,106,1447,8,106,10,106,12,106,1450,9,106,
		1,107,1,107,1,107,1,107,1,107,5,107,1457,8,107,10,107,12,107,1460,9,107,
		1,107,1,107,1,108,1,108,1,108,3,108,1467,8,108,1,109,1,109,1,109,1,109,
		1,109,1,110,1,110,1,110,1,110,5,110,1478,8,110,10,110,12,110,1481,9,110,
		3,110,1483,8,110,1,111,1,111,1,111,3,111,1488,8,111,3,111,1490,8,111,1,
		111,1,111,1,112,1,112,1,112,1,112,1,112,1,112,5,112,1500,8,112,10,112,
		12,112,1503,9,112,1,112,3,112,1506,8,112,3,112,1508,8,112,1,112,1,112,
		1,113,1,113,1,113,5,113,1515,8,113,10,113,12,113,1518,9,113,1,113,3,113,
		1521,8,113,1,114,1,114,3,114,1525,8,114,1,114,3,114,1528,8,114,1,115,1,
		115,3,115,1532,8,115,1,115,1,115,4,115,1536,8,115,11,115,12,115,1537,1,
		115,1,115,3,115,1542,8,115,1,115,4,115,1545,8,115,11,115,12,115,1546,3,
		115,1549,8,115,1,116,1,116,3,116,1553,8,116,1,116,1,116,1,116,3,116,1558,
		8,116,1,116,3,116,1561,8,116,1,117,1,117,1,117,5,117,1566,8,117,10,117,
		12,117,1569,9,117,1,118,1,118,1,118,1,118,3,118,1575,8,118,1,119,1,119,
		3,119,1579,8,119,1,119,1,119,3,119,1583,8,119,1,119,1,119,3,119,1587,8,
		119,1,119,1,119,3,119,1591,8,119,1,119,1,119,3,119,1595,8,119,1,119,1,
		119,3,119,1599,8,119,1,119,1,119,3,119,1603,8,119,1,119,1,119,3,119,1607,
		8,119,1,119,1,119,3,119,1611,8,119,1,119,1,119,3,119,1615,8,119,1,119,
		3,119,1618,8,119,1,120,1,120,1,120,1,120,1,121,1,121,1,121,3,121,1627,
		8,121,1,122,1,122,1,122,5,122,1632,8,122,10,122,12,122,1635,9,122,1,122,
		1,122,1,123,1,123,1,123,1,123,1,123,1,123,1,123,3,123,1646,8,123,1,123,
		3,123,1649,8,123,1,124,1,124,1,124,1,124,1,124,1,124,1,125,1,125,5,125,
		1659,8,125,10,125,12,125,1662,9,125,1,125,1,125,1,126,4,126,1667,8,126,
		11,126,12,126,1668,1,126,4,126,1672,8,126,11,126,12,126,1673,1,127,1,127,
		1,127,1,127,1,127,1,127,3,127,1682,8,127,1,127,1,127,1,127,1,127,3,127,
		1688,8,127,1,128,1,128,1,128,1,128,3,128,1694,8,128,1,129,1,129,1,129,
		1,129,1,129,1,129,1,130,1,130,1,130,1,130,1,130,1,130,1,130,1,130,1,131,
		1,131,1,131,3,131,1713,8,131,1,131,1,131,3,131,1717,8,131,1,131,1,131,
		3,131,1721,8,131,1,131,1,131,1,131,1,132,1,132,1,132,1,132,3,132,1730,
		8,132,1,133,1,133,1,133,1,133,1,133,3,133,1737,8,133,1,133,1,133,1,133,
		1,134,1,134,1,134,1,134,1,134,1,134,3,134,1748,8,134,3,134,1750,8,134,
		1,135,1,135,1,135,5,135,1755,8,135,10,135,12,135,1758,9,135,1,136,1,136,
		1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,3,136,1770,8,136,1,136,
		1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,3,136,1783,
		8,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,
		1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,1,136,
		1,136,1,136,3,136,1810,8,136,1,136,1,136,5,136,1814,8,136,10,136,12,136,
		1817,9,136,1,137,1,137,1,138,1,138,1,138,1,138,1,138,1,138,1,138,3,138,
		1828,8,138,3,138,1830,8,138,1,139,1,139,1,139,3,139,1835,8,139,1,140,1,
		140,3,140,1839,8,140,1,141,1,141,1,141,1,141,1,141,1,141,1,141,3,141,1848,
		8,141,1,141,1,141,1,141,1,141,1,141,3,141,1855,8,141,1,142,1,142,1,143,
		1,143,1,143,5,143,1862,8,143,10,143,12,143,1865,9,143,1,143,1,143,1,143,
		1,143,5,143,1871,8,143,10,143,12,143,1874,9,143,5,143,1876,8,143,10,143,
		12,143,1879,9,143,1,144,1,144,1,144,1,144,1,144,1,144,3,144,1887,8,144,
		1,144,1,144,1,144,1,144,4,144,1893,8,144,11,144,12,144,1894,1,144,1,144,
		3,144,1899,8,144,1,145,1,145,1,145,5,145,1904,8,145,10,145,12,145,1907,
		9,145,1,146,1,146,3,146,1911,8,146,1,147,1,147,1,147,1,147,1,147,1,147,
		1,147,1,147,1,147,1,147,1,147,1,147,1,147,1,147,1,147,3,147,1928,8,147,
		1,148,1,148,1,148,1,148,3,148,1934,8,148,1,148,1,148,3,148,1938,8,148,
		1,148,1,148,1,148,1,148,1,148,1,148,1,148,1,148,3,148,1948,8,148,1,149,
		1,149,5,149,1952,8,149,10,149,12,149,1955,9,149,1,149,4,149,1958,8,149,
		11,149,12,149,1959,1,150,1,150,1,150,0,3,182,272,286,151,0,2,4,6,8,10,
		12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,
		60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,
		106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,
		142,144,146,148,150,152,154,156,158,160,162,164,166,168,170,172,174,176,
		178,180,182,184,186,188,190,192,194,196,198,200,202,204,206,208,210,212,
		214,216,218,220,222,224,226,228,230,232,234,236,238,240,242,244,246,248,
		250,252,254,256,258,260,262,264,266,268,270,272,274,276,278,280,282,284,
		286,288,290,292,294,296,298,300,0,22,2,0,70,70,75,75,1,0,90,91,3,0,68,
		68,71,71,73,74,2,0,27,27,30,30,4,0,85,85,94,94,96,96,98,98,1,0,99,102,
		4,0,1,1,12,12,20,20,26,26,4,0,17,17,86,89,93,93,103,103,3,0,42,43,46,47,
		51,52,3,0,19,19,23,24,31,31,1,0,104,107,2,0,163,164,168,168,1,0,161,162,
		2,0,147,148,154,155,2,0,153,153,156,156,2,0,146,146,169,178,1,0,159,160,
		3,0,149,150,161,163,165,165,1,0,142,143,1,0,135,135,2,0,192,192,194,194,
		11,0,20,20,40,47,51,56,81,83,85,86,88,93,97,97,99,104,107,108,114,126,
		133,133,2187,0,305,1,0,0,0,2,322,1,0,0,0,4,324,1,0,0,0,6,329,1,0,0,0,8,
		357,1,0,0,0,10,378,1,0,0,0,12,392,1,0,0,0,14,402,1,0,0,0,16,412,1,0,0,
		0,18,420,1,0,0,0,20,426,1,0,0,0,22,456,1,0,0,0,24,458,1,0,0,0,26,462,1,
		0,0,0,28,473,1,0,0,0,30,481,1,0,0,0,32,496,1,0,0,0,34,524,1,0,0,0,36,534,
		1,0,0,0,38,536,1,0,0,0,40,557,1,0,0,0,42,559,1,0,0,0,44,567,1,0,0,0,46,
		571,1,0,0,0,48,574,1,0,0,0,50,578,1,0,0,0,52,594,1,0,0,0,54,598,1,0,0,
		0,56,601,1,0,0,0,58,605,1,0,0,0,60,626,1,0,0,0,62,629,1,0,0,0,64,645,1,
		0,0,0,66,647,1,0,0,0,68,659,1,0,0,0,70,661,1,0,0,0,72,669,1,0,0,0,74,675,
		1,0,0,0,76,696,1,0,0,0,78,709,1,0,0,0,80,714,1,0,0,0,82,731,1,0,0,0,84,
		735,1,0,0,0,86,755,1,0,0,0,88,757,1,0,0,0,90,775,1,0,0,0,92,777,1,0,0,
		0,94,789,1,0,0,0,96,796,1,0,0,0,98,804,1,0,0,0,100,807,1,0,0,0,102,818,
		1,0,0,0,104,828,1,0,0,0,106,843,1,0,0,0,108,845,1,0,0,0,110,850,1,0,0,
		0,112,855,1,0,0,0,114,865,1,0,0,0,116,867,1,0,0,0,118,879,1,0,0,0,120,
		885,1,0,0,0,122,891,1,0,0,0,124,894,1,0,0,0,126,897,1,0,0,0,128,901,1,
		0,0,0,130,913,1,0,0,0,132,919,1,0,0,0,134,921,1,0,0,0,136,927,1,0,0,0,
		138,939,1,0,0,0,140,941,1,0,0,0,142,952,1,0,0,0,144,960,1,0,0,0,146,971,
		1,0,0,0,148,982,1,0,0,0,150,987,1,0,0,0,152,994,1,0,0,0,154,1012,1,0,0,
		0,156,1022,1,0,0,0,158,1036,1,0,0,0,160,1044,1,0,0,0,162,1049,1,0,0,0,
		164,1064,1,0,0,0,166,1077,1,0,0,0,168,1079,1,0,0,0,170,1081,1,0,0,0,172,
		1083,1,0,0,0,174,1085,1,0,0,0,176,1091,1,0,0,0,178,1093,1,0,0,0,180,1095,
		1,0,0,0,182,1220,1,0,0,0,184,1237,1,0,0,0,186,1242,1,0,0,0,188,1256,1,
		0,0,0,190,1258,1,0,0,0,192,1279,1,0,0,0,194,1291,1,0,0,0,196,1302,1,0,
		0,0,198,1309,1,0,0,0,200,1334,1,0,0,0,202,1336,1,0,0,0,204,1342,1,0,0,
		0,206,1413,1,0,0,0,208,1428,1,0,0,0,210,1441,1,0,0,0,212,1443,1,0,0,0,
		214,1451,1,0,0,0,216,1466,1,0,0,0,218,1468,1,0,0,0,220,1482,1,0,0,0,222,
		1484,1,0,0,0,224,1493,1,0,0,0,226,1511,1,0,0,0,228,1527,1,0,0,0,230,1548,
		1,0,0,0,232,1560,1,0,0,0,234,1562,1,0,0,0,236,1574,1,0,0,0,238,1617,1,
		0,0,0,240,1619,1,0,0,0,242,1623,1,0,0,0,244,1628,1,0,0,0,246,1648,1,0,
		0,0,248,1650,1,0,0,0,250,1656,1,0,0,0,252,1666,1,0,0,0,254,1687,1,0,0,
		0,256,1693,1,0,0,0,258,1695,1,0,0,0,260,1701,1,0,0,0,262,1709,1,0,0,0,
		264,1729,1,0,0,0,266,1731,1,0,0,0,268,1749,1,0,0,0,270,1751,1,0,0,0,272,
		1769,1,0,0,0,274,1818,1,0,0,0,276,1829,1,0,0,0,278,1834,1,0,0,0,280,1838,
		1,0,0,0,282,1854,1,0,0,0,284,1856,1,0,0,0,286,1858,1,0,0,0,288,1898,1,
		0,0,0,290,1900,1,0,0,0,292,1910,1,0,0,0,294,1927,1,0,0,0,296,1947,1,0,
		0,0,298,1957,1,0,0,0,300,1961,1,0,0,0,302,304,3,2,1,0,303,302,1,0,0,0,
		304,307,1,0,0,0,305,303,1,0,0,0,305,306,1,0,0,0,306,308,1,0,0,0,307,305,
		1,0,0,0,308,309,5,0,0,1,309,1,1,0,0,0,310,323,3,4,2,0,311,323,3,124,62,
		0,312,323,3,142,71,0,313,323,3,6,3,0,314,323,3,10,5,0,315,323,3,8,4,0,
		316,323,3,12,6,0,317,323,3,20,10,0,318,323,3,24,12,0,319,323,3,26,13,0,
		320,323,3,126,63,0,321,323,5,140,0,0,322,310,1,0,0,0,322,311,1,0,0,0,322,
		312,1,0,0,0,322,313,1,0,0,0,322,314,1,0,0,0,322,315,1,0,0,0,322,316,1,
		0,0,0,322,317,1,0,0,0,322,318,1,0,0,0,322,319,1,0,0,0,322,320,1,0,0,0,
		322,321,1,0,0,0,323,3,1,0,0,0,324,325,5,67,0,0,325,326,3,300,150,0,326,
		327,5,140,0,0,327,5,1,0,0,0,328,330,5,126,0,0,329,328,1,0,0,0,329,330,
		1,0,0,0,330,331,1,0,0,0,331,332,5,66,0,0,332,335,3,14,7,0,333,334,5,152,
		0,0,334,336,3,300,150,0,335,333,1,0,0,0,335,336,1,0,0,0,336,346,1,0,0,
		0,337,340,5,148,0,0,338,341,3,28,14,0,339,341,3,16,8,0,340,338,1,0,0,0,
		340,339,1,0,0,0,341,342,1,0,0,0,342,343,5,147,0,0,343,345,1,0,0,0,344,
		337,1,0,0,0,345,348,1,0,0,0,346,344,1,0,0,0,346,347,1,0,0,0,347,350,1,
		0,0,0,348,346,1,0,0,0,349,351,3,38,19,0,350,349,1,0,0,0,350,351,1,0,0,
		0,351,353,1,0,0,0,352,354,3,44,22,0,353,352,1,0,0,0,353,354,1,0,0,0,354,
		355,1,0,0,0,355,356,5,63,0,0,356,7,1,0,0,0,357,358,5,66,0,0,358,359,3,
		14,7,0,359,361,5,134,0,0,360,362,3,300,150,0,361,360,1,0,0,0,361,362,1,
		0,0,0,362,363,1,0,0,0,363,368,5,135,0,0,364,365,5,148,0,0,365,366,3,28,
		14,0,366,367,5,147,0,0,367,369,1,0,0,0,368,364,1,0,0,0,368,369,1,0,0,0,
		369,371,1,0,0,0,370,372,3,38,19,0,371,370,1,0,0,0,371,372,1,0,0,0,372,
		374,1,0,0,0,373,375,3,44,22,0,374,373,1,0,0,0,374,375,1,0,0,0,375,376,
		1,0,0,0,376,377,5,63,0,0,377,9,1,0,0,0,378,379,5,65,0,0,379,382,3,14,7,
		0,380,381,5,152,0,0,381,383,3,300,150,0,382,380,1,0,0,0,382,383,1,0,0,
		0,383,385,1,0,0,0,384,386,3,38,19,0,385,384,1,0,0,0,385,386,1,0,0,0,386,
		388,1,0,0,0,387,389,3,52,26,0,388,387,1,0,0,0,388,389,1,0,0,0,389,390,
		1,0,0,0,390,391,5,63,0,0,391,11,1,0,0,0,392,393,5,65,0,0,393,394,3,14,
		7,0,394,395,5,134,0,0,395,396,3,300,150,0,396,398,5,135,0,0,397,399,3,
		52,26,0,398,397,1,0,0,0,398,399,1,0,0,0,399,400,1,0,0,0,400,401,5,63,0,
		0,401,13,1,0,0,0,402,410,3,300,150,0,403,406,5,148,0,0,404,407,3,28,14,
		0,405,407,3,16,8,0,406,404,1,0,0,0,406,405,1,0,0,0,407,408,1,0,0,0,408,
		409,5,147,0,0,409,411,1,0,0,0,410,403,1,0,0,0,410,411,1,0,0,0,411,15,1,
		0,0,0,412,417,3,18,9,0,413,414,5,141,0,0,414,416,3,18,9,0,415,413,1,0,
		0,0,416,419,1,0,0,0,417,415,1,0,0,0,417,418,1,0,0,0,418,17,1,0,0,0,419,
		417,1,0,0,0,420,423,3,154,77,0,421,422,5,152,0,0,422,424,3,154,77,0,423,
		421,1,0,0,0,423,424,1,0,0,0,424,19,1,0,0,0,425,427,3,206,103,0,426,425,
		1,0,0,0,426,427,1,0,0,0,427,428,1,0,0,0,428,429,5,69,0,0,429,434,3,36,
		18,0,430,431,5,148,0,0,431,432,3,28,14,0,432,433,5,147,0,0,433,435,1,0,
		0,0,434,430,1,0,0,0,434,435,1,0,0,0,435,439,1,0,0,0,436,438,3,22,11,0,
		437,436,1,0,0,0,438,441,1,0,0,0,439,437,1,0,0,0,439,440,1,0,0,0,440,442,
		1,0,0,0,441,439,1,0,0,0,442,443,5,63,0,0,443,21,1,0,0,0,444,448,7,0,0,
		0,445,447,3,44,22,0,446,445,1,0,0,0,447,450,1,0,0,0,448,446,1,0,0,0,448,
		449,1,0,0,0,449,457,1,0,0,0,450,448,1,0,0,0,451,453,3,44,22,0,452,451,
		1,0,0,0,453,454,1,0,0,0,454,452,1,0,0,0,454,455,1,0,0,0,455,457,1,0,0,
		0,456,444,1,0,0,0,456,452,1,0,0,0,457,23,1,0,0,0,458,459,5,69,0,0,459,
		460,3,28,14,0,460,461,5,140,0,0,461,25,1,0,0,0,462,463,5,60,0,0,463,468,
		3,14,7,0,464,465,5,141,0,0,465,467,3,14,7,0,466,464,1,0,0,0,467,470,1,
		0,0,0,468,466,1,0,0,0,468,469,1,0,0,0,469,471,1,0,0,0,470,468,1,0,0,0,
		471,472,5,140,0,0,472,27,1,0,0,0,473,478,3,36,18,0,474,475,5,141,0,0,475,
		477,3,36,18,0,476,474,1,0,0,0,477,480,1,0,0,0,478,476,1,0,0,0,478,479,
		1,0,0,0,479,29,1,0,0,0,480,478,1,0,0,0,481,486,5,72,0,0,482,483,5,134,
		0,0,483,484,3,32,16,0,484,485,5,135,0,0,485,487,1,0,0,0,486,482,1,0,0,
		0,486,487,1,0,0,0,487,489,1,0,0,0,488,490,3,166,83,0,489,488,1,0,0,0,489,
		490,1,0,0,0,490,492,1,0,0,0,491,493,5,125,0,0,492,491,1,0,0,0,492,493,
		1,0,0,0,493,494,1,0,0,0,494,495,3,164,82,0,495,31,1,0,0,0,496,501,3,34,
		17,0,497,498,5,141,0,0,498,500,3,34,17,0,499,497,1,0,0,0,500,503,1,0,0,
		0,501,499,1,0,0,0,501,502,1,0,0,0,502,33,1,0,0,0,503,501,1,0,0,0,504,525,
		5,81,0,0,505,525,5,82,0,0,506,525,5,118,0,0,507,525,5,121,0,0,508,525,
		5,83,0,0,509,525,5,114,0,0,510,525,5,122,0,0,511,525,5,115,0,0,512,525,
		5,119,0,0,513,525,5,120,0,0,514,515,5,116,0,0,515,516,5,146,0,0,516,525,
		3,300,150,0,517,518,5,117,0,0,518,519,5,146,0,0,519,520,3,300,150,0,520,
		521,5,152,0,0,521,525,1,0,0,0,522,525,3,170,85,0,523,525,3,300,150,0,524,
		504,1,0,0,0,524,505,1,0,0,0,524,506,1,0,0,0,524,507,1,0,0,0,524,508,1,
		0,0,0,524,509,1,0,0,0,524,510,1,0,0,0,524,511,1,0,0,0,524,512,1,0,0,0,
		524,513,1,0,0,0,524,514,1,0,0,0,524,517,1,0,0,0,524,522,1,0,0,0,524,523,
		1,0,0,0,525,35,1,0,0,0,526,527,5,148,0,0,527,528,3,28,14,0,528,529,5,147,
		0,0,529,535,1,0,0,0,530,532,7,1,0,0,531,530,1,0,0,0,531,532,1,0,0,0,532,
		533,1,0,0,0,533,535,3,300,150,0,534,526,1,0,0,0,534,531,1,0,0,0,535,37,
		1,0,0,0,536,540,5,136,0,0,537,539,3,40,20,0,538,537,1,0,0,0,539,542,1,
		0,0,0,540,538,1,0,0,0,540,541,1,0,0,0,541,543,1,0,0,0,542,540,1,0,0,0,
		543,544,5,137,0,0,544,39,1,0,0,0,545,549,3,42,21,0,546,548,3,164,82,0,
		547,546,1,0,0,0,548,551,1,0,0,0,549,547,1,0,0,0,549,550,1,0,0,0,550,558,
		1,0,0,0,551,549,1,0,0,0,552,554,3,164,82,0,553,552,1,0,0,0,554,555,1,0,
		0,0,555,553,1,0,0,0,555,556,1,0,0,0,556,558,1,0,0,0,557,545,1,0,0,0,557,
		553,1,0,0,0,558,41,1,0,0,0,559,560,7,2,0,0,560,43,1,0,0,0,561,568,3,142,
		71,0,562,568,3,46,23,0,563,568,3,48,24,0,564,568,3,30,15,0,565,568,3,124,
		62,0,566,568,5,140,0,0,567,561,1,0,0,0,567,562,1,0,0,0,567,563,1,0,0,0,
		567,564,1,0,0,0,567,565,1,0,0,0,567,566,1,0,0,0,568,569,1,0,0,0,569,567,
		1,0,0,0,569,570,1,0,0,0,570,45,1,0,0,0,571,572,5,161,0,0,572,573,3,50,
		25,0,573,47,1,0,0,0,574,575,5,162,0,0,575,576,3,50,25,0,576,49,1,0,0,0,
		577,579,3,66,33,0,578,577,1,0,0,0,578,579,1,0,0,0,579,580,1,0,0,0,580,
		584,3,60,30,0,581,583,3,206,103,0,582,581,1,0,0,0,583,586,1,0,0,0,584,
		582,1,0,0,0,584,585,1,0,0,0,585,587,1,0,0,0,586,584,1,0,0,0,587,588,5,
		140,0,0,588,51,1,0,0,0,589,595,3,126,63,0,590,595,3,142,71,0,591,595,3,
		54,27,0,592,595,3,56,28,0,593,595,3,68,34,0,594,589,1,0,0,0,594,590,1,
		0,0,0,594,591,1,0,0,0,594,592,1,0,0,0,594,593,1,0,0,0,595,596,1,0,0,0,
		596,594,1,0,0,0,596,597,1,0,0,0,597,53,1,0,0,0,598,599,5,161,0,0,599,600,
		3,58,29,0,600,55,1,0,0,0,601,602,5,162,0,0,602,603,3,58,29,0,603,57,1,
		0,0,0,604,606,3,66,33,0,605,604,1,0,0,0,605,606,1,0,0,0,606,607,1,0,0,
		0,607,609,3,60,30,0,608,610,3,158,79,0,609,608,1,0,0,0,609,610,1,0,0,0,
		610,612,1,0,0,0,611,613,5,140,0,0,612,611,1,0,0,0,612,613,1,0,0,0,613,
		614,1,0,0,0,614,615,3,244,122,0,615,59,1,0,0,0,616,627,3,64,32,0,617,619,
		3,62,31,0,618,617,1,0,0,0,619,620,1,0,0,0,620,618,1,0,0,0,620,621,1,0,
		0,0,621,624,1,0,0,0,622,623,5,141,0,0,623,625,5,179,0,0,624,622,1,0,0,
		0,624,625,1,0,0,0,625,627,1,0,0,0,626,616,1,0,0,0,626,618,1,0,0,0,627,
		61,1,0,0,0,628,630,3,64,32,0,629,628,1,0,0,0,629,630,1,0,0,0,630,631,1,
		0,0,0,631,635,5,152,0,0,632,634,3,66,33,0,633,632,1,0,0,0,634,637,1,0,
		0,0,635,633,1,0,0,0,635,636,1,0,0,0,636,639,1,0,0,0,637,635,1,0,0,0,638,
		640,3,168,84,0,639,638,1,0,0,0,639,640,1,0,0,0,640,641,1,0,0,0,641,642,
		3,300,150,0,642,63,1,0,0,0,643,646,3,300,150,0,644,646,5,22,0,0,645,643,
		1,0,0,0,645,644,1,0,0,0,646,65,1,0,0,0,647,648,5,134,0,0,648,649,3,228,
		114,0,649,650,5,135,0,0,650,67,1,0,0,0,651,652,5,78,0,0,652,653,3,70,35,
		0,653,654,5,140,0,0,654,660,1,0,0,0,655,656,5,61,0,0,656,657,3,70,35,0,
		657,658,5,140,0,0,658,660,1,0,0,0,659,651,1,0,0,0,659,655,1,0,0,0,660,
		69,1,0,0,0,661,666,3,72,36,0,662,663,5,141,0,0,663,665,3,72,36,0,664,662,
		1,0,0,0,665,668,1,0,0,0,666,664,1,0,0,0,666,667,1,0,0,0,667,71,1,0,0,0,
		668,666,1,0,0,0,669,672,3,300,150,0,670,671,5,146,0,0,671,673,3,300,150,
		0,672,670,1,0,0,0,672,673,1,0,0,0,673,73,1,0,0,0,674,676,5,109,0,0,675,
		674,1,0,0,0,675,676,1,0,0,0,676,678,1,0,0,0,677,679,3,170,85,0,678,677,
		1,0,0,0,678,679,1,0,0,0,679,680,1,0,0,0,680,682,3,182,91,0,681,683,3,170,
		85,0,682,681,1,0,0,0,682,683,1,0,0,0,683,684,1,0,0,0,684,686,5,134,0,0,
		685,687,5,109,0,0,686,685,1,0,0,0,686,687,1,0,0,0,687,688,1,0,0,0,688,
		690,5,167,0,0,689,691,3,170,85,0,690,689,1,0,0,0,690,691,1,0,0,0,691,692,
		1,0,0,0,692,694,5,135,0,0,693,695,3,88,44,0,694,693,1,0,0,0,694,695,1,
		0,0,0,695,75,1,0,0,0,696,705,5,148,0,0,697,702,3,78,39,0,698,699,5,141,
		0,0,699,701,3,78,39,0,700,698,1,0,0,0,701,704,1,0,0,0,702,700,1,0,0,0,
		702,703,1,0,0,0,703,706,1,0,0,0,704,702,1,0,0,0,705,697,1,0,0,0,705,706,
		1,0,0,0,706,707,1,0,0,0,707,708,5,147,0,0,708,77,1,0,0,0,709,712,3,182,
		91,0,710,711,5,152,0,0,711,713,3,182,91,0,712,710,1,0,0,0,712,713,1,0,
		0,0,713,79,1,0,0,0,714,715,5,144,0,0,715,727,5,136,0,0,716,721,3,82,41,
		0,717,718,5,141,0,0,718,720,3,82,41,0,719,717,1,0,0,0,720,723,1,0,0,0,
		721,719,1,0,0,0,721,722,1,0,0,0,722,725,1,0,0,0,723,721,1,0,0,0,724,726,
		5,141,0,0,725,724,1,0,0,0,725,726,1,0,0,0,726,728,1,0,0,0,727,716,1,0,
		0,0,727,728,1,0,0,0,728,729,1,0,0,0,729,730,5,137,0,0,730,81,1,0,0,0,731,
		732,3,276,138,0,732,733,5,152,0,0,733,734,3,272,136,0,734,83,1,0,0,0,735,
		736,5,144,0,0,736,741,5,138,0,0,737,739,3,270,135,0,738,740,5,141,0,0,
		739,738,1,0,0,0,739,740,1,0,0,0,740,742,1,0,0,0,741,737,1,0,0,0,741,742,
		1,0,0,0,742,743,1,0,0,0,743,744,5,139,0,0,744,85,1,0,0,0,745,746,5,144,
		0,0,746,747,5,134,0,0,747,748,3,272,136,0,748,749,5,135,0,0,749,756,1,
		0,0,0,750,753,5,144,0,0,751,754,3,296,148,0,752,754,3,300,150,0,753,751,
		1,0,0,0,753,752,1,0,0,0,754,756,1,0,0,0,755,745,1,0,0,0,755,750,1,0,0,
		0,756,87,1,0,0,0,757,769,5,134,0,0,758,761,3,90,45,0,759,761,5,32,0,0,
		760,758,1,0,0,0,760,759,1,0,0,0,761,766,1,0,0,0,762,763,5,141,0,0,763,
		765,3,90,45,0,764,762,1,0,0,0,765,768,1,0,0,0,766,764,1,0,0,0,766,767,
		1,0,0,0,767,770,1,0,0,0,768,766,1,0,0,0,769,760,1,0,0,0,769,770,1,0,0,
		0,770,771,1,0,0,0,771,772,5,135,0,0,772,89,1,0,0,0,773,776,3,112,56,0,
		774,776,3,228,114,0,775,773,1,0,0,0,775,774,1,0,0,0,776,91,1,0,0,0,777,
		779,5,167,0,0,778,780,3,182,91,0,779,778,1,0,0,0,779,780,1,0,0,0,780,782,
		1,0,0,0,781,783,3,170,85,0,782,781,1,0,0,0,782,783,1,0,0,0,783,785,1,0,
		0,0,784,786,3,88,44,0,785,784,1,0,0,0,785,786,1,0,0,0,786,787,1,0,0,0,
		787,788,3,244,122,0,788,93,1,0,0,0,789,790,5,138,0,0,790,791,3,96,48,0,
		791,792,3,98,49,0,792,793,5,139,0,0,793,95,1,0,0,0,794,797,3,272,136,0,
		795,797,3,182,91,0,796,794,1,0,0,0,796,795,1,0,0,0,797,97,1,0,0,0,798,
		805,3,64,32,0,799,801,3,100,50,0,800,799,1,0,0,0,801,802,1,0,0,0,802,800,
		1,0,0,0,802,803,1,0,0,0,803,805,1,0,0,0,804,798,1,0,0,0,804,800,1,0,0,
		0,805,99,1,0,0,0,806,808,3,64,32,0,807,806,1,0,0,0,807,808,1,0,0,0,808,
		809,1,0,0,0,809,810,5,152,0,0,810,815,3,102,51,0,811,812,5,141,0,0,812,
		814,3,102,51,0,813,811,1,0,0,0,814,817,1,0,0,0,815,813,1,0,0,0,815,816,
		1,0,0,0,816,101,1,0,0,0,817,815,1,0,0,0,818,820,3,270,135,0,819,821,3,
		170,85,0,820,819,1,0,0,0,820,821,1,0,0,0,821,826,1,0,0,0,822,823,5,136,
		0,0,823,824,3,226,113,0,824,825,5,137,0,0,825,827,1,0,0,0,826,822,1,0,
		0,0,826,827,1,0,0,0,827,103,1,0,0,0,828,829,5,76,0,0,829,830,5,134,0,0,
		830,831,3,106,53,0,831,832,5,135,0,0,832,105,1,0,0,0,833,844,3,64,32,0,
		834,844,5,145,0,0,835,837,3,64,32,0,836,835,1,0,0,0,836,837,1,0,0,0,837,
		838,1,0,0,0,838,840,5,152,0,0,839,836,1,0,0,0,840,841,1,0,0,0,841,839,
		1,0,0,0,841,842,1,0,0,0,842,844,1,0,0,0,843,833,1,0,0,0,843,834,1,0,0,
		0,843,839,1,0,0,0,844,107,1,0,0,0,845,846,5,69,0,0,846,847,5,134,0,0,847,
		848,3,36,18,0,848,849,5,135,0,0,849,109,1,0,0,0,850,851,5,62,0,0,851,852,
		5,134,0,0,852,853,3,228,114,0,853,854,5,135,0,0,854,111,1,0,0,0,855,856,
		3,154,77,0,856,857,3,200,100,0,857,113,1,0,0,0,858,859,5,79,0,0,859,860,
		5,134,0,0,860,861,3,300,150,0,861,862,5,135,0,0,862,866,1,0,0,0,863,864,
		5,79,0,0,864,866,3,272,136,0,865,858,1,0,0,0,865,863,1,0,0,0,866,115,1,
		0,0,0,867,868,5,80,0,0,868,872,3,244,122,0,869,871,3,118,59,0,870,869,
		1,0,0,0,871,874,1,0,0,0,872,870,1,0,0,0,872,873,1,0,0,0,873,877,1,0,0,
		0,874,872,1,0,0,0,875,876,5,64,0,0,876,878,3,244,122,0,877,875,1,0,0,0,
		877,878,1,0,0,0,878,117,1,0,0,0,879,880,5,59,0,0,880,881,5,134,0,0,881,
		882,3,112,56,0,882,883,5,135,0,0,883,884,3,244,122,0,884,119,1,0,0,0,885,
		886,5,77,0,0,886,887,5,134,0,0,887,888,3,272,136,0,888,889,5,135,0,0,889,
		890,3,244,122,0,890,121,1,0,0,0,891,892,5,58,0,0,892,893,3,244,122,0,893,
		123,1,0,0,0,894,895,3,128,64,0,895,896,5,140,0,0,896,125,1,0,0,0,897,898,
		3,128,64,0,898,899,3,244,122,0,899,127,1,0,0,0,900,902,3,154,77,0,901,
		900,1,0,0,0,901,902,1,0,0,0,902,903,1,0,0,0,903,904,3,300,150,0,904,906,
		5,134,0,0,905,907,3,204,102,0,906,905,1,0,0,0,906,907,1,0,0,0,907,908,
		1,0,0,0,908,909,5,135,0,0,909,911,1,0,0,0,910,912,3,156,78,0,911,910,1,
		0,0,0,911,912,1,0,0,0,912,129,1,0,0,0,913,915,3,132,66,0,914,916,3,134,
		67,0,915,914,1,0,0,0,915,916,1,0,0,0,916,131,1,0,0,0,917,920,5,5,0,0,918,
		920,3,300,150,0,919,917,1,0,0,0,919,918,1,0,0,0,920,133,1,0,0,0,921,923,
		5,134,0,0,922,924,3,136,68,0,923,922,1,0,0,0,923,924,1,0,0,0,924,925,1,
		0,0,0,925,926,5,135,0,0,926,135,1,0,0,0,927,932,3,138,69,0,928,929,5,141,
		0,0,929,931,3,138,69,0,930,928,1,0,0,0,931,934,1,0,0,0,932,930,1,0,0,0,
		932,933,1,0,0,0,933,137,1,0,0,0,934,932,1,0,0,0,935,940,3,130,65,0,936,
		940,3,296,148,0,937,940,3,298,149,0,938,940,3,140,70,0,939,935,1,0,0,0,
		939,936,1,0,0,0,939,937,1,0,0,0,939,938,1,0,0,0,940,139,1,0,0,0,941,942,
		3,132,66,0,942,946,5,146,0,0,943,947,3,296,148,0,944,947,3,132,66,0,945,
		947,3,298,149,0,946,943,1,0,0,0,946,944,1,0,0,0,946,945,1,0,0,0,947,141,
		1,0,0,0,948,953,3,144,72,0,949,953,3,146,73,0,950,953,3,148,74,0,951,953,
		3,150,75,0,952,948,1,0,0,0,952,949,1,0,0,0,952,950,1,0,0,0,952,951,1,0,
		0,0,953,955,1,0,0,0,954,956,3,206,103,0,955,954,1,0,0,0,955,956,1,0,0,
		0,956,957,1,0,0,0,957,958,5,140,0,0,958,143,1,0,0,0,959,961,3,156,78,0,
		960,959,1,0,0,0,960,961,1,0,0,0,961,962,1,0,0,0,962,964,3,300,150,0,963,
		965,3,156,78,0,964,963,1,0,0,0,964,965,1,0,0,0,965,966,1,0,0,0,966,967,
		5,134,0,0,967,968,3,200,100,0,968,969,5,135,0,0,969,145,1,0,0,0,970,972,
		3,156,78,0,971,970,1,0,0,0,971,972,1,0,0,0,972,974,1,0,0,0,973,975,5,29,
		0,0,974,973,1,0,0,0,974,975,1,0,0,0,975,980,1,0,0,0,976,977,3,190,95,0,
		977,978,3,300,150,0,978,981,1,0,0,0,979,981,3,192,96,0,980,976,1,0,0,0,
		980,979,1,0,0,0,981,147,1,0,0,0,982,984,3,154,77,0,983,985,3,158,79,0,
		984,983,1,0,0,0,984,985,1,0,0,0,985,149,1,0,0,0,986,988,3,156,78,0,987,
		986,1,0,0,0,987,988,1,0,0,0,988,989,1,0,0,0,989,990,5,29,0,0,990,992,3,
		154,77,0,991,993,3,152,76,0,992,991,1,0,0,0,992,993,1,0,0,0,993,151,1,
		0,0,0,994,999,3,200,100,0,995,996,5,141,0,0,996,998,3,200,100,0,997,995,
		1,0,0,0,998,1001,1,0,0,0,999,997,1,0,0,0,999,1000,1,0,0,0,1000,153,1,0,
		0,0,1001,999,1,0,0,0,1002,1011,3,172,86,0,1003,1011,3,156,78,0,1004,1011,
		3,168,84,0,1005,1011,3,170,85,0,1006,1011,3,166,83,0,1007,1011,5,109,0,
		0,1008,1011,3,174,87,0,1009,1011,3,176,88,0,1010,1002,1,0,0,0,1010,1003,
		1,0,0,0,1010,1004,1,0,0,0,1010,1005,1,0,0,0,1010,1006,1,0,0,0,1010,1007,
		1,0,0,0,1010,1008,1,0,0,0,1010,1009,1,0,0,0,1011,1014,1,0,0,0,1012,1010,
		1,0,0,0,1012,1013,1,0,0,0,1013,1015,1,0,0,0,1014,1012,1,0,0,0,1015,1019,
		3,182,91,0,1016,1018,3,156,78,0,1017,1016,1,0,0,0,1018,1021,1,0,0,0,1019,
		1017,1,0,0,0,1019,1020,1,0,0,0,1020,155,1,0,0,0,1021,1019,1,0,0,0,1022,
		1023,5,84,0,0,1023,1024,5,134,0,0,1024,1025,5,134,0,0,1025,1030,3,130,
		65,0,1026,1027,5,141,0,0,1027,1029,3,130,65,0,1028,1026,1,0,0,0,1029,1032,
		1,0,0,0,1030,1028,1,0,0,0,1030,1031,1,0,0,0,1031,1033,1,0,0,0,1032,1030,
		1,0,0,0,1033,1034,5,135,0,0,1034,1035,5,135,0,0,1035,157,1,0,0,0,1036,
		1041,3,160,80,0,1037,1038,5,141,0,0,1038,1040,3,160,80,0,1039,1037,1,0,
		0,0,1040,1043,1,0,0,0,1041,1039,1,0,0,0,1041,1042,1,0,0,0,1042,159,1,0,
		0,0,1043,1041,1,0,0,0,1044,1047,3,200,100,0,1045,1046,5,146,0,0,1046,1048,
		3,278,139,0,1047,1045,1,0,0,0,1047,1048,1,0,0,0,1048,161,1,0,0,0,1049,
		1062,7,3,0,0,1050,1063,3,300,150,0,1051,1053,3,300,150,0,1052,1051,1,0,
		0,0,1052,1053,1,0,0,0,1053,1054,1,0,0,0,1054,1056,5,136,0,0,1055,1057,
		3,164,82,0,1056,1055,1,0,0,0,1057,1058,1,0,0,0,1058,1056,1,0,0,0,1058,
		1059,1,0,0,0,1059,1060,1,0,0,0,1060,1061,5,137,0,0,1061,1063,1,0,0,0,1062,
		1050,1,0,0,0,1062,1052,1,0,0,0,1063,163,1,0,0,0,1064,1065,3,154,77,0,1065,
		1067,3,186,93,0,1066,1068,3,206,103,0,1067,1066,1,0,0,0,1067,1068,1,0,
		0,0,1068,1069,1,0,0,0,1069,1070,5,140,0,0,1070,165,1,0,0,0,1071,1072,5,
		124,0,0,1072,1073,5,134,0,0,1073,1074,3,300,150,0,1074,1075,5,135,0,0,
		1075,1078,1,0,0,0,1076,1078,5,123,0,0,1077,1071,1,0,0,0,1077,1076,1,0,
		0,0,1078,167,1,0,0,0,1079,1080,7,4,0,0,1080,169,1,0,0,0,1081,1082,7,5,
		0,0,1082,171,1,0,0,0,1083,1084,7,6,0,0,1084,173,1,0,0,0,1085,1086,7,7,
		0,0,1086,175,1,0,0,0,1087,1092,5,5,0,0,1088,1092,5,33,0,0,1089,1092,5,
		21,0,0,1090,1092,3,178,89,0,1091,1087,1,0,0,0,1091,1088,1,0,0,0,1091,1089,
		1,0,0,0,1091,1090,1,0,0,0,1092,177,1,0,0,0,1093,1094,7,8,0,0,1094,179,
		1,0,0,0,1095,1096,7,9,0,0,1096,181,1,0,0,0,1097,1098,6,91,-1,0,1098,1102,
		5,32,0,0,1099,1101,3,176,88,0,1100,1099,1,0,0,0,1101,1104,1,0,0,0,1102,
		1100,1,0,0,0,1102,1103,1,0,0,0,1103,1221,1,0,0,0,1104,1102,1,0,0,0,1105,
		1107,3,180,90,0,1106,1105,1,0,0,0,1107,1110,1,0,0,0,1108,1106,1,0,0,0,
		1108,1109,1,0,0,0,1109,1111,1,0,0,0,1110,1108,1,0,0,0,1111,1115,5,4,0,
		0,1112,1114,3,176,88,0,1113,1112,1,0,0,0,1114,1117,1,0,0,0,1115,1113,1,
		0,0,0,1115,1116,1,0,0,0,1116,1221,1,0,0,0,1117,1115,1,0,0,0,1118,1120,
		3,180,90,0,1119,1118,1,0,0,0,1120,1123,1,0,0,0,1121,1119,1,0,0,0,1121,
		1122,1,0,0,0,1122,1124,1,0,0,0,1123,1121,1,0,0,0,1124,1128,5,23,0,0,1125,
		1127,3,176,88,0,1126,1125,1,0,0,0,1127,1130,1,0,0,0,1128,1126,1,0,0,0,
		1128,1129,1,0,0,0,1129,1221,1,0,0,0,1130,1128,1,0,0,0,1131,1133,3,180,
		90,0,1132,1131,1,0,0,0,1133,1136,1,0,0,0,1134,1132,1,0,0,0,1134,1135,1,
		0,0,0,1135,1137,1,0,0,0,1136,1134,1,0,0,0,1137,1141,5,18,0,0,1138,1140,
		3,176,88,0,1139,1138,1,0,0,0,1140,1143,1,0,0,0,1141,1139,1,0,0,0,1141,
		1142,1,0,0,0,1142,1221,1,0,0,0,1143,1141,1,0,0,0,1144,1146,3,180,90,0,
		1145,1144,1,0,0,0,1146,1149,1,0,0,0,1147,1145,1,0,0,0,1147,1148,1,0,0,
		0,1148,1150,1,0,0,0,1149,1147,1,0,0,0,1150,1154,5,19,0,0,1151,1153,3,176,
		88,0,1152,1151,1,0,0,0,1153,1156,1,0,0,0,1154,1152,1,0,0,0,1154,1155,1,
		0,0,0,1155,1221,1,0,0,0,1156,1154,1,0,0,0,1157,1159,3,180,90,0,1158,1157,
		1,0,0,0,1159,1162,1,0,0,0,1160,1158,1,0,0,0,1160,1161,1,0,0,0,1161,1163,
		1,0,0,0,1162,1160,1,0,0,0,1163,1167,5,13,0,0,1164,1166,3,176,88,0,1165,
		1164,1,0,0,0,1166,1169,1,0,0,0,1167,1165,1,0,0,0,1167,1168,1,0,0,0,1168,
		1221,1,0,0,0,1169,1167,1,0,0,0,1170,1172,3,180,90,0,1171,1170,1,0,0,0,
		1172,1175,1,0,0,0,1173,1171,1,0,0,0,1173,1174,1,0,0,0,1174,1176,1,0,0,
		0,1175,1173,1,0,0,0,1176,1180,5,9,0,0,1177,1179,3,176,88,0,1178,1177,1,
		0,0,0,1179,1182,1,0,0,0,1180,1178,1,0,0,0,1180,1181,1,0,0,0,1181,1221,
		1,0,0,0,1182,1180,1,0,0,0,1183,1221,3,184,92,0,1184,1221,3,162,81,0,1185,
		1221,3,190,95,0,1186,1221,3,192,96,0,1187,1192,5,44,0,0,1188,1189,5,148,
		0,0,1189,1190,3,28,14,0,1190,1191,5,147,0,0,1191,1193,1,0,0,0,1192,1188,
		1,0,0,0,1192,1193,1,0,0,0,1193,1199,1,0,0,0,1194,1198,3,168,84,0,1195,
		1198,3,170,85,0,1196,1198,3,176,88,0,1197,1194,1,0,0,0,1197,1195,1,0,0,
		0,1197,1196,1,0,0,0,1198,1201,1,0,0,0,1199,1197,1,0,0,0,1199,1200,1,0,
		0,0,1200,1221,1,0,0,0,1201,1199,1,0,0,0,1202,1208,3,14,7,0,1203,1207,3,
		168,84,0,1204,1207,3,170,85,0,1205,1207,3,176,88,0,1206,1203,1,0,0,0,1206,
		1204,1,0,0,0,1206,1205,1,0,0,0,1207,1210,1,0,0,0,1208,1206,1,0,0,0,1208,
		1209,1,0,0,0,1209,1221,1,0,0,0,1210,1208,1,0,0,0,1211,1217,3,300,150,0,
		1212,1216,3,168,84,0,1213,1216,3,170,85,0,1214,1216,3,176,88,0,1215,1212,
		1,0,0,0,1215,1213,1,0,0,0,1215,1214,1,0,0,0,1216,1219,1,0,0,0,1217,1215,
		1,0,0,0,1217,1218,1,0,0,0,1218,1221,1,0,0,0,1219,1217,1,0,0,0,1220,1097,
		1,0,0,0,1220,1108,1,0,0,0,1220,1121,1,0,0,0,1220,1134,1,0,0,0,1220,1147,
		1,0,0,0,1220,1160,1,0,0,0,1220,1173,1,0,0,0,1220,1183,1,0,0,0,1220,1184,
		1,0,0,0,1220,1185,1,0,0,0,1220,1186,1,0,0,0,1220,1187,1,0,0,0,1220,1202,
		1,0,0,0,1220,1211,1,0,0,0,1221,1234,1,0,0,0,1222,1223,10,1,0,0,1223,1229,
		5,163,0,0,1224,1228,3,168,84,0,1225,1228,3,170,85,0,1226,1228,3,176,88,
		0,1227,1224,1,0,0,0,1227,1225,1,0,0,0,1227,1226,1,0,0,0,1228,1231,1,0,
		0,0,1229,1227,1,0,0,0,1229,1230,1,0,0,0,1230,1233,1,0,0,0,1231,1229,1,
		0,0,0,1232,1222,1,0,0,0,1233,1236,1,0,0,0,1234,1232,1,0,0,0,1234,1235,
		1,0,0,0,1235,183,1,0,0,0,1236,1234,1,0,0,0,1237,1238,5,95,0,0,1238,1239,
		5,134,0,0,1239,1240,3,272,136,0,1240,1241,5,135,0,0,1241,185,1,0,0,0,1242,
		1247,3,188,94,0,1243,1244,5,141,0,0,1244,1246,3,188,94,0,1245,1243,1,0,
		0,0,1246,1249,1,0,0,0,1247,1245,1,0,0,0,1247,1248,1,0,0,0,1248,187,1,0,
		0,0,1249,1247,1,0,0,0,1250,1257,3,200,100,0,1251,1253,3,200,100,0,1252,
		1251,1,0,0,0,1252,1253,1,0,0,0,1253,1254,1,0,0,0,1254,1255,5,152,0,0,1255,
		1257,3,296,148,0,1256,1250,1,0,0,0,1256,1252,1,0,0,0,1257,189,1,0,0,0,
		1258,1264,5,11,0,0,1259,1261,3,300,150,0,1260,1259,1,0,0,0,1260,1261,1,
		0,0,0,1261,1262,1,0,0,0,1262,1263,5,152,0,0,1263,1265,3,228,114,0,1264,
		1260,1,0,0,0,1264,1265,1,0,0,0,1265,1277,1,0,0,0,1266,1271,3,300,150,0,
		1267,1268,5,136,0,0,1268,1269,3,194,97,0,1269,1270,5,137,0,0,1270,1272,
		1,0,0,0,1271,1267,1,0,0,0,1271,1272,1,0,0,0,1272,1278,1,0,0,0,1273,1274,
		5,136,0,0,1274,1275,3,194,97,0,1275,1276,5,137,0,0,1276,1278,1,0,0,0,1277,
		1266,1,0,0,0,1277,1273,1,0,0,0,1278,191,1,0,0,0,1279,1280,7,10,0,0,1280,
		1281,5,134,0,0,1281,1282,3,228,114,0,1282,1283,5,141,0,0,1283,1284,3,300,
		150,0,1284,1289,5,135,0,0,1285,1286,5,136,0,0,1286,1287,3,194,97,0,1287,
		1288,5,137,0,0,1288,1290,1,0,0,0,1289,1285,1,0,0,0,1289,1290,1,0,0,0,1290,
		193,1,0,0,0,1291,1296,3,196,98,0,1292,1293,5,141,0,0,1293,1295,3,196,98,
		0,1294,1292,1,0,0,0,1295,1298,1,0,0,0,1296,1294,1,0,0,0,1296,1297,1,0,
		0,0,1297,1300,1,0,0,0,1298,1296,1,0,0,0,1299,1301,5,141,0,0,1300,1299,
		1,0,0,0,1300,1301,1,0,0,0,1301,195,1,0,0,0,1302,1305,3,198,99,0,1303,1304,
		5,146,0,0,1304,1306,3,272,136,0,1305,1303,1,0,0,0,1305,1306,1,0,0,0,1306,
		197,1,0,0,0,1307,1310,3,300,150,0,1308,1310,5,7,0,0,1309,1307,1,0,0,0,
		1309,1308,1,0,0,0,1310,199,1,0,0,0,1311,1317,3,300,150,0,1312,1313,5,134,
		0,0,1313,1314,3,200,100,0,1314,1315,5,135,0,0,1315,1317,1,0,0,0,1316,1311,
		1,0,0,0,1316,1312,1,0,0,0,1317,1321,1,0,0,0,1318,1320,3,202,101,0,1319,
		1318,1,0,0,0,1320,1323,1,0,0,0,1321,1319,1,0,0,0,1321,1322,1,0,0,0,1322,
		1335,1,0,0,0,1323,1321,1,0,0,0,1324,1325,5,134,0,0,1325,1327,5,167,0,0,
		1326,1328,3,170,85,0,1327,1326,1,0,0,0,1327,1328,1,0,0,0,1328,1330,1,0,
		0,0,1329,1331,3,300,150,0,1330,1329,1,0,0,0,1330,1331,1,0,0,0,1331,1332,
		1,0,0,0,1332,1333,5,135,0,0,1333,1335,3,88,44,0,1334,1316,1,0,0,0,1334,
		1324,1,0,0,0,1335,201,1,0,0,0,1336,1338,5,138,0,0,1337,1339,3,280,140,
		0,1338,1337,1,0,0,0,1338,1339,1,0,0,0,1339,1340,1,0,0,0,1340,1341,5,139,
		0,0,1341,203,1,0,0,0,1342,1345,3,234,117,0,1343,1344,5,141,0,0,1344,1346,
		5,179,0,0,1345,1343,1,0,0,0,1345,1346,1,0,0,0,1346,205,1,0,0,0,1347,1359,
		3,300,150,0,1348,1349,5,134,0,0,1349,1354,3,294,147,0,1350,1351,5,141,
		0,0,1351,1353,3,294,147,0,1352,1350,1,0,0,0,1353,1356,1,0,0,0,1354,1352,
		1,0,0,0,1354,1355,1,0,0,0,1355,1357,1,0,0,0,1356,1354,1,0,0,0,1357,1358,
		5,135,0,0,1358,1360,1,0,0,0,1359,1348,1,0,0,0,1359,1360,1,0,0,0,1360,1414,
		1,0,0,0,1361,1414,5,110,0,0,1362,1363,5,108,0,0,1363,1366,5,134,0,0,1364,
		1367,3,212,106,0,1365,1367,3,214,107,0,1366,1364,1,0,0,0,1366,1365,1,0,
		0,0,1367,1368,1,0,0,0,1368,1369,5,135,0,0,1369,1414,1,0,0,0,1370,1371,
		5,112,0,0,1371,1372,5,134,0,0,1372,1377,3,218,109,0,1373,1374,5,141,0,
		0,1374,1376,3,218,109,0,1375,1373,1,0,0,0,1376,1379,1,0,0,0,1377,1375,
		1,0,0,0,1377,1378,1,0,0,0,1378,1380,1,0,0,0,1379,1377,1,0,0,0,1380,1381,
		5,135,0,0,1381,1414,1,0,0,0,1382,1383,5,113,0,0,1383,1384,5,134,0,0,1384,
		1389,3,300,150,0,1385,1386,5,141,0,0,1386,1388,3,300,150,0,1387,1385,1,
		0,0,0,1388,1391,1,0,0,0,1389,1387,1,0,0,0,1389,1390,1,0,0,0,1390,1392,
		1,0,0,0,1391,1389,1,0,0,0,1392,1393,5,135,0,0,1393,1414,1,0,0,0,1394,1395,
		5,111,0,0,1395,1396,5,134,0,0,1396,1397,3,298,149,0,1397,1398,5,135,0,
		0,1398,1414,1,0,0,0,1399,1400,5,84,0,0,1400,1401,5,134,0,0,1401,1402,5,
		134,0,0,1402,1407,3,208,104,0,1403,1404,5,141,0,0,1404,1406,3,208,104,
		0,1405,1403,1,0,0,0,1406,1409,1,0,0,0,1407,1405,1,0,0,0,1407,1408,1,0,
		0,0,1408,1410,1,0,0,0,1409,1407,1,0,0,0,1410,1411,5,135,0,0,1411,1412,
		5,135,0,0,1412,1414,1,0,0,0,1413,1347,1,0,0,0,1413,1361,1,0,0,0,1413,1362,
		1,0,0,0,1413,1370,1,0,0,0,1413,1382,1,0,0,0,1413,1394,1,0,0,0,1413,1399,
		1,0,0,0,1414,207,1,0,0,0,1415,1429,3,300,150,0,1416,1417,3,300,150,0,1417,
		1418,5,134,0,0,1418,1423,3,210,105,0,1419,1420,5,141,0,0,1420,1422,3,210,
		105,0,1421,1419,1,0,0,0,1422,1425,1,0,0,0,1423,1421,1,0,0,0,1423,1424,
		1,0,0,0,1424,1426,1,0,0,0,1425,1423,1,0,0,0,1426,1427,5,135,0,0,1427,1429,
		1,0,0,0,1428,1415,1,0,0,0,1428,1416,1,0,0,0,1429,209,1,0,0,0,1430,1442,
		3,300,150,0,1431,1442,5,185,0,0,1432,1442,3,298,149,0,1433,1434,3,300,
		150,0,1434,1435,5,146,0,0,1435,1436,3,220,110,0,1436,1442,1,0,0,0,1437,
		1438,3,300,150,0,1438,1439,5,146,0,0,1439,1440,3,298,149,0,1440,1442,1,
		0,0,0,1441,1430,1,0,0,0,1441,1431,1,0,0,0,1441,1432,1,0,0,0,1441,1433,
		1,0,0,0,1441,1437,1,0,0,0,1442,211,1,0,0,0,1443,1448,3,300,150,0,1444,
		1445,5,142,0,0,1445,1447,3,300,150,0,1446,1444,1,0,0,0,1447,1450,1,0,0,
		0,1448,1446,1,0,0,0,1448,1449,1,0,0,0,1449,213,1,0,0,0,1450,1448,1,0,0,
		0,1451,1452,3,300,150,0,1452,1458,5,134,0,0,1453,1454,3,216,108,0,1454,
		1455,5,152,0,0,1455,1457,1,0,0,0,1456,1453,1,0,0,0,1457,1460,1,0,0,0,1458,
		1456,1,0,0,0,1458,1459,1,0,0,0,1459,1461,1,0,0,0,1460,1458,1,0,0,0,1461,
		1462,5,135,0,0,1462,215,1,0,0,0,1463,1467,3,300,150,0,1464,1467,5,145,
		0,0,1465,1467,5,14,0,0,1466,1463,1,0,0,0,1466,1464,1,0,0,0,1466,1465,1,
		0,0,0,1467,217,1,0,0,0,1468,1469,3,300,150,0,1469,1470,5,134,0,0,1470,
		1471,3,220,110,0,1471,1472,5,135,0,0,1472,219,1,0,0,0,1473,1483,5,186,
		0,0,1474,1479,5,185,0,0,1475,1476,5,142,0,0,1476,1478,5,185,0,0,1477,1475,
		1,0,0,0,1478,1481,1,0,0,0,1479,1477,1,0,0,0,1479,1480,1,0,0,0,1480,1483,
		1,0,0,0,1481,1479,1,0,0,0,1482,1473,1,0,0,0,1482,1474,1,0,0,0,1483,221,
		1,0,0,0,1484,1489,5,136,0,0,1485,1487,3,270,135,0,1486,1488,5,141,0,0,
		1487,1486,1,0,0,0,1487,1488,1,0,0,0,1488,1490,1,0,0,0,1489,1485,1,0,0,
		0,1489,1490,1,0,0,0,1490,1491,1,0,0,0,1491,1492,5,137,0,0,1492,223,1,0,
		0,0,1493,1507,5,136,0,0,1494,1495,5,142,0,0,1495,1501,3,272,136,0,1496,
		1497,5,141,0,0,1497,1498,5,142,0,0,1498,1500,3,272,136,0,1499,1496,1,0,
		0,0,1500,1503,1,0,0,0,1501,1499,1,0,0,0,1501,1502,1,0,0,0,1502,1505,1,
		0,0,0,1503,1501,1,0,0,0,1504,1506,5,141,0,0,1505,1504,1,0,0,0,1505,1506,
		1,0,0,0,1506,1508,1,0,0,0,1507,1494,1,0,0,0,1507,1508,1,0,0,0,1508,1509,
		1,0,0,0,1509,1510,5,137,0,0,1510,225,1,0,0,0,1511,1516,3,278,139,0,1512,
		1513,5,141,0,0,1513,1515,3,278,139,0,1514,1512,1,0,0,0,1515,1518,1,0,0,
		0,1516,1514,1,0,0,0,1516,1517,1,0,0,0,1517,1520,1,0,0,0,1518,1516,1,0,
		0,0,1519,1521,5,141,0,0,1520,1519,1,0,0,0,1520,1521,1,0,0,0,1521,227,1,
		0,0,0,1522,1524,3,154,77,0,1523,1525,3,230,115,0,1524,1523,1,0,0,0,1524,
		1525,1,0,0,0,1525,1528,1,0,0,0,1526,1528,3,74,37,0,1527,1522,1,0,0,0,1527,
		1526,1,0,0,0,1528,229,1,0,0,0,1529,1531,5,134,0,0,1530,1532,3,230,115,
		0,1531,1530,1,0,0,0,1531,1532,1,0,0,0,1532,1533,1,0,0,0,1533,1535,5,135,
		0,0,1534,1536,3,232,116,0,1535,1534,1,0,0,0,1536,1537,1,0,0,0,1537,1535,
		1,0,0,0,1537,1538,1,0,0,0,1538,1549,1,0,0,0,1539,1541,5,138,0,0,1540,1542,
		3,280,140,0,1541,1540,1,0,0,0,1541,1542,1,0,0,0,1542,1543,1,0,0,0,1543,
		1545,5,139,0,0,1544,1539,1,0,0,0,1545,1546,1,0,0,0,1546,1544,1,0,0,0,1546,
		1547,1,0,0,0,1547,1549,1,0,0,0,1548,1529,1,0,0,0,1548,1544,1,0,0,0,1549,
		231,1,0,0,0,1550,1552,5,138,0,0,1551,1553,3,280,140,0,1552,1551,1,0,0,
		0,1552,1553,1,0,0,0,1553,1554,1,0,0,0,1554,1561,5,139,0,0,1555,1557,5,
		134,0,0,1556,1558,3,234,117,0,1557,1556,1,0,0,0,1557,1558,1,0,0,0,1558,
		1559,1,0,0,0,1559,1561,5,135,0,0,1560,1550,1,0,0,0,1560,1555,1,0,0,0,1561,
		233,1,0,0,0,1562,1567,3,236,118,0,1563,1564,5,141,0,0,1564,1566,3,236,
		118,0,1565,1563,1,0,0,0,1566,1569,1,0,0,0,1567,1565,1,0,0,0,1567,1568,
		1,0,0,0,1568,235,1,0,0,0,1569,1567,1,0,0,0,1570,1571,3,154,77,0,1571,1572,
		3,200,100,0,1572,1575,1,0,0,0,1573,1575,5,32,0,0,1574,1570,1,0,0,0,1574,
		1573,1,0,0,0,1575,237,1,0,0,0,1576,1578,3,240,120,0,1577,1579,5,140,0,
		0,1578,1577,1,0,0,0,1578,1579,1,0,0,0,1579,1618,1,0,0,0,1580,1582,3,244,
		122,0,1581,1583,5,140,0,0,1582,1581,1,0,0,0,1582,1583,1,0,0,0,1583,1618,
		1,0,0,0,1584,1586,3,246,123,0,1585,1587,5,140,0,0,1586,1585,1,0,0,0,1586,
		1587,1,0,0,0,1587,1618,1,0,0,0,1588,1590,3,256,128,0,1589,1591,5,140,0,
		0,1590,1589,1,0,0,0,1590,1591,1,0,0,0,1591,1618,1,0,0,0,1592,1594,3,268,
		134,0,1593,1595,5,140,0,0,1594,1593,1,0,0,0,1594,1595,1,0,0,0,1595,1618,
		1,0,0,0,1596,1598,3,120,60,0,1597,1599,5,140,0,0,1598,1597,1,0,0,0,1598,
		1599,1,0,0,0,1599,1618,1,0,0,0,1600,1602,3,122,61,0,1601,1603,5,140,0,
		0,1602,1601,1,0,0,0,1602,1603,1,0,0,0,1603,1618,1,0,0,0,1604,1606,3,114,
		57,0,1605,1607,5,140,0,0,1606,1605,1,0,0,0,1606,1607,1,0,0,0,1607,1618,
		1,0,0,0,1608,1610,3,116,58,0,1609,1611,5,140,0,0,1610,1609,1,0,0,0,1610,
		1611,1,0,0,0,1611,1618,1,0,0,0,1612,1614,3,270,135,0,1613,1615,5,140,0,
		0,1614,1613,1,0,0,0,1614,1615,1,0,0,0,1615,1618,1,0,0,0,1616,1618,5,140,
		0,0,1617,1576,1,0,0,0,1617,1580,1,0,0,0,1617,1584,1,0,0,0,1617,1588,1,
		0,0,0,1617,1592,1,0,0,0,1617,1596,1,0,0,0,1617,1600,1,0,0,0,1617,1604,
		1,0,0,0,1617,1608,1,0,0,0,1617,1612,1,0,0,0,1617,1616,1,0,0,0,1618,239,
		1,0,0,0,1619,1620,3,300,150,0,1620,1621,5,152,0,0,1621,1622,3,238,119,
		0,1622,241,1,0,0,0,1623,1626,3,280,140,0,1624,1625,5,179,0,0,1625,1627,
		3,280,140,0,1626,1624,1,0,0,0,1626,1627,1,0,0,0,1627,243,1,0,0,0,1628,
		1633,5,136,0,0,1629,1632,3,142,71,0,1630,1632,3,238,119,0,1631,1629,1,
		0,0,0,1631,1630,1,0,0,0,1632,1635,1,0,0,0,1633,1631,1,0,0,0,1633,1634,
		1,0,0,0,1634,1636,1,0,0,0,1635,1633,1,0,0,0,1636,1637,5,137,0,0,1637,245,
		1,0,0,0,1638,1639,5,16,0,0,1639,1640,5,134,0,0,1640,1641,3,272,136,0,1641,
		1642,5,135,0,0,1642,1645,3,238,119,0,1643,1644,5,10,0,0,1644,1646,3,238,
		119,0,1645,1643,1,0,0,0,1645,1646,1,0,0,0,1646,1649,1,0,0,0,1647,1649,
		3,248,124,0,1648,1638,1,0,0,0,1648,1647,1,0,0,0,1649,247,1,0,0,0,1650,
		1651,5,28,0,0,1651,1652,5,134,0,0,1652,1653,3,272,136,0,1653,1654,5,135,
		0,0,1654,1655,3,250,125,0,1655,249,1,0,0,0,1656,1660,5,136,0,0,1657,1659,
		3,252,126,0,1658,1657,1,0,0,0,1659,1662,1,0,0,0,1660,1658,1,0,0,0,1660,
		1661,1,0,0,0,1661,1663,1,0,0,0,1662,1660,1,0,0,0,1663,1664,5,137,0,0,1664,
		251,1,0,0,0,1665,1667,3,254,127,0,1666,1665,1,0,0,0,1667,1668,1,0,0,0,
		1668,1666,1,0,0,0,1668,1669,1,0,0,0,1669,1671,1,0,0,0,1670,1672,3,238,
		119,0,1671,1670,1,0,0,0,1672,1673,1,0,0,0,1673,1671,1,0,0,0,1673,1674,
		1,0,0,0,1674,253,1,0,0,0,1675,1681,5,3,0,0,1676,1682,3,242,121,0,1677,
		1678,5,134,0,0,1678,1679,3,242,121,0,1679,1680,5,135,0,0,1680,1682,1,0,
		0,0,1681,1676,1,0,0,0,1681,1677,1,0,0,0,1682,1683,1,0,0,0,1683,1684,5,
		152,0,0,1684,1688,1,0,0,0,1685,1686,5,7,0,0,1686,1688,5,152,0,0,1687,1675,
		1,0,0,0,1687,1685,1,0,0,0,1688,255,1,0,0,0,1689,1694,3,258,129,0,1690,
		1694,3,260,130,0,1691,1694,3,262,131,0,1692,1694,3,266,133,0,1693,1689,
		1,0,0,0,1693,1690,1,0,0,0,1693,1691,1,0,0,0,1693,1692,1,0,0,0,1694,257,
		1,0,0,0,1695,1696,5,34,0,0,1696,1697,5,134,0,0,1697,1698,3,272,136,0,1698,
		1699,5,135,0,0,1699,1700,3,238,119,0,1700,259,1,0,0,0,1701,1702,5,8,0,
		0,1702,1703,3,238,119,0,1703,1704,5,34,0,0,1704,1705,5,134,0,0,1705,1706,
		3,272,136,0,1706,1707,5,135,0,0,1707,1708,5,140,0,0,1708,261,1,0,0,0,1709,
		1710,5,14,0,0,1710,1712,5,134,0,0,1711,1713,3,264,132,0,1712,1711,1,0,
		0,0,1712,1713,1,0,0,0,1713,1714,1,0,0,0,1714,1716,5,140,0,0,1715,1717,
		3,272,136,0,1716,1715,1,0,0,0,1716,1717,1,0,0,0,1717,1718,1,0,0,0,1718,
		1720,5,140,0,0,1719,1721,3,270,135,0,1720,1719,1,0,0,0,1720,1721,1,0,0,
		0,1721,1722,1,0,0,0,1722,1723,5,135,0,0,1723,1724,3,238,119,0,1724,263,
		1,0,0,0,1725,1726,3,154,77,0,1726,1727,3,158,79,0,1727,1730,1,0,0,0,1728,
		1730,3,270,135,0,1729,1725,1,0,0,0,1729,1728,1,0,0,0,1730,265,1,0,0,0,
		1731,1732,5,14,0,0,1732,1733,5,134,0,0,1733,1734,3,112,56,0,1734,1736,
		5,46,0,0,1735,1737,3,272,136,0,1736,1735,1,0,0,0,1736,1737,1,0,0,0,1737,
		1738,1,0,0,0,1738,1739,5,135,0,0,1739,1740,3,238,119,0,1740,267,1,0,0,
		0,1741,1742,5,15,0,0,1742,1750,3,300,150,0,1743,1750,5,6,0,0,1744,1750,
		5,2,0,0,1745,1747,5,22,0,0,1746,1748,3,272,136,0,1747,1746,1,0,0,0,1747,
		1748,1,0,0,0,1748,1750,1,0,0,0,1749,1741,1,0,0,0,1749,1743,1,0,0,0,1749,
		1744,1,0,0,0,1749,1745,1,0,0,0,1750,269,1,0,0,0,1751,1756,3,272,136,0,
		1752,1753,5,141,0,0,1753,1755,3,272,136,0,1754,1752,1,0,0,0,1755,1758,
		1,0,0,0,1756,1754,1,0,0,0,1756,1757,1,0,0,0,1757,271,1,0,0,0,1758,1756,
		1,0,0,0,1759,1760,6,136,-1,0,1760,1770,3,276,138,0,1761,1762,5,134,0,0,
		1762,1763,3,244,122,0,1763,1764,5,135,0,0,1764,1770,1,0,0,0,1765,1766,
		3,282,141,0,1766,1767,3,274,137,0,1767,1768,3,272,136,1,1768,1770,1,0,
		0,0,1769,1759,1,0,0,0,1769,1761,1,0,0,0,1769,1765,1,0,0,0,1770,1815,1,
		0,0,0,1771,1772,10,13,0,0,1772,1773,7,11,0,0,1773,1814,3,272,136,14,1774,
		1775,10,12,0,0,1775,1776,7,12,0,0,1776,1814,3,272,136,13,1777,1782,10,
		11,0,0,1778,1779,5,148,0,0,1779,1783,5,148,0,0,1780,1781,5,147,0,0,1781,
		1783,5,147,0,0,1782,1778,1,0,0,0,1782,1780,1,0,0,0,1783,1784,1,0,0,0,1784,
		1814,3,272,136,12,1785,1786,10,10,0,0,1786,1787,7,13,0,0,1787,1814,3,272,
		136,11,1788,1789,10,9,0,0,1789,1790,7,14,0,0,1790,1814,3,272,136,10,1791,
		1792,10,8,0,0,1792,1793,5,165,0,0,1793,1814,3,272,136,9,1794,1795,10,7,
		0,0,1795,1796,5,167,0,0,1796,1814,3,272,136,8,1797,1798,10,6,0,0,1798,
		1799,5,166,0,0,1799,1814,3,272,136,7,1800,1801,10,5,0,0,1801,1802,5,157,
		0,0,1802,1814,3,272,136,6,1803,1804,10,4,0,0,1804,1805,5,158,0,0,1805,
		1814,3,272,136,5,1806,1807,10,3,0,0,1807,1809,5,151,0,0,1808,1810,3,272,
		136,0,1809,1808,1,0,0,0,1809,1810,1,0,0,0,1810,1811,1,0,0,0,1811,1812,
		5,152,0,0,1812,1814,3,272,136,4,1813,1771,1,0,0,0,1813,1774,1,0,0,0,1813,
		1777,1,0,0,0,1813,1785,1,0,0,0,1813,1788,1,0,0,0,1813,1791,1,0,0,0,1813,
		1794,1,0,0,0,1813,1797,1,0,0,0,1813,1800,1,0,0,0,1813,1803,1,0,0,0,1813,
		1806,1,0,0,0,1814,1817,1,0,0,0,1815,1813,1,0,0,0,1815,1816,1,0,0,0,1816,
		273,1,0,0,0,1817,1815,1,0,0,0,1818,1819,7,15,0,0,1819,275,1,0,0,0,1820,
		1830,3,282,141,0,1821,1822,5,134,0,0,1822,1823,3,228,114,0,1823,1824,5,
		135,0,0,1824,1827,1,0,0,0,1825,1828,3,276,138,0,1826,1828,3,278,139,0,
		1827,1825,1,0,0,0,1827,1826,1,0,0,0,1828,1830,1,0,0,0,1829,1820,1,0,0,
		0,1829,1821,1,0,0,0,1830,277,1,0,0,0,1831,1835,3,272,136,0,1832,1835,3,
		222,111,0,1833,1835,3,224,112,0,1834,1831,1,0,0,0,1834,1832,1,0,0,0,1834,
		1833,1,0,0,0,1835,279,1,0,0,0,1836,1839,3,300,150,0,1837,1839,3,296,148,
		0,1838,1836,1,0,0,0,1838,1837,1,0,0,0,1839,281,1,0,0,0,1840,1855,3,286,
		143,0,1841,1847,5,25,0,0,1842,1848,3,282,141,0,1843,1844,5,134,0,0,1844,
		1845,3,182,91,0,1845,1846,5,135,0,0,1846,1848,1,0,0,0,1847,1842,1,0,0,
		0,1847,1843,1,0,0,0,1848,1855,1,0,0,0,1849,1850,7,16,0,0,1850,1855,3,282,
		141,0,1851,1852,3,284,142,0,1852,1853,3,276,138,0,1853,1855,1,0,0,0,1854,
		1840,1,0,0,0,1854,1841,1,0,0,0,1854,1849,1,0,0,0,1854,1851,1,0,0,0,1855,
		283,1,0,0,0,1856,1857,7,17,0,0,1857,285,1,0,0,0,1858,1859,6,143,-1,0,1859,
		1863,3,294,147,0,1860,1862,3,288,144,0,1861,1860,1,0,0,0,1862,1865,1,0,
		0,0,1863,1861,1,0,0,0,1863,1864,1,0,0,0,1864,1877,1,0,0,0,1865,1863,1,
		0,0,0,1866,1867,10,1,0,0,1867,1868,7,18,0,0,1868,1872,3,300,150,0,1869,
		1871,3,288,144,0,1870,1869,1,0,0,0,1871,1874,1,0,0,0,1872,1870,1,0,0,0,
		1872,1873,1,0,0,0,1873,1876,1,0,0,0,1874,1872,1,0,0,0,1875,1866,1,0,0,
		0,1876,1879,1,0,0,0,1877,1875,1,0,0,0,1877,1878,1,0,0,0,1878,287,1,0,0,
		0,1879,1877,1,0,0,0,1880,1881,5,138,0,0,1881,1882,3,272,136,0,1882,1883,
		5,139,0,0,1883,1899,1,0,0,0,1884,1886,5,134,0,0,1885,1887,3,290,145,0,
		1886,1885,1,0,0,0,1886,1887,1,0,0,0,1887,1888,1,0,0,0,1888,1899,5,135,
		0,0,1889,1892,5,134,0,0,1890,1893,5,141,0,0,1891,1893,8,19,0,0,1892,1890,
		1,0,0,0,1892,1891,1,0,0,0,1893,1894,1,0,0,0,1894,1892,1,0,0,0,1894,1895,
		1,0,0,0,1895,1896,1,0,0,0,1896,1899,5,135,0,0,1897,1899,7,16,0,0,1898,
		1880,1,0,0,0,1898,1884,1,0,0,0,1898,1889,1,0,0,0,1898,1897,1,0,0,0,1899,
		289,1,0,0,0,1900,1905,3,292,146,0,1901,1902,5,141,0,0,1902,1904,3,292,
		146,0,1903,1901,1,0,0,0,1904,1907,1,0,0,0,1905,1903,1,0,0,0,1905,1906,
		1,0,0,0,1906,291,1,0,0,0,1907,1905,1,0,0,0,1908,1911,3,272,136,0,1909,
		1911,3,182,91,0,1910,1908,1,0,0,0,1910,1909,1,0,0,0,1911,293,1,0,0,0,1912,
		1928,3,300,150,0,1913,1928,3,296,148,0,1914,1928,3,298,149,0,1915,1916,
		5,134,0,0,1916,1917,3,272,136,0,1917,1918,5,135,0,0,1918,1928,1,0,0,0,
		1919,1928,3,94,47,0,1920,1928,3,104,52,0,1921,1928,3,108,54,0,1922,1928,
		3,110,55,0,1923,1928,3,80,40,0,1924,1928,3,84,42,0,1925,1928,3,86,43,0,
		1926,1928,3,92,46,0,1927,1912,1,0,0,0,1927,1913,1,0,0,0,1927,1914,1,0,
		0,0,1927,1915,1,0,0,0,1927,1919,1,0,0,0,1927,1920,1,0,0,0,1927,1921,1,
		0,0,0,1927,1922,1,0,0,0,1927,1923,1,0,0,0,1927,1924,1,0,0,0,1927,1925,
		1,0,0,0,1927,1926,1,0,0,0,1928,295,1,0,0,0,1929,1948,5,182,0,0,1930,1948,
		5,183,0,0,1931,1948,5,184,0,0,1932,1934,7,12,0,0,1933,1932,1,0,0,0,1933,
		1934,1,0,0,0,1934,1935,1,0,0,0,1935,1948,5,185,0,0,1936,1938,7,12,0,0,
		1937,1936,1,0,0,0,1937,1938,1,0,0,0,1938,1939,1,0,0,0,1939,1948,5,186,
		0,0,1940,1948,5,180,0,0,1941,1948,5,48,0,0,1942,1948,5,50,0,0,1943,1948,
		5,57,0,0,1944,1948,5,49,0,0,1945,1948,5,38,0,0,1946,1948,5,39,0,0,1947,
		1929,1,0,0,0,1947,1930,1,0,0,0,1947,1931,1,0,0,0,1947,1933,1,0,0,0,1947,
		1937,1,0,0,0,1947,1940,1,0,0,0,1947,1941,1,0,0,0,1947,1942,1,0,0,0,1947,
		1943,1,0,0,0,1947,1944,1,0,0,0,1947,1945,1,0,0,0,1947,1946,1,0,0,0,1948,
		297,1,0,0,0,1949,1953,5,181,0,0,1950,1952,7,20,0,0,1951,1950,1,0,0,0,1952,
		1955,1,0,0,0,1953,1951,1,0,0,0,1953,1954,1,0,0,0,1954,1956,1,0,0,0,1955,
		1953,1,0,0,0,1956,1958,5,193,0,0,1957,1949,1,0,0,0,1958,1959,1,0,0,0,1959,
		1957,1,0,0,0,1959,1960,1,0,0,0,1960,299,1,0,0,0,1961,1962,7,21,0,0,1962,
		301,1,0,0,0,259,305,322,329,335,340,346,350,353,361,368,371,374,382,385,
		388,398,406,410,417,423,426,434,439,448,454,456,468,478,486,489,492,501,
		524,531,534,540,549,555,557,567,569,578,584,594,596,605,609,612,620,624,
		626,629,635,639,645,659,666,672,675,678,682,686,690,694,702,705,712,721,
		725,727,739,741,753,755,760,766,769,775,779,782,785,796,802,804,807,815,
		820,826,836,841,843,865,872,877,901,906,911,915,919,923,932,939,946,952,
		955,960,964,971,974,980,984,987,992,999,1010,1012,1019,1030,1041,1047,
		1052,1058,1062,1067,1077,1091,1102,1108,1115,1121,1128,1134,1141,1147,
		1154,1160,1167,1173,1180,1192,1197,1199,1206,1208,1215,1217,1220,1227,
		1229,1234,1247,1252,1256,1260,1264,1271,1277,1289,1296,1300,1305,1309,
		1316,1321,1327,1330,1334,1338,1345,1354,1359,1366,1377,1389,1407,1413,
		1423,1428,1441,1448,1458,1466,1479,1482,1487,1489,1501,1505,1507,1516,
		1520,1524,1527,1531,1537,1541,1546,1548,1552,1557,1560,1567,1574,1578,
		1582,1586,1590,1594,1598,1602,1606,1610,1614,1617,1626,1631,1633,1645,
		1648,1660,1668,1673,1681,1687,1693,1712,1716,1720,1729,1736,1747,1749,
		1756,1769,1782,1809,1813,1815,1827,1829,1834,1838,1847,1854,1863,1872,
		1877,1886,1892,1894,1898,1905,1910,1927,1933,1937,1947,1953,1959
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
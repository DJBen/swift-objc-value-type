// Generated from Sources/ObjcGrammar/ObjectiveCPreprocessorParser.g4 by ANTLR 4.13.1
import Antlr4

open class ObjectiveCPreprocessorParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = ObjectiveCPreprocessorParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(ObjectiveCPreprocessorParser._ATN.getDecisionState(i)!, i))
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
                 ASSIGN = 108, COPY = 109, GETTER = 110, SETTER = 111, STRONG = 112, 
                 READONLY = 113, READWRITE = 114, WEAK = 115, UNSAFE_UNRETAINED = 116, 
                 IB_OUTLET = 117, IB_OUTLET_COLLECTION = 118, IB_INSPECTABLE = 119, 
                 IB_DESIGNABLE = 120, NS_ASSUME_NONNULL_BEGIN = 121, NS_ASSUME_NONNULL_END = 122, 
                 EXTERN_SUFFIX = 123, IOS_SUFFIX = 124, MAC_SUFFIX = 125, 
                 TVOS_PROHIBITED = 126, IDENTIFIER = 127, LP = 128, RP = 129, 
                 LBRACE = 130, RBRACE = 131, LBRACK = 132, RBRACK = 133, 
                 SEMI = 134, COMMA = 135, DOT = 136, STRUCTACCESS = 137, 
                 AT = 138, ASSIGNMENT = 139, GT = 140, LT = 141, BANG = 142, 
                 TILDE = 143, QUESTION = 144, COLON = 145, EQUAL = 146, 
                 LE = 147, GE = 148, NOTEQUAL = 149, AND = 150, OR = 151, 
                 INC = 152, DEC = 153, ADD = 154, SUB = 155, MUL = 156, 
                 DIV = 157, BITAND = 158, BITOR = 159, BITXOR = 160, MOD = 161, 
                 ADD_ASSIGN = 162, SUB_ASSIGN = 163, MUL_ASSIGN = 164, DIV_ASSIGN = 165, 
                 AND_ASSIGN = 166, OR_ASSIGN = 167, XOR_ASSIGN = 168, MOD_ASSIGN = 169, 
                 LSHIFT_ASSIGN = 170, RSHIFT_ASSIGN = 171, ELIPSIS = 172, 
                 CHARACTER_LITERAL = 173, STRING_START = 174, HEX_LITERAL = 175, 
                 OCTAL_LITERAL = 176, BINARY_LITERAL = 177, DECIMAL_LITERAL = 178, 
                 FLOATING_POINT_LITERAL = 179, WS = 180, MULTI_COMMENT = 181, 
                 SINGLE_COMMENT = 182, BACKSLASH = 183, SHARP = 184, STRING_NEWLINE = 185, 
                 STRING_END = 186, STRING_VALUE = 187, DIRECTIVE_IMPORT = 188, 
                 DIRECTIVE_INCLUDE = 189, DIRECTIVE_PRAGMA = 190, DIRECTIVE_DEFINE = 191, 
                 DIRECTIVE_DEFINED = 192, DIRECTIVE_IF = 193, DIRECTIVE_ELIF = 194, 
                 DIRECTIVE_ELSE = 195, DIRECTIVE_UNDEF = 196, DIRECTIVE_IFDEF = 197, 
                 DIRECTIVE_IFNDEF = 198, DIRECTIVE_ENDIF = 199, DIRECTIVE_TRUE = 200, 
                 DIRECTIVE_FALSE = 201, DIRECTIVE_ERROR = 202, DIRECTIVE_WARNING = 203, 
                 DIRECTIVE_BANG = 204, DIRECTIVE_LP = 205, DIRECTIVE_RP = 206, 
                 DIRECTIVE_EQUAL = 207, DIRECTIVE_NOTEQUAL = 208, DIRECTIVE_AND = 209, 
                 DIRECTIVE_OR = 210, DIRECTIVE_LT = 211, DIRECTIVE_GT = 212, 
                 DIRECTIVE_LE = 213, DIRECTIVE_GE = 214, DIRECTIVE_STRING = 215, 
                 DIRECTIVE_ID = 216, DIRECTIVE_DECIMAL_LITERAL = 217, DIRECTIVE_FLOAT = 218, 
                 DIRECTIVE_NEWLINE = 219, DIRECTIVE_MULTI_COMMENT = 220, 
                 DIRECTIVE_SINGLE_COMMENT = 221, DIRECTIVE_BACKSLASH_NEWLINE = 222, 
                 DIRECTIVE_TEXT_NEWLINE = 223, DIRECTIVE_TEXT = 224
	}

	public
	static let RULE_directive = 0, RULE_directiveText = 1, RULE_preprocessorExpression = 2

	public
	static let ruleNames: [String] = [
		"directive", "directiveText", "preprocessorExpression"
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
		"'NS_SWIFT_NAME'", "'NS_NOESCAPE'", "'assign'", "'copy'", "'getter'", 
		"'setter'", "'strong'", "'readonly'", "'readwrite'", "'weak'", "'unsafe_unretained'", 
		"'IBOutlet'", "'IBOutletCollection'", "'IBInspectable'", "'IB_DESIGNABLE'", 
		nil, nil, nil, nil, nil, "'__TVOS_PROHIBITED'", nil, nil, nil, "'{'", 
		"'}'", "'['", "']'", "';'", "','", "'.'", "'->'", "'@'", "'='", nil, nil, 
		nil, "'~'", "'?'", "':'", nil, nil, nil, nil, nil, nil, "'++'", "'--'", 
		"'+'", "'-'", "'*'", "'/'", "'&'", "'|'", "'^'", "'%'", "'+='", "'-='", 
		"'*='", "'/='", "'&='", "'|='", "'^='", "'%='", "'<<='", "'>>='", "'...'", 
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "'\\'", nil, nil, nil, 
		nil, nil, nil, nil, nil, "'defined'", nil, "'elif'", nil, "'undef'", "'ifdef'", 
		"'ifndef'", "'endif'"
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
		"ASSIGN", "COPY", "GETTER", "SETTER", "STRONG", "READONLY", "READWRITE", 
		"WEAK", "UNSAFE_UNRETAINED", "IB_OUTLET", "IB_OUTLET_COLLECTION", "IB_INSPECTABLE", 
		"IB_DESIGNABLE", "NS_ASSUME_NONNULL_BEGIN", "NS_ASSUME_NONNULL_END", "EXTERN_SUFFIX", 
		"IOS_SUFFIX", "MAC_SUFFIX", "TVOS_PROHIBITED", "IDENTIFIER", "LP", "RP", 
		"LBRACE", "RBRACE", "LBRACK", "RBRACK", "SEMI", "COMMA", "DOT", "STRUCTACCESS", 
		"AT", "ASSIGNMENT", "GT", "LT", "BANG", "TILDE", "QUESTION", "COLON", 
		"EQUAL", "LE", "GE", "NOTEQUAL", "AND", "OR", "INC", "DEC", "ADD", "SUB", 
		"MUL", "DIV", "BITAND", "BITOR", "BITXOR", "MOD", "ADD_ASSIGN", "SUB_ASSIGN", 
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
	func getGrammarFileName() -> String { return "ObjectiveCPreprocessorParser.g4" }

	override open
	func getRuleNames() -> [String] { return ObjectiveCPreprocessorParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return ObjectiveCPreprocessorParser._serializedATN }

	override open
	func getATN() -> ATN { return ObjectiveCPreprocessorParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return ObjectiveCPreprocessorParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,ObjectiveCPreprocessorParser._ATN,ObjectiveCPreprocessorParser._decisionToDFA, ObjectiveCPreprocessorParser._sharedContextCache)
	}


	public class DirectiveContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCPreprocessorParser.RULE_directive
		}
	}
	public class PreprocessorDefContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_IFDEF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IFDEF.rawValue, 0)
			}
			open
			func DIRECTIVE_ID() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue, 0)
			}
			open
			func DIRECTIVE_IFNDEF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IFNDEF.rawValue, 0)
			}
			open
			func DIRECTIVE_UNDEF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_UNDEF.rawValue, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorDef(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorDef(self)
			}
		}
	}
	public class PreprocessorErrorContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_ERROR() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ERROR.rawValue, 0)
			}
			open
			func directiveText() -> DirectiveTextContext? {
				return getRuleContext(DirectiveTextContext.self, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorError(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorError(self)
			}
		}
	}
	public class PreprocessorConditionalContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_IF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IF.rawValue, 0)
			}
			open
			func preprocessorExpression() -> PreprocessorExpressionContext? {
				return getRuleContext(PreprocessorExpressionContext.self, 0)
			}
			open
			func DIRECTIVE_ELIF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ELIF.rawValue, 0)
			}
			open
			func DIRECTIVE_ELSE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ELSE.rawValue, 0)
			}
			open
			func DIRECTIVE_ENDIF() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ENDIF.rawValue, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorConditional(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorConditional(self)
			}
		}
	}
	public class PreprocessorImportContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func directiveText() -> DirectiveTextContext? {
				return getRuleContext(DirectiveTextContext.self, 0)
			}
			open
			func DIRECTIVE_IMPORT() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IMPORT.rawValue, 0)
			}
			open
			func DIRECTIVE_INCLUDE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_INCLUDE.rawValue, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorImport(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorImport(self)
			}
		}
	}
	public class PreprocessorPragmaContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_PRAGMA() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_PRAGMA.rawValue, 0)
			}
			open
			func directiveText() -> DirectiveTextContext? {
				return getRuleContext(DirectiveTextContext.self, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorPragma(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorPragma(self)
			}
		}
	}
	public class PreprocessorDefineContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_DEFINE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DEFINE.rawValue, 0)
			}
			open
			func DIRECTIVE_ID() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue, 0)
			}
			open
			func directiveText() -> DirectiveTextContext? {
				return getRuleContext(DirectiveTextContext.self, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorDefine(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorDefine(self)
			}
		}
	}
	public class PreprocessorWarningContext: DirectiveContext {
			open
			func SHARP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue, 0)
			}
			open
			func DIRECTIVE_WARNING() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_WARNING.rawValue, 0)
			}
			open
			func directiveText() -> DirectiveTextContext? {
				return getRuleContext(DirectiveTextContext.self, 0)
			}

		public
		init(_ ctx: DirectiveContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorWarning(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorWarning(self)
			}
		}
	}
	@discardableResult
	 open func directive() throws -> DirectiveContext {
		var _localctx: DirectiveContext
		_localctx = DirectiveContext(_ctx, getState())
		try enterRule(_localctx, 0, ObjectiveCPreprocessorParser.RULE_directive)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(43)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,1, _ctx)) {
		 	case 1:
		 		_localctx =  PreprocessorImportContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(6)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(7)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IMPORT.rawValue || _la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_INCLUDE.rawValue)) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(8)
		 		try directiveText()

		 		break
		 	case 2:
		 		_localctx =  PreprocessorConditionalContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(9)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(10)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IF.rawValue)
		 		setState(11)
		 		try preprocessorExpression(0)

		 		break
		 	case 3:
		 		_localctx =  PreprocessorConditionalContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(12)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(13)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ELIF.rawValue)
		 		setState(14)
		 		try preprocessorExpression(0)

		 		break
		 	case 4:
		 		_localctx =  PreprocessorConditionalContext(_localctx);
		 		try enterOuterAlt(_localctx, 4)
		 		setState(15)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(16)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ELSE.rawValue)

		 		break
		 	case 5:
		 		_localctx =  PreprocessorConditionalContext(_localctx);
		 		try enterOuterAlt(_localctx, 5)
		 		setState(17)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(18)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ENDIF.rawValue)

		 		break
		 	case 6:
		 		_localctx =  PreprocessorDefContext(_localctx);
		 		try enterOuterAlt(_localctx, 6)
		 		setState(19)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(20)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IFDEF.rawValue)
		 		setState(21)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)

		 		break
		 	case 7:
		 		_localctx =  PreprocessorDefContext(_localctx);
		 		try enterOuterAlt(_localctx, 7)
		 		setState(22)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(23)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_IFNDEF.rawValue)
		 		setState(24)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)

		 		break
		 	case 8:
		 		_localctx =  PreprocessorDefContext(_localctx);
		 		try enterOuterAlt(_localctx, 8)
		 		setState(25)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(26)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_UNDEF.rawValue)
		 		setState(27)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)

		 		break
		 	case 9:
		 		_localctx =  PreprocessorPragmaContext(_localctx);
		 		try enterOuterAlt(_localctx, 9)
		 		setState(28)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(29)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_PRAGMA.rawValue)
		 		setState(30)
		 		try directiveText()

		 		break
		 	case 10:
		 		_localctx =  PreprocessorErrorContext(_localctx);
		 		try enterOuterAlt(_localctx, 10)
		 		setState(31)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(32)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ERROR.rawValue)
		 		setState(33)
		 		try directiveText()

		 		break
		 	case 11:
		 		_localctx =  PreprocessorWarningContext(_localctx);
		 		try enterOuterAlt(_localctx, 11)
		 		setState(34)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(35)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_WARNING.rawValue)
		 		setState(36)
		 		try directiveText()

		 		break
		 	case 12:
		 		_localctx =  PreprocessorDefineContext(_localctx);
		 		try enterOuterAlt(_localctx, 12)
		 		setState(37)
		 		try match(ObjectiveCPreprocessorParser.Tokens.SHARP.rawValue)
		 		setState(38)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DEFINE.rawValue)
		 		setState(39)
		 		try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)
		 		setState(41)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT_NEWLINE.rawValue || _la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT.rawValue) {
		 			setState(40)
		 			try directiveText()

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

	public class DirectiveTextContext: ParserRuleContext {
			open
			func DIRECTIVE_TEXT() -> [TerminalNode] {
				return getTokens(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT.rawValue)
			}
			open
			func DIRECTIVE_TEXT(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT.rawValue, i)
			}
			open
			func DIRECTIVE_TEXT_NEWLINE() -> [TerminalNode] {
				return getTokens(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT_NEWLINE.rawValue)
			}
			open
			func DIRECTIVE_TEXT_NEWLINE(_ i:Int) -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT_NEWLINE.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCPreprocessorParser.RULE_directiveText
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterDirectiveText(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitDirectiveText(self)
			}
		}
	}
	@discardableResult
	 open func directiveText() throws -> DirectiveTextContext {
		var _localctx: DirectiveTextContext
		_localctx = DirectiveTextContext(_ctx, getState())
		try enterRule(_localctx, 2, ObjectiveCPreprocessorParser.RULE_directiveText)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(46) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(45)
		 		_la = try _input.LA(1)
		 		if (!(_la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT_NEWLINE.rawValue || _la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT.rawValue)) {
		 		try _errHandler.recoverInline(self)
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}


		 		setState(48); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (_la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT_NEWLINE.rawValue || _la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TEXT.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class PreprocessorExpressionContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return ObjectiveCPreprocessorParser.RULE_preprocessorExpression
		}
	}
	public class PreprocessorParenthesisContext: PreprocessorExpressionContext {
			open
			func DIRECTIVE_LP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue, 0)
			}
			open
			func preprocessorExpression() -> PreprocessorExpressionContext? {
				return getRuleContext(PreprocessorExpressionContext.self, 0)
			}
			open
			func DIRECTIVE_RP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorParenthesis(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorParenthesis(self)
			}
		}
	}
	public class PreprocessorNotContext: PreprocessorExpressionContext {
			open
			func DIRECTIVE_BANG() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_BANG.rawValue, 0)
			}
			open
			func preprocessorExpression() -> PreprocessorExpressionContext? {
				return getRuleContext(PreprocessorExpressionContext.self, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorNot(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorNot(self)
			}
		}
	}
	public class PreprocessorBinaryContext: PreprocessorExpressionContext {
		public var op: Token!
			open
			func preprocessorExpression() -> [PreprocessorExpressionContext] {
				return getRuleContexts(PreprocessorExpressionContext.self)
			}
			open
			func preprocessorExpression(_ i: Int) -> PreprocessorExpressionContext? {
				return getRuleContext(PreprocessorExpressionContext.self, i)
			}
			open
			func DIRECTIVE_EQUAL() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_EQUAL.rawValue, 0)
			}
			open
			func DIRECTIVE_NOTEQUAL() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_NOTEQUAL.rawValue, 0)
			}
			open
			func DIRECTIVE_AND() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_AND.rawValue, 0)
			}
			open
			func DIRECTIVE_OR() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_OR.rawValue, 0)
			}
			open
			func DIRECTIVE_LT() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LT.rawValue, 0)
			}
			open
			func DIRECTIVE_GT() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_GT.rawValue, 0)
			}
			open
			func DIRECTIVE_LE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LE.rawValue, 0)
			}
			open
			func DIRECTIVE_GE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_GE.rawValue, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorBinary(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorBinary(self)
			}
		}
	}
	public class PreprocessorConstantContext: PreprocessorExpressionContext {
			open
			func DIRECTIVE_TRUE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TRUE.rawValue, 0)
			}
			open
			func DIRECTIVE_FALSE() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_FALSE.rawValue, 0)
			}
			open
			func DIRECTIVE_DECIMAL_LITERAL() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DECIMAL_LITERAL.rawValue, 0)
			}
			open
			func DIRECTIVE_STRING() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_STRING.rawValue, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorConstant(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorConstant(self)
			}
		}
	}
	public class PreprocessorConditionalSymbolContext: PreprocessorExpressionContext {
			open
			func DIRECTIVE_ID() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue, 0)
			}
			open
			func DIRECTIVE_LP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue, 0)
			}
			open
			func preprocessorExpression() -> PreprocessorExpressionContext? {
				return getRuleContext(PreprocessorExpressionContext.self, 0)
			}
			open
			func DIRECTIVE_RP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorConditionalSymbol(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorConditionalSymbol(self)
			}
		}
	}
	public class PreprocessorDefinedContext: PreprocessorExpressionContext {
			open
			func DIRECTIVE_DEFINED() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DEFINED.rawValue, 0)
			}
			open
			func DIRECTIVE_ID() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue, 0)
			}
			open
			func DIRECTIVE_LP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue, 0)
			}
			open
			func DIRECTIVE_RP() -> TerminalNode? {
				return getToken(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue, 0)
			}

		public
		init(_ ctx: PreprocessorExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.enterPreprocessorDefined(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? ObjectiveCPreprocessorParserListener {
				listener.exitPreprocessorDefined(self)
			}
		}
	}

	 public final  func preprocessorExpression( ) throws -> PreprocessorExpressionContext   {
		return try preprocessorExpression(0)
	}
	@discardableResult
	private func preprocessorExpression(_ _p: Int) throws -> PreprocessorExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: PreprocessorExpressionContext
		_localctx = PreprocessorExpressionContext(_ctx, _parentState)
		var _prevctx: PreprocessorExpressionContext = _localctx
		let _startState: Int = 4
		try enterRecursionRule(_localctx, 4, ObjectiveCPreprocessorParser.RULE_preprocessorExpression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(75)
			try _errHandler.sync(self)
			switch (ObjectiveCPreprocessorParser.Tokens(rawValue: try _input.LA(1))!) {
			case .DIRECTIVE_TRUE:
				_localctx = PreprocessorConstantContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(51)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_TRUE.rawValue)

				break

			case .DIRECTIVE_FALSE:
				_localctx = PreprocessorConstantContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(52)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_FALSE.rawValue)

				break

			case .DIRECTIVE_DECIMAL_LITERAL:
				_localctx = PreprocessorConstantContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(53)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DECIMAL_LITERAL.rawValue)

				break

			case .DIRECTIVE_STRING:
				_localctx = PreprocessorConstantContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(54)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_STRING.rawValue)

				break

			case .DIRECTIVE_ID:
				_localctx = PreprocessorConditionalSymbolContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(55)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)
				setState(60)
				try _errHandler.sync(self)
				switch (try getInterpreter().adaptivePredict(_input,3,_ctx)) {
				case 1:
					setState(56)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue)
					setState(57)
					try preprocessorExpression(0)
					setState(58)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue)

					break
				default: break
				}

				break

			case .DIRECTIVE_LP:
				_localctx = PreprocessorParenthesisContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(62)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue)
				setState(63)
				try preprocessorExpression(0)
				setState(64)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue)

				break

			case .DIRECTIVE_BANG:
				_localctx = PreprocessorNotContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(66)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_BANG.rawValue)
				setState(67)
				try preprocessorExpression(6)

				break

			case .DIRECTIVE_DEFINED:
				_localctx = PreprocessorDefinedContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(68)
				try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_DEFINED.rawValue)
				setState(73)
				try _errHandler.sync(self)
				switch (ObjectiveCPreprocessorParser.Tokens(rawValue: try _input.LA(1))!) {
				case .DIRECTIVE_ID:
					setState(69)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)

					break

				case .DIRECTIVE_LP:
					setState(70)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_LP.rawValue)
					setState(71)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_ID.rawValue)
					setState(72)
					try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_RP.rawValue)

					break
				default:
					throw ANTLRException.recognition(e: NoViableAltException(self))
				}

				break
			default:
				throw ANTLRException.recognition(e: NoViableAltException(self))
			}
			_ctx!.stop = try _input.LT(-1)
			setState(91)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(89)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
					case 1:
						_localctx = PreprocessorBinaryContext(  PreprocessorExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCPreprocessorParser.RULE_preprocessorExpression)
						setState(77)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(78)
						_localctx.castdown(PreprocessorBinaryContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_EQUAL.rawValue || _la == ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_NOTEQUAL.rawValue)) {
							_localctx.castdown(PreprocessorBinaryContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(79)
						try preprocessorExpression(6)

						break
					case 2:
						_localctx = PreprocessorBinaryContext(  PreprocessorExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCPreprocessorParser.RULE_preprocessorExpression)
						setState(80)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(81)
						try {
								let assignmentValue = try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_AND.rawValue)
								_localctx.castdown(PreprocessorBinaryContext.self).op = assignmentValue
						     }()

						setState(82)
						try preprocessorExpression(5)

						break
					case 3:
						_localctx = PreprocessorBinaryContext(  PreprocessorExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCPreprocessorParser.RULE_preprocessorExpression)
						setState(83)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(84)
						try {
								let assignmentValue = try match(ObjectiveCPreprocessorParser.Tokens.DIRECTIVE_OR.rawValue)
								_localctx.castdown(PreprocessorBinaryContext.self).op = assignmentValue
						     }()

						setState(85)
						try preprocessorExpression(4)

						break
					case 4:
						_localctx = PreprocessorBinaryContext(  PreprocessorExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, ObjectiveCPreprocessorParser.RULE_preprocessorExpression)
						setState(86)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(87)
						_localctx.castdown(PreprocessorBinaryContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64((_la - 211)) & ~0x3f) == 0 && ((Int64(1) << (_la - 211)) & 15) != 0))) {
							_localctx.castdown(PreprocessorBinaryContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(88)
						try preprocessorExpression(3)

						break
					default: break
					}
			 
				}
				setState(93)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  2:
			return try preprocessorExpression_sempred(_localctx?.castdown(PreprocessorExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func preprocessorExpression_sempred(_ _localctx: PreprocessorExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 5)
		    case 1:return precpred(_ctx, 4)
		    case 2:return precpred(_ctx, 3)
		    case 3:return precpred(_ctx, 2)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,224,95,2,0,7,0,2,1,7,1,2,2,7,2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,
		0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,3,0,42,8,0,3,0,44,8,0,1,1,4,1,47,8,1,
		11,1,12,1,48,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,61,8,2,1,2,1,
		2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,74,8,2,3,2,76,8,2,1,2,1,2,1,
		2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,5,2,90,8,2,10,2,12,2,93,9,2,1,2,
		0,1,4,3,0,2,4,0,4,1,0,188,189,1,0,223,224,1,0,207,208,1,0,211,214,117,
		0,43,1,0,0,0,2,46,1,0,0,0,4,75,1,0,0,0,6,7,5,184,0,0,7,8,7,0,0,0,8,44,
		3,2,1,0,9,10,5,184,0,0,10,11,5,193,0,0,11,44,3,4,2,0,12,13,5,184,0,0,13,
		14,5,194,0,0,14,44,3,4,2,0,15,16,5,184,0,0,16,44,5,195,0,0,17,18,5,184,
		0,0,18,44,5,199,0,0,19,20,5,184,0,0,20,21,5,197,0,0,21,44,5,216,0,0,22,
		23,5,184,0,0,23,24,5,198,0,0,24,44,5,216,0,0,25,26,5,184,0,0,26,27,5,196,
		0,0,27,44,5,216,0,0,28,29,5,184,0,0,29,30,5,190,0,0,30,44,3,2,1,0,31,32,
		5,184,0,0,32,33,5,202,0,0,33,44,3,2,1,0,34,35,5,184,0,0,35,36,5,203,0,
		0,36,44,3,2,1,0,37,38,5,184,0,0,38,39,5,191,0,0,39,41,5,216,0,0,40,42,
		3,2,1,0,41,40,1,0,0,0,41,42,1,0,0,0,42,44,1,0,0,0,43,6,1,0,0,0,43,9,1,
		0,0,0,43,12,1,0,0,0,43,15,1,0,0,0,43,17,1,0,0,0,43,19,1,0,0,0,43,22,1,
		0,0,0,43,25,1,0,0,0,43,28,1,0,0,0,43,31,1,0,0,0,43,34,1,0,0,0,43,37,1,
		0,0,0,44,1,1,0,0,0,45,47,7,1,0,0,46,45,1,0,0,0,47,48,1,0,0,0,48,46,1,0,
		0,0,48,49,1,0,0,0,49,3,1,0,0,0,50,51,6,2,-1,0,51,76,5,200,0,0,52,76,5,
		201,0,0,53,76,5,217,0,0,54,76,5,215,0,0,55,60,5,216,0,0,56,57,5,205,0,
		0,57,58,3,4,2,0,58,59,5,206,0,0,59,61,1,0,0,0,60,56,1,0,0,0,60,61,1,0,
		0,0,61,76,1,0,0,0,62,63,5,205,0,0,63,64,3,4,2,0,64,65,5,206,0,0,65,76,
		1,0,0,0,66,67,5,204,0,0,67,76,3,4,2,6,68,73,5,192,0,0,69,74,5,216,0,0,
		70,71,5,205,0,0,71,72,5,216,0,0,72,74,5,206,0,0,73,69,1,0,0,0,73,70,1,
		0,0,0,74,76,1,0,0,0,75,50,1,0,0,0,75,52,1,0,0,0,75,53,1,0,0,0,75,54,1,
		0,0,0,75,55,1,0,0,0,75,62,1,0,0,0,75,66,1,0,0,0,75,68,1,0,0,0,76,91,1,
		0,0,0,77,78,10,5,0,0,78,79,7,2,0,0,79,90,3,4,2,6,80,81,10,4,0,0,81,82,
		5,209,0,0,82,90,3,4,2,5,83,84,10,3,0,0,84,85,5,210,0,0,85,90,3,4,2,4,86,
		87,10,2,0,0,87,88,7,3,0,0,88,90,3,4,2,3,89,77,1,0,0,0,89,80,1,0,0,0,89,
		83,1,0,0,0,89,86,1,0,0,0,90,93,1,0,0,0,91,89,1,0,0,0,91,92,1,0,0,0,92,
		5,1,0,0,0,93,91,1,0,0,0,8,41,43,48,60,73,75,89,91
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
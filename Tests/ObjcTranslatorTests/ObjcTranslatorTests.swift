import XCTest
import TestingSupport
import ObjcGrammar
import Antlr4
@testable import ObjcTranslator
import CustomDump

final class ObjcTranslatorTests: XCTestCase {
    // Need to keep a strong reference of lexer and collector
    var lexer: ObjectiveCLexer!
    var collector: CollectorTokenSource<ObjectiveCLexer>!
    
    func testEnum_nsEnum() throws {
        let source = """
        /// Some comment
        typedef NS_ENUM(NSInteger, XYAttachmentType) {
            // Comment for one
            XYAttachmentTypeOne = 0,
        
            // Comment for two
            /*
            Multiline comment for two
            */
            XYAttachmentTypeTwo = 1, // trailing comment for two
        };

        """
                
        let translator = try translator(
            from: source,
            existingPrefix: "XY"
        )
        
        print(translator.afterTriviaMap)
        print(translator.beforeTriviaMap)

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            /// Some comment
            @objc(XYAttachmentType)
            public enum AttachmentType: Int {
                case one = 0
                // Comment for two
                /*
                Multiline comment for two
                */
                case two = 1
            }
            """
        )
    }
    
    private func translator(
        from source: String,
        existingPrefix: String = "",
        access: ObjcTranslator.Access = .public
    ) throws -> ObjcTranslator {        
        collector = CollectorTokenSource(
            source: ObjectiveCLexer(ANTLRInputStream(source))
        )
        
        let preprocessor = try ObjectiveCPreprocessorParser(
            CommonTokenStream(collector, 3) // DIRECTIVE_CHANNEL
        )

        let parser = try ObjectiveCParser(
            CommonTokenStream(
                collector
            )
        )
        
        let translationUnit = try parser.translationUnit()
        // Silent 'no viable alternative at <EOF>'
        preprocessor.removeErrorListeners()
        preprocessor.setErrorHandler(BailErrorStrategy())
        
        var directives = [ObjectiveCPreprocessorParser.DirectiveContext]()
        while true {
            do {
                directives.append(try preprocessor.directive())
            } catch {
                break
            }
        }
        
        return ObjcTranslator(
            directives: directives,
            translationUnit: translationUnit,
            commentTokens: collector.commentTokens,
            ignoredTokens: collector.ignoredTokens,
            existingPrefix: existingPrefix,
            access: access
        )
    }
}

import XCTest
import TestingSupport
import ObjcGrammar
import Antlr4
@testable import ObjcTranslator
import CustomDump

final class ObjcTranslatorTests: XCTestCase {
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

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            /// Some comment
            @objc(XYAttachmentType)
            public enum AttachmentType: Int {
                // Comment for one
                case one = 0
                // Comment for two
                /*
                Multiline comment for two
                */
                case two = 1// trailing comment for two
            }
            """
        )
    }
    
    func testEnum_enum() throws {
        let source = """
        
        typedef enum : NSUInteger {
            PINSpeedRecorderConnectionStatusNotReachable,
            PINSpeedRecorderConnectionStatusWWAN,
            PINSpeedRecorderConnectionStatusWiFi
        } PINSpeedRecorderConnectionStatus;
        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "PIN"
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            @objc(PINSpeedRecorderConnectionStatus)
            public enum SpeedRecorderConnectionStatus: UInt {
                case notReachable
                case wWAN
                case wiFi
            }
            """
        )
    }
    
    func testProtocol_properties() throws {
        let source = """
        @protocol ABFoo <NSObject, ABAnotherProtocol>
        
        @property (nonatomic, copy, nonnull) id<ABProviderProtocol> provider;
        
        @property (nonatomic, copy, nonnull) BOOL (^enumerateProviders)(id<ABProviderProtocol> provider, BOOL *stop);
        
        @end
        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "AB"
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            @objc(ABFoo)
            public protocol Foo: NSObjectProtocol, ABAnotherProtocol {
                     
                public var provider: ABProviderProtocol {
                    get
                    set
                }
            
                public var enumerateProviders: (provider: ABProviderProtocol, stop: UnsafeMutablePointer<ObjCBool>) -> Bool {
                    get
                    set
                }
            }
            """
        )
    }
    
    func testProtocol() throws {

    }
    
    private func translator(
        from source: String,
        existingPrefix: String = "",
        access: ObjcTranslator<ObjectiveCLexer>.Access = .public
    ) throws -> ObjcTranslator<ObjectiveCLexer> {
        let collector = CollectorTokenSource(
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
            collector: collector,
            directives: directives,
            translationUnit: translationUnit,
            existingPrefix: existingPrefix,
            access: access
        )
    }
}

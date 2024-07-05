import XCTest
import TestingSupport
import ObjcSyntax
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
        typedef unsigned char HelloWorld;
        typedef void (^ABCharactorCompletionBlock)(ABGender gender, ABStyle style,
                                                               NSMutableDictionary *characterData, NSString *versionedId);
        
        @protocol ABFoo <NSObject, ABAnotherProtocol>
        
        @property (nonatomic, copy, nullable, readonly) NSString *string;

        @property (nonatomic, copy, nonnull) id<ABProviderProtocol> provider;
        
        @property (nonatomic, assign, nonnull) BOOL (^enumerateProviders)(id<ABProviderProtocol> provider, BOOL *stop);
        
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
            
            
            typealias HelloWorld = UInt8
            
            typealias ABCharactorCompletionBlock = (gender: ABGender?, style: ABStyle?, characterData: [AnyHashable: Any]?, versionedId: String?) -> Void
            
            @objc(ABFoo)
            public protocol Foo: NSObjectProtocol, ABAnotherProtocol {
                    
                var string: String? {
                    get
                }
            
                var provider: ABProviderProtocol {
                    get
                    set
                }
            
                var enumerateProviders: (provider: ABProviderProtocol, stop: UnsafeMutablePointer<ObjCBool>) -> Bool {
                    get
                    set
                }
            }
            """
        )
    }
    
    func testProtocol_nsSwiftName() throws {
        let source = """
        
        #import <UIKit/UIKit.h>

        NS_ASSUME_NONNULL_BEGIN

        /// Responsible for presenting the view.
        NS_SWIFT_NAME(SwiftViewPresenting)
        @protocol EXViewPresenting <NSObject>
        
        @property (nonatomic) NSDictionary<NSNumber *, NSString *> *viewTagMap;
        
        @property (nonatomic, weak) id<Foo, Bar> fooBarDelegate;
        
        // Some class method
        + (BOOL)archiveEntryWithFileName:(NSString *)fileName;

        - (instancetype)initWithDataBlock:(nullable NSData *_Nullable (^)(NSError **error))dataBlock;
        
        /// Presents the feature blah blah.
        /// @param navigationController Navigation controller to set chat screen to.
        /// @param the index in the tab bar tabBarController
        - (void)presentAttachedToNavigationController:(UINavigationController *)navigationController
                                   withTabBarTagIndex:(NSInteger)tagIndex;

        /// Handle logout.
        - (void)handleLogout;

        @end

        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "EX"
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """

            
            /// Responsible for presenting the view.
            @objc(EXViewPresenting)
            public protocol SwiftViewPresenting: NSObjectProtocol {

                var viewTagMap: [NSNumber: String]? {
                    get
                    set
                }
            
                weak var fooBarDelegate: (Foo & Bar)? {
                    get
                    set
                }
            
                // Some class method
                class func archiveEntry(fileName: String) -> Bool

                init(dataBlock: (error: UnsafeMutablePointer<Error>) -> Data)

                /// Presents the feature blah blah.
                /// @param navigationController Navigation controller to set chat screen to.
                /// @param the index in the tab bar tabBarController
                func presentAttachedToNavigationController(_ navigationController: UINavigationController, tagIndex: Int)

                /// Handle logout.
                func handleLogout()
            }
            """
        )
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

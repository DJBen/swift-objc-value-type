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
    
    @available(iOS 14, *)
    func testMacros() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        @protocol AdsNetworking <NSObject>

        - (void)startImpression:(AdImpression *)impression
              completionHandler:(nullable void (^)(NSError *_Nullable error))completion
            NS_SWIFT_NAME(startImpression(_:completionHandler:))API_AVAILABLE(ios(14.5))
                API_UNAVAILABLE(macos, watchos)__TVOS_PROHIBITED;

        @end
        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            #"""

            
            @objc
            public protocol AdsNetworking: NSObjectProtocol {

                @available(iOS 14.5, *)
                @available(macOS, unavailable) 
                @available(watchOS, unavailable)
                @objc
                func startImpression(_ impression: AdImpression, completion: ((error: Error?) -> Void)?)
            }
            """#
        )
    }
    
    func testProtocol_methods_optionalSections() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        
        @protocol DataSourceProtocol <NSObject>

        // Required methods
        @required
        - (NSInteger)numberOfItems;
        - (id)itemAtIndex:(NSInteger)index;

        // Optional methods
        @optional
        @property (nonatomic, strong) NSString *string;
        
        - (NSString *)titleForItemAtIndex:(NSInteger)index;
        - (void)didSelectItemAtIndex:(NSInteger)index;

        @end
        
        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            #"""
            
            
            @objc
            public protocol DataSourceProtocol: NSObjectProtocol {

                // Required methods
                @objc
                func numberOfItems() -> Int

                @objc
                func itemAtIndex(_ index: Int) -> AnyObject

                // Optional methods
                optional var string: String? {
                    get
                    set
                }
                
                @objc
                optional func titleForItemAtIndex(_ index: Int) -> String

                @objc
                optional func didSelectItemAtIndex(_ index: Int)
            }
            """#
        )
    }
    
    func testProtocol_methods() throws {
        let source = """
        
        #import <UIKit/UIKit.h>
        #import <Foundation/Foundation.h>

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
        /// - Parameter navigationController Navigation controller to set chat screen to.
        /// - Parameter the index in the tab bar tabBarController
        - (void)presentAttachedToNavigationController:(UINavigationController *)navigationController
                                   withTabBarTagIndex:(NSInteger)tagIndex;

        /// Handle logout.
        - (void)handleLogout;

        /// @return a number
        - (nullable NSNumber *)someTypeWithOptionalStr:(nullable NSString *)optionalStr optionalStr2:(NSString *_Nullable)str2;

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
            
            import UIKit
            import Foundation
            
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
                @objc
                class func archiveEntry(fileName: String) -> Bool

                @objc
                init(dataBlock: ((error: UnsafeMutablePointer<Error>) -> Data?)?)

                /// Presents the feature blah blah.
                /// - Parameter navigationController Navigation controller to set chat screen to.
                /// - Parameter the index in the tab bar tabBarController
                @objc
                func presentAttachedToNavigationController(_ navigationController: UINavigationController, tagIndex: Int)

                /// Handle logout.
                @objc
                func handleLogout()
            
                /// - Returns a number
                @objc
                func someType(optionalStr: String?, str2: String?) -> NSNumber?
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

        let parser = try ObjectiveCParser(
            CommonTokenStream(collector)
        )
        
        let translationUnit = try parser.translationUnit()
        
        let preprocessorSource = ANTLRInputStream(source)
        let preprocessorLexer = ObjectiveCPreprocessorLexer(preprocessorSource)
        
        let preprocessorParser = try ObjectiveCPreprocessorParser(
            CommonTokenStream(preprocessorLexer)
        )
        let document = try preprocessorParser.objectiveCDocument()
        
        let directives = document.text().compactMap { text in
            if let directive = text.directive() {
                return directive
            } else {
                return nil
            }
        }
        
        return ObjcTranslator(
            preprocessorSource: preprocessorSource,
            collector: collector,
            directives: directives,
            translationUnit: translationUnit,
            existingPrefix: existingPrefix,
            access: access
        )
    }
}

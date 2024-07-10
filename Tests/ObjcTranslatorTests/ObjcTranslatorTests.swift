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
    
    func testEnum_optionSet() throws {
        // Excerpt from Masonry
        let source = """
        typedef NS_OPTIONS(NSInteger, MASAttribute) {
            MASAttributeLeft = 1 << NSLayoutAttributeLeft,
            MASAttributeRight = 1 << NSLayoutAttributeRight,
            MASAttributeTop = 1 << NSLayoutAttributeTop,
            MASAttributeBottom = 1 << NSLayoutAttributeBottom,
            MASAttributeLeading = 1 << NSLayoutAttributeLeading,
            MASAttributeTrailing = 1 << NSLayoutAttributeTrailing,
            MASAttributeWidth = 1 << NSLayoutAttributeWidth,
            MASAttributeHeight = 1 << NSLayoutAttributeHeight,
            MASAttributeCenterX = 1 << NSLayoutAttributeCenterX,
            MASAttributeCenterY = 1 << NSLayoutAttributeCenterY,
            MASAttributeBaseline = 1 << NSLayoutAttributeBaseline,

        #if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) ||                           \
            (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)

            MASAttributeFirstBaseline = 1 << NSLayoutAttributeFirstBaseline,
            MASAttributeLastBaseline = 1 << NSLayoutAttributeLastBaseline,

        #endif

        #if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)

            MASAttributeLeftMargin = 1 << NSLayoutAttributeLeftMargin,
            MASAttributeRightMargin = 1 << NSLayoutAttributeRightMargin,
            MASAttributeTopMargin = 1 << NSLayoutAttributeTopMargin,
            MASAttributeBottomMargin = 1 << NSLayoutAttributeBottomMargin,
            MASAttributeLeadingMargin = 1 << NSLayoutAttributeLeadingMargin,
            MASAttributeTrailingMargin = 1 << NSLayoutAttributeTrailingMargin,
            MASAttributeCenterXWithinMargins = 1 << NSLayoutAttributeCenterXWithinMargins,
            MASAttributeCenterYWithinMargins = 1 << NSLayoutAttributeCenterYWithinMargins,

        #endif

        };

        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "MAS"
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """

            
            public struct Attribute: OptionSet {
                public let rawValue: UInt

                public let left = Attribute(rawValue: 1 << NSLayoutAttributeLeft)

                public let right = Attribute(rawValue: 1 << NSLayoutAttributeRight)

                public let top = Attribute(rawValue: 1 << NSLayoutAttributeTop)

                public let bottom = Attribute(rawValue: 1 << NSLayoutAttributeBottom)

                public let leading = Attribute(rawValue: 1 << NSLayoutAttributeLeading)

                public let trailing = Attribute(rawValue: 1 << NSLayoutAttributeTrailing)

                public let width = Attribute(rawValue: 1 << NSLayoutAttributeWidth)

                public let height = Attribute(rawValue: 1 << NSLayoutAttributeHeight)

                public let centerX = Attribute(rawValue: 1 << NSLayoutAttributeCenterX)

                public let centerY = Attribute(rawValue: 1 << NSLayoutAttributeCenterY)

                public let baseline = Attribute(rawValue: 1 << NSLayoutAttributeBaseline)

                public let firstBaseline = Attribute(rawValue: 1 << NSLayoutAttributeFirstBaseline)

                public let lastBaseline = Attribute(rawValue: 1 << NSLayoutAttributeLastBaseline)

                public let leftMargin = Attribute(rawValue: 1 << NSLayoutAttributeLeftMargin)

                public let rightMargin = Attribute(rawValue: 1 << NSLayoutAttributeRightMargin)

                public let topMargin = Attribute(rawValue: 1 << NSLayoutAttributeTopMargin)

                public let bottomMargin = Attribute(rawValue: 1 << NSLayoutAttributeBottomMargin)

                public let leadingMargin = Attribute(rawValue: 1 << NSLayoutAttributeLeadingMargin)

                public let trailingMargin = Attribute(rawValue: 1 << NSLayoutAttributeTrailingMargin)

                public let centerXWithinMargins = Attribute(rawValue: 1 << NSLayoutAttributeCenterXWithinMargins)

                public let centerYWithinMargins = Attribute(rawValue: 1 << NSLayoutAttributeCenterYWithinMargins)

                public init(rawValue: UInt) {
                    self.rawValue = rawValue
                }
            }
            """
        )
    }
    
    func testProtocol_properties_nestedBlocks() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN

        @protocol ABFoo <NSObject, ABAnotherProtocol>

        @property (nonatomic, copy, nullable) void (^handler_resultsForQuery)
            (Query *, void (^)(SCResult<QueryResultModel *> *));
        
        @end
        
        NS_ASSUME_NONNULL_END
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
            
                var handler_resultsForQuery: ((Query, (SCResult<QueryResultModel>) -> Void) -> Void)? {
                    get
                    set
                }
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
            
                var enumerateProviders: (provider: ABProviderProtocol?, stop: UnsafeMutablePointer<ObjCBool>) -> Bool {
                    get
                    set
                }
            }
            """
        )
    }
    
    func testClassInterface_generics() throws {
        let source = """
        
        @interface PluginRegistry<PlugIn> : NSObject

        /// Registers a plug-in
        - (void)register:(PlugIn)plugIn;

        @end
        
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        // Ignore non-initializers for classes
        assertBuildResult(
            result,
            #"""
            
            
            @objc
            public class PluginRegistry<PlugIn>: NSObject {
            }
            """#
        )
    }
    
    func testMacros() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        @protocol AdsNetworking <NSObject>

        - (void)startImpression:(AdImpression *)impression
              completionHandler:(nullable void (^)(NSError *_Nullable error))completion
            NS_SWIFT_NAME(startImpression(_:completionHandler:))API_AVAILABLE(ios(14.5))
                API_UNAVAILABLE(macos, watchos)__TVOS_PROHIBITED;

        -(instancetype)init __attribute__((unavailable("init is not available.")));
        +(instancetype) new __attribute__((unavailable("new is not available")));
        -(void)f __attribute__((availability(macosx,introduced=10.4,deprecated=10.6,message="hello world")));

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
            
                @available(macosx, introduced: 10.4, deprecated: 10.6, message: "hello world")
                @objc
                func f()
            }
            """#
        )
    }
    
    func testVar_struct() throws {
        let source = """
        /// AccessibilityIdentifiers for UI tests
        const struct UITestAccessibilityIdType UITestAccessibilityId =
        {
             .mainPage = @"main_page",
             .signOut = @"sign_out",
             .displayButton = @"display_content",
             .cacheButton = @"cache_content",
             .browserTab = @"browser_view",
             .installTab = @"install_view",
             .linkTab = @"link_view",
             .mediaTab = @"media_view",
             .autoCloseEnable = @"auto_close_enable",
             .autoCloseDisable = @"auto_close_disable",
             .invalidLinkDisable = @"invalid_link_disable",
             .invalidLinkEnable = @"invalid_link_enable",
        }
        ;

        /// Config passed by UI Tests
        const struct UITestConfigType UITestConfig =
        {
             .browserType = @"browser_type",
        }
        ;
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            #"""
            
            
            /// AccessibilityIdentifiers for UI tests
            @objc
            public class UITestAccessibilityId: NSObject {
                         
                @objc
                public static let mainPage = "main_page"

                @objc
                public static let signOut = "sign_out"

                @objc
                public static let displayButton = "display_content"

                @objc
                public static let cacheButton = "cache_content"

                @objc
                public static let browserTab = "browser_view"

                @objc
                public static let installTab = "install_view"

                @objc
                public static let linkTab = "link_view"

                @objc
                public static let mediaTab = "media_view"

                @objc
                public static let autoCloseEnable = "auto_close_enable"

                @objc
                public static let autoCloseDisable = "auto_close_disable"

                @objc
                public static let invalidLinkDisable = "invalid_link_disable"

                @objc
                public static let invalidLinkEnable = "invalid_link_enable"
            }

            /// Config passed by UI Tests
            @objc
            public class UITestConfig: NSObject {

                @objc
                public static let browserType = "browser_type"
            }
            """#
        )
    }
    
    func testProtocol_methods_block() throws {
        let source = """
        @protocol SaverProtocol <NSObject>

        /**
         This override the existing sections with mutated results.
         */
        - (void)saveSectionsWithMutationBlock:(nonnull NSArray<Section *> *_Nonnull (^)(
                                                  id<DataAccessing> _Nonnull dataAccessor))mutationBlock
                              completionQueue:(nonnull dispatch_queue_t)completionQueue
                                   completion:(nonnull dispatch_block_t)completion;
        
        - (void)noEscapeBlock:(NS_NOESCAPE Section* (^_Nonnull)())block;
        
        @end
        """
        
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            #"""
            
            
            @objc
            public protocol SaverProtocol: NSObjectProtocol {

                /**
             This override the existing sections with mutated results.
             */
                @objc
                func saveSections(mutationBlock: @escaping (dataAccessor: DataAccessing) -> [Section], completionQueue: dispatch_queue_t, completion: dispatch_block_t)
            
                @objc
                func noEscapeBlock(_ block: () -> Section)
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
        @property (nonatomic, strong, nullable) NSString *string;
        
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
                func itemAtIndex(_ index: Int) -> Any

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
        
        @property (nonatomic, weak, nullable) id<Foo, Bar> fooBarDelegate;
        
        // Some class method
        + (BOOL)archiveEntryWithFileName:(NSString *)fileName;

        - (instancetype)initWithDataBlock:(nullable NSData *_Nullable (^)(NSError * _Nonnull *error))dataBlock;
        
        /// Presents the feature blah blah.
        /// @param navigationController Navigation controller to set chat screen to.
        /// @param tagIndex the index in the tab bar tabBarController
        - (void)presentAttachedToNavigationController:(UINavigationController *)navigationController
                                   withTabBarTagIndex:(NSInteger)tagIndex;

        /// Handle logout.
        - (void)handleLogout;

        /// @return a number
        - (nullable NSNumber *)someTypeWithOptionalStr:(nullable NSString *)optionalStr optionalStr2:(NSString *_Nullable)str2;
        
        /// Method with no type specified
        - (void)methodWithNoTypeSpecified:idArg;

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

                var viewTagMap: [NSNumber: String] {
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
                /// - Parameter navigationController: Navigation controller to set chat screen to.
                /// - Parameter tagIndex: the index in the tab bar tabBarController
                @objc
                func presentAttachedToNavigationController(_ navigationController: UINavigationController, tagIndex: Int)

                /// Handle logout.
                @objc
                func handleLogout()
            
                /// - Returns a number
                @objc
                func someType(optionalStr: String?, str2: String?) -> NSNumber?
            
                /// Method with no type specified
                @objc
                func method(noTypeSpecified idArg: Any)
            }
            """
        )
    }
    
    func testClassInterface() throws {
        let source = """
        #import <SCBase/SCMacros.h>
        #import <SCLazy/SCLazy.h>

        #import <SCContactPermissionInfoServices/SCContactPermissionInfoProvider.h>
        #import <SCContactPermissionInfoServices/SCContactPermissionManager.h>

        #import <Foundation/Foundation.h>

        NS_ASSUME_NONNULL_BEGIN

        /// Provides contactPermissionInfoProvider in a given user scope.
        @interface SCContactPermissionInfoServices : NSObject

        /// Provides the current cpntact permission status.
        @property (nonatomic, readonly) SCLazy<id<SCContactPermissionInfoProvider>> *contactPermissionInfoProvider;
        @property (nonatomic, readonly) SCLazy<id<SCContactPermissionManager>> *contactPermissionManager;

        -(instancetype)init __attribute__((unavailable("init is not available.")));
        +(instancetype) new __attribute__((unavailable("new is not available")));

        - (instancetype)
            initWithContactPermissionInfoProvider:(SCLazy<id<SCContactPermissionInfoProvider>> *)contactPermissionInfoProvider
                         contactPermissionManager:(SCLazy<id<SCContactPermissionManager>> *)contactPermissionManager;

        @end

        NS_ASSUME_NONNULL_END

        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "SC"
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            
            import SCBase
            import SCLazy
            import SCContactPermissionInfoServices
            import Foundation

            /// Provides contactPermissionInfoProvider in a given user scope.
            @objc(SCContactPermissionInfoServices)
            public class ContactPermissionInfoServices: NSObject {

                @objc
                public let contactPermissionInfoProvider: SCLazy<SCContactPermissionInfoProvider>

                @objc
                public let contactPermissionManager: SCLazy<SCContactPermissionManager>

                @objc
                public init(contactPermissionInfoProvider: SCLazy<SCContactPermissionInfoProvider>, contactPermissionManager: SCLazy<SCContactPermissionManager>) {
                    self.contactPermissionInfoProvider = contactPermissionInfoProvider
                    self.contactPermissionManager = contactPermissionManager
                    super.init()
                }
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

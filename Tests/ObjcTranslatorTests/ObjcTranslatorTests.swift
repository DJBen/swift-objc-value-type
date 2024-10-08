import XCTest
import TestingSupport
import SharedUtilities
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
            
            
            public typealias HelloWorld = UInt8
            
            public typealias ABCharactorCompletionBlock = (_ gender: ABGender?, _ style: ABStyle?, _ characterData: [AnyHashable: Any]?, _ versionedId: String?) -> Void
            
            @objc(ABFoo)
            public protocol Foo: NSObjectProtocol, ABAnotherProtocol {
                    
                var string: String? {
                    get
                }
            
                var provider: ABProviderProtocol {
                    get
                    set
                }
            
                var enumerateProviders: (_ provider: ABProviderProtocol?, _ stop: UnsafeMutablePointer<ObjCBool>) -> Bool {
                    get
                    set
                }
            }
            """
        )
    }
        
    func testMacros() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        @protocol AdsNetworking <NSObject>

        - (void)startImpression:(AdImpression *)impression
              completionHandler:(nullable void (^)(NSError *_Nullable error))completion
            NS_SWIFT_NAME(startImpressionMeow(_:completionHandler:))API_AVAILABLE(ios(14.5))
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
                func startImpressionMeow(_ impression: AdImpression, completionHandler completion: ((_ error: Error?) -> Void)?)
            
                @available(macosx, introduced: 10.4, deprecated: 10.6, message: "hello world")
                @objc
                func f()
            }
            """#
        )
    }
    
    func testVar_staticConst() throws {
        let source = """
        static CGSize const kButtonSize = {50, 50};
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            #"""
            
            
            // WARNING: this const declaration is not accessible from ObjC; consider wrap it with a @objc class.
            public static let kButtonSize = CGSize(50, 50)
            """#
        )
    }
    
    func testVar_struct() throws {
        let source = """
        /// AccessibilityIdentifiers for UI tests
        const struct UITestAccessibilityIdType UITestAccessibilityId =
        {
             // Main page
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
                
                // Main page
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
    
    func testProtocol_escapingBlock_typedef() throws {
        let source = """
        typedef void (^CompletionBlock)(NSString *_Nonnull param);
        
        NS_ASSUME_NONNULL_BEGIN
        
        @protocol SomeProtocol <NSObject>

        /**
         This override the existing sections with mutated results.
         */
        - (void)performBlock:(CompletionBlock)block;
        
        - (void)noEscapeBlock:(NS_NOESCAPE CompletionBlock)block;
        
        - (void)dispatchWithBlock:(dispatch_block_t)block;
        
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
             
            
            public typealias CompletionBlock = (_ param: String) -> Void
            
            @objc
            public protocol SomeProtocol: NSObjectProtocol {
            
                /**
             This override the existing sections with mutated results.
             */
                @objc
                func performBlock(_ block: @escaping CompletionBlock)
            
                @objc
                func noEscapeBlock(_ block: CompletionBlock)
            
                @objc
                func dispatch(withBlock block: @escaping () -> Void)
            }
            """#
        )
    }
    
    func testProtocol_methods_names() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        
        @protocol SomeProtocol <NSObject>

        - (int)valueForConfigKeySync:(NSString *)configKey
                        defaultValue:(int)defaultValue
                                 foo:(Foo *_Nullable)foo;
        
        - (void)valueForNancyForSam:(int)sam;
        
        - (void)valueForNancyWithSam:(int)sam;

        - (void)valueWithSam:(int)sam;

        - (void)forReal:(NSString *)real;

        - (void)sForReal:(NSString *)real;
        
        - (instancetype)initWithSam:(int)sam;

        - (instancetype)initWithSamFoo:(int)sam;
        
        - (id<Token>)startSection:(Reason)reason;
        
        @end
        
        NS_ASSUME_NONNULL_END
        
        """
                
        let translator = try translator(
            from: source,
            existingPrefix: ""
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            
            
            @objc
            public protocol SomeProtocol: NSObjectProtocol {
            
                @objc
                func value(forConfigKeySync configKey: String, defaultValue: Int32, foo: Foo?) -> Int32

                @objc
                func valueForNancy(forSam sam: Int32)
            
                @objc
                func valueForNancy(withSam sam: Int32)

                @objc
                func value(withSam sam: Int32)
            
                @objc
                func forReal(_ real: String)
                
                @objc
                func s(forReal real: String)
            
                @objc
                init(sam: Int32)

                @objc
                init(samFoo sam: Int32)
            
                @objc
                func startSection(_ reason: Reason) -> Token
            }
            """
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
        
        - (void)namedCompletion:(void (^)(id<Result> result))completion;
        
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
                func saveSections(mutationBlock: @escaping (_ dataAccessor: DataAccessing) -> [Section], completionQueue: dispatch_queue_t, completion: @escaping () -> Void)
            
                @objc
                func noEscapeBlock(_ block: () -> Section)
            
                @objc
                func namedCompletion(_ completion: ((_ result: Result?) -> Void)?)
            }
            """#
        )
    }
    
    func testProtocol_methods_optionalSections() throws {
        let source = """
        static NSString *const kSomeDeviceId = @"SomeDeviceId";

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
            
            
            // WARNING: this const declaration is not accessible from ObjC; consider wrap it with a @objc class.
            public static let kSomeDeviceId = "SomeDeviceId"
            
            @objc
            public protocol DataSourceProtocol: NSObjectProtocol {

                // Required methods
                @objc
                func numberOfItems() -> Int

                @objc
                func item(at index: Int) -> Any

                // Optional methods
                optional var string: String? {
                    get
                    set
                }
                
                @objc
                optional func titleForItem(at index: Int) -> String

                @objc
                optional func didSelectItem(at index: Int)
            }
            """#
        )
    }
    
    func testProtocol_compoundTypes() throws {
        let source = """
        @protocol CompoundProtocol <NSObject>
        
        @property (nonatomic, strong) id<Foo, Bar> fooBar;

        /** blah blah **/
        - (void)compoundType:(id<Foo, Bar> _Nonnull)fooBar;
        
        @end
        """
        
        let translator = try translator(
            from: source
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """

            
            @objc
            public protocol CompoundProtocol: NSObjectProtocol {

                var fooBar: (Foo & Bar)? {
                    get
                    set
                }

                /** blah blah **/
                @objc
                func compoundType(_ fooBar: Foo & Bar)
            }
            """
        )
    }
    
    func testProtocol_methods() throws {
        let source = """
        
        #import <UIKit/UIKit.h>
        #import <Foundation/Foundation.h>
        #import <Foo/Foo.bar.h>

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
            import Foo
            
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
                class func archiveEntry(withFileName fileName: String) -> Bool

                @objc
                init(dataBlock: ((_ error: UnsafeMutablePointer<Error>) -> Data?)?)

                /// Presents the feature blah blah.
                /// - Parameter navigationController: Navigation controller to set chat screen to.
                /// - Parameter tagIndex: the index in the tab bar tabBarController
                @objc
                func presentAttached(toNavigationController navigationController: UINavigationController, withTabBarTagIndex tagIndex: Int)

                /// Handle logout.
                @objc
                func handleLogout()
            
                /// - Returns a number
                @objc
                func someType(withOptionalStr optionalStr: String?, optionalStr2 str2: String?) -> NSNumber?
            
                /// Method with no type specified
                @objc
                func methodWithNoTypeSpecified(_ idArg: Any)
            }
            """
        )
    }
    
    func testClassInterface() throws {
        let source = """
        /// Top level comments
        
        #import <ContactPermissionInfoServices/ContactPermissionInfoProvider.h>
        #import <ContactPermissionInfoServices/ContactPermissionManager.h>

        #import <Foundation/Foundation.h>
        // Comments to @import
        @import CoreGraphics;

        NS_ASSUME_NONNULL_BEGIN

        /// Provides contactPermissionInfoProvider in a given user scope.
        @interface ContactPermissionInfoServices : NSObject

        /// Provides the current contact permission status.
        @property (nonatomic, readonly) Lazy<id<ContactPermissionInfoProvider>> *contactPermissionInfoProvider;
        @property (nonatomic, readonly) Lazy<id<ContactPermissionManager>> *contactPermissionManager;

        -(instancetype)init __attribute__((unavailable("init is not available.")));
        +(instancetype) new __attribute__((unavailable("new is not available")));

        - (instancetype)
            initWithContactPermissionInfoProvider:(Lazy<id<ContactPermissionInfoProvider>> *)contactPermissionInfoProvider
                         contactPermissionManager:(Lazy<id<ContactPermissionManager>> *)contactPermissionManager;

        @end

        NS_ASSUME_NONNULL_END

        """
        
        let translator = try translator(
            from: source,
            existingPrefix: ""
        )

        let result = try translator.translate()
        
        assertBuildResult(
            result,
            """
            
            /// Top level comments
            import ContactPermissionInfoServices
            import Foundation
            // Comments to @import
            import CoreGraphics
            
            /// Provides contactPermissionInfoProvider in a given user scope.
            @objc
            public class ContactPermissionInfoServices: NSObject {

                /// Provides the current contact permission status.
                @objc
                public let contactPermissionInfoProvider: Lazy<ContactPermissionInfoProvider>

                @objc
                public let contactPermissionManager: Lazy<ContactPermissionManager>

                @objc
                public init(contactPermissionInfoProvider: Lazy<ContactPermissionInfoProvider>, contactPermissionManager: Lazy<ContactPermissionManager>) {
                    self.contactPermissionInfoProvider = contactPermissionInfoProvider
                    self.contactPermissionManager = contactPermissionManager
                    super.init()
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

    
    func testClassInterface_genericsWithInheritance() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        
        @interface GenericTabBarItemContainerDataSource<State, VC : UIViewController *> : GenericDeckContainerDataSource <State, VC>
        
        /// See GenericDeckContainerDataSource for the first 4 parameters.
        /// @param tabBarItemContainer The TabBarItemContainer for which this object is the data source for.
        - (instancetype)initWithBuilder:(VC (^)(State))builder
         preserveStateBlock:(nullable State (^)(VC))preserveStateBlock
         purgeBehavior:(GenericDeckContainerDataSourcePurgeBehavior)purgeBehavior
         purgeDelay:(NSInteger)purgeDelay
         tabBarItemContainer:(id<TabBarItemContainer>)tabBarItemContainer;
        
        @end
        
        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source
        )

        // Just make sure it can parse
        let _ = try translator.translate()
    }
    
    func testClassInterface_genericsWithCovariance() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        
        @interface AccessOrderedDictionary<__covariant KeyType, __covariant ObjectType> : OrderedDictionary <NSCoding>

        - (instancetype)initWithMaxSize:(NSInteger)maxSize;

        - (ObjectType)objectForKey:(KeyType)key updateOrder:(BOOL)updateOrder;

        @end
        
        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source
        )

        // Just make sure it can parse
        let _ = try translator.translate()
    }

    func testPrefixStripping() throws {
        let source = """
        NS_ASSUME_NONNULL_BEGIN
        
        @interface PFFoo: NSObject

        @end
        
        @protocol PFHelloProtocol <NSObject>
        
        // First comment
        - (PFFoo *)handle:(nullable NSArray<PFFoo *> *)foos;
        
        @end
        
        @interface PFSomeServices: NSObject
        
        // First comment
        @property (nonatomic, weak, nullable) id<PFHelloProtocol> delegate;
        
        // Value object should append -Objc
        @property (nonatomic, strong) PFValueObject *valueObject;
        
        @end
        
        NS_ASSUME_NONNULL_END
        """
        
        let translator = try translator(
            from: source,
            existingPrefix: "PF",
            typeRegexesExcludedFromPrefixStripping: [/Services$/],
            otherTypeMappings: TypeMappings(swiftValueTypes: ["ValueObject"], swiftTypeMappings: ["PFValueObject": "ValueObject"])
        )

        let result = try translator.translate()
        
        // Ignore non-initializers for classes
        assertBuildResult(
            result,
            #"""
            
            
            @objc(PFFoo)
            public class Foo: NSObject {
            }
            
            @objc(PFHelloProtocol)
            public protocol HelloProtocol: NSObjectProtocol {
            
                // First comment
                @objc
                func handle(_ foos: [Foo]?) -> Foo
            }
            
            @objc
            public class PFSomeServices: NSObject {
            
                // First comment
                @objc
                public weak var delegate: HelloProtocol?
            
                // Value object should append -Objc
                @objc
                public let valueObject: ValueObjectObjc
            }
            """#
        )
    }
    
    private func translator(
        from source: String,
        existingPrefix: String = "",
        typeRegexesExcludedFromPrefixStripping: [any RegexComponent] = [],
        otherTypeMappings: TypeMappings? = nil,
        access: ObjcTranslator.Access = .public
    ) throws -> ObjcTranslator {
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
            typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping,
            access: access, 
            otherTypeMappings: otherTypeMappings
        )
    }
}

import XCTest
import Covfefe
import TestingSupport
@testable import ObjcSupport
import CustomDump

final class ObjcParserTests: XCTestCase {
    func testVarType() throws {
        let grammar = Grammar(start: "var_type") {
            basicProductions()
            typeProductions()
        }
        let parser = EarleyParser(grammar: grammar)

        let input = "Foo *(^helloWorld) (NSString *, int)"
        let syntax = try XCTUnwrap(try parser.syntaxTree(for: input))

        let input2 = "NSString * _Nullable"
        let syntax2 = try XCTUnwrap(try parser.syntaxTree(for: input2))

        let input3 = "id <AA , BB>"
        let syntax3 = try XCTUnwrap(try parser.syntaxTree(for: input3))

        let input4 = "        NSDictionary<NSString *, NSNumber *>     *     "
        let syntax4 = try XCTUnwrap(try parser.syntaxTree(for: input4))

        let input5 = "NSDictionary<NSString*, id<Listener>> *"
        let syntax5 = try XCTUnwrap(try parser.syntaxTree(for: input5))

        let input6 = "BOOL"
        let syntax6 = try XCTUnwrap(try parser.syntaxTree(for: input6))
    }

    func testParamType() throws {
        let grammar = Grammar(start: "nullability_qualified_param_type") {
            basicProductions()
            typeProductions()
        }
        let parser = EarleyParser(grammar: grammar)
        let input = "nonnull NSArray<NSValue*> *"
        let syntax = try XCTUnwrap(try parser.syntaxTree(for: input))
        
        let input2 = "nullable id<MyProtocol>"
        let syntax2 = try XCTUnwrap(try parser.syntaxTree(for: input2))

        let input3 = "NSError *(^ _Nonnull)(NSInteger, uint32_t, NSDictionary<NSString*, id<Listener>> *)"
        let syntax3 = try XCTUnwrap(try parser.syntaxTree(for: input3))

        let input4 = "nonnull AppTerminationType *"
        let syntax4 = try XCTUnwrap(try parser.syntaxTree(for: input4))
    }

    func testDecl() throws {
        let grammar1 = Grammar(start: "method_param") {
            basicProductions()
            typeProductions()
            declProductions()
        }
        let parser1 = EarleyParser(grammar: grammar1)

        let input = """
        setNextAppTerminationType:(nonnull AppTerminationType *)appTerminationType
        """
        let syntax = try XCTUnwrap(try parser1.syntaxTree(for: input))

        let grammar2 = Grammar(start: "method_decl") {
            basicProductions()
            typeProductions()
            declProductions()
        }
        let parser2 = EarleyParser(grammar: grammar2)

        let input2 = """
        /// Set the app termination type for the current app session. This allows specifying the termination type when
        /// a specific flow in the app knows that a termination is about to occur, or should not occur.
        /// Specify the synchronous flag if you know the app is about to crash immediately afterwards.
        - (void)setAppTerminationType:(nonnull   AppTerminationType *)appTerminationType
                          synchronous:(BOOL)synchronous;
        
        """
        let syntax2 = try XCTUnwrap(try parser2.syntaxTree(for: input2))

        let grammar3 = Grammar(start: "property_decl") {
            basicProductions()
            typeProductions()
            declProductions()
        }
        let parser3 = EarleyParser(grammar: grammar3)

        let input3 = """
        /// An observable that will be published upon immediately preceeding a forced termination.
        /// You must do your cleanup work synchronously, as the app will be terminated in the very next call.
        /// The published object will be an arbitrary instance, you should not do anything with it.
        @property (nonatomic, strong, readonly, nonnull) SCObservable *forceTerminationObservable;
        """
        let syntax3 = try XCTUnwrap(try parser3.syntaxTree(for: input3))

        syntax3.iterate { indexPath, currentItem, shouldEnterSubtree in
            let spaces = (0..<indexPath.count).map { _ in "  " }.reduce("", +)
            print(spaces, currentItem.root ?? "\"\(input3[currentItem.leaf!])\"")
        } nodeIterarionComplete: { indexPath, key, continueIterating in
        }
    }

    func testDecl_protocol() throws {
        let grammar1 = Grammar(start: "protocol_decl") {
            basicProductions()
            typeProductions()
            declProductions()
        }
        let parser1 = EarleyParser(grammar: grammar1)
        let input = """
        /// Protocol responsible for force termination of the app, and providing consumers with notice of forced termination.
        @protocol SCAppTerminator <NSObject>

        /// An observable that will be published upon immediately preceeding a forced termination.
        /// You must do your cleanup work synchronously, as the app will be terminated in the very next call.
        /// The published object will be an arbitrary instance, you should not do anything with it.
        @property (nonatomic, strong, readonly, nonnull) SCObservable *forceTerminationObservable;

        /// Forcibly terminate the app
        - (void)forceAppTermination;

        @end

        """
        let syntax = try XCTUnwrap(try parser1.syntaxTree(for: input))

        syntax.iterate { indexPath, currentItem, shouldEnterSubtree in
            let spaces = (0..<indexPath.count).map { _ in "  " }.reduce("", +)
            print(spaces, currentItem.root ?? "\"\(input[currentItem.leaf!])\"")
        } nodeIterarionComplete: { indexPath, key, continueIterating in
        }
    }

    func testCodeBlock() throws {
        let grammar1 = Grammar(start: "import_slashed") {
            codeBlockProductions()
            typeProductions()
            basicProductions()
            declProductions()
        }

        let parser1 = EarleyParser(grammar: grammar1)

        let input = "#import <Foundation/Foundation.h>"
        let syntax = try XCTUnwrap(try parser1.syntaxTree(for: input))

        let grammar2 = Grammar(start: "code_block_list") {
            codeBlockProductions()
            typeProductions()
            basicProductions()
            declProductions()
        }

        let parser2 = EarleyParser(grammar: grammar2)

        let input2 = """
        //
        //  SCAppTerminationProvider.h
        //  SCAppTerminationServices
        //
        //  Created by Daniel Amitay on 1/20/21.
        //

        #import <SCAppTerminationServices/SCAppTerminationType.h>

        #import <Foundation/Foundation.h>

        /// Protocol responsible for providing and updating the app session's termination type.
        @protocol SCAppTerminationProvider <NSObject>

        /// The termination type experienced by the previous app session.
        - (nonnull SCAppTerminationType *)lastAppTerminationType;

        /// Set the app termination type for the current app session. This allows specifying the termination type when
        /// a specific flow in the app knows that a termination is about to occur, or should not occur.
        /// Specify the synchronous flag if you know the app is about to crash immediately afterwards.
        - (void)setNextAppTerminationType:(nonnull SCAppTerminationType *)appTerminationType synchronous:(BOOL)synchronous;

        /// An observable that will be published upon immediately preceeding a forced termination.
        /// You must do your cleanup work synchronously, as the app will be terminated in the very next call.
        /// The published object will be an arbitrary instance, you should not do anything with it.
        @property (nonatomic, strong, readonly, nonnull) SCObservable *forceTerminationObservable;

        /// Forcibly terminate the app
        - (void)forceAppTermination;
        
        @end

        """

        let syntax2 = try XCTUnwrap(try parser2.syntaxTree(for: input2))

        syntax2.iterate { indexPath, currentItem, shouldEnterSubtree in
            let spaces = (0..<indexPath.count).map { _ in "  " }.reduce("", +)
            print(spaces, currentItem.root ?? "\"\(input2[currentItem.leaf!])\"")
        } nodeIterarionComplete: { indexPath, key, continueIterating in
        }
    }

    func testBasics() throws {
        let grammar1 = Grammar(start: "block_comment") {
            basicProductions()
        }
        let parser1 = EarleyParser(grammar: grammar1)

        let input = """

        /*
         * abracadabra
         * yea yea
         */

        """
        let syntax = try XCTUnwrap(try parser1.syntaxTree(for: input))

        let input2 = """
        /**
        @param [param] [Description]: Describes what value should be passed for this parameter
        @return [Description]: Describes the return value of the method
        @see [selector]: Provide “see also” reference to related method
        @warning [description]: Call out exceptional or potentially dangerous behavior
        */
        """
        let syntax2 = try XCTUnwrap(try parser1.syntaxTree(for: input2))
    }

    func test_nsEnum() throws {
        let input = """
        typedef NS_ENUM(NSUInteger, TextKeyboardType) {
            TextKeyboardTypeText = 2,
            TextKeyboardTypeSearch,
            TextKeyboardTypeFriendSearch = -1,
            TextKeyboardTypeEmoji,
        };
        """

        let grammar1 = Grammar(start: "typedef_ns_enum") {
            basicProductions()
            typeProductions()
        }
        let parser1 = EarleyParser(grammar: grammar1)
        let syntax = try XCTUnwrap(try parser1.allSyntaxTrees(for: input))

        let grammar = Grammar(start: "ns_enum_case_list") {
            basicProductions()
            typeProductions()
        }
        let parser = EarleyParser(grammar: grammar)

        let syntax2 = try XCTUnwrap(try parser.syntaxTree(
            for: """
            TextKeyboardTypeText = 2,
            TextKeyboardTypeSearch,
            TextKeyboardTypeFriendSearch = -1,
            TextKeyboardTypeEmoji
            """
        ))
    }

    func test_nsOptions() throws {
        let input = """
        /// The enum type of the webview user event
        typedef NS_OPTIONS(NSUInteger, SCAdTrackLoggingEventType) {
            /// Default no logging option
            SCAdTrackLoggingEventTypeNull = 0,
            /// Fire Prod Ad Track
            SCAdTrackLoggingEventTypeAdTrack = 1 << 0,
            /// Fire webview user event blizzard
            /// Currently, the firing events inlcude webview dismiss (including background case) and any browser feature usage
            /// event.
            SCAdTrackLoggingEventTypeWebviewUserEvent = 1 << 1,
        };
        """


        let grammar = Grammar(start: "typedef_ns_option") {
            basicProductions()
            typeProductions()
        }
        let parser = EarleyParser(grammar: grammar)

        let syntax2 = try XCTUnwrap(try parser.syntaxTree(
            for: input
        ))
    }

    func test_typedef() throws {

    }
}

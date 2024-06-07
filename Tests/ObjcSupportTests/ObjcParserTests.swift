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

        syntax2.iterate { indexPath, currentItem, shouldEnterSubtree in
            let spaces = (0..<indexPath.count).map { _ in "  " }.reduce("", +)
            print(spaces, currentItem.root ?? "\"\(input2[currentItem.leaf!])\"")
        } nodeIterarionComplete: { indexPath, key, continueIterating in
        }
    }
}

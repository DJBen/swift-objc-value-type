import XCTest
import TestingSupport
import ObjcSyntax
import Antlr4
@testable import ObjcTranslator
import CustomDump

final class ObjcPreprocessorTests: XCTestCase {
    typealias IfDefState = ObjcPreprocessor.IfDefState
    
    func testExpandMacro() throws {
        let expandedMacro = ObjcPreprocessor.expandMacro(
            MacroDefinition(
                name: "GUARD_ELSE_RETURN_VALUE",
                params: ["condition", "value"],
                body: """
                if (condition) {\
                } else {\
                    return value;\
                }
                """
            )
            ,
            in: """
            #define GUARD_ELSE_RETURN(condition) GUARD_ELSE_RETURN_VALUE(condition, )
            """
        )
        
        XCTAssertNoDifference(
            expandedMacro,
            """
            #define GUARD_ELSE_RETURN(condition) if (condition) {\
            } else {\
                return ;\
            }
            """
        )
    }
    
    func testExpandMacro_varArgs() throws {
        let expandedMacro = ObjcPreprocessor.expandMacro(
            MacroDefinition(
                name: "metamacro_at2",
                params: ["_0", "_1", "..."],
                body: """
                metamacro_head(__VA_ARGS__)
                """
            )
            ,
            in: """
            function_call(metamacro_at2(1, 2, 3, 4))
            """
        )
        
        XCTAssertNoDifference(
            expandedMacro,
            """
            function_call(metamacro_head(3,4))
            """
        )
    }
    
    func testIfDefState() {
        var state = IfDefState()
        state.ifDef("foo")
        XCTAssertTrue(state.isInContext(["foo", "bar"]))
        state.elseBranch()
        XCTAssertFalse(state.isInContext(["foo", "bar"]))
        state.endIf()
        XCTAssertTrue(state.isInContext(["foo", "bar"]))
        
        state.ifDef("_cplusplus")
        state.ifDef("nested2")
        XCTAssertFalse(state.isInContext(["_cplusplus"]))
        XCTAssertTrue(state.isInContext(["_cplusplus", "nested2"]))
        state.elseBranch()
        XCTAssertTrue(state.isInContext(["_cplusplus"]))
        XCTAssertFalse(state.isInContext(["_cplusplus", "nested2"]))
        XCTAssertFalse(state.isInContext([]))
        state.endIf()
        XCTAssertTrue(state.isInContext(["_cplusplus"]))
        state.elseBranch()
        XCTAssertTrue(state.isInContext([]))
        XCTAssertFalse(state.isInContext(["_cplusplus"]))
        XCTAssertFalse(state.isInContext(["_cplusplus", "nested2"]))
        state.endIf()
        XCTAssertTrue(state.isInContext([]))
    }
}

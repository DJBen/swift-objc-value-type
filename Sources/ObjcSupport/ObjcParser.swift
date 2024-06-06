import Foundation
import Covfefe

public final class ObjcParser {
    public let parser: EarleyParser

    public init() throws {
        let grammar = Grammar(start: "var_type") {
            typeProductions()
        }
        parser = EarleyParser(grammar: grammar)
    }
}

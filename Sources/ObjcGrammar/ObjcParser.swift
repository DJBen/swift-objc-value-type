import Foundation
import Covfefe

public final class ObjcParser {
    public let parser: EarleyParser

    public init(
        startingNonTerminal: String = "code_block_list"
    ) throws {
        let grammar = Grammar(start: NonTerminal(stringLiteral: startingNonTerminal)) {
            basicProductions()
            typeProductions()
            declProductions()
            codeBlockProductions()
        }
        parser = EarleyParser(grammar: grammar)
    }
}

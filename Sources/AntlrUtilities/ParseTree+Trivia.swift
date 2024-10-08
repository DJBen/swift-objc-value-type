import Antlr4
import OrderedCollections

extension ParseTree {
    // Algorithm adopted from http://meri-stuff.blogspot.com/2012/09/tackling-comments-in-antlr-compiler.html
    public func assignTrivia(
        tokens: inout [Token],
        beforeTriviaMap: inout [Interval: [Token]],
        afterTriviaMap: inout [Interval: [Token]]
    ) {
        if let rule = self as? RuleNode, rule.getChildCount() > 0 {
            let startTokenIndex = self.getSourceInterval().a
            let leadingTokens = taking(tokens: &tokens, until: startTokenIndex)
            for token in leadingTokens {
                appendToBeforeTrivia(
                    target: self.getSourceInterval(),
                    token: token,
                    beforeTriviaMap: &beforeTriviaMap
                )
            }
            
            var prevNonTerminalChild: ParseTree?
            for i in 0..<rule.getChildCount() {
                let child = rule[i]
                
                child.assignTrivia(
                    tokens: &tokens,
                    beforeTriviaMap: &beforeTriviaMap,
                    afterTriviaMap: &afterTriviaMap
                )
                
                if child is RuleNode {
                    prevNonTerminalChild = child
                }
            }
            
            let endTokenIndex = self.getSourceInterval().b
            let trailingTokens = taking(tokens: &tokens, until: endTokenIndex)
            for token in trailingTokens {
                if let prevNonTerminalChild {
                    appendToAfterTrivia(
                        target: prevNonTerminalChild.getSourceInterval(),
                        token: token,
                        afterTriviaMap: &afterTriviaMap
                    )
                } else {
                    // Orphan
                }
            }
        }
    }

    public func appendToBeforeTrivia(
        target: Interval,
        token: Token,
        beforeTriviaMap: inout [Interval: [Token]]
    ) {
        if beforeTriviaMap[target] == nil {
            beforeTriviaMap[target] = []
        }
        
        beforeTriviaMap[target]!.append(token)
    }
    
    public func appendToAfterTrivia(
        target: Interval,
        token: Token,
        afterTriviaMap: inout [Interval: [Token]]
    ) {
        if afterTriviaMap[target] == nil {
            afterTriviaMap[target] = []
        }
        
        afterTriviaMap[target]!.append(token)
    }
    
    public func taking(tokens: inout [Token], until endTokenIndex: Int) -> [Token] {
        if let endIndex = tokens.firstIndex(where: { $0.getTokenIndex() > endTokenIndex }) {
            let result = Array(tokens[..<endIndex])
            tokens = Array(tokens[endIndex...])
            return result
        } else {
            let result = tokens
            tokens = []
            return result
        }
    }
}

import Foundation
import Antlr4

public class CollectorTokenSource<UpstreamTokenSource: TokenSource>: TokenSource {
    private let source: UpstreamTokenSource

    public private(set) var commentTokens: [Token] = []
    
    public private(set) var directiveTokens: [Token] = []

    // Ignored tokens include NS_ASSUME_NONNULL that is important to determine
    // the nullability
    public private(set) var ignoredTokens: [Token] = []

    private var index = 0
    
    public init(
        source: UpstreamTokenSource
    ) {
        self.source = source
    }
    
    public func nextToken() throws -> Token {
        // Channels: ["DEFAULT_TOKEN_CHANNEL", "HIDDEN", "COMMENTS_CHANNEL", "DIRECTIVE_CHANNEL", "IGNORED_MACROS"]
        let token = try source.nextToken()
        index += 1
        if token.getChannel() == 3 {
            directiveTokens.append(token)
        } else if token.getChannel() == 2 {
            commentTokens.append(token)
        } else if token.getChannel() == 4 {
            ignoredTokens.append(token)
        }
        return token
    }
    
    public func getLine() -> Int {
        source.getLine()
    }
    
    public func getCharPositionInLine() -> Int {
        source.getCharPositionInLine()
    }
    
    public func getInputStream() -> CharStream? {
        source.getInputStream()
    }
    
    public func getSourceName() -> String {
        "COMMENT+DIRECTIVE+" + source.getSourceName()
    }
    
    public func setTokenFactory(_ factory: TokenFactory) {
        source.setTokenFactory(factory)
    }
    
    public func getTokenFactory() -> TokenFactory {
        source.getTokenFactory()
    }
}

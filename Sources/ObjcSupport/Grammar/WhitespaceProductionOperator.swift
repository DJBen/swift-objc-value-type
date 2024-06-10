import Covfefe

precedencegroup ProductionPrecedence {
    associativity: left
    lowerThan: AdditionPrecedence, AlternativePrecedence
}

// The production operator --> permitting whitespaces before and after
infix operator -%-%> : ProductionPrecedence

public let ws = try! re("\\s+")

/// Generates a production from a given non-terminal and produced sequence of symbols
///
/// - Parameters:
///   - lhs: Non-terminal pattern
///   - rhs: Produced string of symbols
/// - Returns: Production with the given pattern and generated result
///
/// - Note: The returned array contains exactly 1 item. The operator returns array in order to ensure compatibility
/// with the `GrammarBuilder`.
@GrammarBuilder
public func -%-%> (lhs: NonTerminal, rhs: ProductionString) -> [Production] {
    lhs --> rhs <|> n(lhs.name) <+> ws <|> ws <+> n(lhs.name)
}

/// Generates a set of productions from a given non-terminal and produced result
///
/// - Parameters:
///   - lhs: Non-terminal pattern
///   - rhs: Collection of possible produced strings of symbols
/// - Returns: Productions with the given pattern and generated results
@GrammarBuilder
public func -%-%> (lhs: NonTerminal, rhs: ProductionResult) -> [Production] {
    lhs --> rhs <|> n(lhs.name) <+> ws <|> ws <+> n(lhs.name)
}

/// Generates a production from the given non-terminal to the given symbol
///
/// - Parameters:
///   - lhs: Non-terminal pattern
///   - rhs: Produced symbol
/// - Returns: Production with the given pattern generating the given symbol
///
/// - Note: The returned array contains exactly 1 item. The operator returns array in order to ensure compatibility
/// with the `GrammarBuilder`.
@GrammarBuilder
public func -%-%> (lhs: NonTerminal, rhs: Symbol) -> [Production] {
    lhs --> rhs <|> n(lhs.name) <+> ws <|> ws <+> n(lhs.name)
}


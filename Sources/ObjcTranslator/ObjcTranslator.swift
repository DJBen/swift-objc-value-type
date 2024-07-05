import Foundation
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

typealias PP = ObjectiveCPreprocessorParser
typealias P = ObjectiveCParser
typealias L = ObjectiveCLexer

public class ObjcTranslator<UpstreamTokenSource: TokenSource> {
    public enum Access: ExpressibleByStringLiteral {
        public typealias StringLiteralType = String
        
        case `public`
        case `internal`
        
        public init(stringLiteral: String) {
            switch stringLiteral {
            case "public":
                self = .public
            case "internal", "":
                self = .internal
            default:
                fatalError("Invalid access level; available options are public or internal")
            }
        }
    }
    
    let collector: CollectorTokenSource<UpstreamTokenSource>
    let directives: [ObjectiveCPreprocessorParser.DirectiveContext]
    let translationUnit: ObjectiveCParser.TranslationUnitContext
    let existingPrefix: String
    let access: Access
    
    var beforeTriviaMap: [Interval: [Token]] = [:]
    var afterTriviaMap: [Interval: [Token]] = [:]
    
    private let nsAssumeNonnullRanges: [Interval]
    
    public init(
        collector: CollectorTokenSource<UpstreamTokenSource>,
        directives: [ObjectiveCPreprocessorParser.DirectiveContext],
        translationUnit: ObjectiveCParser.TranslationUnitContext,
        existingPrefix: String = "",
        access: Access = .public
    ) {
        self.collector = collector
        self.directives = directives
        self.translationUnit = translationUnit
        self.existingPrefix = existingPrefix
        self.access = access

        var nsAssumeNonnullRanges = [Interval]()
        var nsAssumeNonnullStart: Int = -1
        for ignoredToken in collector.ignoredTokens {
            if ignoredToken.getType() == L.NS_ASSUME_NONNULL_BEGIN && nsAssumeNonnullStart == -1 {
                nsAssumeNonnullStart = ignoredToken.getTokenIndex()
            } else if ignoredToken.getType() == L.NS_ASSUME_NONNULL_END && nsAssumeNonnullStart != -1 {
                nsAssumeNonnullRanges.append(Interval(nsAssumeNonnullStart, ignoredToken.getTokenIndex()))
                nsAssumeNonnullStart = -1
            }
        }
        self.nsAssumeNonnullRanges = nsAssumeNonnullRanges
        assignTrivia(
            tree: translationUnit,
            commentTokens: collector.commentTokens
        )
    }
    
    @CodeBlockItemListBuilder
    public func translate() throws -> CodeBlockItemListSyntax {
        for directive in directives {
            switch directive {
            case let ctx as PP.PreprocessorImportContext:
                if let importSubject = ctx.directiveText() {
                    ImportDeclSyntax(
                        path: ImportPathComponentListSyntax {
                            // Only import A from `#import <A/B.h>`
                            // and ignore `#import "C.h"`
                            if let match = importSubject.getText().firstMatch(of: /<([\w_]+)\/[\w_]+\.\w+>/) {
                                ImportPathComponentSyntax(
                                    name: .identifier(String(match.1))
                                )
                            }
                        }
                    )
                }
            default:
                // No-op
                CodeBlockItemListSyntax()
            }
        }
        
        for topLevelDecl in translationUnit.topLevelDeclaration() {
            try translate(
                topLevelDecl
            )
        }
    }
    
    @CodeBlockItemListBuilder
    func translate(
        _ topLevelDecl: ObjectiveCParser.TopLevelDeclarationContext
    ) throws -> CodeBlockItemListSyntax {
        if let importDecl = topLevelDecl.importDeclaration() {
            // importDeclaration
            //    : '@import' identifier ';'
            //    ;
            ImportDeclSyntax(
                path: ImportPathComponentListSyntax {
                    if let importSubject = importDecl.identifier()?.getText() {
                        ImportPathComponentSyntax(
                            name: .identifier(importSubject)
                        )
                    }
                }
            )
        } else if let _ = topLevelDecl.functionDeclaration() {
            // Top-level function declaration: ignore for now
        } else if let decl = topLevelDecl.declaration() {
            // declaration
            //    : functionCallExpression
            //    | enumDeclaration
            //    | varDeclaration
            //    | typedefDeclaration
            //    ;
            if let typedefDecl = decl.typedefDeclaration() {
               try translate(
                   typedefDecl: typedefDecl
               )
            } else if let _ = decl.functionCallExpression() {
                // Ignore for now
            } else if let enumDecl = decl.enumDeclaration() {
                // Includes enum and optionSet decls
                try translate(enumDecl: enumDecl)
            } else if let _ = decl.varDeclaration() {
                // Ingore for now
            }
        } else if let _ = topLevelDecl.classInterface() {
            // Ignore
        } else if let _ = topLevelDecl.classImplementation() {
            // Ignore
        } else if let _ = topLevelDecl.categoryInterface() {
            // Ignore
        } else if let _ = topLevelDecl.categoryImplementation() {
            // Ignore
        } else if let protocolDecl = topLevelDecl.protocolDeclaration() {
            try translate(
                protocolDecl: protocolDecl,
                existingPrefix: existingPrefix
            )
        } else if let _ = topLevelDecl.protocolDeclarationList() {
            // Forward protocol declaration, ignore
        } else if let _ = topLevelDecl.classDeclarationList() {
            // Forward class declaration, ignore
        } else if let _ = topLevelDecl.functionDefinition() {
            // Ignore for now
        }
    }
    
    private func appendToBeforeTrivia(
        target: Interval,
        token: Token
    ) {
        if beforeTriviaMap[target] == nil {
            beforeTriviaMap[target] = []
        }
        
        beforeTriviaMap[target]!.append(token)
    }
    
    private func appendToAfterTrivia(
        target: Interval,
        token: Token
    ) {
        if afterTriviaMap[target] == nil {
            afterTriviaMap[target] = []
        }
        
        afterTriviaMap[target]!.append(token)
    }
    
    private func assignTrivia<Tree: ParseTree>(
        tree: Tree,
        commentTokens: [Token]
    ) {
        var commentTokens = commentTokens
        assignTrivia(
            tree: tree,
            commentTokens: &commentTokens
        )
    }
    
    // Algorithm adapted from http://meri-stuff.blogspot.com/2012/09/tackling-comments-in-antlr-compiler.html
    private func assignTrivia<Tree: ParseTree>(
        tree: Tree,
        commentTokens: inout [Token]
    ) {
        if let rule = tree as? RuleNode, rule.getChildCount() > 0 {
            let startTokenIndex = tree.getSourceInterval().a
            let leadingTokens = taking(commentTokens: &commentTokens, until: startTokenIndex)
            for token in leadingTokens {
                appendToBeforeTrivia(target: tree.getSourceInterval(), token: token)
            }
            
            var prevNonTerminalChild: ParseTree?
            for i in 0..<rule.getChildCount() {
                let child = rule[i]
                
                assignTrivia(
                    tree: child,
                    commentTokens: &commentTokens
                )
                
                if child is RuleNode {
                    prevNonTerminalChild = child
                }
            }
            
            let endTokenIndex = tree.getSourceInterval().b
            let trailingTokens = taking(commentTokens: &commentTokens, until: endTokenIndex)
            for token in trailingTokens {
                if let prevNonTerminalChild {
                    appendToAfterTrivia(target: prevNonTerminalChild.getSourceInterval(), token: token)
                } else {
                    // Orphan
                }
            }
        }
    }
    
    private func taking(commentTokens: inout [Token], until endTokenIndex: Int) -> [Token] {
        if let endIndex = commentTokens.firstIndex(where: { $0.getTokenIndex() > endTokenIndex }) {
            let result = Array(commentTokens[..<endIndex])
            commentTokens = Array(commentTokens[endIndex...])
            return result
        } else {
            let result = commentTokens
            commentTokens = []
            return result
        }
    }
    
    func beforeTrivia(for tree: SyntaxTree) -> Trivia {
        if let tokens = beforeTriviaMap[tree.getSourceInterval()] {
            return tokens.compactMap { token in
                token.getText().map {
                    Trivia(pieces: [.lineComment($0), .newlines(1)])
                }
            }.reduce(Trivia(), +)
        } else {
            return Trivia()
        }
    }
    
    func afterTrivia(for tree: SyntaxTree) -> Trivia {
        if let tokens = afterTriviaMap[tree.getSourceInterval()] {
            return tokens.compactMap { token in
                token.getText().map {
                    Trivia(pieces: [.lineComment($0)])
                }
            }.reduce(Trivia(), +)
        } else {
            return Trivia()
        }
    }
    
    func isNSAssumeNonnull(_ tree: SyntaxTree) -> Bool {
        nsAssumeNonnullRanges.contains(where: { $0.properlyContains(tree.getSourceInterval()) })
    }
}

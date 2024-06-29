import Foundation
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

typealias PP = ObjectiveCPreprocessorParser
typealias P = ObjectiveCParser
typealias L = ObjectiveCLexer

public class ObjcTranslator {
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
    
    let directives: [ObjectiveCPreprocessorParser.DirectiveContext]
    let translationUnit: ObjectiveCParser.TranslationUnitContext
    let existingPrefix: String
    let access: Access
    
    var beforeTriviaMap: [Interval: [Token]] = [:]
    var afterTriviaMap: [Interval: [Token]] = [:]
    
    let nsAssumeNonnullRanges: [Interval]
    
    public init(
        directives: [ObjectiveCPreprocessorParser.DirectiveContext],
        translationUnit: ObjectiveCParser.TranslationUnitContext,
        commentTokens: [Token],
        ignoredTokens: [Token],
        existingPrefix: String = "",
        access: Access = .public
    ) {
        self.directives = directives
        self.translationUnit = translationUnit
        self.existingPrefix = existingPrefix
        self.access = access

        var nsAssumeNonnullRanges = [Interval]()
        var nsAssumeNonnullStart: Int = -1
        for ignoredToken in ignoredTokens {
            if ignoredToken.getType() == L.NS_ASSUME_NONNULL_BEGIN && nsAssumeNonnullStart == -1 {
                nsAssumeNonnullStart = ignoredToken.getTokenIndex()
            } else if ignoredToken.getType() == L.NS_ASSUME_NONNULL_END && nsAssumeNonnullStart != -1 {
                nsAssumeNonnullRanges.append(Interval(nsAssumeNonnullStart, ignoredToken.getTokenIndex()))
                nsAssumeNonnullStart = -1
            }
        }
        self.nsAssumeNonnullRanges = nsAssumeNonnullRanges
        assignTrivia(tree: translationUnit, commentTokens: commentTokens)
    }
    
    private func appendToBeforeTrivia(
        sourceInterval: Interval,
        token: Token
    ) {
        if beforeTriviaMap[sourceInterval] == nil {
            beforeTriviaMap[sourceInterval] = []
        }
        
        beforeTriviaMap[sourceInterval]!.append(token)
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
            .with(\.leadingTrivia, beforeTrivia(for: topLevelDecl))
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
            if let _ = decl.functionCallExpression() {
                // Ignore for now
            } else if let enumDecl = decl.enumDeclaration() {
                try translate(enumDecl: enumDecl)
            } else if let varDecl = decl.varDeclaration() {
                
            } else if let typedefDecl = decl.typedefDeclaration() {
                
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

        } else if let protocolDeclList = topLevelDecl.protocolDeclarationList() {

        } else if let _ = topLevelDecl.classDeclarationList() {
            // Ignore
        } else if let _ = topLevelDecl.functionDefinition() {
            // Ignore for now
        }
    }
    
    private func appendToAfterTrivia(
        sourceInterval: Interval,
        token: Token
    ) {
        if afterTriviaMap[sourceInterval] == nil {
            afterTriviaMap[sourceInterval] = []
        }
        
        afterTriviaMap[sourceInterval]!.append(token)
    }
    
    private func assignTrivia<Tree: ParseTree>(
        tree: Tree,
        commentTokens: [Token]
    ) {
        var index = 0
        assignTrivia(
            tree: tree,
            commentTokens: commentTokens,
            parentTreeInterval: tree.getSourceInterval(),
            nextSiblingInterval: nil,
            commentTokenIndex: &index
        )
    }
    
    private func assignTrivia<Tree: ParseTree>(
        tree: Tree,
        commentTokens: [Token],
        parentTreeInterval: Interval,
        nextSiblingInterval: Interval?,
        commentTokenIndex: inout Int
    ) {
        guard commentTokenIndex < commentTokens.count else {
            return
        }
        
        while commentTokenIndex < commentTokens.count {
            let token = commentTokens[commentTokenIndex]
            let commentTokenInterval = Interval(token.getTokenIndex(), token.getTokenIndex())
            
            if commentTokenInterval.startsBeforeDisjoint(tree.getSourceInterval()) {
                appendToBeforeTrivia(sourceInterval: tree.getSourceInterval(), token: token)
                commentTokenIndex += 1
            } else {
                break
            }
        }
        
        if let rule = tree as? RuleNode {
            for i in 0..<rule.getChildCount() {
                let childRule = rule[i]
                
                assignTrivia(
                    tree: childRule,
                    commentTokens: commentTokens,
                    parentTreeInterval: tree.getSourceInterval(),
                    nextSiblingInterval: i + 1 < rule.getChildCount() ? rule[i + 1].getSourceInterval() : nil,
                    commentTokenIndex: &commentTokenIndex
                )
            }
        }
        
        while commentTokenIndex < commentTokens.count {
            let token = commentTokens[commentTokenIndex]
            let commentTokenInterval = Interval(token.getTokenIndex(), token.getTokenIndex())
            
            if parentTreeInterval.properlyContains(commentTokenInterval) && nextSiblingInterval == nil {
                appendToAfterTrivia(sourceInterval: tree.getSourceInterval(), token: token)
                commentTokenIndex += 1
            } else {
                break
            }
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
                    Trivia(pieces: [.lineComment($0), .newlines(1)])
                }
            }.reduce(Trivia(), +)
        } else {
            return Trivia()
        }
    }
}

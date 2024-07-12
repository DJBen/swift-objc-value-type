import Foundation
import ObjcSyntax
import Antlr4
import OrderedCollections
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
    
    let preprocessorSource: CharStream
    let collector: CollectorTokenSource<UpstreamTokenSource>
    let directives: [ObjectiveCPreprocessorParser.DirectiveContext]
    let translationUnit: ObjectiveCParser.TranslationUnitContext
    let existingPrefix: String
    let access: Access
    
    var beforeTriviaMap: [Interval: [Token]] = [:]
    var afterTriviaMap: [Interval: [Token]] = [:]
    
    private let nsAssumeNonnullRanges: [Interval]
    
    public init(
        preprocessorSource: CharStream,
        collector: CollectorTokenSource<UpstreamTokenSource>,
        directives: [ObjectiveCPreprocessorParser.DirectiveContext],
        translationUnit: ObjectiveCParser.TranslationUnitContext,
        existingPrefix: String = "",
        access: Access = .public
    ) {
        self.preprocessorSource = preprocessorSource
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
            directives: directives,
            tree: translationUnit,
            commentTokens: collector.commentTokens
        )
    }
    
    struct DedupedImportDirective: Hashable {
        let importString: String
        let interval: Interval
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(importString)
        }
        
        static func == (lhs: DedupedImportDirective, rhs: DedupedImportDirective) -> Bool {
            return lhs.importString == rhs.importString
        }
    }
    
    @CodeBlockItemListBuilder
    public func translate() throws -> CodeBlockItemListSyntax {
        let importedLibraries: OrderedSet<DedupedImportDirective> = {
            var set = OrderedSet<DedupedImportDirective>()
            for directive in directives {
                switch directive {
                case let ctx as PP.PreprocessorImportContext:
                    if ctx.IMPORT() != nil, let importSubject = ctx.directive_text() {
                        
                        // Only import A from `#import <A/B.h>`
                        // and ignore `#import "C.h"`
                        if let match = importSubject.getText().firstMatch(of: /<([\w_]+)\/[\w_]+\.\w+>/) {
                            set.append(
                                DedupedImportDirective(
                                    importString: String(match.1),
                                    interval: directive.getSourceInterval()
                                )
                            )
                        }
                    }
                default:
                    break
                }
            }
            return set
        }()

        for importedLibrary in importedLibraries {
            ImportDeclSyntax(
                leadingTrivia: .newline + beforeTrivia(for: importedLibrary.interval),
                path: ImportPathComponentListSyntax {
                    ImportPathComponentSyntax(
                        name: .identifier(importedLibrary.importString)
                    )
                }
            )
        }
        
        for (index, topLevelDecl) in translationUnit.topLevelDeclaration().enumerated() {
            try translate(
                topLevelDecl,
                translationUnitTrivia: index == 0 ? beforeTrivia(for: translationUnit) : Trivia()
            )
        }
    }
    
    @CodeBlockItemListBuilder
    func translate(
        _ topLevelDecl: ObjectiveCParser.TopLevelDeclarationContext,
        translationUnitTrivia: Trivia
    ) throws -> CodeBlockItemListSyntax {
        if let importDecl = topLevelDecl.importDeclaration() {
            // importDeclaration
            //    : '@import' identifier ';'
            //    ;
            ImportDeclSyntax(
                leadingTrivia: translationUnitTrivia + beforeTrivia(for: importDecl),
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
                   typedefDecl: typedefDecl,
                   declLeadingTrivia: beforeTrivia(for: decl)
               )
            } else if let _ = decl.functionCallExpression() {
                // Ignore for now
            } else if let enumDecl = decl.enumDeclaration() {
                // Includes enum and optionSet decls
                try translate(
                    enumDecl: enumDecl,
                    declLeadingTrivia: beforeTrivia(for: decl)
                )
            } else if let varDecl = decl.varDeclaration() {
                try translate(
                    varDecl: varDecl,
                    translationUnitTrivia: translationUnitTrivia,
                    declLeadingTrivia: beforeTrivia(for: decl)
                )
            }
        } else if let classInterface = topLevelDecl.classInterface() {
            try translate(
                classInterfaceDecl: classInterface
            )
        } else if let _ = topLevelDecl.classImplementation() {
            // Ignore
        } else if let _ = topLevelDecl.categoryInterface() {
            // Ignore
        } else if let _ = topLevelDecl.categoryImplementation() {
            // Ignore
        } else if let protocolDecl = topLevelDecl.protocolDeclaration() {
            try translate(
                protocolDecl: protocolDecl
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
        directives: [PP.DirectiveContext],
        tree: Tree,
        commentTokens: [Token]
    ) {
        var commentTokens = commentTokens
        for directive in directives {
            switch directive {
            case let ctx as PP.PreprocessorImportContext:
                if ctx.IMPORT() != nil {
                    let commentsAssociatedWithImport = taking(tokens: &commentTokens, until: ctx.getSourceInterval().a)
                    for comment in commentsAssociatedWithImport {
                        appendToBeforeTrivia(target: ctx.getSourceInterval(), token: comment)
                    }
                }
            default:
                break
            }
        }
        
        assignTrivia(
            tree: tree,
            tokens: &commentTokens
        )
    }
    
    // Algorithm adapted from http://meri-stuff.blogspot.com/2012/09/tackling-comments-in-antlr-compiler.html
    private func assignTrivia<Tree: ParseTree>(
        tree: Tree,
        tokens: inout [Token]
    ) {
        if let rule = tree as? RuleNode, rule.getChildCount() > 0 {
            let startTokenIndex = tree.getSourceInterval().a
            let leadingTokens = taking(tokens: &tokens, until: startTokenIndex)
            for token in leadingTokens {
                appendToBeforeTrivia(
                    target: tree.getSourceInterval(),
                    token: token
                )
            }
            
            var prevNonTerminalChild: ParseTree?
            for i in 0..<rule.getChildCount() {
                let child = rule[i]
                
                assignTrivia(
                    tree: child,
                    tokens: &tokens
                )
                
                if child is RuleNode {
                    prevNonTerminalChild = child
                }
            }
            
            let endTokenIndex = tree.getSourceInterval().b
            let trailingTokens = taking(tokens: &tokens, until: endTokenIndex)
            for token in trailingTokens {
                if let prevNonTerminalChild {
                    appendToAfterTrivia(target: prevNonTerminalChild.getSourceInterval(), token: token)
                } else {
                    // Orphan
                }
            }
        }
    }
    
    private func taking(tokens: inout [Token], until endTokenIndex: Int) -> [Token] {
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
    
    func beforeTrivia(for interval: Interval) -> Trivia {
        if let tokens = beforeTriviaMap[interval] {
            return tokens.compactMap { token in
                convertingToSwiftDocs(token.getText()).map {
                    Trivia(pieces: [.lineComment($0), .newlines(1)])
                }
            }.reduce(Trivia(), +)
        } else {
            return Trivia()
        }
    }
    
    func beforeTrivia(for tree: SyntaxTree) -> Trivia {
        beforeTrivia(for: tree.getSourceInterval())
    }
    
    func afterTrivia(for tree: SyntaxTree) -> Trivia {
        if let tokens = afterTriviaMap[tree.getSourceInterval()] {
            return tokens.compactMap { token in
                convertingToSwiftDocs(token.getText()).map {
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
    
    private func convertingToSwiftDocs(_ comment: String?) -> String? {
        comment?.replacing(/@param\s+(\w+):?/) { match in
            return "- Parameter \(match.1):"
        }.replacing(/@return(?:s)?/) { match in
            return "- Returns"
        }.replacing(/@note/) { match in
            return "- Note"
        }
    }
}

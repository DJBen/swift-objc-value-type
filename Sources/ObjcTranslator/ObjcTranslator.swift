import Foundation
import ObjcSyntax
import Antlr4
import OrderedCollections
import AntlrUtilities
import SharedUtilities
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
    
    let preprocessorSource: CharStream
    let collector: CollectorTokenSource
    let directives: [ObjectiveCPreprocessorParser.DirectiveContext]
    let translationUnit: ObjectiveCParser.TranslationUnitContext
    let existingPrefix: String
    let typeRegexesExcludedFromPrefixStripping: [any RegexComponent]
    let access: Access
    
    var beforeTriviaMap: [Interval: [Token]] = [:]
    var afterTriviaMap: [Interval: [Token]] = [:]
    
    let typeMappings: TypeMappings
    private let nsAssumeNonnullRanges: [Interval]

    public init(
        preprocessorSource: CharStream,
        collector: CollectorTokenSource,
        directives: [ObjectiveCPreprocessorParser.DirectiveContext],
        translationUnit: ObjectiveCParser.TranslationUnitContext,
        existingPrefix: String = "",
        typeRegexesExcludedFromPrefixStripping: [any RegexComponent],
        access: Access = .public,
        otherTypeMappings: TypeMappings?
    ) {
        self.preprocessorSource = preprocessorSource
        self.collector = collector
        self.directives = directives
        self.translationUnit = translationUnit
        self.existingPrefix = existingPrefix
        self.typeRegexesExcludedFromPrefixStripping = typeRegexesExcludedFromPrefixStripping
        self.access = access
        
        self.typeMappings = {
            var mappings = TypeMappings(
                translationUnit,
                existingPrefix: existingPrefix,
                typeRegexesExcludedFromPrefixStripping: typeRegexesExcludedFromPrefixStripping
            )
            if let otherTypeMappings {
                mappings.merge(with: otherTypeMappings)
            }
            return mappings
        }()

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
                        if let match = importSubject.getText().firstMatch(of: /<([\w_]+)\/[\w_.]+\.\w+>/) {
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
                    let commentsAssociatedWithImport = tree.taking(tokens: &commentTokens, until: ctx.getSourceInterval().a)
                    for comment in commentsAssociatedWithImport {
                        tree.appendToBeforeTrivia(
                            target: ctx.getSourceInterval(),
                            token: comment,
                            beforeTriviaMap: &beforeTriviaMap
                        )
                    }
                }
            default:
                break
            }
        }
        
        tree.assignTrivia(
            tokens: &commentTokens,
            beforeTriviaMap: &beforeTriviaMap,
            afterTriviaMap: &afterTriviaMap
        )
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
    
    func mapSwiftType(
        _ swiftType: String,
        macro: P.MacroContext? = nil
    ) -> String {
        if let macro, macro.identifier().contains(where: { $0.NS_SWIFT_NAME() != nil }), let swiftName = macro.primaryExpression().first?.getText() {
            // If NS_SWIFT_NAME is declared
            return swiftName
        }
        if let mappedType = typeMappings.swiftTypeMappings[swiftType] {
            if typeMappings.swiftValueTypes.contains(mappedType) {
                return mappedType + "Objc"
            }
            return mappedType
        }
        return swiftType
    }
    
    func mappingObjcTypeToSwift(_ objcType: String) -> String {
        ObjcSwiftUtils.mappingObjcTypeToSwift(
            objcType,
            mapSwiftType: { mapSwiftType($0, macro: nil) }
        )
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

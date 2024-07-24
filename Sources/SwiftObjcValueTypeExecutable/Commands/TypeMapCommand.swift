import ArgumentParser
import Foundation
import ObjcSyntax
import ObjcTranslator
import SwiftParser
import SwiftSyntax
import SwiftSyntaxBuilder
import Antlr4
import SharedUtilities
import OrderedCollections
import CustomDump
import Remodel

enum TypeMapCommandError: Error {
    case stdinUnsupported
}

struct TypeMapCommand: ParsableCommand, FileHandlingCommand {
    static var configuration = CommandConfiguration(
        commandName: "type-map",
        abstract: """
        Preprocesses the source (.h, .m, .value, .adtValue) and generate a dict of type replacement in json.
        """,
        discussion: """
        The dictionary is in shape of
        {
            "swiftTypeMappings": {"PFFoo", "Foo", "PFValue": "Value"},
            "swiftValueTypes" : ["Value"],
            "typedefBlockNames" : ["Block1, Block2"]
        }
        The result can be supplied to migrate-objc and migrate-remodel to provide adequate type replacement instructions.
        """
    )
    
    @OptionGroup
    var fileArguments: FileHandlingArguments

    @OptionGroup
    var prefixStrippingArguments: PrefixStrippingArguments
    
    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "A list of file paths in which #define macros are defined; used for preprocessing sources."
    )
    var macroDefinitionPaths: [String] = []
    
    @Option(
        name: [.long],
        parsing: .upToNextOption,
        help: "A list of defined symbols to pass in preprocessor"
    )
    var preprocessorDefines: [String] = []
    
    func run() throws {
        let charStreams = try macroDefinitionPaths.map {
            try ANTLRFileStream($0)
        }
        
        let sourcePreprocessor = ObjcPreprocessor(
            macroSources: try charStreams.map {
                let preprocessorParser = try ObjectiveCPreprocessorParser(
                    CommonTokenStream(ObjectiveCPreprocessorLexer($0))
                )
                return try preprocessorParser.objectiveCDocument()
            },
            definedSymbols: preprocessorDefines
        )
        
        if fileArguments.sourcePaths.isEmpty && fileArguments.inputFileListPath == nil {
            // Do not support stdin
            throw TypeMapCommandError.stdinUnsupported
        } else {
            var objcHeaderIterator = SourceFileIterator(
                sourcePaths: Set(fileArguments.sourcePaths),
                inputFileListPath: fileArguments.inputFileListPath,
                filteringExtension: {
                    ["h"].contains($0.lowercased())
                }
            )
            
            var typeMappings = TypeMappings()
            
            while let sourceFile = objcHeaderIterator.next() {
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(sourceFile.path))")
                }
            
                typeMappings.merge(
                    with: try self.typeMappings(sourcePreprocessor: sourcePreprocessor) {
                        try ANTLRFileStream(sourceFile.path)
                    }
                )
            }
            
            var remodelValueObjectIterator = SourceFileIterator(
                sourcePaths: Set(fileArguments.sourcePaths),
                inputFileListPath: fileArguments.inputFileListPath,
                filteringExtension: {
                    ["value", "adtvalue"].contains($0.lowercased())
                }
            )
                      
            let remodelParser = RemodelValueObjectParser()

            while let sourceFile = remodelValueObjectIterator.next() {
                let remodelType: RemodelType
                let fileName = sourceFile.path
                if fileArguments.verbose {
                    print("swift-objc-value-type: reading from (\(fileName))")
                }
                if (fileName as NSString).pathExtension.lowercased() == "value" {
                    remodelType = .value
                } else if (fileName as NSString).pathExtension.lowercased() == "adtvalue" {
                    remodelType = .adtValue
                } else {
                    throw RemodelError.unableToInferRemodelType
                }
                
                guard let ast = try remodelParser.parse(
                    type: remodelType,
                    source: String(contentsOfFile: sourceFile.path, encoding: .utf8)
                ) else {
                    if fileArguments.verbose {
                        print("swift-objc-value-type: skip processing (\(sourceFile.path))")
                    }
                    return
                }
                
                let resultRemodelValueTypeName = ast.name.removingPrefix(
                    prefixStrippingArguments.existingPrefix,
                    typeRegexesExcludedFromPrefixStripping: []
                )
                
                typeMappings.swiftTypeMappings[ast.name] = resultRemodelValueTypeName
                typeMappings.swiftValueTypes.append(resultRemodelValueTypeName)
            }
            let jsonData = try JSONEncoder().encode(typeMappings)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    }
    
    private func typeMappings(
        sourcePreprocessor: ObjcPreprocessor,
        _ charStream: () throws -> CharStream
    ) throws -> TypeMappings {
        let preprocessedSourceText = try sourcePreprocessor.preprocess(try charStream())
                
        let parserSource = ANTLRInputStream(preprocessedSourceText)
        let collector = CollectorTokenSource(
            source: ObjectiveCLexer(parserSource)
        )

        let parser = try ObjectiveCParser(
            CommonTokenStream(
                collector
            )
        )
        
        let translationUnit = try parser.translationUnit()
        
        return TypeMappings(
            translationUnit,
            existingPrefix: prefixStrippingArguments.existingPrefix,
            typeRegexesExcludedFromPrefixStripping: try prefixStrippingArguments.typePatternsExcludedFromPrefixStripping.map(Regex.init)
        )
    }
}

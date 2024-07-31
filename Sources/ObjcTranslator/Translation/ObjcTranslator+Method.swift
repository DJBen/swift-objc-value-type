import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import OrderedCollections
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    @MemberBlockItemListBuilder
    func translate(
        instanceMethodDeclaration methodDecl: P.InstanceMethodDeclarationContext,
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            sectionBeforeTrivia: sectionBeforeTrivia,
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: false,
            isOptionalConformance: isOptionalConformance,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    func translate(
        classMethodDeclaration methodDecl: P.ClassMethodDeclarationContext,
        isOptionalConformance: Bool,
        sectionBeforeTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        try swiftMethodDecl(
            sectionBeforeTrivia: sectionBeforeTrivia,
            parentLeadingTrivia: beforeTrivia(for: methodDecl),
            methodDecl: methodDecl.methodDeclaration()!,
            isClassMethod: true,
            isOptionalConformance: isOptionalConformance,
            parentTrailingTrivia: afterTrivia(for: methodDecl)
        )
    }
    
    @MemberBlockItemListBuilder
    private func swiftMethodDecl(
        sectionBeforeTrivia: Trivia,
        parentLeadingTrivia: Trivia,
        methodDecl: P.MethodDeclarationContext,
        isClassMethod: Bool,
        isOptionalConformance: Bool,
        parentTrailingTrivia: Trivia
    ) throws -> MemberBlockItemListSyntax {
        let returnType = try methodDecl.methodType().map {
            try swiftType(
                typeName: $0.typeName()!,
                nullability: TypeNullability(
                    propertyNullability: nil,
                    isNSAssumeNonnull: isNSAssumeNonnull(methodDecl),
                    isGenericType: false
                )
                .with(typeName: $0.typeName()),
                context: .propertyOrMethodReturnType
            )
        }
        
        // methodSelector
        //    : selector
        //    | keywordDeclarator+ (',' '...')?
        //    ;

        let (functionName, firstArgFirstName, firstArgSecondName) = methodDecl.funcNameAndFirstParam
        
        let funcSignature = FunctionSignatureSyntax(
            parameterClause: FunctionParameterClauseSyntax(
                parameters: try FunctionParameterListSyntax {
                    for (funcParamIndex, keywordDecl) in methodDecl.methodSelector()!.keywordDeclarator().enumerated() {
                        let varName = keywordDecl.identifier()!.getText()
                        let firstName: TokenSyntax = {
                            if funcParamIndex == 0 {
                                return firstArgFirstName
                            } else if let selectorName = keywordDecl.selector()?.getText(), selectorName.lowercased() != varName.lowercased() {
                                return .identifier(selectorName)
                            } else {
                                return .identifier(varName)
                            }
                        }()
                        let secondName: TokenSyntax? = {
                            if funcParamIndex == 0 {
                                return firstArgSecondName
                            } else if let selectorName = keywordDecl.selector()?.getText(), selectorName.lowercased() != varName.lowercased() {
                                return .identifier(keywordDecl.identifier()!.getText())
                            } else {
                                return nil
                            }
                        }()
                        FunctionParameterSyntax(
                            firstName: firstName,
                            secondName: secondName,
                            type: try swiftType(
                                typeName: keywordDecl.methodType().first?.typeName(),
                                nullability: TypeNullability(
                                    propertyNullability: nil,
                                    isNSAssumeNonnull: isNSAssumeNonnull(methodDecl),
                                    isGenericType: false
                                )
                                .with(typeName: keywordDecl.methodType().first?.typeName()),
                                context: .methodArgument
                            )
                        )
                    }
                }
            ),
            returnClause: {
                // Omit for initializers
                if methodDecl.isInitializer {
                    return nil
                }
                // Omit for void return types
                if methodDecl.methodType()?.typeName()?.getText() == "void" {
                    return nil
                }
                return returnType.map {
                    ReturnClauseSyntax(type: $0)
                }
            }()
        )
        
        let coalescedTrivia = sectionBeforeTrivia == parentLeadingTrivia ? sectionBeforeTrivia : sectionBeforeTrivia + parentLeadingTrivia
        
        if !methodDecl.hasUnavailableAttribute {
            if methodDecl.isInitializer {
                InitializerDeclSyntax(
                    leadingTrivia: .newlines(2) + coalescedTrivia + beforeTrivia(for: methodDecl),
                    attributes: AttributeListSyntax {
                        methodDecl.availabilityAttributes
                        "@objc"
                    }
                    .with(\.trailingTrivia, .newline),
                    signature: funcSignature,
                    trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
                )
            } else {
                FunctionDeclSyntax(
                    leadingTrivia: .newlines(2) + coalescedTrivia + beforeTrivia(for: methodDecl),
                    attributes: AttributeListSyntax {
                        methodDecl.availabilityAttributes
                        "@objc"
                    }
                        .with(\.trailingTrivia, .newline),
                    modifiers: DeclModifierListSyntax {
                        if isClassMethod {
                            DeclModifierSyntax(name: .keyword(.class))
                        }
                        if isOptionalConformance {
                            DeclModifierSyntax(name: .keyword(.optional))
                        }
                    },
                    name: .identifier(functionName),
                    signature: funcSignature,
                    trailingTrivia: parentTrailingTrivia + afterTrivia(for: methodDecl)
                )
            }
        }
    }
}

extension P.MethodDeclarationContext {
    // https://clang.llvm.org/docs/AttributeReference.html#availability
    @AttributeListBuilder
    var availabilityAttributes: AttributeListSyntax {
        // macro
        //    : identifier (LP primaryExpression (',' primaryExpression)* RP)?
        //    | NS_SWIFT_NAME LP swiftSelectorExpression RP
        //    | API_AVAILABLE LP apiAvailableOsVersion (',' apiAvailableOsVersion)* RP
        //    | API_UNAVAILABLE LP identifier (',' identifier)* RP
        //    | NS_SWIFT_UNAVAILABLE LP stringLiteral RP
        //    ;
        
        for `macro` in self.macro() {
            if `macro`.API_AVAILABLE() != nil {
                for osVersion in `macro`.apiAvailableOsVersion() {
                    let osVersionString = "\(swiftOS(osVersion.identifier()!.getText())) \(osVersion.version()!.getText())"
                     AttributeSyntax(
                         "@available(\(raw: osVersionString), *)"
                     )
                     .with(\.trailingTrivia, .newline)
                }
            }
            if `macro`.API_UNAVAILABLE() != nil {
                for identifier in `macro`.identifier() {
                    AttributeSyntax(
                        "@available(\(raw: swiftOS(identifier.getText())), unavailable)"
                    )
                    .with(\.trailingTrivia, .newline)
                }
            }
            if `macro`.ATTRIBUTE() != nil {
                for clangAttr in `macro`.clangAttribute() {
                    // __attribute__((availability(macos,introduced=10.4,deprecated=10.6,obsoleted=10.7)))
                    if clangAttr.identifier()?.getText() == "availability" {
                        let os = swiftOS(clangAttr.clangAttributeArgument(0)!.getText())
                        let isUnavailble = clangAttr.clangAttributeArgument().contains(where: { $0.identifier()?.getText() == "unavailable" })
                        let message = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "message" }).map {
                            "message: \($0.stringLiteral()!.getText())"
                        }
                        if isUnavailble {
                            if let message {
                                AttributeSyntax(
                                    "@available(\(raw: os), unavailable, \(raw: message))"
                                )
                                .with(\.trailingTrivia, .newline)
                            } else {
                                AttributeSyntax(
                                    "@available(\(raw: os), unavailable)"
                                )
                                .with(\.trailingTrivia, .newline)
                            }
                        } else {
                            let introduced = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "introduced" }).map {
                                "introduced: \($0.version()!.getText())"
                            }
                            let deprecated = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "deprecated" }).map {
                                "deprecated: \($0.version()!.getText())"
                            }
                            let obsoleted = clangAttr.clangAttributeArgument().first(where: { $0.identifier()?.getText() == "obsoleted" }).map {
                                "obsoleted: \($0.version()!.getText())"
                            }
                            
                            let args = [introduced, deprecated, obsoleted, message].compactMap({ $0 }).joined(separator: ", ")
                                                    
                            AttributeSyntax(
                                "@available(\(raw: os), \(raw: args))"
                            )
                            .with(\.trailingTrivia, .newline)
                        }
                    }
                }
            }
        }
    }
    
    var hasUnavailableAttribute: Bool {
        for `macro` in self.macro() {
            if `macro`.identifier().contains(where: { $0.getText() == "NS_UNAVAILABLE" }) {
                return true
            }
            if `macro`.NS_SWIFT_UNAVAILABLE() != nil {
                return true
            }
            if `macro`.clangAttribute().contains(where: { clangAttr in
                clangAttr.identifier()!.getText() == "unavailable"
            }) {
                return true
            }
        }
        return false
    }

    var isInitializer: Bool {
        methodType()?.typeName()?.declarationSpecifiers()?.typeSpecifier()?.genericTypeSpecifier()?.getText() == "instancetype"
    }
    
    var funcNameAndFirstParam: (functionName: String, firstName: TokenSyntax, secondName: TokenSyntax?) {
        let swiftAliasedFunctionName: String? = {
            if let swiftAlias = self.macro().first(where: { $0.NS_SWIFT_NAME() != nil }), let swiftSelectorImpl = swiftAlias.swiftSelectorExpression() {
                // TODO: aliasing other parameter is currently not implemented
                return swiftSelectorImpl.identifier()?.getText()
            }
            return nil
        }()
        
        if let selector = self.methodSelector()!.selector() {
            // Method without args
            return (swiftAliasedFunctionName ?? selector.getText(), .wildcardToken(), nil)
        } else {
            // Method with at least one args
            let keywordDecls = self.methodSelector()!.keywordDeclarator()
            let rawFunctionName = keywordDecls.first!.selector()!.getText()
            let objcFirstArgName = keywordDecls.first!.identifier()!.getText()
            let firstArgIsBlock = keywordDecls.first!.methodType().first?.typeName()?.blockType() != nil

            let matches = rawFunctionName.matches(of: /(?!^)(With(?!No)|For|In|At|To)(?=[A-Z])/)
            guard let lastComponent = matches.last else {
                if rawFunctionName.lowercased().hasSuffix(objcFirstArgName.lowercased()) {
                    return (swiftAliasedFunctionName ?? rawFunctionName, .wildcardToken(), .identifier(objcFirstArgName))
                } else {
                    return (swiftAliasedFunctionName ?? rawFunctionName, .identifier(objcFirstArgName), nil)
                }
            }
            let remainder = String(rawFunctionName[lastComponent.1.endIndex...])
            
            /*
             + (BOOL)archiveEntryWithFileName:(NSString *)fileName;

             - (void)presentAttachedToNavigationController:(UINavigationController *)navigationController
                                        withTabBarTagIndex:(NSInteger)tagIndex;

             - (void)startImpression:(AdImpression *)impression
                   completionHandler:(nullable void (^)(NSError *_Nullable error))completion NS_SWIFT_NAME(startImpressionMeow(_:completionHandler:));

             - (void)valueForNancyForSam:(int)sam;

             - (void)valueForNancyWithSam:(int)sam;

             - (nullable NSNumber *)someTypeWithOptionalStr:(nullable NSString *)optionalStr optionalStr2:(NSString *_Nullable)str2;

             - (void)methodWithNoTypeSpecified:idArg;

             - (void)crapWithNoTypeSpecified:idArg;

             - (void)methodWithTypeSpecified:idArg;

             - (void)methodWithSpecified:idArg;

             - (void)methodWithType:idArg;

             - (void)valueWithSam:(int)sam;

             - (void)valueWithSamAltman:(int)samAltman;

             - (void)valueWithSamBlock:(int)samBlock;

             - (void)valueWithSam2Block:(void (^)())sam2Block;

             - (void)valueWithPreSam2Block:(void (^)())sam2Block;

             - (void)valueWithSam2Blah:(void (^)())sam2Block;

             - (instancetype)initWithSam:(int)sam;

             - (instancetype)initWithSamFoo:(int)sam;

             - (void)forBadReal:(NSString *)real;

             - (void)sForReal:(NSString *)real;

             - (void)performFoo:(CompletionBlock)foo;

             - (void)makeBlock:(int)block;

             - (void)performBlock:(CompletionBlock)block;

             - (void)noEscapeBlock:(NS_NOESCAPE CompletionBlock)block;

             - (void)saveSectionsInMutationBlock:(nonnull NSArray<NSString *> *_Nonnull (^)(
                                                       id _Nonnull dataAccessor))mutationBlock
                                   completionQueue:(nonnull dispatch_queue_t)completionQueue
                                        completion:(nonnull dispatch_block_t)completion;

             - (void)saveSectionsWithMutationBlock:(nonnull NSArray<NSString *> *_Nonnull (^)(
                                                       id _Nonnull dataAccessor))mutationBlock
                                   completionQueue:(nonnull dispatch_queue_t)completionQueue
                                        completion:(nonnull dispatch_block_t)completion;

             - (id)itemAtIndex:(NSInteger)index;
             - (id)itemForIndex:(NSInteger)index;
             - (id)itemInIndex:(NSInteger)index;
             - (id)itemWithIndex:(NSInteger)index;

             - (id)itemAtIndexPath:(NSIndexPath *)indexPath;
             - (id)itemForIndexPath:(NSIndexPath *)indexPath;
             - (id)itemInIndexPath:(NSIndexPath *)indexPath;
             - (id)itemWithIndexPath:(NSIndexPath *)indexPath;

             - (id)itemAtIndexFoo:(id)indexFoo;
             - (id)itemForIndexFoo:(id)indexFoo;
             - (id)itemInIndexFoo:(id)indexFoo;
             - (id)itemWithIndexFoo:(id)indexFoo;

             - (id)itemAtNum:(NSInteger)num;
             - (id)itemForNum:(NSInteger)num;
             - (id)itemInNum:(NSInteger)num;
             - (id)itemWithNum:(NSInteger)num;

             - (NSString *)titleForItemAtIndex:(NSInteger)index;
             
             ------
             
             static func archiveEntry(withFileName fileName: String) -> Bool

             
             func presentAttached(toNavigationController navigationController: Any!, withTabBarTagIndex tagIndex: Int)

             
             func startImpressionMeow(_ impression: Any!, completionHandler completion: ((Error?) -> Void)? = nil)

             func startImpressionMeow(_ impression: Any!) async throws

             
             func valueForNancy(forSam sam: Int32)

             
             func valueForNancy(withSam sam: Int32)

             
             func someType(withOptionalStr optionalStr: String?, optionalStr2 str2: String?) -> NSNumber?
             
             func methodWithNoTypeSpecified(_ idArg: Any!)
             
             func crapWithNoTypeSpecified(_ idArg: Any!)
             
             func method(withTypeSpecified idArg: Any!)
             
             func method(withSpecified idArg: Any!)
             
             func method(withType idArg: Any!)
             
             func value(withSam sam: Int32)
             
             func value(withSamAltman samAltman: Int32)
             
             func value(withSamBlock samBlock: Int32)
             
             func value(sam2Block: @escaping () -> Void)
             
             func value(preSam2Block sam2Block: @escaping () -> Void)
             
             func value(sam2Blah sam2Block: @escaping () -> Void)
             
             init(sam: Int32)
             
             init(samFoo sam: Int32)
             
             func forBadReal(_ real: String)

             func s(forReal real: String)
             
             func performFoo(_ foo: @escaping CompletionBlock)

             func makeBlock(_ block: Int32)

             func perform(_ block: @escaping CompletionBlock)

             func noEscape(_ block: (String) -> Void)

             func saveSections(inMutationBlock mutationBlock: @escaping (Any) -> [String], completionQueue: dispatch_queue_t, completion: @escaping () -> Void)

             func saveSections(inMutationBlock mutationBlock: @escaping (Any) -> [String], completionQueue: dispatch_queue_t) async

             
             func saveSections(mutationBlock: @escaping (Any) -> [String], completionQueue: dispatch_queue_t, completion: @escaping () -> Void)

             func saveSections(mutationBlock: @escaping (Any) -> [String], completionQueue: dispatch_queue_t) async

             func item(at index: Int) -> Any

             func item(for index: Int) -> Any

             func item(in index: Int) -> Any

             func item(with index: Int) -> Any

             @available(macOS 10.10, *)
             func item(at indexPath: IndexPath) -> Any

             @available(macOS 10.10, *)
             func item(for indexPath: IndexPath) -> Any

             @available(macOS 10.10, *)
             func item(in indexPath: IndexPath) -> Any

             @available(macOS 10.10, *)
             func item(with indexPath: IndexPath) -> Any
             
             func item(atIndexFoo indexFoo: Any) -> Any

             func item(forIndexFoo indexFoo: Any) -> Any

             func item(inIndexFoo indexFoo: Any) -> Any

             func item(withIndexFoo indexFoo: Any) -> Any

             
             func item(atNum num: Int) -> Any

             func item(forNum num: Int) -> Any

             func item(inNum num: Int) -> Any

             func item(withNum num: Int) -> Any

             func titleForItem(at index: Int) -> String
             
            */
            
            let separatorWithRemainder = String(lastComponent.1).lowercasingFirst + remainder.uppercasingFirst

            let firstArgName: TokenSyntax = {
                if objcFirstArgName == "index" || objcFirstArgName == "indexPath" {
                    return .identifier(String(lastComponent.1).lowercasingFirst)
                } else if (rawFunctionName.starts(with: "init") && String(lastComponent.1).lowercased() == "with") || firstArgIsBlock {
                    return .identifier(remainder.lowercasingFirst)
                } else {
                    return .identifier(separatorWithRemainder)
                }
            }()
            
            let functionNamePrecedingSeparator = String(rawFunctionName[rawFunctionName.startIndex..<lastComponent.1.startIndex])
            
            if functionNamePrecedingSeparator.starts(with: "init") || String(lastComponent.1).lowercased() == "with" {
                if firstArgName.text.lowercased() == objcFirstArgName.lowercased() {
                    return (swiftAliasedFunctionName ?? functionNamePrecedingSeparator, firstArgName, nil)
                } else {
                    return (swiftAliasedFunctionName ?? functionNamePrecedingSeparator, firstArgName, .identifier(objcFirstArgName))
                }
            } else {
                if firstArgName.text.lowercased() == objcFirstArgName.lowercased() {
                    return (swiftAliasedFunctionName ?? functionNamePrecedingSeparator, .wildcardToken(), .identifier(objcFirstArgName))
                } else {
                    return (swiftAliasedFunctionName ?? functionNamePrecedingSeparator, firstArgName, .identifier(objcFirstArgName))
                }
            }
        }
    }
}

private func swiftOS(_ os: String) -> String {
    if os.lowercased() == "ios" {
        return "iOS"
    } else if os.lowercased() == "macos" {
        return "macOS"
    } else if os.lowercased() == "tvos" {
        return "tvOS"
    } else if os.lowercased() == "watchos" {
        return "watchOS"
    } else if os.lowercased() == "visionos" {
        return "visionOS"
    } else if os.lowercased() == "driverkit" {
        return "driverKit"
    }
    return os
}

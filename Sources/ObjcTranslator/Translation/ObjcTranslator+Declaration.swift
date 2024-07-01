import Foundation
import SharedUtilities
import ObjcGrammar
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    func swiftIdentifier(
        fieldDeclarator: P.FieldDeclaratorContext
    ) throws -> TokenSyntax {
        // fieldDeclarator
        //    : declarator
        //    | declarator? ':' constant
        //    ;

        // declarator
        //    : pointer? directDeclarator
        //    ;
        
        // directDeclarator
        //    : (identifier | LP declarator RP) declaratorSuffix*
        //    | LP '^' nullabilitySpecifier? identifier? RP blockParameters
        //    ;
        
        guard let declarator = fieldDeclarator.declarator() else {
            throw ObjcTranslatorError.unsupported(
                "declarator? ':' constant",
                parseTreeType: String(describing: type(of: fieldDeclarator))
            )
        }
        
        return .identifier(declarator.directDeclarator()!.getText())
    }
}

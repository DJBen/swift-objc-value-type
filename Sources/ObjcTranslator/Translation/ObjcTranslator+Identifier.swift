import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    func swiftIdentifier(
        declarator: P.DeclaratorContext
    ) -> TokenSyntax {
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
        
        return .identifier(
            declarator.identifier()!.getText()
        )
    }
}

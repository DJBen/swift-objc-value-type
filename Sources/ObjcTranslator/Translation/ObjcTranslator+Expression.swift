import Foundation
import SharedUtilities
import ObjcSyntax
import Antlr4
import SwiftSyntax
import SwiftSyntaxBuilder

extension ObjcTranslator {
    func swiftExpr(
        _ expr: P.ExpressionContext
    ) -> ExprSyntaxProtocol {
        if let castExpr = expr.castExpression() {
            if let unaryExpr = castExpr.unaryExpression() {
                if let postfixExpr = unaryExpr.postfixExpression() {
                    if let primaryExpr = postfixExpr.primaryExpression() {
                        if let stringLiteral = primaryExpr.stringLiteral() {
                            return ExprSyntax(
                                stringLiteral: swiftStringLiteral(stringLiteral)
                            )
                        }
                    }
                }
            }
        }
        
        return ExprSyntax(stringLiteral: expr.getText())
    }
    
    func swiftStringLiteral(
        _ objcStringLiteral: P.StringLiteralContext
    ) -> String {
        return String(objcStringLiteral.getText().dropFirst())
    }
}

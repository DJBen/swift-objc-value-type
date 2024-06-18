import SwiftSyntax

extension AttributeSyntax {
    public var objcValueWrapperNSCopying: Bool? {
        return self.boolValueIfNameEquals("nsCopying")
    }
    
    public var objcValueWrapperNSCoding: Bool? {
        return self.boolValueIfNameEquals("nsCoding")
    }
    
    public var objcValueWrapperObjcBuilder: Bool? {
        return self.boolValueIfNameEquals("objcBuilder")
    }
    
    private func boolValueIfNameEquals(_ expectedName: String?) -> Bool? {
        guard
            let arguments = self.arguments,
            let labeledExpressionList = arguments.as(LabeledExprListSyntax.self),
            let labeledExpression = labeledExpressionList.first(where: { $0.label?.text == expectedName }) else
        {
            return nil
        }
        
        guard let boolExpr = labeledExpression.expression.as(BooleanLiteralExprSyntax.self) else {
            return nil
        }
        switch boolExpr.literal.tokenKind {
        case .keyword(let kw):
            switch kw {
            case .`true`:
                return true
            case .`false`:
                return false
            default:
                return nil
            }
        default:
            return nil
        }
    }
}

extension AttributeListSyntax {
    public var objcValueWrapperMacro: AttributeSyntax? {
        for element in self {
            if let objcValueWrapperMacro = element.objcValueWrapperMacro {
                return objcValueWrapperMacro
            }
        }
        
        return nil
    }
}

extension AttributeListSyntax.Element {
    public var objcValueWrapperMacro: AttributeSyntax? {
        self.attributeIfNameEquals("ObjcValueWrapper")
    }

    private func attributeIfNameEquals(_ expectedName: String) -> AttributeSyntax? {
        if
            case let .attribute(attribute) = self,
            let identifier = IdentifierTypeSyntax(attribute.attributeName),
            identifier.name.text == expectedName
        {
            return attribute
        }

        return nil
    }
}


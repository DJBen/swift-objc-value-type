import Foundation
import ObjcSyntax
import Antlr4

public struct TypeMappings: Codable {
    public var swiftValueTypes: [String]
    public var swiftTypeMappings: [String: String]
    
    // Keep track of a list of block names defined by typedef,
    // and escape them if `NS_NOESCAPE` is not provided.
    public var typedefBlockNames: Set<String>
    
    public init(
        swiftValueTypes: [String] = [],
        swiftTypeMappings: [String: String] = [:],
        typedefBlockNames: Set<String> = []
    ) {
        self.swiftValueTypes = swiftValueTypes
        self.swiftTypeMappings = swiftTypeMappings
        self.typedefBlockNames = typedefBlockNames
    }
    
    public mutating func merge(with otherTypeMappings: TypeMappings) {
        swiftValueTypes = swiftValueTypes + otherTypeMappings.swiftValueTypes
        swiftTypeMappings = swiftTypeMappings.merging(
            otherTypeMappings.swiftTypeMappings, 
            uniquingKeysWith: { $1 }
        )
        typedefBlockNames = typedefBlockNames.union(otherTypeMappings.typedefBlockNames)
    }
}

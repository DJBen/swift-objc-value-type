import Foundation
import ObjcSyntax
import Antlr4

public struct TypeMappings: Codable {
    public var swiftValueTypes: [String]
    public var swiftTypeMappings: [String: String]
    
    public init(swiftValueTypes: [String] = [], swiftTypeMappings: [String: String] = [:]) {
        self.swiftValueTypes = swiftValueTypes
        self.swiftTypeMappings = swiftTypeMappings
    }
    
    public mutating func merge(with otherTypeMappings: TypeMappings) {
        swiftValueTypes = swiftValueTypes +  otherTypeMappings.swiftValueTypes
        swiftTypeMappings = swiftTypeMappings.merging(
            otherTypeMappings.swiftTypeMappings, 
            uniquingKeysWith: { $1 }
        )
    }
}

import Foundation
import ObjcSyntax
import OrderedCollections
import Antlr4

public struct TypeMigrations {
    public var objcTypeMigrations: OrderedDictionary<String, String>
    public var swiftTypeMigrations: OrderedDictionary<String, String>
    
    public init(objcTypeMigrations: OrderedDictionary<String, String> = [:], swiftTypeMigrations: OrderedDictionary<String, String> = [:]) {
        self.objcTypeMigrations = objcTypeMigrations
        self.swiftTypeMigrations = swiftTypeMigrations
    }
    
    public mutating func merge(with otherTypeMigrations: TypeMigrations) {
        objcTypeMigrations = objcTypeMigrations.merging(
            otherTypeMigrations.objcTypeMigrations,
            uniquingKeysWith: { $1 }
        )
        swiftTypeMigrations = swiftTypeMigrations.merging(
            otherTypeMigrations.swiftTypeMigrations, 
            uniquingKeysWith: { $1 }
        )
    }
}

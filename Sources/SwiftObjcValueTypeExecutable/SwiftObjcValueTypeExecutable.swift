import ArgumentParser
import Foundation
import SwiftDiagnostics
import SwiftOperators
import SwiftParser
import SwiftParserDiagnostics
import SwiftSyntax

#if os(Windows)
import WinSDK
#endif

@main
class SwiftObjcValueTypeExecutable: ParsableCommand {
    required init() {}
    
    static var configuration = CommandConfiguration(
        commandName: "swift-objc-value-type",
        abstract: "Generate objc compatible value types for Swift structs and enums",
        subcommands: [
            GenerateValueTypeCommand.self,
            ParseRemodelCommand.self,
            MigrateRemodelCommand.self,
            MigrateObjcCommand.self
        ]
    )
}

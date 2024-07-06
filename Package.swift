// swift-tools-version:5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "SwiftObjcValueType",
  platforms: [
    .macOS(.v13),
    .iOS(.v16),
  ],
  products: [
    .executable(name: "swift-objc-value-type", targets: ["SwiftObjcValueTypeExecutable"]),
    .library(name: "SwiftObjcValueTypeMacroInterface", targets: ["SwiftObjcValueTypeMacroInterface"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.1"),
    .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.1"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "1.3.0"),
    .package(url: "https://github.com/apple/swift-collections.git", .upToNextMinor(from: "1.1.0")),
    .package(url: "https://github.com/antlr/antlr4", from: "4.13.1"),
  ],
  targets: [
    .macro(
        name: "SwiftObjcValueTypeMacro",
        dependencies: [
            "SwiftObjcValueType",
            .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
        ]
    ),

    .target(
      name: "SwiftObjcValueTypeMacroInterface",
      dependencies: [
        "SwiftObjcValueTypeMacro",
      ]
    ),

    .target(
      name: "SharedUtilities",
      dependencies: [
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
      ]
    ),

    .target(
      name: "SwiftObjcValueType",
      dependencies: [
        "SharedUtilities",
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
        .product(name: "OrderedCollections", package: "swift-collections"),
      ]
    ),

    .target(
      name: "ObjcTranslator",
      dependencies: [
        "SharedUtilities",
        "ObjcSyntax",
        .product(name: "Antlr4", package: "antlr4"),
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
        .product(name: "OrderedCollections", package: "swift-collections"),
      ]
    ),

    .target(
      name: "ObjcSyntax",
      dependencies: [
        .product(name: "Antlr4", package: "antlr4"),
      ]
    ),

    .target(
      name: "Remodel",
      dependencies: [
        "SharedUtilities",
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
      ]
    ),

    .target(
      name: "TestingSupport",
      dependencies: [
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
      ]
    ),

    .testTarget(
        name: "SwiftObjcValueTypeTests",
        dependencies: [
            "SwiftObjcValueType",
            "TestingSupport"
        ]
    ),

    .testTarget(
        name: "SwiftObjcValueTypeMacroTests",
        dependencies: [
            "SwiftObjcValueType",
            "SwiftObjcValueTypeMacro",
            .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
        ]
    ),

    .testTarget(
        name: "RemodelTests",
        dependencies: [
            "Remodel",
            "TestingSupport",
            .product(name: "CustomDump", package: "swift-custom-dump")
        ]
    ),

    .testTarget(
        name: "ObjcTranslatorTests",
        dependencies: [
            "SharedUtilities",
            "ObjcTranslator",
            "TestingSupport",
            .product(name: "CustomDump", package: "swift-custom-dump")
        ]
    ),

    .executableTarget(
      name: "SwiftObjcValueTypeExecutable",
      dependencies: [
        "SwiftObjcValueType",
        "Remodel",
        "ObjcTranslator",
        .product(name: "CustomDump", package: "swift-custom-dump"),
        .product(name: "SwiftDiagnostics", package: "swift-syntax"),
        .product(name: "SwiftOperators", package: "swift-syntax"),
        .product(name: "SwiftParser", package: "swift-syntax"),
        .product(name: "SwiftParserDiagnostics", package: "swift-syntax"),
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
  ]
)

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("StrictConcurrency"),
    .unsafeFlags(["-enable-actor-data-race-checks"],
        .when(configuration: .debug)),
]

for target in package.targets {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(contentsOf: swiftSettings)
}

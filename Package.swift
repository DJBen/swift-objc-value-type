// swift-tools-version:5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
  name: "SwiftObjcValueType",
  platforms: [
    .macOS(.v13),
    .iOS(.v13),
  ],
  products: [
    .executable(name: "swift-objc-value-type", targets: ["SwiftObjcValueTypeExecutable"]),
    .library(name: "SwiftObjcValueTypeMacroInterface", targets: ["SwiftObjcValueTypeMacroInterface"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.2"),
    .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2")
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
      name: "SwiftObjcValueType",
      dependencies: [
        .product(name: "SwiftSyntax", package: "swift-syntax"),
        .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
      ]
    ),

    .target(
      name: "SwiftObjcValueTypeMacroInterface",
      dependencies: [
        "SwiftObjcValueTypeMacro",
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

    .executableTarget(
      name: "SwiftObjcValueTypeExecutable",
      dependencies: [
        "SwiftObjcValueType",
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

// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-optimal-memory-layout",
    products: [
        .library(
            name: "swift-optimal-memory-layout",
            targets: ["swift-optimal-memory-layout"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax", from: "600.0.1")
    ],
    targets: [
        .executableTarget(name: "Generate"),
        .target(name: "Utilities"),
        .target(
            name: "swift-optimal-memory-layout",
            dependencies: [
                "Utilities",
                "SwiftOptimalMemoryLayoutMacro"
            ]
        ),
        .macro(
            name: "SwiftOptimalMemoryLayoutMacro",
            dependencies: [
                "Utilities",
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftDiagnostics", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "swift-optimal-memory-layoutTests",
            dependencies: ["swift-optimal-memory-layout"]
        ),
    ]
)

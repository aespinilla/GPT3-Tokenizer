// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GPT3 Tokenizer",
    products: [
        .library(
            name: "GPT3 Tokenizer",
            targets: ["GPT3 Tokenizer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "GPT3 Tokenizer",
            dependencies: [],
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "GPT3 TokenizerTests",
            dependencies: ["GPT3 Tokenizer"]),
    ]
)

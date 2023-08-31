// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Gifski",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Gifski",
            targets: ["libgifski"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "libgifski",
            path: "./Gifski.xcframework"
        ),
//        .target(
//            name: "Gifski",
//            dependencies: ["libgifski"],
//            path: nil
//        ),
//        .testTarget(
//            name: "GifskiTests",
//            dependencies: ["libgifski"]
//        ),
    ]
)

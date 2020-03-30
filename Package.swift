// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowLayout",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "FlowLayout",
            targets: ["FlowLayout"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/eonist/CommonCell.git", .branch("master")),
        .package(url: "https://github.com/eonist/ImageSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/NetworkSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/JSONSugar.git", .branch("master"))
        //.package(url: "https://github.com/eonist/RefreshControlKit.git", .branch("master")),
        //.package(url: "https://github.com/eonist/TestRunner.git", .branch("master")),
        //.package(url: "https://github.com/eonist/UITestSugar.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "FlowLayout",
            dependencies: ["CommonCell", "ImageSugar", "NetworkSugar", "JSONSugar"])
    ]
)

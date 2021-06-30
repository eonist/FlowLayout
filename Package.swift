// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FlowLayout",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "FlowLayout",
            targets: ["FlowLayout"])
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/CommonCell.git", .branch("master")),
        .package(url: "https://github.com/eonist/ImageSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/NetworkSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/JSONSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/With.git", .branch("master")),
        .package(url: "https://github.com/eonist/Spatial.git", .branch("master"))
        //.package(url: "https://github.com/eonist/RefreshControlKit.git", .branch("master")),
        //.package(url: "https://github.com/eonist/TestRunner.git", .branch("master")),
        //.package(url: "https://github.com/eonist/UITestSugar.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "FlowLayout",
            dependencies: ["CommonCell", "ImageSugar", "NetworkSugar", "JSONSugar", "With", "Spatial"])
    ]
)

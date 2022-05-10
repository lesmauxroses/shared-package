// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LesMotsRosesUI",
    platforms: [
        .iOS(.v14), .macOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LesMotsRosesUI",
            targets: ["LesMotsRosesUI"]),
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name:"SocketIO", url: "https://github.com/socketio/socket.io-client-swift", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LesMotsRosesUI",
            dependencies: ["SocketIO"],
            resources: [
                .process("Fonts"),
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "LesMotsRosesUITests",
            dependencies: ["LesMotsRosesUI"]),
    ]
)

// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClientPackage",
    platforms: [ .iOS(.v15), .macOS(.v12) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClientPackage",
            targets: ["ClientPackageTarget"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ClientPackageTarget"
        )
    ]
)

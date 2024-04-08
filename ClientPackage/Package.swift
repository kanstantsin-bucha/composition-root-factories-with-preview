// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ClientPackage",
    defaultLocalization: "en",
    platforms: [ .iOS(.v17) ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ClientPackage",
            targets: ["ClientPackageTarget"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kanstantsin-bucha/apple-os-logs", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ClientPackageTarget",
            dependencies: [
                .productItem(name: "OSLogs", package: "apple-os-logs", moduleAliases: nil, condition: nil)
            ]
        )
    ]
)

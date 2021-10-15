// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "HandyUIKit",
    platforms: [.iOS(.v9), .tvOS(.v9)],
    products: [
        .library(name: "HandyUIKit", targets: ["HandyUIKit"])
    ],
    targets: [
        .target(
            name: "HandyUIKit",
            path: "Frameworks/HandyUIKit"
        ),
        .testTarget(
            name: "HandyUIKitTests",
            dependencies: ["HandyUIKit"]
        )
    ]
)

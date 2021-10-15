// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "HandyUIKit",
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

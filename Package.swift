// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "HandyUIKit",
    products: [
        .library(name: "HandyUIKit", targets: ["HandyUIKit"])
    ],
    targets: [
        .target(
            name: "HandyUIKit",
            path: "Frameworks/HandyUIKit",
            exclude: ["Frameworks/SupportingFiles"]
        ),
        .testTarget(
            name: "HandyUIKitTests",
            dependencies: ["HandyUIKit"],
            exclude: ["Tests/SupportingFiles"]
        )
    ]
)

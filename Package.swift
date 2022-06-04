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

#if swift(>=5.6)
  // Add the documentation compiler plugin if possible
  package.dependencies.append(
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  )
#endif

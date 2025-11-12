// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "lcms2",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "lcms2",
            targets: ["_lcms2"]
        ),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_lcms2",
            dependencies: ["Lcms2"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.16.0-xcode/lcms2.xcframework.zip",
            checksum: "537f563a65be91118d674d48f43c9d46fc459a3a7ecc20bed9af856b64dc4dce"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
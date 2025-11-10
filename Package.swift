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
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.16.0/lcms2.xcframework.zip",
            checksum: "077eec06ddbb8b482539290d5a211eb45e234d37c1de4f0476f505eb85b3032b"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
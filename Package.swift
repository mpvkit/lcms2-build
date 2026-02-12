// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "lcms2",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14)],
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
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.18.0/lcms2.xcframework.zip",
            checksum: "945a6fa36ad8b39cfb75603a84f375249bc382adde4eb8e9cfc70b8cb942312d"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
import Foundation
import Darwin

do {
    let options = try ArgumentOptions.parse(CommandLine.arguments)
    try Build.performCommand(options)

    try BuildLittleCms().buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable {
    case lcms2
    var version: String {
        switch self {
        case .lcms2:
            return "lcms2.17rc0"
        }
    }

    var url: String {
        switch self {
        case .lcms2:
            return "https://github.com/mm2/Little-CMS"
        }
    }


    // for generate Package.swift
    var targets : [PackageTarget] {
        switch self {
        case .lcms2:
            return  [
                .target(
                    name: "Lcms2",
                    url: "https://github.com/mpvkit/lcms2-build/releases/download/\(BaseBuild.options.releaseVersion)/lcms2.xcframework.zip",
                    checksum: "https://github.com/mpvkit/lcms2-build/releases/download/\(BaseBuild.options.releaseVersion)/lcms2.xcframework.checksum.txt"
                ),
            ]
        }
    }
}



private class BuildLittleCms: BaseBuild {
    init() {
        super.init(library: .lcms2)
    }
}
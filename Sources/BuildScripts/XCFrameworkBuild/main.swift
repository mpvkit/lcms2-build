import Foundation
import BuildShared

do {
    let options = try BuildRunner.performCommand()

    try BuildLittleCms(options: options).buildALL()
} catch {
    print(error.localizedDescription)
    exit(1)
}


enum Library: String, CaseIterable, BuildLibrary {
    case lcms2
    var version: String {
        switch self {
        case .lcms2:
            return "lcms2.18"
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
                    url: "https://github.com/mpvkit/lcms2-build/releases/download/\(BuildRunner.options!.releaseVersion)/lcms2.xcframework.zip",
                    checksum: "https://github.com/mpvkit/lcms2-build/releases/download/\(BuildRunner.options!.releaseVersion)/lcms2.xcframework.checksum.txt"
                ),
            ]
        }
    }
}



private class BuildLittleCms: BaseBuild {
    init(options: ArgumentOptions) {
        super.init(library: Library.lcms2, options: options)
    }
}

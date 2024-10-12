//
//  AppPlist.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation


protocol Plist {
    /// app version
    var version: String { get }
    /// app build number
    var buildNumber: String? { get }
    /// indicates if we we have to show or hide the build in settings
    var hideBuildVersion: Bool { get }
    /// indicates if update mechanism is enabled or not
    var updateEnabled: Bool { get }
}


struct AppPlist: Plist {
    var hideBuildVersion: Bool {
        return dictionary?["HideBuildVersion"] as? Bool ?? true
    }

    var version: String {
        return dictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    var buildNumber: String? {
        return dictionary?[kCFBundleVersionKey as String] as? String
    }

    var updateEnabled: Bool {
        return dictionary?["UpdateEnabled"] as? Bool ?? true
    }

    private let dictionary: [String: Any]?

    init(dictionary: [String: Any]?) {
        self.dictionary = dictionary
    }
}

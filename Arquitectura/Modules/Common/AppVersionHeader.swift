//
//  AppVersionHeader.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//
import Foundation

struct AppVersionHeader: URLRequestHeader {
    private let plist: Plist

    var value: [String: String] {
        [
            "appVersion": plist.version
        ]
    }

    init(plist: Plist) {
        self.plist = plist
    }

    func apply(to request: inout URLRequest) {
        value.forEach({ request.addValue($1, forHTTPHeaderField: $0) })
    }
}

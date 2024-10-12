//
//  PlistAssembler.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

enum PlistAssembler {
    static func assemble() -> Plist {
        return AppPlist(dictionary: Bundle.main.infoDictionary)
    }
}

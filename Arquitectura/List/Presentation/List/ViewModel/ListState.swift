//
//  ListState.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

import Foundation

struct ListState: Equatable {
    let isLoading: Bool
    let items: [ListItem]
}


extension ListState {
    static func loading() -> ListState {
        .init(isLoading: true, items: .init())
    }
}

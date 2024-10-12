//
//  ListItemDTO.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

// MARK: - ListItemDTO

struct ListMockDTO: Equatable, Codable {
    let profile: [ItemDTO]

    struct ItemDTO: Equatable, Codable {
        let title: String
        let icon: String
        let url: String
    }
}

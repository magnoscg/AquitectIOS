//
//  ListItem.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

// MARK: - ListItem

struct ListItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let icon: String
    let url: String
}

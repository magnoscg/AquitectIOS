//
//  ListMapperDTO.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol ListItemMapperDTO {
    func map(_ codable: ListMockDTO) -> [ListItem]
}

struct ListItemMapperDTOImpl: ListItemMapperDTO {
    func map(_ codable: ListMockDTO) -> [ListItem] {
        codable.profile.map { map($0)}
    }
}

private extension ListItemMapperDTOImpl {
    func map(_ codable: ListMockDTO.ItemDTO) -> ListItem {
        .init(id: UUID(),
              title: codable.title,
              icon: codable.icon,
              url: codable.url)
    }
}

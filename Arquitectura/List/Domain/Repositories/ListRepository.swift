//
//  ListRepository.swift
//  Arquitectura
//
//  Created by Carlos Cáceres González on 12/10/24.
//

protocol ListRepository {
    func fetchItems() async throws -> [ListItem]
}

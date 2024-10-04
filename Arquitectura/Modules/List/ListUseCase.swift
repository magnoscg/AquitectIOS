//
//  ListUseCase.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

// MARK: - ListUseCase.swift

protocol ListUseCase {
    func getItems() async throws -> [ListItem]
}

struct ListUseCaseImpl: ListUseCase {
    private let repository: ListRepository

    init(repository: ListRepository = ListRepositoryImpl()) {
        self.repository = repository
    }

    func getItems() async throws -> [ListItem] {
        try await repository.fetchItems()
    }
}

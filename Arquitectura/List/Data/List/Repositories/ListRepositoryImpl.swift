//
//  ListRepository.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation


// MARK: - ListRepository Implementaion

struct ListRepositoryImpl: ListRepository {
    private let remoteDataSource: ListDataSource

    init(datasource: ListDataSource = ListRemoteDataSourceImpl()) {
        self.remoteDataSource = datasource
    }

    func fetchItems() async throws -> [ListItem] {
        let params: ListDataSourceParams = .init(credentials: .init(username: "", password: "" ))
        return try await remoteDataSource.fetchItems(params: params)
    }
}

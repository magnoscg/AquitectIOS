//
//  ListLocalDatasource.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation


struct LocalDataSourceImpl: ListDataSource {
    private var items: [ListItem] = []

    func fetchItems(params: ListDataSourceParams) async throws -> [ListItem] {
        items
    }
}

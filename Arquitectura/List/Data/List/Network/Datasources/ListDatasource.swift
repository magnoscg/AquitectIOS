//
//  ListDatasource.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol ListDataSource {
    func fetchItems(params: ListDataSourceParams) async throws -> [ListItem]
}

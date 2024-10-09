//
//  ListURLComponentsCreator.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol ListURLCreator {
    func createURLComponents(baseEndpoint: String, params: ListDataSourceParams) -> URLComponents?
}

struct ListURLCreatorImpl: ListURLCreator, URLQueryItemCreatorType, QueryCreatorType {
    func createURLComponents(baseEndpoint: String, params: ListDataSourceParams) -> URLComponents? {
        let queryItems: [URLQueryItem?] = [
            URLQueryItem(name: "page", value: ""),
            URLQueryItem(name: "limit", value: "")
        ]

        return create(endpoint: buildEndpoint(baseEndpoint: baseEndpoint),
                      items: queryItems)
    }
}

private extension ListURLCreatorImpl {
    func buildEndpoint(baseEndpoint: String) -> String {
        baseEndpoint + "/api/items"
    }
}



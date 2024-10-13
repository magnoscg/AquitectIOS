//
//  ListDatasource.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

struct ListRemoteDataSourceImpl: ListDataSource, URLRequestHeaderCreatorType {
    private let apiClient: HTTPClient
    private let decoder: JSONDecoder
    private let listMapperDTO: ListItemMapperDTO
    private let listURLCreator: ListURLCreator

    init(apiClient: HTTPClient = URLSessionAPIClient(),
         decoder: JSONDecoder = JSONDecoder(),
         listMapperDTO: ListItemMapperDTO = ListItemMapperDTOImpl(),
         listURLCreator: ListURLCreator = ListURLCreatorImpl()) {
        self.apiClient = apiClient
        self.decoder = decoder
        self.listMapperDTO = listMapperDTO
        self.listURLCreator = listURLCreator
    }

    func fetchItems(params: ListDataSourceParams) async throws -> [ListItem] {
//        try await Task.sleep(for: .seconds(1)) // 1 segundo de delay
//        return [
//            ListItem(id: 1, title: "Remote Item 1"),
//            ListItem(id: 2, title: "Remote Item 2"),
//            ListItem(id: 3, title: "Remote Item 3")
//        ]

        guard let request = createRequest(params: params) else {
            throw BaseError.invalidURL
        }

        let (data, _) = try await apiClient.data(for: request)
        let codable = try decoder.decode(ListMockDTO.self, from: data)
        return listMapperDTO.map(codable)
    }
}

// MARK: - Create Request

private extension ListRemoteDataSourceImpl {
    func createRequest(params: ListDataSourceParams) -> URLRequest? {
        let components = listURLCreator.createURLComponents(baseEndpoint: "https://apimocha.com/arquitectura", params: params)
        return URLRequest(url: components?.url,
                          headers: createDefaultHeaders(credentials: params.credentials))
    }
}


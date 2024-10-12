//
//  APIClient.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol HTTPClient {
    func data(for request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

struct URLSessionAPIClient: HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func data(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw BaseError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw BaseError.httpError(statusCode: httpResponse.statusCode)
        }

        return (data, httpResponse)
    }
}

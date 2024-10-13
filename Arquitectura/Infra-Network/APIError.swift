//
//  APIError.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

enum BaseError: Error {
    case generic
    case noInternetConnection
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError
    case noContent
    case invalidURL

    var description: String {
        switch self {
        case .generic:
            "An unknown error occurred"
        case .noInternetConnection:
            "No internet connection"
        case .invalidResponse:
            "Invalid response from the server"
        case .httpError(let statusCode):
            "HTTP error with status code: \(statusCode)"
        case .decodingError:
            "Error decoding the response"
        case .noContent:
            "No content available"
        case .invalidURL:
            "Invalid URL"
        }
    }
}

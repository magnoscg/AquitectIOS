//
//  Endpoints.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

import Foundation

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var header: [String: String] { get }
    var body: Data? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Endpoint: APIEndpoint {
    let baseURL: URL
    let path: String
    let httpMethod: HTTPMethod
    let header: [String: String]
    let body: Data?

    init(baseURL: URL, path: String, httpMethod: HTTPMethod, header: [String: String] = [:], body: Data? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.httpMethod = httpMethod
        self.header = header
        self.body = body
    }
}

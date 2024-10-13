//
//  QueryCreatorType.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol QueryCreatorType {
    func create(endpoint: String, items: [URLQueryItem?], sorted: Bool) -> URLComponents?
}

extension QueryCreatorType {
    func create(endpoint: String, items: [URLQueryItem?], sorted: Bool = true) -> URLComponents? {
        var queryComponents = URLComponents(string: endpoint)
        if sorted {
            queryComponents?.queryItems = items.compactMap { $0 }.sorted {
                $0.name.caseInsensitiveCompare($1.name) == .orderedAscending
            }
        } else {
            queryComponents?.queryItems = items.compactMap { $0 }
        }
        return queryComponents
    }
}

protocol URLRequestHeaderCreatorType {
    func createDefaultHeaders(credentials: Credentials, plist: Plist) -> [URLRequestHeader]
}

extension URLRequestHeaderCreatorType {
    func createDefaultHeaders(credentials: Credentials, plist: Plist = PlistAssembler.assemble()) -> [URLRequestHeader] {
        [
            BasicAuthHeader(credentials: credentials),
            AppVersionHeader(plist: plist)
        ]
    }
}

protocol URLQueryItemCreatorType {
    func items(from dictionary: [String: String]) -> [URLQueryItem]
    func items(from encodable: Encodable) -> [URLQueryItem]
}

extension URLQueryItemCreatorType {
    func items(from encodable: Encodable) -> [URLQueryItem] {
        guard let data = try? JSONEncoder().encode(encodable) else { return [] }
        guard let queryItemsDictionary = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any] else { return [] }
        let queryItems = queryItemsDictionary
            .map { URLQueryItem(name: $0, value: String(describing: $1)) }
            .sorted { $0.name < $1.name }
        return queryItems
    }

    func items(from dictionary: [String: String]) -> [URLQueryItem] {
        dictionary.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

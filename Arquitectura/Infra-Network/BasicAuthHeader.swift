//
//  BasicAuthHeader.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

struct BasicAuthHeader: URLRequestHeader {
    private var credentials: Credentials

    let field = "Authorization"

    var value: String {
        let plainCredentials = String(format: "%@:%@", credentials.username, credentials.password)
        guard let dataCredentials = plainCredentials.data(using: String.Encoding.utf8) else {
            return ""
        }
        let base64Encoded = dataCredentials.base64EncodedString(options: .lineLength64Characters)
        return "Basic \(base64Encoded)"
    }

    init(credentials: Credentials) {
        self.credentials = credentials
    }

    func apply(to request: inout URLRequest) {
        request.addValue(value, forHTTPHeaderField: field)
    }
}

//
//  URLRequestHeader.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

protocol URLRequestHeader {
    func apply(to request: inout URLRequest)
}


extension URLRequest {
    init(url: URL, headers: [URLRequestHeader]) {
        self.init(url: url)
        headers.forEach { header in
            header.apply(to: &self)
        }
    }

    init?(url: URL?, headers: [URLRequestHeader]) {
        guard let url = url else { return nil }

        self.init(url: url, headers: headers)
    }
}

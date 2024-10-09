//
//  APIResponse.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation


extension HTTPURLResponse {
    var isSuccess: Bool {
        return (200...299).contains(statusCode)
    }

    var isOK: Bool {
        return statusCode == 200
    }

    var isNoContent: Bool {
        return statusCode == 204
    }
}

//
//  Credentials.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation

/// A type that defines the credentials of an authenticated user
public struct Credentials: Equatable, Codable {
    /// The username
    public let username: String
    /// The password
    public let password: String


    /// Creates new ``Credentials``
    /// - Parameters:
    ///   - username: the user username
    ///   - password: the user password
    public init(username: String,
                password: String) {
        self.username = username
        self.password = password
    }
}

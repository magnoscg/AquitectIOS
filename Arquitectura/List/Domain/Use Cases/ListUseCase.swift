//
//  ListUseCase.swift
//  Arquitectura
//
//  Created by Carlos Cáceres González on 12/10/24.
//

protocol ListUseCase {
    func getItems() async throws -> [ListItem]
}

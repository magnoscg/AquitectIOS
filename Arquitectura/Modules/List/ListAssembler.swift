//
//  ListAssembler.swift
//  Arquitectura
//
//  Created by Oscar Canton on 29/9/24.
//

import Foundation
import SwiftUI

// MARK: - Assembler

enum ListAssembler {
    static func assemble() -> some View {
        // Aquí irían todas las inicializaciones de dependencias como en el ejemplo original
        // Por brevedad, solo incluyo algunas a modo de ejemplo
        let repository: ListRepository = ListRepositoryImpl()
        let useCase: ListUseCase = ListUseCaseImpl(repository: repository)
        let viewModel = ListViewModelImpl(useCase: useCase)
        let router = ListRouterImpl()

        return ListView(viewModel: viewModel, router: router)
    }
}

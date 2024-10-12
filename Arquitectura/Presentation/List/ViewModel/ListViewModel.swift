//
//  ListViewModel.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

/// MARK: - ListViewModel.swift

import Foundation
import Combine
import Observation

protocol ListViewModel {
    var state: ListState { get }
    func loadItems() async
}

@Observable
final class ListViewModelImpl: ListViewModel {
    private(set) var state: ListState = .loading()
    private var hasLoadedData = false
    private let useCase: ListUseCase

    init(useCase: ListUseCase) {
        self.useCase = useCase
    }

    @MainActor
    func loadItems() async {
        guard !hasLoadedData else { return }

        state = .loading()
        do {
            let items = try await useCase.getItems()
            hasLoadedData = true
            state = .init(isLoading: false, items: items)
        } catch {
            // Manejar el error apropiadamente
            state = .init(isLoading: false, items: .init())
            print("Error loading items: \(error)")
        }
    }
}

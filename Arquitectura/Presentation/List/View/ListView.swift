//
//  ListView.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation
import SwiftUI

// MARK: - ListView.swift

struct ListView: View {
    @State var viewModel: ListViewModel
    @State var router: ListRouter


    var body: some View {
        NavigationStack(path: $router.path) {
            List {
                ForEach(viewModel.state.items) { item in
                    ItemContent(item: item) {
                        router.pushDetail(item: item)
                    }
                }
            }
            .disabled(viewModel.state.isLoading)
            .blur(radius: viewModel.state.isLoading ? 3 : 0)

            .navigationTitle("Lista")
            .onAppear {
                Task {
                    if viewModel.state.items.isEmpty {
                        await viewModel.loadItems()
                    }
                }
            }
            .navigationDestination(for: ListDestination.self) { destination in
                switch destination {
                case .detail(let item):
                    Text("Detalle: \(item.title)")
                }
            }
        }
    }
}

#Preview {
    ListAssembler.assemble()
}

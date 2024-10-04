//
//  ListRouter.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation
import SwiftUI


// MARK: - ListRouter.swift

import SwiftUI

enum ListDestination: Hashable {
    case detail(ListItem)
}

protocol ListRouter: ObservableObject {
    var path: NavigationPath { get set }
    func pushDetail(item: ListItem)
    func popToRoot()
}

class ListRouterImpl: ListRouter {
    @Published var path = NavigationPath()

    func pushDetail(item: ListItem) {
        path.append(ListDestination.detail(item))
    }

    func popToRoot() {
        path = NavigationPath()
    }
}

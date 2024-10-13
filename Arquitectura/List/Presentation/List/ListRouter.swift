//
//  ListRouter.swift
//  Arquitectura
//
//  Created by Oscar Canton on 30/9/24.
//

import Foundation
import SwiftUI
import Observation


// MARK: - ListRouter.swift

import SwiftUI

enum ListDestination: Hashable {
    case detail(ListItem)
}

protocol ListRouter {
    var path: NavigationPath { get set }
    func pushDetail(item: ListItem)
    func popToRoot()
}

@Observable
class ListRouterImpl: ListRouter {
    var path = NavigationPath()

    func pushDetail(item: ListItem) {
        path.append(ListDestination.detail(item))
    }

    func popToRoot() {
        path = NavigationPath()
    }
}

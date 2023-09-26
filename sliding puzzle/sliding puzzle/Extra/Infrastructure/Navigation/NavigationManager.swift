//
//  NavigationManager.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

class NavigationManager: ObservableObject {

    @Published var path = NavigationPath()

    var isEmpty: Bool {
        path.isEmpty
    }
    
    var countOfPages: Int {
        path.count
    }

    func popToRoot() {
        path = NavigationPath()
    }

    func back() {
        path.removeLast()
    }

    func goToGamePage() {
        path.append(NavigationRoute.gameScene)
    }
}

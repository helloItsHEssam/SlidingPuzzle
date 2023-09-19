//
//  StartView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/18/23.
//

import SwiftUI

struct StartView: View {

    @StateObject var nav = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $nav.path) {
            SimpleButtonView(title: "Start") {
                nav.goToGamePage()
            }
            .navigationDestination(for: NavigationRoute.self) { route in
                switch route {
                case .gameScene: GameView()
                }
            }
        }
        .environmentObject(nav)
    }
}

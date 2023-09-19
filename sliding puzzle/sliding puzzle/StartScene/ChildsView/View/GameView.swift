//
//  GameView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/18/23.
//

import SwiftUI

struct GameView: View {

    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @EnvironmentObject var nav: NavigationManager
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 1), count: 3)

    var body: some View {
        if verticalSizeClass == .compact {
            Text("Hi, roate phone")
                .navigationBarHidden(true)
        } else {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 1) {
                            ForEach((0...8), id: \.self) { _ in
                                Circle()
                                    .background(Color.tintBlue)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

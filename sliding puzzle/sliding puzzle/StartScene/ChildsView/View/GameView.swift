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
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            Color
                .background
                .ignoresSafeArea()

            if verticalSizeClass == .compact {
                Text("Hi, rotate the phone :-)")
                    .font(.custom(Poppins.weight(.regular), size: 32))
            } else {
                VStack(spacing: 0) {
                    DetailView()
                        .padding(EdgeInsets(top: 0, leading: 20,
                                            bottom: 12, trailing: 20))
                    
                    PuzzleView(viewModel: viewModel)
                        .padding([.leading, .trailing], 20)
                    
                    SimpleButtonView(title: "Reset") {
                        // TODO: complete reset method
                    }
                    .padding(.top, 32)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.initializeGame()
        }
    }
}

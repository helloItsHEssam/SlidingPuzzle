//
//  DetailView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct DetailView: View {

    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        HStack {
            DetailTextView(content: "Move: \(viewModel.numberOfMoves)")
            Spacer()
            DetailTextView(content: "Time: \(viewModel.elapsedTime)")
        }
        .animation(nil, value: UUID())
    }
}

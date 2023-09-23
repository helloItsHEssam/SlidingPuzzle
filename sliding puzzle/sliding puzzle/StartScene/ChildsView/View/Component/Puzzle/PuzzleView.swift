//
//  PuzzleView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct PuzzleView: View {

    private let gridItemLayout = Array(repeating: GridItem(.flexible(),
                                                           spacing: 1), count: 3)
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 1) {
            ForEach(viewModel.items.indices, id: \.self) { row in
                ForEach(viewModel.items[row]) { item in
                    let content = String(describing: item)
                    PuzzleItemView(content: content)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.shiftPuzzleItem(item)
                            }
                        }
                }
            }
        }
    }
}

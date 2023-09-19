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

    var body: some View {

        LazyVGrid(columns: gridItemLayout, spacing: 1) {
            ForEach((0...8), id: \.self) { int in
                PuzzleItemView(content: "\(int + 1)")
            }
        }        
    }
}

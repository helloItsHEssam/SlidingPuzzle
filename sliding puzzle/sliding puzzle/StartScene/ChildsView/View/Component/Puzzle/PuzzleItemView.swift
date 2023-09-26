//
//  PuzzleItemView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct PuzzleItemView: View {

    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        VStack {
            ContentPuzzleItemView(content: content)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.tintBlue)
        .cornerRadius(20)
    }
}

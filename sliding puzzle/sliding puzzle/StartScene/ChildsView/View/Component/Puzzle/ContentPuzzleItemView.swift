//
//  ContentPuzzleItemView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct ContentPuzzleItemView: View {
    
    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        Text(content)
            .font(.custom(Poppins.weight(.bold), fixedSize: 80))
            .foregroundColor(Color.white)
            .lineLimit(1)
    }
}

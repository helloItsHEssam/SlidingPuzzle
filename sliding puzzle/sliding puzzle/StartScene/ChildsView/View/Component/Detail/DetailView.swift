//
//  DetailView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct DetailView: View {

    var body: some View {
        HStack {
            DetailTextView(content: "Move: 0")
            Spacer()
            DetailTextView(content: "Time: 00:00")
        }
    }
}

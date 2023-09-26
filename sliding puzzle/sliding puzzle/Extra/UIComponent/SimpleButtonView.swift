//
//  SimpleButtonView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/18/23.
//

import SwiftUI

struct SimpleButtonView: View {

    private let action: () -> Void
    private let title: String
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(Poppins.weight(.extraBold), size: 34))
                .padding(EdgeInsets(top: 12, leading: 32,
                                    bottom: 12, trailing: 32))
        }
        .background(Color.tintBlue)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

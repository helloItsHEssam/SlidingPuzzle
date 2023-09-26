//
//  TextMessageAlertView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/26/23.
//

import SwiftUI

struct TextMessageAlertView: View {
    
    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        Text(content)
            .font(.custom(Poppins.weight(.bold), size: 30))
            .foregroundColor(.black)
    }
}

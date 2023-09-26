//
//  DetailTextView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/19/23.
//

import SwiftUI

struct DetailTextView: View {
    
    private var content: String
    
    init(content: String) {
        self.content = content
    }

    var body: some View {
        Text(content)
            .font(.custom(Poppins.weight(.regular), size: 20))
            .foregroundColor(.detailText)
            .dynamicTypeSize(...DynamicTypeSize.accessibility1)
    }
}

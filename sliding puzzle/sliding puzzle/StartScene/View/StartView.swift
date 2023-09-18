//
//  StartView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/18/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        SimpleButtonView(title: "Start") {
            print("hello")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

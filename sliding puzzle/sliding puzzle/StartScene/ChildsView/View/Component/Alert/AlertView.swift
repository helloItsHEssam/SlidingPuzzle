//
//  AlertView.swift
//  sliding puzzle
//
//  Created by Hessam Mahdiabadi on 9/25/23.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var show: Bool
    
    private func dismiss() {
        withAnimation(.easeInOut(duration: 0.2)) {
            show.toggle()
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if show {
                    Color.black.opacity(show ? 0.7 : 0.0)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            dismiss()
                        }
                    VStack(spacing: 32) {
                        TextMessageAlertView(content: "Congrats!")
                            .padding([.leading, .trailing, .top], 20)
                        SimpleButtonView(title: "OK") {
                            dismiss()
                        }
                        .padding(.bottom, 20)
                    }
                    .frame(width: geometry.size.width - 40)
                    .background(Color.white)
                    .cornerRadius(20)
                    .transition(.scale)
                }
            }
        }
    }
}

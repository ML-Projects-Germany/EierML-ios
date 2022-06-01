//
//  RoundButton.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import SwiftUI

struct RoundButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .imageScale(.large)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
            .background(Color.white.opacity(0.3))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.001), lineWidth: 1.5)
                    .shadow(color: Color.white, radius: 4, x: 2, y: 2)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            )
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            Button {
                print("Button pressed")
            } label: {
                Image(systemName: "ellipsis")
            }
            .buttonStyle(RoundButton())
        }
    }
}

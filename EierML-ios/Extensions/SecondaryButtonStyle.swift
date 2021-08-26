//
//  SecondaryButtonStyle.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.body.bold())
            .padding()
            .background(
                !isEnabled ? color.opacity(0.5) :
                    configuration.isPressed ? color.adjust(by: -5) : color
            )
            .cornerRadius(11)
            .foregroundColor(.white)
            .shadow(
                color: configuration.isPressed ? .black.opacity(0.02) : .black.opacity(0.15),
                radius: 5
            )
    }
}

struct SecondaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test 123", action: {})
            .buttonStyle(SecondaryButtonStyle(color: Color.Palette.red))
            .padding()
    }
}

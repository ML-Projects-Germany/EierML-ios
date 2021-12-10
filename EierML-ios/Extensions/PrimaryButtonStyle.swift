//
//  PrimaryButtonStyle.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    var color: Color
    var pressedColor: Color

    init(
        color: Color,
        pressedColor: Color
    ) {
        self.color = color
        self.pressedColor = pressedColor
    }

    init(
        color: Color
    ) {
        self.color = color
        self.pressedColor = color.adjust(by: -5) ?? color
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .font(Font.body.bold())
            .padding()
            .frame(minHeight: 60)
            .background(
                !isEnabled ? color.opacity(0.5) :
                    configuration.isPressed ? pressedColor : color
            )
            .cornerRadius(11)
            .foregroundColor(.white)
            .shadow(
                color: configuration.isPressed ? .black.opacity(0.02) : .black.opacity(0.15),
                radius: 5
            )
    }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Test 123", action: {})
                .buttonStyle(
                    PrimaryButtonStyle(
                        color: Color.Palette.blue,
                        pressedColor: Color.Palette.darkBlue
                    )
                )
            Button("Test 123", action: {})
                .disabled(true)
                .buttonStyle(
                    PrimaryButtonStyle(
                        color: Color.Palette.blue,
                        pressedColor: Color.Palette.darkBlue
                    )
                )
        }
        .padding()
    }
}

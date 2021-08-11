//
//  NewsRowButtonStyle.swift
//  clickbaitml-ios (iOS)
//
//  Created by Torben Köhler on 01.08.21.
//

import SwiftUI

struct NewsRowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct NewsRowButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(NewsRowButtonStyle())
    }
}

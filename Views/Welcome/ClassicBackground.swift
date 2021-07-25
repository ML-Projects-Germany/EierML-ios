//
//  ClasicBackground.swift
//  EierML-ios
//
//  Created by Torben Köhler on 18.07.21.
//

import SwiftUI

struct ClassicBackground: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                                    [
                                        Color.Palette.blue.opacity(0.7),
                                        Color.Palette.red.opacity(0.7)
                                    ]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}

struct ClassicBackground_Previews: PreviewProvider {
    static var previews: some View {
        ClassicBackground()
            .ignoresSafeArea()
    }
}

//
//  ClasicBackgroundView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 18.07.21.
//

import SwiftUI

struct ClassicBackgroundView: View {
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors:
                                    [
                                        Color.Palette.blue.opacity(0.8),
                                        Color.Palette.red.opacity(0.8)
                                    ]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}

struct ClassicBackground_Previews: PreviewProvider {
    static var previews: some View {
        ClassicBackgroundView()
            .ignoresSafeArea()
    }
}

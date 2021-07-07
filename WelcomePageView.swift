//
//  WelcomePageView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors:
                                        [
                                            Color.Palette.red.opacity(0.8),
                                            Color.Palette.blue.opacity(0.8)
                                        ]),
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Wilkommen")
                    .bold()
                Text("zu unserem Projekt EierML")
            }
            .font(.largeTitle)
            VStack(alignment: .leading) {
                Spacer()
                Button(action: {

                }, label: {
                    Text("Weiter")
                })
                .buttonStyle(PrimaryButtonStyle(color: Color.Palette.red))
                .padding()
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}

//
//  WelcomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("firstAppStart") var firstAppStart: Bool?

    var body: some View {
        NavigationView {
            ZStack {
                ClassicBackgroundView()
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Text("Wilkommen")
                        .bold()
                    Text("zu unserem Projekt EierML")
                }
                .font(.largeTitle)
                VStack(alignment: .leading) {
                    Spacer()
                    NavigationButton {
                        firstAppStart = false
                    } destination: {
                        HomeView()
                            .navigationBarHidden(true)
                    } label: {
                        Text("Weiter")
                    }
                    .buttonStyle(PrimaryButtonStyle(color: Color.Palette.red))
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//
//  AppView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct AppView: View {
    @AppStorage("firstAppStart") var firstAppStart: Bool?

    var body: some View {
        ZStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Startseite", systemImage: "rectangle.stack")
                    }
                    .tag(0)
                EggsView()
                    .tabItem {
                        Label("EierML", systemImage: "magnifyingglass.circle")
                    }
            }
            if firstAppStart ?? true {
                WellcomeView()
                    .transition(.opacity)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

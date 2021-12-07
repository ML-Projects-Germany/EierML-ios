//
//  AppView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct AppView: View {
    @StateObject var appModel: AppModel

    init() {
        self._appModel = StateObject(wrappedValue: AppModel())
    }

    var body: some View {
        GeometryReader { reader in
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
                
                .onAppear {
                    if #available(iOS 15.0, *) {
                        let appearance = UITabBarAppearance()
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                    }
                }
                WellcomeView(firstAppStart: $appModel.firstAppStart)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 0.0)
                    .offset(x: appModel.firstAppStart ? 0 : -reader.size.width, y: 0)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

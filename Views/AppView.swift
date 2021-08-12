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
            if firstAppStart ?? true {
                WellcomeView()
            } else {
                HomeView()
            }
//            VStack {
//                Color.primary.colorInvert()
//                    .opacity(0.6)
//                    .frame(maxWidth: .infinity, maxHeight: 40)
//                Spacer()
//            }
//            .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

//
//  AppView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.21.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        ZStack {
            Group {
                Color.white
                LinearGradient(colors: [
                    Color(red: 0.384, green: 0.596, blue: 0.875, opacity:0.7),
                    Color(red: 0.941, green: 0.369, blue: 0.392, opacity: 0.7)
                ], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
            Text("Hello EierML-App")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

// background: linear-gradient(180deg, rgba(98, 152, 223, 0.7) 0%, rgba(240, 94, 100, 0.7) 100%);

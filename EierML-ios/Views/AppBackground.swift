//
//  AppBackground.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.07.22.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        Group {
            LinearGradient(colors: [
                Color(red: 0.384, green: 0.596, blue: 0.875, opacity: 0.7),
                Color(red: 0.941, green: 0.369, blue: 0.392, opacity: 0.7)
            ], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
    }
}

struct AppBackground_Previews: PreviewProvider {
    static var previews: some View {
        AppBackground()
    }
}

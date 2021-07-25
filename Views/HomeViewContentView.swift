//
//  SwiftUIView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 18.07.21.
//

import SwiftUI

struct HomeViewContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 0) {
            LinearGradient(gradient:
                            Gradient(colors:
                                        [
                                            backgroundOverlayColor.opacity(0),
                                            backgroundOverlayColor.opacity(0.1)
                                        ]),
                           startPoint: .top,
                           endPoint: .bottom)
                .frame(height: 30)
            ZStack {
                backgroundOverlayColor
                    .opacity(0.1)
                    .ignoresSafeArea(.all, edges: .bottom)
                VStack {
                    WelcomeMessageView()
                        .padding(.bottom, 15)
                    Label(
                        title: { Text("EierML-Blog") },
                        icon: { Image(systemName: "filemenu.and.cursorarrow") }
                    )
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
            LinearGradient(gradient:
                            Gradient(colors:
                                        [
                                            backgroundOverlayColor.opacity(0.1),
                                            backgroundOverlayColor.opacity(0)
                                        ]),
                           startPoint: .top,
                           endPoint: .bottom)
                .frame(height: 30)
        }
    }

    var backgroundOverlayColor: Color {
        colorScheme == .dark ? .white.opacity(0) : .white
    }

    var contentBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
}

struct HomeViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackground()
                .ignoresSafeArea()
            HomeViewContentView()
        }
    }
}

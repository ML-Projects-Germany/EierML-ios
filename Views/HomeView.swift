//
//  HomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.07.21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            ZStack {
                ClassicBackgroundView()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 0) {
                        HomeViewHeader()
                            .frame(height: 80)
                            .padding(.bottom, 20)
                        VStack(spacing: 0) {
                            ZStack {
                                VStack {
                                    WelcomeMessageView()
                                        .padding(.bottom, 15)
                                        .padding(.horizontal, 20)
                                    Label(
                                        title: { Text("EierML-Blog") },
                                        icon: { Image(systemName: "filemenu.and.cursorarrow") }
                                    )
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                    .padding(.bottom, -15)
                                    NewsListView()
                                        .frame(maxWidth: .infinity, maxHeight: 400)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

    var contentBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
              .preferredColorScheme(.dark)
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

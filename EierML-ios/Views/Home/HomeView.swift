//
//  HomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.07.21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("welcomeMessageIsShown") var welcomeMessageIsShown: Bool = true

    var body: some View {
        NavigationView {
            GeometryReader { reader in
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
                                        // MARK: Wellcome
                                        if welcomeMessageIsShown {
                                            WellcomeMessageView(isShown: $welcomeMessageIsShown)
                                                .frame(maxHeight: .infinity)
                                                .padding(.bottom, 15)
                                                .padding(.horizontal, 10)
                                        }
                                        // MARK: EierML-Blog
                                        Label(
                                            title: { Text("EierML-Blog") },
                                            icon: { Image(systemName: "filemenu.and.cursorarrow") }
                                        )
                                        .font(.headline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                        .padding(.bottom, -15)
                                        NewsListView()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: rowWidth(reader: reader)/1.35)
                                        // MARK: Mehr über EierML lernen
                                        Label(
                                            title: { Text("Mehr über EierML lernen") },
                                            icon: {
                                                Image("egg")
                                                    .renderingMode(.template)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 20, height: 20)
                                            }
                                        )
                                        .font(.headline)
                                        .foregroundColor(.primary.opacity(0.8))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                        EierMLBandages()
                                            .padding(.vertical, 10)
                                        // MARK: Mehr über Machine learning lernen
                                        Label(
                                            title: { Text("Mehr über Machine learning lernen") },
                                            icon: { Image(systemName: "graduationcap") }
                                        )
                                        .font(.headline)
                                        .foregroundColor(.primary.opacity(0.8))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 20)
                                        MLProjectsBandages()
                                            .padding(.vertical, 10)
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
                VStack {
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .frame(maxWidth: .infinity, maxHeight: reader.safeAreaInsets.top)
                        .offset(x: 0, y: -reader.safeAreaInsets.top)
                    Spacer()
                }
            }
        }
    }

    var contentBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
    }

    func rowWidth(reader: GeometryProxy) -> CGFloat {
        if reader.size.width/10*8 <= 300 {
            return reader.size.width/10*8
        } else {
            return 300
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.dark)
            HomeView()
                .previewDevice("iPod touch (7th generation)")
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

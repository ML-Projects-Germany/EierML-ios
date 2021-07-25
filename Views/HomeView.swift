//
//  HomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.07.21.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            ZStack {
                ClassicBackground()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 0) {
                        HomeViewHeader()
                            .frame(height: 80)
                        HomeViewContentView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
              .preferredColorScheme(.dark)
//            HomeView()
//                .previewDevice("iPod touch (7th generation)")
//              .preferredColorScheme(.dark)
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

//#if canImport(UIKit)
//extension View {
//    fileprivate func hideKeyboard() {
//        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//    }
//}
//#endif

//@State private var widthText: String = ""
//@State private var heightText: String = ""
//@State private var wightText: String = ""

//VStack(spacing: 0) {
//    VStack(spacing: 25) {
//        PrimaryTextField(
//            "Weite",
//            text: $widthText,
//            mainColor: Color.Palette.blue,
//            borderColor: Color.Palette.blue,
//            imageName: "arrow.left.and.right"
//        )
//        PrimaryTextField(
//            "Höhe",
//            text: $heightText,
//            mainColor: Color.Palette.blue,
//            borderColor: Color.Palette.blue,
//            imageName: "arrow.up.and.down"
//        )
//        PrimaryTextField(
//            "Gewicht",
//            text: $wightText,
//            mainColor: Color.Palette.blue,
//            borderColor: Color.Palette.blue,
//            imageName: "egg",
//            systemImage: false
//        )
//    }
//    .padding()

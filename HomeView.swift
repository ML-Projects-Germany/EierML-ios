//
//  HomeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.07.21.
//

import SwiftUI

struct HomeView: View {
    @State private var widthText: String = ""
    @State private var heightText: String = ""
    @State private var wightText: String = ""

    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color.Palette.blue
                    .ignoresSafeArea()
                Circle()
                    .frame(width: reader.size.width*2.7, height: reader.size.height*3)
                    .position(x: 0)
                    .foregroundColor(Color.Palette.red)
                    .shadow(radius: 10)
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Eier")
                        Text("ML")
                            .bold()
                    }
                    .foregroundColor(.white)
                    .font(.title)
                    .padding()
                    VStack(spacing: 25) {
                        PrimaryTextField(
                            "Weite",
                            text: $widthText,
                            mainColor: .white,
                            borderColor: .white,
                            imageName: "arrow.left.and.right"
                        )
                        PrimaryTextField(
                            "Höhe",
                            text: $heightText,
                            mainColor: .white,
                            borderColor: .white,
                            imageName: "arrow.up.and.down"
                        )
                        PrimaryTextField(
                            "Gewicht",
                            text: $wightText,
                            mainColor: .white,
                            borderColor: .white,
                            imageName: "egg",
                            systemImage: false
                        )
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        hideKeyboard()
                    }, label: {
                        Text("Berechnen")
                    })
                    .buttonStyle(PrimaryButtonStyle(color: Color.Palette.red))
                    .padding()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
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

#if canImport(UIKit)
extension View {
    fileprivate func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//
//  HomeViewHeader.swift
//  EierML-ios
//
//  Created by Torben Köhler on 18.07.21.
//

import SwiftUI

struct HomeViewHeader: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 0) {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(15)
                .padding(.trailing, 15)
            VStack {
                HStack(spacing: 0) {
                    Text("Eier")
                        .foregroundColor(.white)
                    Text("ML")
                        .gradientForeground(colors: [Color.Palette.red, Color.Palette.blue])
                        .shadow(color: shadowColor.opacity(0.2), radius: 5)
                }
                .font(.largeTitle.bold())
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }

    var shadowColor: Color {
        colorScheme == .dark ? .black : .white
    }
}

struct HomeViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            ScrollView {
                HomeViewHeader()
                Spacer()
            }
        }
    }
}

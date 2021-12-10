//
//  EggCardView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.12.21.
//

import SwiftUI

struct EggCardView: View {
    var egg: Egg

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                EggImageViewWithNumber(number: egg.number)
                    .foregroundColor(.black)
                    .frame(width: 45, height: 45)
                    .padding()
                HStack {
                    Text(egg.timeString)
                        .padding(.init(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(Color.Palette.blue.opacity(0.5))
                        .cornerRadius(10)
                    Text("Härte: \(egg.viscosity)")
                        .padding(.init(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(Color.Palette.red.opacity(0.5))
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .padding(.trailing)
            }
            Rectangle()
                .foregroundColor(.Palette.blue)
                .frame(height: 4)
        }
        .background(Color.white.opacity(0.5))
        .frame(maxWidth: 500)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 10)
    }

}

struct EggCardView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardView(egg: .mock)
            .padding()
    }
}

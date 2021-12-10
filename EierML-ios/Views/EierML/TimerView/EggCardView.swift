//
//  EggCardView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.12.21.
//

import SwiftUI

struct EggCardView: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                EggImageViewWithNumber(number: 1)
                    .foregroundColor(.black)
                    .frame(width: 45, height: 45)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .topLeading)
                HStack {
                    Text("Zeit: 1:50")
                        .padding(.init(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(Color.Palette.blue.opacity(0.5))
                        .cornerRadius(10)
                    Text("Härte: 5")
                        .padding(.init(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(Color.Palette.red.opacity(0.5))
                        .cornerRadius(10)
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.trailing)
            }
            Rectangle()
                .foregroundColor(.Palette.blue)
                .frame(height: 4)
        }
        .frame(maxWidth: 500, maxHeight: 100)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 10)
    }

}

struct EggCardView_Previews: PreviewProvider {
    static var previews: some View {
        EggCardView()
            .padding()
    }
}

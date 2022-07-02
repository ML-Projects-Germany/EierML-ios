//
//  TopNavigationView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.07.22.
//

import SwiftUI

struct TopNavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    print("")
                } label: {
                    Image(systemName: "ellipsis")
                }
                .buttonStyle(RoundButton())
                Spacer()
                Text("EierML")
                    .font(.system(size: 27, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Spacer()
                Button {
                    print("")
                } label: {
                    Image(systemName: "heart.text.square")
                }
                .buttonStyle(RoundButton())
            }
            .padding(.init(top: 10, leading: 20, bottom: 0, trailing: 20))
            Spacer()
            EggSizeView()
            Spacer()
        }
    }
}

struct TopNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavigationView()
    }
}

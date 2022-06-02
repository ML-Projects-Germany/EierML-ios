//
//  EggSizeView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 01.06.22.
//

import SwiftUI

struct EggSizeView: View {
    @State var height: Double = 50
    @State var weight: Double = 50

    var body: some View {
        VStack {
            ZStack {
                Image("egg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
                    .scaleEffect(1.3)
                Button {
                    print("add")
                } label: {
                    Label("Hinzufügen", systemImage: "plus")
                        .foregroundColor(.black)
                        .offset(y: 10)
                }
                CustomVerticalSlider(value: $height, range: (0, 100)) { modifiers in
                    ZStack {
                        Color.white.opacity(0.3)
                        ZStack(alignment: .top) {
                            Color.white
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(hex: "5E5E5E"))
                                .frame(width: 25, height: 15, alignment: .center)
                                .padding(.top, height >= 98.5 ? 5 : 0)
                        }
                        .padding(.top, -13)
                        .modifier(modifiers.barBottom)
                    }
                    .cornerRadius(10)
                }
                .frame(width: 25, height: 300)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal)
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 0) {
                    Group {
                        Text("Breite: 32mm")
                        Text("Höhe: 61mm")
                        Text("Dauer: 3min 20s")
                    }
                    .foregroundColor(.white)
                }
                CustomSlider(value: $weight, range: (0, 100)) { modifiers in
                    ZStack {
                        Color.white.opacity(0.3)
                        ZStack(alignment: .trailing) {
                            Color.white
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(hex: "5E5E5E"))
                                .rotationEffect(.degrees(90))
                                .frame(width: 15, height: 25, alignment: .center)
                                .padding(.trailing, weight >= 98.5 ? 5 : 0)
                        }
                        .padding(.trailing, -13)
                        .modifier(modifiers.barLeft)
                    }
                    .cornerRadius(10)
                }
                .frame(height: 25)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 35)
        }
    }
}

struct EggSizeView_Previews: PreviewProvider {
    static var previews: some View {
        EggSizeView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.orange)
            .ignoresSafeArea()
    }
}

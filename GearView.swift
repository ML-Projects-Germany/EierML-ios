//
//  GearView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 11.07.21.
//

import SwiftUI

struct GearView: View {
    @State var percentage: Float = 0

    var body: some View {
        VStack {
            
            GeometryReader { geometry in
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.Palette.red)
                        .shadow(color: .black.opacity(0.1), radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 2)
                                .blur(radius: 4)
                                .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.black, Color.clear)))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.3), lineWidth: 8)
                                .blur(radius: 4)
                                .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.clear, Color.black)))
                        )
                    VStack() {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.15), radius: 10)
                            .frame(width: 60)
                            .offset(x: (geometry.size.width-40) * CGFloat(self.percentage / 100), y: 0)
                            .animation(.easeIn)
                            .padding(6)
                    }
                    .frame(maxWidth: .infinity ,alignment: .leading)
                }
                .gesture(DragGesture(minimumDistance: 0)
                            .onChanged({ value in
                                // TODO: - maybe use other logic here
                                self.percentage = min(max(0, Float(value.location.x-35 / geometry.size.width * 100)), 100)
                            }))
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            }
        }
    }
}

struct GearView_Preview: PreviewProvider {
    static var previews: some View {
        GearView()
            .padding()
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

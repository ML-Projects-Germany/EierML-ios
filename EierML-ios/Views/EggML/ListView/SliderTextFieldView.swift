//
//  SliderTextFieldView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI
import Combine

struct SliderTextFieldView: View {struct CustomSlider: View {

    @Binding var value: CGFloat

    @State var lastOffset: CGFloat = 0

    var range: ClosedRange<CGFloat>
    var leadingOffset: CGFloat = 5
    var trailingOffset: CGFloat = 5

    var knobSize: CGSize = CGSize(width: 25, height: 25)

    let trackGradient = LinearGradient(gradient: Gradient(colors: [.pink, .yellow]), startPoint: .leading, endPoint: .trailing)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 30)
                    .background(self.trackGradient)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.clear)
                            .shadow(color: .black, radius: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    )
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: self.knobSize.width, height: self.knobSize.height)
                        .foregroundColor(.white)
                        .offset(x: self.$value.wrappedValue.map(from: self.range, to: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset)))
                        .shadow(radius: 8)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { value in

                                    if abs(value.translation.width) < 0.1 {
                                        self.lastOffset = self.$value.wrappedValue.map(from: self.range, to: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset))
                                    }

                                    let sliderPos = max(0 + self.leadingOffset, min(self.lastOffset + value.translation.width, geometry.size.width - self.knobSize.width - self.trailingOffset))
                                    let sliderVal = sliderPos.map(from: self.leadingOffset...(geometry.size.width - self.knobSize.width - self.trailingOffset), to: self.range)

                                    self.value = sliderVal
                                }

                    )
                    Spacer()
                }
            }
        }
    }
}
}

struct SliderTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextFieldView()
    }
}

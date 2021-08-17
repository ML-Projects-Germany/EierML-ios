//
//  SliderTextFieldView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI

struct SliderTextFieldView: View {

    @State var sliderValue: Double
    @State var textValue: String = ""

    init(sliderValue: State<Double>) {
        self._sliderValue = sliderValue
    }

    var body: some View {
        HStack {
            TextField("Breite", text: $textValue)
                .onChange(of: textValue, perform: { value in
                    if let doubleValue = value.doubleValue {
                        sliderValue = doubleValue
                    }
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Slider(value: $sliderValue, in: 0...20)
                .onChange(of: sliderValue, perform: { value in
                    textValue = String(format: "%.1f", value)
                })
                .padding()
        }
    }
}

struct SliderTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextFieldView(sliderValue: State(wrappedValue: 0))
    }
}

extension String {
    struct NumFormatter {
        static let instance = NumberFormatter()
    }

    var doubleValue: Double? {
        return NumFormatter.instance.number(from: self)?.doubleValue
    }

    var integerValue: Int? {
        return NumFormatter.instance.number(from: self)?.intValue
    }
}

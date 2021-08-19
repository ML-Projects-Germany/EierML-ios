//
//  SliderTextFieldView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI
import Combine

struct SliderTextFieldView: View {

    @State var sliderValue: Double
    @State var textValue: String = ""

    @State var update: Bool = false

    init(sliderValue: State<Double>) {
        self._sliderValue = sliderValue
    }

    var body: some View {
        HStack {
            Picker(
                selection: .constant(1),
                label: Text("Picker")) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }
            .frame(maxWidth: 50)
            .pickerStyle(InlinePickerStyle())
            Slider(value: $sliderValue, in: 0...20)
                .onChange(of: sliderValue, perform: { value in
                    if !update {
                        update = true
                        textValue = String(format: "%.1f", value)
                        update = false
                    }
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

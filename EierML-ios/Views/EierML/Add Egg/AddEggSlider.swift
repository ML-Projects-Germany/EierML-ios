//
//  AddEggSlider.swift
//  EierML-ios
//
//  Created by Torben Köhler on 04.09.21.
//

import SwiftUI

struct AddEggSlider: View {
    let title: String
    @Binding var value: CGFloat
    let min: CGFloat
    let max: CGFloat
    let unit: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.body)
            Slider(
                value: $value,
                in: min...max
            ) {
                EmptyView()
            }
            HStack {
                Text("\(Int(min.rounded()))\(unit ?? "")")
                    .foregroundColor(.secondary)
                Text("\(Int(value.rounded()))\(unit ?? "")")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 5)
                Text("\(Int(max.rounded()))\(unit ?? "")")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color.black.opacity(0.05))
        .cornerRadius(10)
    }
}

struct AddEggSlider_Previews: PreviewProvider {
    static var previews: some View {
        AddEggSlider(title: "Höhe:", value: .constant(50), min: 40, max: 60, unit: "mm")
            .padding()
    }
}

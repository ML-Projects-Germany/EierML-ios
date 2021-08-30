//
//  NumberRow.swift
//  EierML-ios
//
//  Created by Torben Köhler on 30.08.21.
//

import SwiftUI

struct NumberRow: View {
    var number: String

    @Binding var selectedCell: String

    var body: some View {
        ZStack {
            Text(number)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .background(selectedCell == number ? Color.accentColor.opacity(0.6) : Color.white)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.accentColor, lineWidth: 3)
        )
        .shadow(color: .black.opacity(0.1), radius: 8)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedCell = number
            }
        }
    }
}

struct NumberRow_Previews: PreviewProvider {
    static var previews: some View {
        NumberRow(number: "1", selectedCell: .constant("1"))
            .frame(width: 100, height: 45)
    }
}

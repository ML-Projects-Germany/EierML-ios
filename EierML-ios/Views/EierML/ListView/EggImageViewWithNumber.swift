//
//  EggImageViewWithNumber.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

struct EggImageViewWithNumber: View {
    var number: Int
    var body: some View {
        ZStack {
            Image("egg bordered")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            Text("\(number)")
                .font(.body.bold())
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .frame(width: 20)
        }
    }
}

struct EggImageWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        EggImageViewWithNumber(number: 1)
    }
}

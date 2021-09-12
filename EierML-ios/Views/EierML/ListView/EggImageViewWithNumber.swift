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
        GeometryReader { reader in
            ZStack {
                Image("egg bordered")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: reader.size.width)
                Text("\(number)")
                    .font(.system(size: reader.size.width/5*2, weight: .bold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .frame(width: reader.size.width/2)
            }
        }
    }
}

struct EggImageWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        EggImageViewWithNumber(number: 18)
//            .frame(width: 40)
    }
}

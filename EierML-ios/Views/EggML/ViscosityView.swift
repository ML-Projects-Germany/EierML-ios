//
//  ViscosityView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 28.08.21.
//

import SwiftUI

struct ViscosityView: View {
    @State var sliderValue: Double = 0.2

    var body: some View {
        VStack {
            Text("Wie hart soll dein Ei werden?")
                .font(.headline)
            GeometryReader { reader in
                LazyVGrid(columns: [
                    GridItem(.fixed(reader.size.width/3-20)),
                    GridItem(.fixed(reader.size.width/3-20)),
                    GridItem(.fixed(reader.size.width/3-20))
                ], content: {
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }

    var maskView: some View {
        Image("egg")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }

}

struct ViscosityView_Previews: PreviewProvider {
    static var previews: some View {
        ViscosityView()
    }
}

// Spacer()
// ZStack {
//    GeometryReader { reader in
//        ZStack {
//            Group {
//                Color.gray.opacity(0.2)
//                Color.white.opacity(0.8)
//                    .frame(
//                        width: CGFloat(sliderValue)*reader.size.width,
//                        height: CGFloat(sliderValue)*reader.size.height
//                    )
//            }
//            .mask(maskView)
//        }
//    }
// }
// .frame(width: reader.size.width/1.2, height: reader.size.height/2.5)
// Spacer()
// ZStack {
//    Slider(value: $sliderValue, in: 0.3...0.97)
//        .frame(width: reader.size.width/1.2)
// }
// .frame(maxWidth: .infinity)
// Spacer()

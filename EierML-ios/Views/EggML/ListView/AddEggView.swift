//
//  AddEggView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI

struct AddEggView: View {

    @State var sliderValue: Double = 0

    var body: some View {
        VStack {
            ZStack {
                Image("egg")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 300, height: 450)
                    .foregroundColor(.white)
                    .opacity(0.6)
                VStack {
                    Text("\(getCentimeterForNormalPixels(300))")
                    Text("\(getNormalPixelsForCentimeter(getCentimeterForNormalPixels(300)))")
                }
            }
            SliderTextFieldView()
        }
    }

    func getCentimeterForNormalPixels(_ pixels: CGFloat) -> CGFloat {
        let nativeBoundsComposer = UIScreen.main.nativeBounds.width/UIScreen.main.bounds.width
        let nativeBounds = pixels*nativeBoundsComposer

        return nativeBounds/(UIScreen.pixelsPerCentimeter ?? 1)
    }

    func getNormalPixelsForCentimeter(_ centimeter: CGFloat) -> CGFloat {
        let nativeBounds = centimeter*(UIScreen.pixelsPerCentimeter ?? 1)
        let nativeBoundsComposer = UIScreen.main.nativeBounds.width/UIScreen.main.bounds.width

        return nativeBounds/nativeBoundsComposer
    }
}

struct AddEggView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            AddEggView()
        }
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            AddEggView()
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

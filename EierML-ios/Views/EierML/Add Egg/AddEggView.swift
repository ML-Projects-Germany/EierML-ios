//
//  AddEggView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI

struct AddEggView: View {
    @ObservedObject private var model: EggsViewModel

    /// 30-50
    @State private var widthValue: CGFloat
    /// 40-70
    @State private var heightValue: CGFloat
    /// 1-10
    private var viscosity: Int
    let eggNumber: Int

    init(model: EggsViewModel) {
        self._model = ObservedObject(wrappedValue: model)
        if let egg = model.editableEgg {
            self.viscosity = egg.viscosity
            self.widthValue = CGFloat(egg.width)
            self.heightValue = CGFloat(egg.height)
            self.eggNumber = egg.number
            print(egg.height)
            print(heightValue)
        } else {
            self.eggNumber = model.eggs.count+1
            self.widthValue = 40
            self.heightValue = 55
            self.viscosity = 5
        }
    }

    // ViscosityView
    @State var showViscosityView: Bool = true

    var body: some View {
        GeometryReader { reader in
            ZStack {
                NavigationView {
                    VStack {
                        Spacer()
                        Image("egg")
                            .renderingMode(.template)
                            .resizable()
                            .frame(
                                width: widthValue*pixelForMilimeter(),
                                height: heightValue*pixelForMilimeter()
                            )
                            .foregroundColor(.white)
                            .gradientForeground(colors: [
                                Color.Palette.blue,
                                Color.Palette.red
                            ])
                        .frame(width: reader.size.width, height: reader.size.height/3)
                        Spacer()
                        VStack {
                            AddEggSlider(title: "Höhe", value: $heightValue, min: 40, max: 70, unit: "mm")
                            AddEggSlider(title: "Breite", value: $widthValue, min: 30, max: 50, unit: "mm")
                        }
                        .padding()
                        Spacer().frame(height: 10)
                    }
                    .navigationBarItems(leading: quitButton, trailing: continueButton(screenSize: reader.size))
                }
            }
        }
    }

    private var quitButton: some View {
        Button(action: {
            withAnimation {
                model.dismissAddEggView()
            }
        }, label: {
            Text("Abbrechen")
                .fontWeight(.medium)
        })
    }

    private func continueButton(screenSize: CGSize) -> some View {
        NavigationButton {
            ViscosityView(
                number: eggNumber,
                height: Int(heightValue.rounded()),
                width: Int(widthValue.rounded()),
                model: model
            )
        } label: {
            Text("Weiter")
                .fontWeight(.bold)
        }
    }

    private func pixelForMilimeter() -> CGFloat {
        PixelConverter.getNormalPixelsForCentimeter(0.1)
    }
}

struct AddEggView_Previews: PreviewProvider {
    static var previews: some View {
        AddEggView(model: EggsViewModel())
        AddEggView(model: EggsViewModel())
            .previewDevice("iPod touch (7th generation)")
    }
}

// Egg(
//    number: model.eggs.count+1,
//    height: eggWidthInMilimeter(screenSize: screenSize),
//    width: eggHeightInMilimeter(screenSize: screenSize),
//    viscosity: viscosity
// )

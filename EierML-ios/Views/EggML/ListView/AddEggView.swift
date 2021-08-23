//
//  AddEggView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 17.08.21.
//

import SwiftUI

struct AddEggView: View {

    @State var widthValue: Double = 0.6
    @State var heightValue: Double = 0.7

    var body: some View {
        NavigationView {
            GeometryReader { reader in
                ClassicBackgroundView()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Image("egg")
                            .renderingMode(.template)
                            .resizable()
                            .frame(
                                width: CGFloat(widthValue)*reader.size.width,
                                height: CGFloat(heightValue)*reader.size.height/1.4
                            )
                            .foregroundColor(.white)
                            .opacity(0.6)
                        VStack(alignment: .leading) {
                            Text("Breite: \(getCentimeterForNormalPixels(CGFloat(widthValue)*reader.size.width))")
                            Text("Höhe: \(getCentimeterForNormalPixels(CGFloat(heightValue)*reader.size.height/1.4))")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .frame(width: reader.size.width, height: reader.size.height/2)
                    Spacer()
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Höhe")
                            .font(.body)
                        Slider(
                            value: $heightValue,
                            in: 0.2...1,
                            minimumValueLabel: Image(systemName: "minus"),
                            maximumValueLabel: Image(systemName: "plus")
                        ) {
                            EmptyView()
                        }
                        Spacer().frame(height: 15)
                        Text("Breite")
                            .font(.body)
                        Slider(
                            value: $widthValue,
                            in: 0.2...1,
                            minimumValueLabel: Image(systemName: "minus"),
                            maximumValueLabel: Image(systemName: "plus")
                        ) {
                            EmptyView()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    Spacer().frame(height: 30)
                }
            }
            .navigationBarItems(leading: quitButton, trailing: addButton)
        }
    }

    var quitButton: some View {
        Button(action: {

        }, label: {
            Text("Abbrechen")
                .fontWeight(.medium)
                .foregroundColor(.white)
        })
    }

    var addButton: some View {
        Button(action: {

        }, label: {
            Text("Hinzufügen")
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
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
        AddEggView()
        AddEggView()
        .previewDevice("iPod touch (7th generation)")
    }
}

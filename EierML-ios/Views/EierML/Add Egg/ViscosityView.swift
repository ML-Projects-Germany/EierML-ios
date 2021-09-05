//
//  ViscosityView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 28.08.21.
//

import SwiftUI

struct ViscosityView: View {
    @ObservedObject private var model: EggsViewModel

    @State private var selectedCell: String = "5"

    private let number: Int
    private let height: Int
    private let width: Int

    init(
        number: Int,
        height: Int,
        width: Int,
        model: EggsViewModel
    ) {
        self.number = number
        self.height = height
        self.width = width
        self._model = ObservedObject(wrappedValue: model)
    }

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            GeometryReader { reader in
                LazyVGrid(
                    columns: gridItems(
                        for: .fixed(reader.size.width/3-20),
                        count: 3
                    ),
                    alignment: .center,
                    content: {
                        ForEach(1..<11) { number in
                            NumberRow(number: "\(number)", selectedCell: $selectedCell)
                        }
                        .frame(height: 50)
                        .padding(5)
                })
            }
            .frame(height: 265)
            // swiftlint:disable:next line_length
            Text("Die meißten Menschen bevorzugen ein Ei bei dem das weiße noch hart und das gelbe weich ist, dies entspricht hier dem Wert \"5\". \"1\" ist noch roh und \"10\" ist richtig hart gekocht.")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
            Spacer()
        }
        .navigationTitle("Wie hart soll es sein?")
        .navigationBarItems(trailing: addButton)
    }

    private var addButton: some View {
        Button(action: {
            model.addEgg(
                Egg(
                    number: number,
                    height: height,
                    width: width,
                    viscosity: Int(selectedCell)!
                )
            )
            withAnimation {
                model.dismissAddEggView()
            }
        }, label: {
            Text("Hinzufügen")
        })
    }

    var maskView: some View {
        Image("egg")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }

    func gridItems(for size: GridItem.Size, count: Int) -> [GridItem] {
        var response: [GridItem] = []
        for _ in 0...count-1 {
            response.append(.init(size))
        }
        return response
    }

}

struct ViscosityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViscosityView(
                number: 1,
                height: 45,
                width: 30,
                model: EggsViewModel()
            )
        }
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

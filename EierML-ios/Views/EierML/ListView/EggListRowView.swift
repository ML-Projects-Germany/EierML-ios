//
//  EggListRowView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 23.08.21.
//

import SwiftUI

struct EggListRowView: View {
    @ObservedObject private var model: EggsViewModel
    private let egg: Egg

    private let width: CGFloat = 70
    @State private var offset = CGSize.zero
    @State private var scale: CGFloat = 0.5

    init(
        egg: Egg,
        model: EggsViewModel
    ) {
        self.egg = egg
        self._model = ObservedObject(wrappedValue: model)
    }

    var body: some View {
        GeometryReader { reader in
            Color.white
                .opacity(0.1)
                .cornerRadius(15)
            HStack(spacing: 0) {
                HStack {
                    EggImageViewWithNumber(number: egg.number)
                        .frame(width: 40, height: 40)
                        .padding(5)
                    VStack(alignment: .leading) {
                        Text("\(egg.height)mm x \(egg.width)mm")
                            .fontWeight(.medium)
                        Text("Härte: \(egg.viscosity)")
                            .fontWeight(.medium)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Label(egg.timeString, systemImage: "clock")
                        .font(.body.bold())
                        .padding(.trailing)
                }
                .foregroundColor(.white)
                .frame(width: reader.size.width, alignment: .leading)
                ZStack {
                    Image(systemName: "trash")
                        .foregroundColor(Color.Palette.red)
                }
                .frame(width: reader.size.height, height: reader.size.height)
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding(.leading, 10)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.scale = 0.5
                        self.offset = .zero
                    }
                    trashTapped()
                }
            }
        }
        .frame(height: 70)
        .offset(self.offset)
        .gesture(DragGesture()
                    .onChanged { gesture in
                        withAnimation(.spring()) {
                            self.offset.width = gesture.translation.width
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            if self.offset.width < -50 {
                                self.scale = 1
                                self.offset.width = -width-15
                            } else {
                                self.scale = 0.5
                                self.offset = .zero
                            }
                        }
                    }
        )
        .onTapGesture {
            model.showAddEggView(with: egg)
        }
    }

    func trashTapped() {
        withAnimation {
            model.deleteEgg(number: egg.number)
        }
    }
}

struct EggListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
            EggListRowView(egg: .mock, model: EggsViewModel())
        }
        ZStack {
            ClassicBackgroundView()
            EggListRowView(egg: .mock, model: EggsViewModel())
        }
        .previewDevice("iPod touch (7th generation)")
    }
}

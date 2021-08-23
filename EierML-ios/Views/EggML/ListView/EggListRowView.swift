//
//  EggListRowView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 23.08.21.
//

import SwiftUI

struct EggListRowView: View {
    let egg: Egg

    let width: CGFloat = 70

    @State var offset = CGSize.zero
    @State var scale: CGFloat = 0.5

    var body: some View {
        GeometryReader { geo in
            Color.white
                .opacity(0.1)
                .cornerRadius(15)
            HStack(spacing: 0) {
                HStack {
                    ZStack {
                        Image("egg bordered")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                        Text("\(egg.number)")
                            .font(.body.bold())
                            .lineLimit(1)
                            .minimumScaleFactor(0.01)
                            .frame(width: 20)
                    }
                    .padding(5)
                    Text("\(egg.size)mm x \(egg.size)mm")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Label("\(egg.timeInMinutes) min", systemImage: "clock")
                        .font(.body.bold())
                        .padding(.trailing)
                }
                .foregroundColor(.white)
                .frame(width: geo.size.width, alignment: .leading)

                ZStack {
                    Image(systemName: "trash")
                        .foregroundColor(Color.Palette.red)
                }
                .frame(width: geo.size.height, height: geo.size.height)
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding(.leading, 10)
                .onTapGesture {
                    self.scale = 0.5
                    self.offset = .zero
                    trashTapped()
                }
            }
        }
        .frame(height: 70)
        .offset(self.offset)
        .animation(.spring())
        .gesture(DragGesture()
              .onChanged { gesture in
                           self.offset.width = gesture.translation.width
                          }
              .onEnded { _ in
                         if self.offset.width < -50 {
                                self.scale = 1
                                self.offset.width = -width-15
                          } else {
                                self.scale = 0.5
                                self.offset = .zero
                         }
                       }
                )
        .onTapGesture {
            self.scale = 1
            self.offset.width = -width-15
        }
    }

    func trashTapped() {

    }
}

struct EggListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
//                .opacity(0.5)
            EggListRowView(egg: .mock)
        }
    }
}

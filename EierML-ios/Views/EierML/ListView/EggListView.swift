//
//  EggListView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI

struct EggListView: View {
    @ObservedObject private var model: EggsViewModel

    init(model: EggsViewModel) {
        self._model = ObservedObject(wrappedValue: model)
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ZStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation(.spring()) {
                                        model.eggTutorialIsShown = true
                                    }
                                }, label: {
                                    Image(systemName: "info.circle")
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                        .padding(.trailing, 10)
                                })
                                .frame(maxHeight: .infinity)
                            }
                            Text("Deine Eier")
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                        }
                        ForEach(model.eggs) { egg in
                            EggListRowView(egg: egg, model: model)
                        }
                        Button(action: {
                            model.showAddEggView()
                        }, label: {
                            HStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 30)
                                    .padding([.vertical], 10)
                                Text("Ei hinzufügen")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                        })
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(5)
                }
                VStack {
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .frame(maxWidth: .infinity, maxHeight: reader.safeAreaInsets.top)
                        .offset(x: 0, y: -reader.safeAreaInsets.top)
                    Spacer()
                }
            }
        }
    }

    var seperator: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 2)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct EggListView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EggListView(model: EggsViewModel())
        }
    }
}

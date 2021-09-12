//
//  EierMLTutorialView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI
import SwiftUIPager

struct EierMLTutorialView: View {
    @ObservedObject private var model: EggsViewModel
    @StateObject private var viewModel: EierMLTutorialViewModel

    @StateObject private var page: Page = .first()

    init(model: EggsViewModel) {
        self._model = ObservedObject(wrappedValue: model)
        self._viewModel = StateObject(wrappedValue: EierMLTutorialViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.1), radius: 8)
                ClassicBackgroundView()
                    .ignoresSafeArea()
                Pager(page: page, data: viewModel.tutorialSheets, id: \.id) { tutorialSheet in
                    TutorialSheetView(tutorialSheet, dismissTutorial: $model.eggTutorialIsShown)
                }
                .preferredItemSize(CGSize(width: .greatestFiniteMagnitude, height: reader.size.height/2))
                .itemSpacing(20)
                .interactive(opacity: 0.5)
                .vertical()
                .sensitivity(.high)
                .shadow(color: .black.opacity(0.15), radius: 10)
                .padding(.horizontal, 20)
                .ignoresSafeArea()
                VStack {
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .frame(maxWidth: .infinity, maxHeight: reader.safeAreaInsets.top+55)
                        .offset(x: 0, y: -reader.safeAreaInsets.top)
                    Spacer()
                }
                VStack {
                    ZStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation(.spring()) {
                                    model.eggTutorialIsShown = false
                                }
                            }, label: {
                                Text("Überspringen")
                            })
                            .padding([.top, .trailing])
                        }
                        Text("Tutorial")
                            .font(.title.bold())
                            .padding(.top)
                            .frame(height: 50)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct EierMLTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView(model: EggsViewModel())
        }
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView(model: EggsViewModel())
        }
            .previewDevice("iPod touch (7th generation)")
    }
}

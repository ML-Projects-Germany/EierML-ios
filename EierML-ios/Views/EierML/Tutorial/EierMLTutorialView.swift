//
//  EierMLTutorialView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI
import SwiftUIPager

struct EierMLTutorialView: View {
    @StateObject private var model: EierMLTutorialViewModel

    @StateObject private var page: Page = .first()

    @Binding var dismissTutorial: Bool

    init(dismissTutorial: Binding<Bool>) {
        self._dismissTutorial = dismissTutorial
        self._model = StateObject(wrappedValue: EierMLTutorialViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color.primary.colorInvert()
                    .ignoresSafeArea()
                    .shadow(color: .black.opacity(0.1), radius: 8)
                ClassicBackgroundView()
                    .ignoresSafeArea()
                Pager(page: page, data: model.tutorialSheets, id: \.id) { tutorialSheet in
                    TutorialSheetView(tutorialSheet, dismissTutorial: $dismissTutorial)
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
                                withAnimation(.easeInOut) {
                                    dismissTutorial = true
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
            EierMLTutorialView(dismissTutorial: .constant(true))
        }
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            EierMLTutorialView(dismissTutorial: .constant(true))
        }
            .previewDevice("iPod touch (7th generation)")
    }
}

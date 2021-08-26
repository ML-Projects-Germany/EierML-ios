//
//  EggsView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EggsView: View {
    @StateObject private var model: EggsViewModel
    @State private var showTutorial: Bool = false
    @State private var showAddEggView: Bool = false
    init() {
        self._model = StateObject(wrappedValue: EggsViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                ClassicBackgroundView()
                    .ignoresSafeArea()
                ZStack {
                    if showTutorial {
                        EierMLTutorialView()
                            .transition(.move(edge: .leading))
                            .zIndex(1.0)
                    } else {
                        EggListView(
                            model: model,
                            showAddEggView: $showAddEggView
                        )
                        .transition(.move(edge: .leading))
                        .blur(radius: showTutorial ? 3 : 0)
                    }
                }
                .animation(.easeInOut)
                .sheet(isPresented: $showAddEggView, content: {
                    AddEggView(model: model)
                })
                VStack {
                    VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                        .frame(maxWidth: .infinity, maxHeight: reader.safeAreaInsets.top)
                        .offset(x: 0, y: -reader.safeAreaInsets.top)
                    Spacer()
                }
            }
        }
    }
}

struct EggsView_Previews: PreviewProvider {
    static var previews: some View {
        EggsView()
    }
}

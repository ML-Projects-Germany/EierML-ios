//
//  EggsView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EggsView: View {
    @StateObject private var model: EggsViewModel
    @State private var showAddEggView: Bool = false

    init() {
        self._model = StateObject(wrappedValue: EggsViewModel())
    }

    var body: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            ZStack {
                if model.eggTutorialIsShown {
                    EggListView(
                        model: model,
                        showAddEggView: $showAddEggView,
                        dismissTutorial: $model.eggTutorialIsShown
                    )
                } else {
                    EierMLTutorialView(
                        dismissTutorial: $model.eggTutorialIsShown
                    )
                    .zIndex(1.0)
                    .transition(.move(edge: .leading))
                }
            }
            .sheet(isPresented: $showAddEggView, content: {
                AddEggView(model: model)
            })
        }
    }
}

struct EggsView_Previews: PreviewProvider {
    static var previews: some View {
        EggsView()
        EggsView()
            .previewDevice("iPod touch (7th generation)")
    }
}

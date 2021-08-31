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

    @State private var editableEgg: Egg?

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
            .fullScreenCover(isPresented: $showAddEggView, content: {
                if let editableEgg = editableEgg {
                    AddEggView(
                        model: model,
                        egg: editableEgg
                    )
                } else {
                    AddEggView(model: model)
                }
            })
            .onReceive(model.showEditEggView, perform: { egg in
                editableEgg = egg
                showAddEggView = true
                editableEgg = nil
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

//
//  EggsView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EggsView: View {
    @StateObject private var model: EggsViewModel
    @State private var dismissTutorial: Bool = false
    @State private var showAddEggView: Bool = false

    init() {
        self._model = StateObject(wrappedValue: EggsViewModel())
    }

    var body: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
            ZStack {
                if dismissTutorial {
                    EggListView(
                        model: model,
                        showAddEggView: $showAddEggView
                    )
                    .opacity(dismissTutorial ? 1 : 0)
                } else {
                    EierMLTutorialView(
                        dismissTutorial: $dismissTutorial
                    )
                    .zIndex(1.0)
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

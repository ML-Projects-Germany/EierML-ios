//
//  EggListView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI

struct EggListView: View {
    @StateObject var model: EggListViewModel

    @State var showAddEggView: Bool

    init(showAddEggView: State<Bool>) {
        self._model = StateObject(wrappedValue: EggListViewModel())
        self._showAddEggView = showAddEggView
    }

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Deine Eier")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                ForEach(model.eggs) { egg in
                    EggListRowView(egg: egg)
                }
                Button(action: {
                    showAddEggView = true
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
            EggListView(showAddEggView: State(wrappedValue: true))
        }
    }
}

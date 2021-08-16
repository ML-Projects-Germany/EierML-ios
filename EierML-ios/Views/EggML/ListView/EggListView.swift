//
//  EggListView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 16.08.21.
//

import SwiftUI

struct EggListView: View {
    @StateObject var model: EggListViewModel

    @State var showAddEggView: Bool = false

    init() {
        self._model = StateObject(wrappedValue: EggListViewModel())
    }

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack {
                    ForEach(model.eggs) { egg in
                        Text("Hello")
                    }
                    Button(action: {
                        showAddEggView = true
                    }, label: {
                        HStack {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(10)
                            Text("Ei hinzufügen")

                        }
                        .font(.headline)
                        .foregroundColor(.white)
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                if showAddEggView {
                    ZStack {
                        Color.primary.colorInvert()
                        Text("Hello")
                    }
                    .frame(
                        width: reader.size.width/3*2,
                        height: reader.size.width/3*2.1, alignment: .center
                    )
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                }
            }
        }
    }
}

struct EggListView_Previews: PreviewProvider {
    static var previews: some View {
        EggListView()
    }
}

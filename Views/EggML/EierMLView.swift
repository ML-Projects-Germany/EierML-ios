//
//  EierMLView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.08.21.
//

import SwiftUI

struct EierMLView: View {
    @StateObject var model: EierMLViewModel

    @State var showAddEggView: Bool = true

    init() {
        self._model = StateObject(wrappedValue: EierMLViewModel())
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
                        .foregroundColor(.accentColor)
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

struct EggMLView_Previews: PreviewProvider {
    static var previews: some View {
        EierMLView()
    }
}

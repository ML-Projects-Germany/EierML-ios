//
//  EggCardView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 05.07.22.
//

import SwiftUI

extension View {
    func optionalMatchedGeometryEffecty<ID>(id: ID?, in namespace: Namespace.ID?) -> some View where ID: Hashable {
        guard let id = id, let namespace = namespace else {
            return AnyView(self)
        }
        return AnyView(self.matchedGeometryEffect(id: id, in: namespace))
    }
}

struct EggCardView: View {
    private var egg: Egg
    private var namespace: Namespace.ID?
    private var eggImageId: String?

    init(egg: Egg) {
        self.egg = egg
    }

    var body: some View {
        HStack {
            Image("egg")
                .resizable()
                .optionalMatchedGeometryEffecty(id: eggImageId, in: namespace)
                .frame(width: 40, height: 50)
                .overlay {
                    Text("\(egg.number)")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.4), radius: 4)
                        .offset(y: 1)
                        .transition(.scale)
                }
                .frame(width: 50, height: 50)
            HStack(spacing: 5) {
                VStack(alignment: .leading) {
                    Text("Höhe:")
                    Text("Breite:")
                }
                VStack(alignment: .trailing) {
                    Text("\(egg.height)mm").fontWeight(.medium)
                    Text("\(egg.width)mm").fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("Zeit: **\(egg.timeString)**")
        }
        .foregroundColor(.white)
        .shadow(color: .black.opacity(0.1), radius: 4)
        .padding(14)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
    }

    func eggImageMatchedGeometryEffect(id: String, in namespace: Namespace.ID) -> some View {
        var view = self
        view.eggImageId = id
        view.namespace = namespace
        return view
    }
}

struct EggCardTestView: View {
    @Namespace var namespace
    @State var show: Bool = true

    var body: some View {
        ZStack {
            AppBackground()
            VStack {
                if show {
                    Image("egg")
                        .resizable()
                        .matchedGeometryEffect(id: "egg", in: namespace)
                        .frame(width: 200, height: 300)
                } else {
                    EggCardView(egg: .mock)
                        .eggImageMatchedGeometryEffect(id: "egg", in: namespace)
                        .padding()
                }
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct EggCard_Previews: PreviewProvider {
    static var previews: some View {
        EggCardTestView()
    }
}

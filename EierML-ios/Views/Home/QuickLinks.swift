//
//  QuickLinks.swift
//  EierML-ios
//
//  Created by Torben Köhler on 07.12.21.
//

import SwiftUI

struct QuickLinks: View {
    var body: some View {
        VStack {
            // MARK: Mehr über EierML lernen
            Label(
                title: { Text("Mehr über EierML lernen") },
                icon: {
                    Image("egg")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
            )
            .font(.headline)
            .foregroundColor(.primary.opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            EierMLBandages()
                .padding(.vertical, 10)
            // MARK: Mehr über Machine learning lernen
            Label(
                title: { Text("Mehr über Machine learning lernen") },
                icon: { Image(systemName: "graduationcap") }
            )
            .font(.headline)
            .foregroundColor(.primary.opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            MLProjectsBandages()
                .padding(.vertical, 10)
        }
    }
}

struct QuickLinks_Previews: PreviewProvider {
    static var previews: some View {
        QuickLinks()
    }
}

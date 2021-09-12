//
//  Bandage.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

struct Bandage: View {
    var title: String
    var systemImage: String
    var subtitle: String
    var link: String
    var linkColor: Color = .accentColor

    var body: some View {
        Link(destination: URL(staticString: link), label: {
            HStack(spacing: 0) {
                Image(systemName: systemImage)
                    .imageScale(.large)
                    .frame(width: 28)
                    .padding()
                    .foregroundColor(linkColor)
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary.opacity(0.8))
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundColor(.primary.opacity(0.5))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "chevron.forward")
                    .foregroundColor(linkColor)
                    .padding()
            }
            .frame(minHeight: 65, alignment: .center)
            .background(
                ZStack {
                    Color(UIColor.systemBackground)
                    linkColor.opacity(0.1)
                }
            )
            .cornerRadius(15)
            .padding(.horizontal)
        })
    }
}

struct Bandage_Previews: PreviewProvider {
    static var previews: some View {
        Bandage(
            title: "Bandage",
            systemImage: "globe",
            subtitle: "Subtitle goes like this",
            link: "https://google.de"
        )
    }
}

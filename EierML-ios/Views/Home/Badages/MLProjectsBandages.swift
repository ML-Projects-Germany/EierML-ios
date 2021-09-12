//
//  MLProjectsBandages.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

struct MLProjectsBandages: View {
    var body: some View {
        VStack(spacing: 12) {
            Bandage(
                title: "ML-Projects",
                systemImage: "graduationcap",
                subtitle: "Hier findest du alles über ML-Projects",
                link: "https://eierml.ml-projects.de",
                linkColor: Color(hex: "#FEBC12")
            )
            Bandage(
                title: "Blog",
                systemImage: "note.text",
                subtitle: "Alle Artikel zur unseren Projekten",
                link: "https://ml-projects.de/blog/",
                linkColor: Color(hex: "#06EDC4")
            )
            Bandage(
                title: "#Team",
                systemImage: "person.3",
                subtitle: "Unser Team",
                link: "https://eierml.ml-projects.de/ueber-uns/",
                linkColor: Color(hex: "#FF4B40")
            )
        }
    }
}

struct MLProjectsBandages_Previews: PreviewProvider {
    static var previews: some View {
        MLProjectsBandages()
    }
}

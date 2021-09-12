//
//  EierMLBandages.swift
//  EierML-ios
//
//  Created by Torben Köhler on 12.09.21.
//

import SwiftUI

struct EierMLBandages: View {
    var body: some View {
        VStack(spacing: 12) {
            Bandage(
                title: "Eier-ML",
                systemImage: "globe",
                subtitle: "Unsere Webseite",
                link: "https://eierml.ml-projects.de"
            )
            Bandage(
                title: "Blog",
                systemImage: "note.text",
                subtitle: "Alle Artikel zur ML und der App",
                link: "https://eierml.ml-projects.de/blog/"
            )
            Bandage(
                title: "GitHub",
                systemImage: "terminal",
                subtitle: "Der Code hinter der App",
                link: "https://github.com/tkoehlerlg/EierML-ios"
            )
        }
    }
}

struct EierMLBandages_Previews: PreviewProvider {
    static var previews: some View {
        EierMLBandages()
    }
}

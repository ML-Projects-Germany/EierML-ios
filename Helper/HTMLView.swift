//
//  HTMLView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 08.08.21.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    var htmlString: String
    var baseURL: URL?
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.loadHTMLString(htmlString, baseURL: baseURL)
    }
}

struct HTMLView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLView(htmlString: "Hello", baseURL: nil)
    }
}

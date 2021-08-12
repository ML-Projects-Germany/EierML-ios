//
//  WebView.swift
//  SamedayHealth-ios
//
//  Created by Marius Seufzer on 28.04.21.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL
    let cookies: [HTTPCookie]?

    @Binding var isLoading: Bool {
        willSet {
            print("changed \(newValue)")
        }
    }

    // MARK: Coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(isLoading: self.$isLoading)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding private var isLoading: Bool

        init(isLoading: Binding<Bool>) {
            self._isLoading = isLoading
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            isLoading = false
        }
    }

    // MARK: View
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        // Coordinator
        webView.navigationDelegate = context.coordinator

        // Cookies
        cookies?.forEach({ cookie in
            webView.configuration.websiteDataStore.httpCookieStore.setCookie(cookie, completionHandler: nil)
        })

        webView.load(URLRequest(url: url))
        isLoading = true

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(staticString: "https://google.com"), cookies: nil, isLoading: .constant(false))
    }
}

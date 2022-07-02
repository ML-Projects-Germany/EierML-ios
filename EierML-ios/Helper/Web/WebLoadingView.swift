import Foundation
import UIKit
import SwiftUI

struct WebLoadingView<Content>: View where Content: View {
    @Binding var isShown: Bool
    var content: () -> Content
    var body: some View {
        ZStack {
            self.content()
                .disabled(self.isShown)
                .blur(radius: self.isShown ? 3 : 0)
                .animation(.easeInOut, value: self.isShown)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .frame(width: 100, height: 100)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
                .opacity(self.isShown ? 1 : 0)
                .animation(.easeInOut, value: self.isShown)
        }
    }
}

//
//  WebForm.swift
//  SamedayHealth-ios
//
//  Created by Torben Köhler on 04.06.21.
//

import Foundation
import UIKit
import SwiftUI

struct WebLoadingView<Content>: View where Content: View {
    @Binding var isShown: Bool {
        willSet {
            print("changed loading \(newValue)")
        }
    }
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.content()
                    .disabled(self.isShown)
                    .blur(radius: self.isShown ? 3 : 0)
                    .animation(.easeInOut)
                ZStack(alignment: .center) {
//                    LottieView(name: "Sameday-Logo-Loading", loopMode: .loop)
//                        .padding()
                }
                .frame(width: geometry.size.width/1.9, height: geometry.size.width/1.9)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.1), radius: 5)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .opacity(self.isShown ? 1 : 0)
                .animation(.easeInOut)
            }
        }
    }
}

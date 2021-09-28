//
//  AlertView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 15.09.21.
//

import SwiftUI

struct AlertView: View {
    let model: AlertViewModel
    var action: () -> Void
    let closeTriggered: () -> Void

    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack(spacing: 0) {
                    Text(model.title)
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding([.horizontal, .top], 20)
                    Text(model.description)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                        .padding(.bottom)
                    HStack {
                        Spacer()
                        Button(action: {
                            action()
                            closeTriggered()
                        }, label: {
                            Text(model.primaryButtonTitle)
                        })
                        .buttonStyle(SecondaryButtonStyle(color: .Palette.red))
                        Spacer()
                        Button(action: {
                            closeTriggered()
                        }, label: {
                            Text("Abbrechen")
                        })
                        .buttonStyle(SecondaryButtonStyle(color: .Palette.red))
                        Spacer()
                    }
                    .padding()
                }
                .frame(width: reader.size.width/5*4, alignment: .center)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }

    }

//    @ViewBuilder
//    private var content: some View {
//        Text("")
//    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ClassicBackgroundView()
                .ignoresSafeArea()
        }
        .alertView(
            title: "Log out?",
            description: "You are about to log out",
            primaryButtonTitle: "Log out",
            show: .constant(true),
            action: {}
        )
    }
}

//
//  PlaygroundView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.07.22.
//

import SwiftUI
import ComposableArchitecture

struct VerticalCustomSlider: View {
    @Binding private var dragValueY: Double
    @GestureState private var isDragged: Bool = false

    init(value: Binding<Double>) {
        self._dragValueY = value
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color(hex: "#5E5E5E")
                            .opacity(isDragged ? 1 : 0.5))
                        .animation(.easeIn.speed(2.5), value: isDragged)
                        .padding(.top, dragValueY >= 1 ? 14 : 5)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .top
                        )
                }
                .background(.white)
                .offset(y: geometry.size.height-self.circleOffset(frame: geometry.size))
            }
            .background(.ultraThinMaterial)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged({ value in
                    withAnimation(.easeOut.speed(1.2)) {
                        self.dragValueY = max(0, min(1, (geometry.size.height-value.location.y)/geometry.size.height))
                    }
                })
                .updating($isDragged, body: { _, isDragged, _ in
                    if !isDragged {
                        isDragged = true
                        let generator = UIImpactFeedbackGenerator(style: .soft)
                        generator.impactOccurred()
                    }
                })
                .onEnded({ _ in
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                })
            )
            .cornerRadius(geometry.size.height/2)
        }
    }

    func circleOffset(frame: CGSize) -> CGFloat {
        return (dragValueY*(frame.height-25))+25
    }
}

struct VerticalCustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AppBackground()
            EggSizeView(store: Store(
                initialState: .init(
                    heightSliderValue: 0.5,
                    widthSliderValue: 0.5
                ),
                reducer: eggSizeViewReducer,
                environment: ()
            ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
        ZStack {
            AppBackground()
            EggSizeView(store: Store(
                initialState: .init(
                    heightSliderValue: 0.5,
                    widthSliderValue: 0.5
                ),
                reducer: eggSizeViewReducer,
                environment: ()
            ))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

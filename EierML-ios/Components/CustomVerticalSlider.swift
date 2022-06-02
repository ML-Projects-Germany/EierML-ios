//
//  CustomVerticalSlider.swift
//  EierML-ios
//
//  Created by Torben Köhler on 02.06.22.
//

import SwiftUI


struct CustomVerticalSliderComponents {
    let barBottom: CustomVerticalSliderModifier
    let barTop: CustomVerticalSliderModifier
    let knob: CustomVerticalSliderModifier
}

struct CustomVerticalSliderModifier: ViewModifier {
    enum Name {
        case barBottom
        case barTop
        case knob
    }
    let name: Name
    let size: CGSize
    let offset: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(height: size.height)
            .position(x: size.width*0.5, y: size.height*0.5)
            .offset(y: offset)
    }
}

struct CustomVerticalSlider<Component: View>: View {
    @Binding var value: Double
    var range: (Double, Double)
    var knobHeight: CGFloat?
    let viewBuilder: (CustomVerticalSliderComponents) -> Component

    init(value: Binding<Double>, range: (Double, Double), knobHeight: CGFloat? = nil,
         _ viewBuilder: @escaping (CustomVerticalSliderComponents) -> Component
    ) {
        _value = value
        self.range = range
        self.viewBuilder = viewBuilder
        self.knobHeight = knobHeight
    }

    var body: some View {
        return GeometryReader { geometry in
            self.view(geometry: geometry) // function below
        }
    }

    private func view(geometry: GeometryProxy) -> some View {
        let frame = geometry.frame(in: .global)
        let drag = DragGesture(minimumDistance: 0).onChanged({ drag in
            self.onDragChange(drag, frame) }
        )

        let offsetY = self.getOffsetY(frame: frame)

        let knobSize = CGSize(width: knobHeight ?? frame.width, height: frame.width)
        let barBottomSize = CGSize(width: frame.width, height: CGFloat(offsetY + knobSize.height * 0.5))
        let barTopSize = CGSize(width: frame.width, height: frame.height - barBottomSize.height)

        let modifiers = CustomVerticalSliderComponents(
            barBottom: CustomVerticalSliderModifier(name: .barBottom, size: barBottomSize, offset: barTopSize.height),
            barTop: CustomVerticalSliderModifier(name: .barTop, size: barTopSize, offset: barBottomSize.height),
            knob: CustomVerticalSliderModifier(name: .knob, size: knobSize, offset: offsetY))

        return ZStack { viewBuilder(modifiers).gesture(drag) }
    }

    private func onDragChange(_ drag: DragGesture.Value, _ frame: CGRect) {
        let height = (knob: Double(knobHeight ?? frame.size.width), view: Double(frame.size.height))
        let yrange = (min: Double(0), max: Double(height.view - height.knob))
        var value = Double(drag.startLocation.y + drag.translation.height) // knob center y
        value -= 0.5*height.knob // offset from center to leading edge of knob
        value = value > yrange.max ? yrange.max : value // limit to leading edge
        value = value < yrange.min ? yrange.min : value // limit to trailing edge
        value = value.convert(fromRange: (yrange.min, yrange.max), toRange: range)
        withAnimation(.easeOut) {
            self.value = 100 - value
        }
    }

    private func getOffsetY(frame: CGRect) -> CGFloat {
        let height = (knob: knobHeight ?? frame.size.width, view: frame.size.height)
        let yrange: (Double, Double) = (Double(height.view - height.knob), 0)
        let result = (100 - self.value).convert(fromRange: range, toRange: yrange)
        return CGFloat(result)
    }
}

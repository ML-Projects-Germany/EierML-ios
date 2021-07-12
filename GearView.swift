//
//  GearView.swift
//  EierML-ios
//
//  Created by Torben Köhler on 11.07.21.
//

import SwiftUI

struct GearView: View {
    @State var temperatureValue: CGFloat = 0.0
    @State var angleValue: CGFloat = 0.0
    var config: Config
    var body: some View {
        ZStack {
            Circle()
                .frame(width: config.radius * 2, height: config.radius * 2)
                .scaleEffect(1.2)
                .foregroundColor(Color.Palette.red)

            Circle()
                .trim(from: 0.0, to: temperatureValue/config.totalValue)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                .frame(width: config.radius * 1.9, height: config.radius * 2)
                .rotationEffect(.degrees(-90))

//            Circle()
//                .trim(from: 0.0, to: temperatureValue/config.totalValue)
//                .stroke(temperatureValue < config.maximumValue/2 ? Color.blue : Color.red, lineWidth: 4)
//                .frame(width: config.radius * 2, height: config.radius * 2)
//                .rotationEffect(.degrees(-90))

            Circle()
                .fill(Color.white)
                .shadow(radius: 10)
                .frame(width: config.knobRadius * 2, height: config.knobRadius * 2)
                .offset(y: -config.radius+7)
                .rotationEffect(Angle.degrees(Double(angleValue)))
                .gesture(DragGesture(minimumDistance: 0.0)
                            .onChanged({ value in
                                change(location: value.location)
                            }))

            Text("\(String.init(format: "%.0f", temperatureValue)) º")
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
    }

    private func change(location: CGPoint) {
        // creating vector from location point
        let vector = CGVector(dx: location.x, dy: location.y)

        // geting angle in radian need to subtract the knob radius and padding from the dy and dx
        let angle = atan2(vector.dy - (config.knobRadius + 10), vector.dx - (config.knobRadius + 10)) + .pi/2.0

        // convert angle range from (-pi to pi) to (0 to 2pi)
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        // convert angle value to temperature value
        let value = fixedAngle / (2.0 * .pi) * config.totalValue

        if value >= config.minimumValue && value <= config.maximumValue {
            temperatureValue = value
            angleValue = fixedAngle * 180 / .pi // converting to degree
        }
    }
}

struct Config {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
    let knobRadius: CGFloat
    let radius: CGFloat
}

struct GearView_Preview: PreviewProvider {
    static var previews: some View {
        GearView(config: Config(minimumValue: -30.0,
                                maximumValue: 30.0,
                                totalValue: 100.0,
                                knobRadius: 15.0,
                                radius: 125.0)
        )
            .padding()
    }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

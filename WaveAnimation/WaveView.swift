//
//  WaveView.swift
//  WaveAnimation
//
//  Created by leadIosDev on 07/03/21.
//

import SwiftUI

struct WaveView: Shape {
    var yOffSet: CGFloat = 1
    var animatableData: CGFloat {
        get {return yOffSet}
        set { yOffSet = newValue}
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let midPoint = rect.height / 2
            path.move(to: CGPoint(x: 0, y: midPoint))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.height, y: midPoint))
            path.addCurve(to: CGPoint(x: 0, y: midPoint), control1: CGPoint(x: rect.maxX * 0.75, y: rect.midY - (rect.midY * yOffSet)), control2: CGPoint(x: rect.maxX * 0.25, y: rect.midY + (rect.midY * yOffSet)))
        }
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

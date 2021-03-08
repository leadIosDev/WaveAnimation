//
//  ContentView.swift
//  WaveAnimation
//
//  Created by Lead_iOS on 07/03/21.
//

import SwiftUI

struct ContentView: View {
    let gred = LinearGradient(gradient: Gradient(colors: [Color("color1"), Color("color2")]), startPoint: .bottom, endPoint: .top)
    let gred1 = LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("color2")]), startPoint: .bottom, endPoint: .top)
    @State var startAnimating: Bool = false
    var body: some View {
        ZStack {
            ZStack {
                WaveView(yOffSet: self.startAnimating ? -0.25: 0.25)
                    .fill(gred1)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.5))
                    .offset(y: -20)
                
                WaveView(yOffSet: self.startAnimating ? -0.5: 0.5)
                    .fill(Color("Color4"))
                    .opacity(0.5)
                    
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true).delay(0.8))
                    .offset(y: -10)
                    
                WaveView(yOffSet: self.startAnimating ? -0.75: 0.75)
                    .fill(Color("Color3"))
                    .animation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: true).delay(1.2))
            }
            .frame(width: 300, height: 300)
            .background(gred)
            .mask( Circle().frame(width: 300, height: 300))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea())
        .onAppear() {
            self.startAnimating = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

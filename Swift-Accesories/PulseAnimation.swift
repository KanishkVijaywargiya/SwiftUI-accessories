//
//  PulseAnimation.swift
//  Swift-Accesories
//
//  Created by KANISHK VIJAYWARGIYA on 14/12/21.
//

import SwiftUI

struct PulseAnimation: View {
    var body: some View {
        Loading()
    }
}

struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation()
    }
}

struct Loading: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Circle().fill(Color.green.opacity(0.25)).frame(width: 350, height: 350).scaleEffect(self.animate ? 1 : 0)
            
            Circle().fill(Color.green.opacity(0.35)).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
            
            Circle().fill(Color.green.opacity(0.45)).frame(width: 150, height: 150).scaleEffect(self.animate ? 1 : 0)
            
            Circle().fill(Color.green).frame(width: 30, height: 30)
        }.onAppear {
            self.animate = true
        }
        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
    }
}

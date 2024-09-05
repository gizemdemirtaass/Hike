//
//  CustomCircleView.swift
//  Hike
//
//  Created by gizem demirtas on 31.07.2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        //GRADIENT COLOR ANIMATION
        ZStack {
            
            Circle()
                .fill(
                      LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomLeading : .topLeading)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        } //: ZSTACK
        .frame(width: 256 , height: 256)
        .mask(Circle())
        .
    ()
    }
}

#Preview {
    CustomCircleView()
}

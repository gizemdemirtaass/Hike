//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by gizem demirtas on 29.07.2024.
//

import SwiftUI


struct CustomBackgroundView: View {
    
    var body: some View {
        
        //MARK: - CARD
        ZStack {
            //MARK : - 3.DEPTH
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y:12)
            
            
            //MARK : - 2.LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
                .opacity(0.85)
            
            //MARK : - 1.SURFACE
            
            
            LinearGradient(colors: [
                .customGreenLight,
                .customGreenMedium],
                           startPoint: .topLeading,
                           endPoint: .bottomLeading
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}

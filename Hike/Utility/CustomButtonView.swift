//
//  CustomButtonView.swift
//  Hike
//
//  Created by gizem demirtas on 30.07.2024.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors:
                        [.white,
                        .customGreenLight,
                        .customGreenMedium],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            Circle()
                .stroke(LinearGradient(colors:  //stroke için yeniden circle oluşturmalısın!!
                [
                .customGrayLight,
                .customGrayMedium
                ],
                startPoint: .top,
                endPoint: .bottom),
                lineWidth: 4)
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
        } // : ZSTACK
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}

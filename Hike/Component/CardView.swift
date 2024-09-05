//
//  CardView.swift
//  Hike
//
//  Created by gizem demirtas on 29.07.2024.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        
        print("-----BUTTON WAS PRESSED-----")
        print("Status: Old Image Number = \(imageNumber)")
        
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random Number Generated = \(randomNumber)")
        }while randomNumber == imageNumber   //SWIFT LOOP
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("----THE END-----")
        print("\n")
    }
    
    var body: some View {
        
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack (alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight , .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                        Spacer() // İki view arasında esnek boşluk oluşturur!
                        Button {
                            //ACTION: Show a Sheet
                            print("The button was pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                    }
                    
                    Text("Fun and enjoyable outdoor ativity for friends and families")
                        .multilineTextAlignment(.leading) //sola hizalama
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                    
                } //: HEADER
                .padding(.horizontal,30)
                
                
                //MARK: - MAIN CONTENT
                
                ZStack {
                    
                    CustomCircleView()
                        
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 300)
                        .animation(.default, value: imageNumber)
                        //.animation(.easeInOut(duration: 1), value: imageNumber)
                    
                }
                //MARK: - FOOTER
                Button{
                    //ACTION : Generate a random number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight,
                                .customGreenMedium
                            ], 
                            startPoint: .top,
                            endPoint: .bottom
                            
                            )
                        )
                        .shadow(
                            color: .black.opacity(0.2),
                            radius: 0.25,
                            x:1,
                            y: 2)
                }
               .buttonStyle(GradientButton())
                
                
                
                
            } //: VSTACK
        } //: CARD
        .frame(width: 320, height: 570)
            
    }
}

#Preview {
    CardView()
}

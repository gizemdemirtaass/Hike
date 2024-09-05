//
//  SettingsView.swift
//  Hike
//
//  Created by gizem demirtas on 6.08.2024.
//

import SwiftUI

struct SettingsView: View {
    // MARK: -PROPERTIES
    
    private let alternateAppIcons: [String] = [
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
        // MARK: - SECTION: HEADER
            Section {
                HStack{
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors' Choise")
                            .fontWeight(.medium)
                    }
                    //.fontWeight(.black)
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                    
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack (spacing : 8){
                    Text("Where can you find \nperfect tracks")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
                
            } //: HEADER
            .listRowSeparator(.hidden)  //Liste görünümünü sildik !!
           
        // MARK: - SECTION: ICONS
            
            Section (header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (spacing:12){
                        ForEach(alternateAppIcons.indices, id:\.self) { item in
                            Button {
                                print("Icon \(alternateAppIcons[item]) was pressed.")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                    if error != nil {
                                        print("Failed request to update the app's icon : \(String(describing: error?.localizedDescription))")
                                    }
                                    else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless) //KESİN EKLE!
                        }
                    }
                    
                }
                .padding(.top, 12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
                
                    
            } //: SECTION
            .listRowSeparator(.hidden)
            
            
        // MARK: - SECTION: ABOUT
            
            Section (
                header : Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){
                
                
                // 1. Basic Labeled Content
                //LabeledContent("Application" , value: "Hike")
                
                // 2. Advanced Labeled Content
                //LabeledContent {
                    // Content
                  //  Text("Hike")
                //} label : {
                    // Label
                  //      Text("Application")
                //}
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Gizem Demirtas", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "İbrahim Emanetci", rowTintColor: .pink)
                //CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "https://credo.academy", rowTintColor: .indigo)
                CustomListRowView(rowLabel: "Website",
                                  rowIcon: "globe",
                                  //rowContent: nil,
                                  rowTintColor: .indigo,
                                  rowLinkLabel: "Credo Academy",
                                  rowLinkDestination: "https://credo.academy")
                
                
                
                
                
            } //: SECTION
            
        } //: LIST
        
    }
}

#Preview {
    SettingsView()
}

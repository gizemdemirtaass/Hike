//
//  CustomListRowView.swift
//  Hike
//
//  Created by gizem demirtas on 7.08.2024.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowLabel : String
    @State var rowIcon : String
    @State var rowContent : String? = nil //Bir değerin mevcut olup olmadığını bilmediğimiz için string türünü isteğe bağlı olarak bildirdik!!
    //not: "nil" bir değişkene atanamayan yalnızca isteğe bağlı bir değere atanabilen özel bir değerdir! - Varsayılan olarak hiç bir değerin olmadığı anlamına gelir!
    
    @State var rowTintColor : Color
    @State var rowLinkLabel : String? = nil
    @State var rowLinkDestination : String? = nil
    
    
    var body: some View {
        // 2. Advanced Labeled Content
        LabeledContent {
            // Content
            if rowContent != nil {  //'rowContent!' demek rowContent in kesinlikle boş olmadığını garanti eder
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            } else if (rowLinkLabel != nil &&
                       rowLinkDestination != nil) {
                Link (rowLinkLabel! , destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        } label : {
            // Label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Website",
            rowIcon: "globe",
            rowContent: nil,
            rowTintColor: .pink,
            rowLinkLabel: "Credo Academy",
            rowLinkDestination: "https://crode.academy"
        )
    }
}


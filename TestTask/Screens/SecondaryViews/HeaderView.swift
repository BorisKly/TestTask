//
//  HeaderView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct HeaderView: ToolbarContent {
    
    var title: String
    
    var body: some ToolbarContent {
    
        ToolbarItem(placement: .automatic) {
            HStack{
                Spacer()
                Text(title)
                    .foregroundStyle(Colors.blackColor)
                Spacer()
            }
       
//            .frame(maxWidth: .infinity)
//            .padding()
//            .background(Colors.primaryColor)
            
        }
    }
}

//#Preview {
//    HeaderView(title: "Working with ...")
//}

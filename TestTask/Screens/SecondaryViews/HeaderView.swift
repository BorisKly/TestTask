//
//  HeaderView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var body: some View {
        HStack{
            Spacer()
            Text(title)
            Spacer()
        }
        .frame(height: 50)
        .background(Colors.primaryColor)
    }
}

#Preview {
    HeaderView(title: "Working with ...")
}

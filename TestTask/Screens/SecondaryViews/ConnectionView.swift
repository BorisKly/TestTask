//
//  ConnectionView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct ConnectionView: View {
    
    var body: some View {
        VStack(spacing: 30){
            Image("internetConnectionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: 100, maxHeight: 100) 
            Text("There is no internet connection")
            Button {
                print("pressed")
            } label: {
                Text("Try again")
            }.customStyle()
        }
    }
}

#Preview {
    ConnectionView()
}

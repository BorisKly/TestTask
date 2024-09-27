//
//  ConnectionView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct ConnectionView: View {
    
    var body: some View {
        VStack(spacing: 12){
            Image("internetConnectionImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(width: 200, height: 200) 
            Text("There is no internet connection")
                .custom20()
            Button {
                print("pressed")
            } label: {
                Text("Try again")
            }
            .customStyle()
        }
    }
}

#Preview {
    ConnectionView()
}

//
//  ConnectionView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct ConnectionView: View {
    
    @State var isPresed: Bool = false
    @State var isDissabled: Bool = false
   
    var body: some View {
        VStack(spacing: 30){
            Image("successImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: 100, maxHeight: 100) 
            Text("There is no internet connection")
            Button {
                print("pressed")
            } label: {
                Text("Try again")
            }.customStyle(isPressed: isPresed, isDisabled: isDissabled)
        }
    }
}

#Preview {
    ConnectionView()
}

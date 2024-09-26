//
//  SplashScreenView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            HStack{
                Spacer()
                VStack{
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(maxWidth: 100, maxHeight: 100)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    self.isActive = true
                                }
                            }
                        }
                    Spacer()
                }
                Spacer()
            }.background(Colors.primaryColor)
        }
    }
}

#Preview {
    SplashScreenView()
}

//
//  SplashScreenView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(maxWidth: 160, maxHeight: 100)
                Spacer()
            }
            Spacer()
        }.background(Colors.primaryColor)
    }
}

#Preview {
    SplashScreenView()
}

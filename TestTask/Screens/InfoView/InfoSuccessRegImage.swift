//
//  SuccessRegisterView.swift
//  TestTask
//
//  Created by Borys Klykavka on 29.09.2024.
//

import SwiftUI

struct InfoSuccessRegImage: View {
    
    let primaryRadius: CGFloat = 200
    let secondaryRadius: CGFloat = 71
    let lineWidth: CGFloat = 1

    let newImage = UIImage(named: "checkmark")
    let ramka = UIImage(named: "ramka")


    var body: some View {
        
        ZStack{
            Circle()
                .fill(Colors.secondaryColor)
                .frame(width: primaryRadius, height: primaryRadius)
                .overlay(
                    Ellipse()
                        .stroke(Colors.blackColor87, lineWidth: lineWidth)
                )
            HStack{
                Image(uiImage: ramka!)
                    .scaledToFit()
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .background(Colors.primaryColor)
                    .padding(.leading, 10)
                Spacer()
            }
            ZStack{
                Circle()
                    .fill(Colors.secondaryGreenColor)
                    .frame(width: secondaryRadius, height: secondaryRadius)
                    .overlay(
                        Ellipse()
                            .stroke(Colors.blackColor87, lineWidth: lineWidth)
                    )
                Image(uiImage: newImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: secondaryRadius * 0.7, height: secondaryRadius * 0.7)
                    .foregroundColor(.white)
            }
            
            
        }
        .frame(width: primaryRadius + 5, height: primaryRadius + 5)
//        .background(.orange)
    }
}

#Preview {
    InfoSuccessRegImage()
}

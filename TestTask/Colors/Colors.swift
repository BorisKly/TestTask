//
//  Colors.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//


import SwiftUI

public enum Colors  {
        
    static let primaryColor = Color(red: 224/255, green:  224/255, blue: 65/255, opacity: 1) //yellow
    static let primaryDarkColor = Color(red: 225/255, green:  199/255, blue: 0, opacity: 1)
   
    static let secondaryColor = Color(red: 0/255, green:  189/255, blue: 211/255, opacity: 1) //blue
    static let secondaryGreenColor = Color(red: 56/255, green:  218/255, blue: 111/255, opacity: 1) //green

    static let secondaryLightBrounColor = Color(red: 222/255, green:  222/255, blue: 222/255, opacity: 1) //broun
    static let primaryAlertColor = Color(red: 255/255, green:  77/255, blue: 77/255, opacity: 1) //red

    static let blackColor87 = Color(red: 0/255, green:  0/255, blue: 0/255, opacity: 0.87)
    static let blackColor60 = Color(red: 0/255, green:  0/255, blue: 0/255, opacity: 0.60)
    
    static let whiteDarkColor = Color(red: 248/255, green:  248/255, blue: 248/255, opacity: 1)
    static let whiteColor = Color(red: 255/255, green:  255/255, blue: 255/255, opacity: 1)
    
//      static let primaryColorLight = Color(red: 224/255, green: 224/255, blue: 65/255, opacity: 1) // Yellow (Light mode)
//      static let primaryColorDark = Color(red: 225/255, green: 199/255, blue: 0, opacity: 1) // Darker Yellow (Dark mode)
//      
//      // Метод для отримання динамічного кольору залежно від поточного режиму
//      static func primaryColor(for colorScheme: ColorScheme) -> Color {
//          return colorScheme == .dark ? primaryColorDark : primaryColorLight
//      }
}

//
//  Text+.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import SwiftUI

extension Text {
    
    func footnoteRedStyle() -> some View {
        self
            .font(.footnote)
            .foregroundStyle(Colors.primaryAlertColor)
    }

    func custom20() -> some View {
        self
            .font(Fonts.primaryFont20)
            .foregroundStyle(Colors.blackColor87)
    }
  
}

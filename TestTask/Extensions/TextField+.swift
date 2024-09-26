//
//  ЕучеАшудв+.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

extension TextField {
    func customStyle() -> some View {
        self
            .frame(width: 320, height: 48)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Colors.thirdDarkColor, lineWidth: 2)
            )
            .onTapGesture {
                     hideKeyboard()
                 }
    }
}


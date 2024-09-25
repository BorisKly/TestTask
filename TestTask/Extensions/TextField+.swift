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
            .frame(height: 40)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Colors.thirdDarkColor, lineWidth: 2)
            )
    }
}


//
//  Button+.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

extension Button {
    func customStyle() -> some View {
        self
            .frame(width: 140, height: 48)
            .background(Colors.primaryColor)
            .cornerRadius(24)
            .foregroundColor(.white)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
    }
}

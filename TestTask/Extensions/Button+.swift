//
//  Button+.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

extension Button {
    func customStyle(isPressed: Bool, isDisabled: Bool) -> some View {
        self
            .padding()
            .background(isPressed ? Color.gray : (isDisabled ? Color.gray.opacity(0.5) : Color.blue))
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 2)
            .animation(.easeInOut(duration: 0.2), value: isPressed)
    }
    func radioButton() -> some View {
        self
          
    }
}

//
//  RadioButton.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct RadioButton: View {
   
    let id: Int
    let label: String
    @Binding var selectedId: Int

    var body: some View {
        Button(action: {
            self.selectedId = id
        }) {
            HStack {
                Image(systemName: self.selectedId == id ? "smallcircle.fill.circle.fill" : "circle")
                    .foregroundColor(self.selectedId == id ? .blue : .gray)
                Text(label)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle()) // Без стандартного стилю кнопки
    }
}

//#Preview {
//    RadioButton()
//}

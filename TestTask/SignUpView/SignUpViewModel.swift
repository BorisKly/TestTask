//
//  SignUpViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var selectedId: Int = 1
    @Published var selectedPhoto: Data
    
    
    init() {
        // Завантажуємо зображення за замовчуванням
        if let defaultImage = UIImage(named: "default_image"),
           let data = defaultImage.pngData() {
            self.selectedPhoto = data // Присвоюємо дані зображення
        } else {
            self.selectedPhoto = Data() // Порожні дані, якщо зображення не знайдено
        }
    }

    func printRes() {
        print(name)
        print(email)
        print(phone)
        print(selectedId)

    }
    
    

}

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
    @Published var phone: String = "+380"
    @Published var selectedId: Int = 1
    @Published var selectedPhoto: Data?
    
    @Published var token: String = ""
    @Published var openSuccessRegisterView = false
    @Published var openAlreadyRegisterView = false

    @Published var isNameValid: Bool = true
    @Published var isEmailValid: Bool = true
    @Published var isPhoneValid: Bool = true

    
    private var validationWorkItem: DispatchWorkItem?
    
    init() {
//        if let defaultImage = UIImage(named: "photo"),
//           let data = defaultImage.jpegData(compressionQuality: 1.0) {
//            self.selectedPhoto = data
//        } else {
//            self.selectedPhoto = Data()
//        }
        fetchToken()
    }
    
    func validateName() {
        isNameValid = name.count >= 2 && name.count <= 20
    }
    func validateEmail() {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        isEmailValid = emailPredicate.evaluate(with: email)
    }    
    func validatePhone() {
        let phonePattern = "^\\+380\\d{9}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phonePattern)
        isPhoneValid = phonePredicate.evaluate(with: phone)
    }
}

struct UserSettings: Codable {
    var token: String
}


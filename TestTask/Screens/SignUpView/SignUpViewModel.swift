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

    @Published var isNameValid: Bool = false
    @Published var isEmailValid: Bool = false
    @Published var isPhoneValid: Bool = false
    @Published var isPhotoValid: Bool = false

    @Published var isSignUpButtonPressed = false
    
    private var validationWorkItem: DispatchWorkItem?
    
    init() {
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
    func validatePhoto() {
        if selectedPhoto != nil {
            isPhotoValid = true
        }
    }
    
    func resetUser() {
        name = ""
        email = ""
        phone = "+380"
        selectedPhoto = nil
        isSignUpButtonPressed = false
    }
}

struct UserSettings: Codable {
    var token: String
}


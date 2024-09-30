//
//  SignUpViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
        
    @Published var name: String = ""{
        didSet {
            validateName() 
        }
    }
    @Published var email: String = ""{
        didSet {
            validateEmail()
        }
    }
    @Published var phone: String = "+380"
    {
        didSet {
            validatePhone()
        }
    }
    @Published var selectedPhoto: Data?{
        didSet {
            validatePhone()
        }
    }
    @Published var selectedId: Int = 1

    
    @Published var token: String = ""
    
    @Published var infoModel: InfoViewEnum?

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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            self.isNameValid = name.count >= 2 && name.count <= 20
        }
    }
    
    func validateEmail() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            self.isEmailValid = emailPredicate.evaluate(with: self.email)
        }
    }
  
    func validatePhone() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            let phonePattern = "^\\+380\\d{9}$"
            let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phonePattern)
            self.isPhoneValid = phonePredicate.evaluate(with: self.phone)
        }
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


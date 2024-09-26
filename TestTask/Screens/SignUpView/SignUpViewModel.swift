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
    @Published var selectedPhoto: Data?
    
    @Published var token: String = ""
    @Published var openSuccessRegisterView = true

    init() {
        if let defaultImage = UIImage(named: "photo"),
           let data = defaultImage.jpegData(compressionQuality: 1.0) {
            self.selectedPhoto = data
        } else {
            self.selectedPhoto = Data()
        }
        fetchToken()
    }
}

struct UserSettings: Codable {
    var token: String
}


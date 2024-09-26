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
    
    init() {
        if let defaultImage = UIImage(named: "photo"),
           let data = defaultImage.jpegData(compressionQuality: 1.0) {
            self.selectedPhoto = data
        } else {
            self.selectedPhoto = Data()
        }
        fetchToken()
    }
    
    func fetchToken() {
        NetworkService.shared.getToken { result in
            switch result {
            case .success(let token):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: token, options: [])
                    let token = try JSONDecoder().decode(TokenResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.token = token.token
                    }
                } catch {
                    print("Error decoding TokenResponseData: \(error.localizedDescription)")
                }            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registerNewUser() {
        let boundary = UUID().uuidString
        let userData = UserData(name: name,
                                email: email,
                                phone: phone,
                                position_id: selectedId,
                                photo: selectedPhoto)
        
        let requestBody = createBody(userData: userData, boundary: boundary)
        NetworkService.shared.postUser(data: ["body" : requestBody], 
                                       settings: ["token": token],
                                       boundary: boundary) { result in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func createBody(userData: UserData, boundary: String) -> Data {
        
        var body = Data()

        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"name\"\r\n\r\n")
        body.append("\(userData.name)\r\n")
        
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"email\"\r\n\r\n")
        body.append("\(userData.email)\r\n")
        
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"phone\"\r\n\r\n")
        body.append("\(userData.phone)\r\n")
        
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"position_id\"\r\n\r\n")
        body.append("\(userData.position_id)\r\n")
        if let photoData = userData.photo {
            let filename = "user_photo.jpg"
            let mimeType = "image/jpeg"

            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"photo\"; filename=\"\(filename)\"\r\n")
            body.append("Content-Type: \(mimeType)\r\n\r\n")
            body.append(photoData)
            body.append("\r\n")
        }
        body.append("--\(boundary)--\r\n")
        
        if let bodyString = String(data: body, encoding: .utf8) {
             print("body:\n\(bodyString)")
         } else {
             print("Failed to convert body data to string.")
         }
        return body
    }
    
}

struct UserSettings: Codable {
    var token: String
}


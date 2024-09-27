//
//  SignUpViewModel+registerUser.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import Foundation

extension SignUpViewModel {
    
    func registerUser() {
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
                let json = result.json
                print(json)
                let statusCode = result.statusCode
                if statusCode == 201 {
                    DispatchQueue.main.async{
                        self.openSuccessRegisterView = true
                        self.resetUser()
                    }
                }
                print(statusCode)
            case .failure(let error):
                switch error {
                case .invalidUrl:
                    print("invalidURL")
                case .invalidTask:
                    print("invalidTask")
                case .invalidResponse:
                    print("invalidResponse")
                case .serverError(json: let json, statusCode: let statusCode):
                    if statusCode == 409 {
                        DispatchQueue.main.async{
                            self.openAlreadyRegisterView = true
                        }
                    }
                    if statusCode == 401 {
                        print("The token expired")
                    }
                    if statusCode == 422 {
                        print("Validation failed: one of the fields is incorrect")
                    }
                case .customError(message: let message, statusCode: let statusCode):
                    print("\(statusCode): \(message) ")
                }
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

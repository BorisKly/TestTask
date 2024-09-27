//
//  UsersListViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import Foundation

class UsersListViewModel: ObservableObject {
    
    @Published var users: [ResponseUser] = [];
    let numberOfUsersPerPage = 6
    
    let data: [String: Any] = [
        "queryParams": [
            "page": "1",
            "count": "6"
        ],
    ]
    
    func fetchUsers() {
        NetworkService.shared.getUsers(data: data, settings: nil) { result in
            switch result {
            case .success(let result):
                let json = result.json
                print(json)
                let statusCode = result.statusCode
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let usersResponseData = try JSONDecoder().decode(UsersResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.users = usersResponseData.users
                    }
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

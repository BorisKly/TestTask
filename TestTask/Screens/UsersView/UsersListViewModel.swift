//
//  UsersListViewModel.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import Foundation
import SwiftUI

class UsersListViewModel: ObservableObject {

    let model = UsersListModel()
    
    @Published var users: [ResponseUser] = [];
    @Published var page: Int = 1;
    @Published var totalPages: Int = 0;
    @Published var totalUsers: Int = 0;
    
    init() {
//      users = model.mockUsers
       fetchUsers(page: page)
    }

    func fetchUsers(page: Int) {
        
        let data = createRequestData(page: page)

        NetworkService.shared.getUsers(data: data, settings: nil) { result in
            switch result {
            case .success(let result):
                let json = result.json
                print(json)
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                    let usersResponseData = try JSONDecoder().decode(UsersResponseData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.users = usersResponseData.users
                        self.totalPages = usersResponseData.totalPages
                        self.totalUsers = usersResponseData.totalUsers
                    }
                } catch {
                    print("Error decoding UsersResponseData: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func nextPage() {
        if page < totalPages {
            page += 1
            fetchUsers(page: page)
        }
    }
    
    func previousPage() {
        if page > 1 {
            page -= 1
            fetchUsers(page: page)
        }
    }
    
    func calculateIndicatorHeight(geometry: GeometryProxy) -> CGFloat {
         let totalHeight = geometry.size.height
         let indicatorHeight = totalHeight / CGFloat(totalPages)
         let currentIndicatorHeight = indicatorHeight * CGFloat(page)
         return indicatorHeight > totalHeight ? totalHeight : currentIndicatorHeight
     }
    
    private func createRequestData(page: Int) -> [String: Any] {
        let data: [String: Any] = [
            "queryParams": [
                "page": String(page),
                "count": String(model.numberOfUsersPerPage)
            ]
        ]
        return data
    }
}

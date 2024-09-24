//
//  UsersListView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct UsersListView: View {
    
    @State var users: [ResponseUser] = [];
    
    let data: [String: Any] = [
        "queryParams": [
            "page": "2",
            "count": "10"
        ],
    ]
    var body: some View {
        VStack{
            HeaderView(title: "Working with GET reques")
            NavigationStack {
                List(users) { user in
                    NavigationLink {
                        UserDetailView(user:user)
                    } label: {
                        UserView(user: user)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationTitle("Users")
            }.onAppear {
                NetworkService.shared.getUsers(data: data, settings: nil) { result in
                    switch result {
                    case .success(let result):
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: result, options: [])
                            let usersResponseData = try JSONDecoder().decode(UsersResponseData.self, from: jsonData)
                            self.users = usersResponseData.users
                        } catch {
                            print("Error decoding UsersResponseData: \(error.localizedDescription)")
                        }
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

//#Preview {
//    UsersListView(users: [User])
//}

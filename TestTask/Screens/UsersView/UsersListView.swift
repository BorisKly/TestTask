//
//  UsersListView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct UsersListView: View {
    
    @EnvironmentObject var viewModel: UsersListViewModel
    
    var body: some View {
        VStack{
            NavigationStack {
                List(viewModel.users) { user in
                    NavigationLink {
                        UserDetailView(user:user)
                    } label: {
                        UserView(user: user)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .navigationTitle("Users")
            }.onAppear {
                viewModel.fetchUsers()
            }
        }
    }
}

//#Preview {
//    UsersListView(users: [User])
//}

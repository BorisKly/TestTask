//
//  SuccessRegisteredView.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import SwiftUI

struct SuccessRegisteredView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var usersListViewModel: UsersListViewModel
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing: 20) {
                Spacer()
                Image("successRegistered")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Registration Successful!")
                    .custom20()
                HStack {
                    Button("Got it") {
                        mainViewModel.showSuccessRegistrationModal = false
                        usersListViewModel.fetchUsers(page: 1)
                        mainViewModel.selectedTab = 0
                    }
                    .customStyle()
                }
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}

#Preview {
    SuccessRegisteredView()
}

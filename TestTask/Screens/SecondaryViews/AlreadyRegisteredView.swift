//
//  AlreadyRegisteredView.swift
//  TestTask
//
//  Created by Borys Klykavka on 26.09.2024.
//

import SwiftUI

struct AlreadyRegisteredView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var usersListViewModel: UsersListViewModel
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing: 20) {
                Spacer()
                Image("alreadyRegistered")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("That email is already registered!")
                    .custom20()
                HStack {
                    Button("Try again") {
                        mainViewModel.showAlreadyRegisteredModal = false
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
    AlreadyRegisteredView()
}

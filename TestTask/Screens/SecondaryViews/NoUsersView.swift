//
//  NoUsersView.swift
//  TestTask
//
//  Created by Borys Klykavka on 27.09.2024.
//

import SwiftUI

struct NoUsersView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var usersListViewModel: UsersListViewModel
    
    var body: some View {
        HStack{
            Spacer()
            VStack(spacing: 20) {
                Spacer()
                Image("noUsersImage")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("There is no users yet")
                    .custom20()
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
    }
}

#Preview {
    NoUsersView()
}

//
//  MainView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var usersListViewModel: UsersListViewModel
    @EnvironmentObject var signUpViewModel: SignUpViewModel

    var body: some View {
        ZStack{
            NavigationStack{
                TabView(selection: $mainViewModel.selectedTab) {
                    Group {
                        UsersListView()
                            .tabItem {
                                Label("Users", systemImage: "person.3.fill")
                            }
                            .tag(0)
                        SignUpView()
                            .tabItem {
                                Label("Sign up", systemImage: "person.crop.circle.fill.badge.plus")
                            }
                            .tag(1)
                    }
                    .toolbarColorScheme(.light, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Colors.primaryColor, for: .tabBar)
                }
                .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text(mainViewModel.selectedTab == 0 ? "Working with GET request" : "Working with POST request")
                        }
                }
                .toolbarBackground(Colors.primaryColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            if mainViewModel.showSuccessRegistrationModal {
                SuccessRegisteredView()
                .transition(.move(edge: .bottom))
            }
            if mainViewModel.showAlreadyRegisteredModal {
                AlreadyRegisteredView()
                .transition(.move(edge: .bottom))
            }
        }
        .onReceive(signUpViewModel.$openSuccessRegisterView) { status in
            if status {
                mainViewModel.showSuccessRegistrationModal = true
                signUpViewModel.openSuccessRegisterView = false
            }
        }
        .onReceive(signUpViewModel.$openAlreadyRegisterView) { status in
            if status {
                mainViewModel.showAlreadyRegisteredModal = true
                signUpViewModel.openAlreadyRegisterView = false
            }
        }
    }
}

#Preview {
    MainView()
}

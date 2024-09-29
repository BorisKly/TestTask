//
//  MainView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel

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
                            Text(mainViewModel.selectedTab == 0 ? "Working with GET request" : "Working with POST request").font(Fonts.primaryFont20)
                        }
                }
                .toolbarBackground(Colors.primaryColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            if mainViewModel.showInfoViewModal {
                InfoView(infoModel: mainViewModel.infoModel ?? .internetConnection)
                .transition(.move(edge: .bottom))
            }
        }
        .onReceive(mainViewModel.$infoModel) { elem in
            print("elem: \(elem)")
            if elem != nil {
                mainViewModel.showInfoViewModal = true }
            //signUpViewModel.infoModel = nil
        }
    }
}

//#Preview {
//    MainView()
//}

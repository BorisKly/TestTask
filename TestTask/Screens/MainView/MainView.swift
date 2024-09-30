//
//  MainView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel

    init() {
        UITabBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

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
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Colors.whiteDarkColor, for: .tabBar)
                    .tint(Colors.secondaryColor)
                }
                .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Text(mainViewModel.selectedTab == 0 ? "Working with GET request" : "Working with POST request")
                                .font(Fonts.primaryFont20)
                        }
                }
                .toolbarBackground(Colors.primaryColor, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            if mainViewModel.showInfoViewModal {
                InfoView(infoType: mainViewModel.infoType ?? .internetConnection)
                .transition(.move(edge: .bottom))
            }
        }
        .onReceive(mainViewModel.$infoType) { elem in
            if elem != nil {
                mainViewModel.showInfoViewModal = true }
        }
    }
}

//#Preview {
//    MainView()
//}

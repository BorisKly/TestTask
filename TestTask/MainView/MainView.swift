//
//  MainView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Group {
                SignUpView()
                    .tabItem {
                        Label("Sign up", systemImage: "person.crop.circle.fill.badge.plus")
                    }
                UsersListView()
                    .tabItem {
                        Label("Users", systemImage: "person.3.fill")
                    }
//                SignUpView()
//                    .tabItem {
//                        Label("Sign up", systemImage: "person.crop.circle.fill.badge.plus")
//                    }
            }
            .toolbarColorScheme(.light, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Colors.primaryColor, for: .tabBar)
        }
    }
}

#Preview {
    MainView()
}

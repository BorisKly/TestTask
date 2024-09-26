//
//  ContentView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var signUpViewModel = SignUpViewModel()
    @StateObject var usersListViewModel = UsersListViewModel()
    @StateObject var mainViewModel = MainViewModel()
    
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                MainView()
                    .environmentObject(signUpViewModel)
                    .environmentObject(usersListViewModel)
                    .environmentObject(mainViewModel)
            } else {
                ConnectionView()
            }
        }
    }
}

#Preview {
    ContentView()
}

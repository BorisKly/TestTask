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
    
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                MainView()
                    .environmentObject(signUpViewModel)
                    .environmentObject(usersListViewModel)
                    .environmentObject(mainViewModel)
                    .environmentObject(networkMonitor)
            } else {
                InfoView(infoModel: .internetConnection)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

@main
struct TestTaskApp: App {
    
    @StateObject var networkMonitor = NetworkMonitor()
    
    @StateObject var signUpViewModel = SignUpViewModel()
    @StateObject var usersListViewModel = UsersListViewModel()
    @StateObject var mainViewModel = MainViewModel()
   
    @State private var isActive = false

    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
                    .environmentObject(networkMonitor)
                    .environmentObject(signUpViewModel)
                    .environmentObject(usersListViewModel)
                    .environmentObject(mainViewModel)
            } else {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
            }
        }
    }
}

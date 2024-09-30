//
//  ContentView.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkMonitor: NetworkMonitor
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                MainView()
            } else {
                InfoView(infoModel: .internetConnection)
            }
        }
    }
}

#Preview {
    ContentView()
}

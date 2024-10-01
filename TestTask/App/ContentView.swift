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
                withAnimation(.easeInOut) {
                    MainView()
                }
            } else {
                withAnimation(.easeInOut) {
                    InfoView(infoType: .internetConnection)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

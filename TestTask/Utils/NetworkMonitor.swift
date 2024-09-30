//
//  NetworkMonitor.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
  
    @Published var isConnected: Bool = true
    private var monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitorQueue")

    private var timer: Timer? = nil

    init() {
        monitor = NWPathMonitor()
        startMonitoring()
    }
    
    func startMonitoring() {
        print(#function)
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
                print("Network status changed: \(self.isConnected)")
            }
        }
        monitor.start(queue: queue)
    }
    
    func checkConnection() {
        let path = monitor.currentPath
        DispatchQueue.main.async {
            self.isConnected = path.status == .satisfied
        }
        print(isConnected)
    }
    
    func isNetworkAvailable() -> Bool {
        return isConnected
    }
}

//
//  NetworkMonitor.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    private var monitor: NWPathMonitor
    
    @Published var isConnected: Bool = false

    init() {
        monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}

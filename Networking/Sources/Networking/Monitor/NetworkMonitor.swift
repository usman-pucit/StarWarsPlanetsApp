//
//  NetworkMonitor.swift
//  Networking
//
//  Created by Usman on 06.05.25.
//

import Network
import Foundation

public protocol NetworkMonitorType {
    var isReachable: Bool { get set }
}

@Observable
public final class NetworkMonitor: NetworkMonitorType, @unchecked Sendable {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    public var isReachable: Bool = true
    
    public init() {
        self.startMonitoring()
    }
    
    deinit {
        self.stopMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isReachable = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    private func stopMonitoring() {
        monitor.cancel()
    }
}

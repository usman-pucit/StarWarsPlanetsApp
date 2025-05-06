//
//  NetworkMonitor+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 06.05.25.
//

import Foundation
@testable import Networking

class NetworkMonitorMock: NetworkMonitorType {
    var isReachable: Bool
    
    init(isReachable: Bool = false) {
        self.isReachable = isReachable
    }
}

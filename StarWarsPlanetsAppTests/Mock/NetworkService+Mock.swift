//
//  NetworkService+Mock.swift
//  Networking
//
//  Created by Usman on 05.05.25.
//

import Foundation
@testable import Networking

public class NetworkServiceMock: NetworkServiceType {
    private(set) var request: URLRequest
    private let result: Result<(Data, HTTPURLResponse), Error>
    
    public init(
        request: URLRequest,
        result: Result<(Data, HTTPURLResponse), Error>
    ) {
        self.request = request
        self.result = result
    }
    
    public func fetch(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        self.request = request
        
        switch result {
        case .success((let data, let response)):
            return (data, response)
        case .failure(let error):
            throw error
        }
    }
}

//
//  NerworkService.swift
//  Networking
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the network service
public protocol NetworkServiceType {
    func fetch(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

// MARK: - Service
public class NerworkService {
    public init() { }
}

extension NerworkService: NetworkServiceType {
    public func fetch(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.unacceptableStatusCode(httpResponse.statusCode)
        }
        
        return (data, httpResponse)
    }
}

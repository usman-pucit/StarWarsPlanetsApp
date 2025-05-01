//
//  File.swift
//  Networking
//
//  Created by Usman on 01.05.25.
//

import Foundation

public protocol RequestBuilderType {
    func build() throws -> URLRequest
}

public struct RequestBuilder {
    private let host: String
    private let path: String
    private let scheme: String
    private let queryItems: [URLQueryItem]
    
    public init(
        host: String,
        path: String,
        scheme: String = "https",
        queryItems: [URLQueryItem] = []
    ) {
        self.host = host
        self.path = path
        self.scheme = scheme
        self.queryItems = queryItems
    }
}

extension RequestBuilder: RequestBuilderType {
    public func build() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        return URLRequest(url: url)
    }
}

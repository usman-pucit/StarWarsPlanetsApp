//
//  RequestBuilder+Extension.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation
import Networking

extension RequestBuilder {
    static func planets() throws -> URLRequest {
        let request = RequestBuilder(
            host: EnvironmentConfig.baseURL,
            path: "/api/planets",
            scheme: "https"
        )
        
        return try request.build()
    }
    
    static func detail(id: String) throws -> URLRequest {
        let request = RequestBuilder(
            host: EnvironmentConfig.baseURL,
            path: "/api/planets/\(id)",
            scheme: "https"
        )
        
        return try request.build()
    }
}

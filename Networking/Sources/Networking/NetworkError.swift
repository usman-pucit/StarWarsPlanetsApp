//
//  NetworkError.swift
//  Networking
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define all network errors
public enum NetworkError: Error, LocalizedError {
    case invalidResponse
    case unacceptableStatusCode(Int)
    case noInternetConnection
    
    public var errorDescription: String? {
        switch self {
        case .invalidResponse:
            "Response was invalid."
        case .noInternetConnection:
            "Please check your internet connection and try again."
        case .unacceptableStatusCode(let code):
            "Unacceptable status code: \(code)"
        }
    }
}


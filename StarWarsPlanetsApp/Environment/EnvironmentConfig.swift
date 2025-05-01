//
//  EnvironmentConfig.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

enum EnvironmentConfig {
    private enum Keys {
        static let baseURL = "BASE_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let url = infoDictionary[Keys.baseURL] as? String else {
            return "swapi.dev/api/" // Fallback value
        }
        
        return url
    }()
}

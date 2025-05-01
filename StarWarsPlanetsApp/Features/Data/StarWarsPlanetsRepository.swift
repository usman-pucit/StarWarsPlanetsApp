//
//  StarWarsPlanetsRepository.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation
import Networking

// Define a protocol for the repository
protocol StarWarsPlanetsRepositoryType {
    
}

// MARK: - Repository
final class StarWarsPlanetsRepository {
    private let networkService: NerworkServiceType
    
    init(
        networkService: NerworkServiceType = NerworkService()
    ) {
        self.networkService = networkService
    }
}

extension StarWarsPlanetsRepository: StarWarsPlanetsRepositoryType {
    // Implement the protocol methods here
}



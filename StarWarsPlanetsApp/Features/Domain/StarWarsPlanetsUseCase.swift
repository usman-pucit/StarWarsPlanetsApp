//
//  StarWarsPlanetsUseCase.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the use case
protocol StarWarsPlanetsUseCaseType {
    
}

// MARK: - UseCase
final class StarWarsPlanetsUseCase {
    private let repository: StarWarsPlanetsRepositoryType
    
    init(
        repository: StarWarsPlanetsRepositoryType = StarWarsPlanetsRepository()
    ) {
        self.repository = repository
    }
}

extension StarWarsPlanetsUseCase: StarWarsPlanetsUseCaseType {
    // Implement the protocol methods here
}
    


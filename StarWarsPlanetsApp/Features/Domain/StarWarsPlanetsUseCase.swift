//
//  StarWarsPlanetsUseCase.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the use case
protocol StarWarsPlanetsUseCaseType {
    func fetchPlanets() async throws -> [Domain.Main.Planet]
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
    func fetchPlanets() async throws -> [Domain.Main.Planet] {
        try await repository.fetchPlanets()
    }
}
    


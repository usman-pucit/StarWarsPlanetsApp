//
//  PlanetsListUseCase.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the use case
protocol PlanetsListUseCaseType {
    func fetchPlanets() async throws -> [Domain.Planet.Item]
}

// MARK: - UseCase
final class PlanetsListUseCase {
    private let repository: PlanetsListRepositoryType
    
    init(
        repository: PlanetsListRepositoryType = PlanetsListRepository()
    ) {
        self.repository = repository
    }
}

extension PlanetsListUseCase: PlanetsListUseCaseType {
    func fetchPlanets() async throws -> [Domain.Planet.Item] {
        try await repository.fetchPlanets()
    }
}
    


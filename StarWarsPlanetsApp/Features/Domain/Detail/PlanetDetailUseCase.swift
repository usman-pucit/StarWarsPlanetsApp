//
//  PlanetDetailUseCase.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 04.05.25.
//

import Foundation

// Define a protocol for the use case
protocol PlanetDetailUseCaseType {
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail
}

// MARK: - UseCase
final class PlanetDetailUseCase {
    private let repository: PlanetsListRepositoryType
    
    init(
        repository: PlanetsListRepositoryType = PlanetsListRepository()
    ) {
        self.repository = repository
    }
}

extension PlanetDetailUseCase: PlanetDetailUseCaseType {
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail {
        try await repository.fetchDetail(id: id)
    }
}

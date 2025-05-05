//
//  PlanetsListUseCase+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 05.05.25.
//

import Foundation
@testable import StarWarsPlanetsApp

class PlanetsListUseCaseMock: PlanetsListUseCaseType {
    private let repository: PlanetsListRepositoryType
    
    init(
        repository: PlanetsListRepositoryType
    ) {
        self.repository = repository
    }
    
    func fetchPlanets() async throws -> [Domain.Planet.Item] {
        return try await repository.fetchPlanets()
    }
}

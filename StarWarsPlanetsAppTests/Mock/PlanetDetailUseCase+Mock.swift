//
//  PlanetDetailUseCase+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 06.05.25.
//

import Foundation
@testable import StarWarsPlanetsApp

class PlanetDetailUseCaseMock: PlanetDetailUseCaseType {
    private let repository: PlanetsListRepositoryType
    
    init(
        repository: PlanetsListRepositoryType
    ) {
        self.repository = repository
    }
    
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail {
        try await repository.fetchDetail(id: id)
    }
}

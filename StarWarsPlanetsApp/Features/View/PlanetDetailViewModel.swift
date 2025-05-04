//
//  PlanetDetailViewModel.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 03.05.25.
//

import Foundation

protocol PlanetDetailViewModelType {
    func fetchDetail() async
}

@Observable
final class PlanetDetailViewModel {
    private let useCase: PlanetDetailUseCaseType
    private let planetId: String
    private(set) var detail: UI.Planet.Detail?
    private(set) var error: Error?
    
    init(
        planetId: String,
        useCase: PlanetDetailUseCaseType = PlanetDetailUseCase()
    ) {
        self.planetId = planetId
        self.useCase = useCase
    }
}
    
extension PlanetDetailViewModel: PlanetDetailViewModelType {
    func fetchDetail() async {
        do {
            let detail = try await useCase.fetchDetail(id: planetId)
            self.detail = detail.normalize()
        } catch {
            self.error = error
            print("Error fetching detail: \(error)")
        }
    }
}

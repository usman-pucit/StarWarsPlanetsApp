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
    enum State {
        case idle
        case loading
        case result(detail: UI.Planet.Detail)
        case empty
        case error(error: Error)
    }
    
    private(set) var viewState: State = .idle
    
    @ObservationIgnored
    private let useCase: PlanetDetailUseCaseType
    private let planetId: String
    
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
        viewState = .loading
        
        do {
            let detail = try await useCase.fetchDetail(id: planetId)
            viewState = .result(detail: detail.normalize())
        } catch {
            viewState = .error(error: error)
        }
    }
}

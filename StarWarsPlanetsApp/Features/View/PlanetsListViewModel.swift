//
//  PlanetsListViewModel.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the view model
protocol PlanetsListViewModelType {
    func fetchPlanets() async
}

// Mark: - ViewModel
@Observable
final class PlanetsListViewModel {
    enum State {
        case idle
        case loading
        case result([UI.Planet.Item])
        case empty
        case error(Error)
    }
    
    private(set) var viewState: State = .idle
        
    @ObservationIgnored
    private let useCase: PlanetsListUseCaseType
    
    init(
        useCase: PlanetsListUseCaseType = PlanetsListUseCase()
    ) {
        self.useCase = useCase
    }
}

extension PlanetsListViewModel: PlanetsListViewModelType {
    @MainActor
    func fetchPlanets() async {
        viewState = .loading
        
        do {
            let planets = try await useCase.fetchPlanets()
            viewState = .result(planets.map { $0.normalize() })
        } catch {
            viewState = .error(error)
        }
    }
}

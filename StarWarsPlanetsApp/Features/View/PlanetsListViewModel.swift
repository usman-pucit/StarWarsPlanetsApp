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
    private let useCase: PlanetsListUseCaseType
    private(set) var planets: [UI.Planet.Item] = []
    private(set) var error: Error?
    
    init(
        useCase: PlanetsListUseCaseType = PlanetsListUseCase()
    ) {
        self.useCase = useCase
    }
}

extension PlanetsListViewModel: PlanetsListViewModelType {
    @MainActor
    func fetchPlanets() async {
        do {
            let planets = try await useCase.fetchPlanets()
            self.planets = planets.map { $0.normalize() }
            print("Fetched planets: \(planets)")
        } catch {
            self.error = error
            print("Error fetching planets: \(error)")
        }
    }
}

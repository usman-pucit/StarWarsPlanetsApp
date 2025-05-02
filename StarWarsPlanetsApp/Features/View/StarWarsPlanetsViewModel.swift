//
//  StarWarsPlanetsViewModel.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the view model
protocol StarWarsPlanetsViewModelType {
    func fetchPlanets() async
}

// Mark: - ViewModel
@Observable
final class StarWarsPlanetsViewModel {
    private let useCase: StarWarsPlanetsUseCaseType
    private(set) var planets: [UI.Main.Planet] = []
    private(set) var error: Error?
    
    init(
        useCase: StarWarsPlanetsUseCaseType = StarWarsPlanetsUseCase()
    ) {
        self.useCase = useCase
    }
}

extension StarWarsPlanetsViewModel: StarWarsPlanetsViewModelType {
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

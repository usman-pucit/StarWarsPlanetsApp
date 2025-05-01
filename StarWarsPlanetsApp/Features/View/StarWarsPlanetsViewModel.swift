//
//  StarWarsPlanetsViewModel.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the view model
protocol StarWarsPlanetsViewModelType {
    
}

// Mark: - ViewModel
@Observable
final class StarWarsPlanetsViewModel {
    private let useCase: StarWarsPlanetsUseCaseType
    
    init(
        useCase: StarWarsPlanetsUseCaseType = StarWarsPlanetsUseCase()
    ) {
        self.useCase = useCase
    }
}

extension StarWarsPlanetsViewModel: StarWarsPlanetsViewModelType {
    // Implement the protocol methods here
}

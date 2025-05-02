//
//  StarWarsPlanetsRepository.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation
import Networking

// Define a protocol for the repository
protocol StarWarsPlanetsRepositoryType {
    func fetchPlanets() async throws -> [Domain.Main.Planet]
}

// MARK: - Repository
final class StarWarsPlanetsRepository {
    private let networkService: NetworkServiceType
    private let jsonMapper: NetworkMapperType
    
    init(
        networkService: NetworkServiceType = NerworkService(),
        jsonMapper: NetworkMapperType = JSONMapper()
    ) {

        self.networkService = networkService
        self.jsonMapper = jsonMapper
    }
}

extension StarWarsPlanetsRepository: StarWarsPlanetsRepositoryType {
    func fetchPlanets() async throws -> [Domain.Main.Planet] {
        // Create a request to fetch planets
        let request = try RequestBuilder.planets()
        
        // Fetch data from the network
        let (data, _) = try await networkService.fetch(request)
        
        // Decode the data into the expected model
        let apiModel: API.Main.PlanetResponse = try jsonMapper.decode(from: data)
        
        // Normalize the API model to the domain model
        return apiModel.normalize()
    }
}



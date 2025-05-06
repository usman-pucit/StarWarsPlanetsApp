//
//  PlanetsListRepository.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation
import Networking

// Define a protocol for the repository
protocol PlanetsListRepositoryType {
    func fetchPlanets() async throws -> [Domain.Planet.Item]
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail
}

// MARK: - Repository
final class PlanetsListRepository {
    private let networkService: NetworkServiceType
    private let jsonMapper: NetworkMapperType
    private let networkMonitor: NetworkMonitorType
    
    init(
        networkService: NetworkServiceType = NerworkService(),
        jsonMapper: NetworkMapperType = JSONMapper(),
        networkMonitor: NetworkMonitorType = NetworkMonitor()
    ) {

        self.networkService = networkService
        self.jsonMapper = jsonMapper
        self.networkMonitor = networkMonitor
    }
}

extension PlanetsListRepository: PlanetsListRepositoryType {
    func fetchPlanets() async throws -> [Domain.Planet.Item] {
        // Check network connectivity
        guard networkMonitor.isReachable else {
            throw NetworkError.noInternetConnection
        }
        
        // Create a request to fetch planets
        let request = try RequestBuilder.planets()
        
        // Fetch data from the network
        let (data, _) = try await networkService.fetch(request)
        
        // Decode the data into the expected model
        let apiModel: API.Planet.List.Response = try jsonMapper.decode(from: data)
        
        // Normalize the API model to the domain model
        return apiModel.normalize()
    }
    
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail {
        // Check network connectivity
        guard networkMonitor.isReachable else {
            throw NetworkError.noInternetConnection
        }
        
        // Create a request to fetch planets
        let request = try RequestBuilder.detail(id: id)
        
        // Fetch data from the network
        let (data, _) = try await networkService.fetch(request)
        
        // Decode the data into the expected model
        let apiModel: API.Planet.Detail.Response = try jsonMapper.decode(from: data)
        
        // Normalize the API model to the domain model
        return apiModel.normalize()
    }
}



//
//  PlanetsListRepository+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 05.05.25.
//

import Foundation
import Networking
@testable import StarWarsPlanetsApp

class PlanetsListRepositoryMock: PlanetsListRepositoryType {
    private let networkService: NetworkServiceType
    private let jsonMapper: NetworkMapperType

    init(
        networkService: NetworkServiceType,
        jsonMapper: NetworkMapperType = JSONMapper()
    ) {
        self.networkService = networkService
        self.jsonMapper = jsonMapper
    }
    
    func fetchPlanets() async throws -> [Domain.Planet.Item] {
        let request = try RequestBuilder.planets()
        
        let (data, _) = try await networkService.fetch(request)
        
        let apiModel: API.Planet.List.Response = try jsonMapper.decode(from: data)
        
        return apiModel.normalize()
    }
    
    func fetchDetail(id: String) async throws -> Domain.Planet.Detail {
        let request = try RequestBuilder.detail(id: id)
        
        let (data, _) = try await networkService.fetch(request)
        
        let apiModel: API.Planet.Detail.Response = try jsonMapper.decode(from: data)
        
        return apiModel.normalize()
    }
}


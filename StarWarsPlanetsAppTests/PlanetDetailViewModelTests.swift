//
//  PlanetDetailViewModelTests.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 06.05.25.
//

import Testing
import Networking
import Foundation
@testable import StarWarsPlanetsApp

@Suite("Unit tests for PlanetDetailViewModel")
struct PlanetDetailViewModelTests {
    @Test("Test 1: fetch detail of planet with success")
    func testFetchPlanetDetail_withSuccess_expectDetail() async throws {
        // Given
        let mockResponse = API.Planet.Detail.Response.mock()
        let request = try RequestBuilder.detail(id: "1")
        let result = Result<(Data, HTTPURLResponse), Error>.success((try JSONEncoder().encode(mockResponse), HTTPURLResponse()))
        let service = NetworkServiceMock(request: request, result: result)
        let repository = PlanetsListRepositoryMock(networkService: service)
        let useCase = PlanetDetailUseCaseMock(repository: repository)
        let sut = PlanetDetailViewModel(planetId: "1", useCase: useCase)
        
        // When
        await sut.fetchDetail()
        
        // Then
        switch sut.viewState {
        case .result(let detail):
            #expect(detail.name == "Tatooine")
        default:
            #expect(Bool(false), "Test failed with unexpected state")
        }
    }
    
    @Test("Test 1: fetch detail of planet with error")
    func testFetchPlanetDetail_withFailure_expectError() async throws {
        // Given
        let mockError = NetworkError.invalidResponse
        let request = try RequestBuilder.detail(id: "1")
        let result = Result<(Data, HTTPURLResponse), Error>.failure(mockError)
        let service = NetworkServiceMock(request: request, result: result)
        let repository = PlanetsListRepositoryMock(networkService: service)
        let useCase = PlanetDetailUseCaseMock(repository: repository)
        let sut = PlanetDetailViewModel(planetId: "1", useCase: useCase)
        
        // When
        await sut.fetchDetail()
        
        // Then
        switch sut.viewState {
        case .error(let error):
            #expect(error.localizedDescription == mockError.localizedDescription)
        default:
            #expect(Bool(false), "Test failed with unexpected state")
        }
    }
}


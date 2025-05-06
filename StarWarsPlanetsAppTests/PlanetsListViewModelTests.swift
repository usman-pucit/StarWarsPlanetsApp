//
//  PlanetsListViewModelTests.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 01.05.25.
//

import Testing
import Networking
import Foundation
@testable import StarWarsPlanetsApp

@Suite("Unit tests for PlanetsListViewModel")
struct PlanetsListViewModelTests {
    @Test("Test 1: fetch list of planets with success")
    func testFetchPlanetsList_withSuccess_expectListofPlanets() async throws {
        // Given
        let mockResponse = API.Planet.List.Response.mock()
        let request = try RequestBuilder.planets()
        let result = Result<(Data, HTTPURLResponse), Error>.success((try JSONEncoder().encode(mockResponse), HTTPURLResponse()))
        let service = NetworkServiceMock(request: request, result: result)
        let repository = PlanetsListRepositoryMock(networkService: service)
        let useCase = PlanetsListUseCaseMock(repository: repository)
        let sut = PlanetsListViewModel(useCase: useCase)
        
        // When
        await sut.fetchPlanets()
        
        // Then
        switch sut.viewState {
        case .result(let planets):
            #expect(planets.count == 2)
            #expect(planets.first!.name == "Tatooine")
        default:
            #expect(Bool(false), "Test failed with unexpected state")
        }
    }
    
    @Test("Test 2: fetch list of planets with invalid response expect error")
    func testFetchPlanets_withFailure_expectError() async throws {
        // Given
        let mockError = NetworkError.invalidResponse
        let request = try RequestBuilder.planets()
        let result = Result<(Data, HTTPURLResponse), Error>.failure(mockError)
        let service = NetworkServiceMock(request: request, result: result)
        let repository = PlanetsListRepositoryMock(networkService: service)
        let useCase = PlanetsListUseCaseMock(repository: repository)
        let sut = PlanetsListViewModel(useCase: useCase)
        
        // When
        await sut.fetchPlanets()
        
        // Then
        switch sut.viewState {
        case .error(let error):
            #expect(error.localizedDescription == mockError.localizedDescription)
        default:
            #expect(Bool(false), "Test failed with unexpected state")
        }
    }
    
    @Test("Test 2: fetch list of planets with no internet connection expect error")
    func testFetchPlanetsWithoutInternet_withFailure_expectNoInternetConnectionError() async throws {
        // Given
        let mockResponse = API.Planet.List.Response.mock()
        let request = try RequestBuilder.planets()
        let result = Result<(Data, HTTPURLResponse), Error>.success((try JSONEncoder().encode(mockResponse), HTTPURLResponse()))
        let service = NetworkServiceMock(request: request, result: result)
        let networkMonitor = NetworkMonitorMock(isReachable: false)
        let repository = PlanetsListRepositoryMock(networkService: service, networkMonitor: networkMonitor)
        let useCase = PlanetsListUseCaseMock(repository: repository)
        let sut = PlanetsListViewModel(useCase: useCase)
        
        // When
        await sut.fetchPlanets()
        
        // Then
        switch sut.viewState {
        case .error(let error):
            #expect(error.localizedDescription == NetworkError.noInternetConnection.localizedDescription)
        default:
            #expect(Bool(false), "Test failed with unexpected state")
        }
    }
}


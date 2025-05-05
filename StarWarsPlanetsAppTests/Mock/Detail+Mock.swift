//
//  Detail+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 05.05.25.
//

import Foundation
@testable import StarWarsPlanetsApp

extension API.Planet.Detail.Response {
    static func mock() -> API.Planet.Detail.Response {
        API.Planet.Detail.Response(
            message: "Success",
            planet: .mock(),
            apiVersion: "1.0",
            timestamp: "2024-05-05T12:00:00Z",
            support: .mock(),
            social: .mock()
        )
    }
}

extension API.Planet.Detail.Response.Planet {
    static func mock() -> API.Planet.Detail.Response.Planet {
        .init(
            properties: .mock(),
            id: "1",
            description: "A desert planet and the home of Luke Skywalker",
            uid: "1",
            v: 1
        )
    }
}

extension API.Planet.Detail.Response.Planet.Properties {
    static func mock() -> API.Planet.Detail.Response.Planet.Properties {
        .init(
            created: "2024-05-05T12:00:00Z",
            edited: "2024-05-05T12:00:00Z",
            climate: "Arid",
            surfaceWater: "1",
            name: "Tatooine",
            diameter: "10465",
            rotationPeriod: "23",
            terrain: "Desert",
            gravity: "1 standard",
            orbitalPeriod: "304",
            population: "200000",
            url: "https://swapi.tech/api/planets/1"
        )
    }
}

// MARK: - Encodable

extension API.Planet.Detail.Response: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
        try container.encode(planet, forKey: .planet)
        try container.encode(apiVersion, forKey: .apiVersion)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(support, forKey: .support)
        try container.encode(social, forKey: .social)
    }
}

extension API.Planet.Detail.Response.Planet: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(properties, forKey: .properties)
        try container.encode(id, forKey: .id)
        try container.encode(description, forKey: .description)
        try container.encode(uid, forKey: .uid)
        try container.encode(v, forKey: .v)
    }
}

extension API.Planet.Detail.Response.Planet.Properties: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(created, forKey: .created)
        try container.encode(edited, forKey: .edited)
        try container.encode(climate, forKey: .climate)
        try container.encode(surfaceWater, forKey: .surfaceWater)
        try container.encode(name, forKey: .name)
        try container.encode(diameter, forKey: .diameter)
        try container.encode(rotationPeriod, forKey: .rotationPeriod)
        try container.encode(terrain, forKey: .terrain)
        try container.encode(gravity, forKey: .gravity)
        try container.encode(orbitalPeriod, forKey: .orbitalPeriod)
        try container.encode(population, forKey: .population)
        try container.encode(url, forKey: .url)
    }
} 

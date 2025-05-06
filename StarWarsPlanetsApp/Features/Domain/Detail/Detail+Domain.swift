//
//  Detail+Domain.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 04.05.25.
//

import Foundation

extension Domain.Planet {
    struct Detail {
        let name: String
        let climate: String
        let population: String
        let terrain: String
        let diameter: String
        let gravity: String
    }
}

// MARK: Noralizable
extension API.Planet.Detail.Response: Normalizable {
    typealias Output = Domain.Planet.Detail
    
    func normalize() -> Output {
        Output(
            name: planet.properties.name,
            climate: planet.properties.climate,
            population: planet.properties.population,
            terrain: planet.properties.terrain,
            diameter: planet.properties.diameter,
            gravity: planet.properties.gravity
        )
    }
}

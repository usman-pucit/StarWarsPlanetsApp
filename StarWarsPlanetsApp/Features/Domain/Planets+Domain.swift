//
//  Planets+Domain.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

extension Domain.Main {
    struct Planet {
        let uid: String
        let name: String
        let url: String
    }
}

// MARK: Noralizable
extension API.Main.PlanetResponse: Normalizable {
    typealias Output = [Domain.Main.Planet]
    
    func normalize() -> Output {
        return planets.map { $0.normalize() }
    }
}

extension API.Main.PlanetResponse.Planet: Normalizable {
    typealias Output = Domain.Main.Planet
    
    func normalize() -> Output {
        Output(
            uid: uid,
            name: name,
            url: url
        )
    }
}

//
//  Planets+Domain.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

extension Domain.Planet {
    struct Item {
        let uid: String
        let name: String
        let url: String
    }
}

// MARK: Noralizable
extension API.Planet.List.Response: Normalizable {
    typealias Output = [Domain.Planet.Item]
    
    func normalize() -> Output {
        return planets.map { $0.normalize() }
    }
}

extension API.Planet.List.Response.Planet: Normalizable {
    typealias Output = Domain.Planet.Item
    
    func normalize() -> Output {
        Output(
            uid: uid,
            name: name,
            url: url
        )
    }
}

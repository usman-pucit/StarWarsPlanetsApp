//
//  Planets+UI.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

extension UI.Planet {
    struct Item: Identifiable, Hashable {
        let id: String
        let name: String
        let url: String
    }
}

// MARK: Normalizable
extension Domain.Planet.Item: Normalizable {
    typealias Output = UI.Planet.Item
    
    func normalize() -> Output {
        Output(
            id: uid,
            name: name,
            url: url
        )
    }
}


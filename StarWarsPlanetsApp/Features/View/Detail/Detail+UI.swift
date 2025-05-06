//
//  Detail+UI.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 04.05.25.
//

import Foundation

extension UI.Planet {
    struct Detail {
        let name: String
        let items: [Item]
    }
}

extension UI.Planet.Detail {
    struct Item: Identifiable {
        var id = UUID()
        let title: String
        let value: String
        let icon: String
    }
}
    

// MARK: Noralizable
extension Domain.Planet.Detail: Normalizable {
    typealias Output = UI.Planet.Detail
    
    func normalize() -> Output {
        Output(
            name: name,
            items: [
                .init(title: "Climate", value: name, icon: "sun.max"),
                .init(title: "Population", value: population, icon: "person.3.sequence"),
                .init(title: "Diameter", value: diameter+" "+"km", icon: "circle"),
                .init(title: "Terrain", value: terrain, icon: "arrow.down.to.line"),
                .init(title: "Gravity", value: gravity, icon: "mountain.2"),
            ]
        )
    }
}

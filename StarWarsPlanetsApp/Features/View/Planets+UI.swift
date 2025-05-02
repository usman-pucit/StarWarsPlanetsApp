//
//  Planets+UI.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

extension UI.Main {
    struct Planet: Identifiable {
        var id = UUID()
        let name: String
    }
}

// MARK: Normalizable
extension Domain.Main.Planet: Normalizable {
    typealias Output = UI.Main.Planet
    
    func normalize() -> Output {
        Output(
            name: name
        )
    }
}


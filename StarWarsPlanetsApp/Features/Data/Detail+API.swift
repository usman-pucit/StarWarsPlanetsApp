//
//  Detail+API.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 04.05.25.
//

import Foundation

extension API.Planet.Detail {
    struct Response: Decodable {
        let message: String
        let planet: Planet
        let apiVersion: String
        let timestamp: String
        let support: API.Planet.List.Response.SupportInfo
        let social: API.Planet.List.Response.SocialLinks
        
        enum CodingKeys: String, CodingKey {
            case message
            case planet = "result"
            case apiVersion = "apiVersion"
            case timestamp
            case support
            case social
        }
    }
}

extension API.Planet.Detail.Response {
    struct Planet: Decodable {
        let properties: Properties
        let id: String
        let description: String
        let uid: String
        let v: Int
        
        enum CodingKeys: String, CodingKey {
            case properties
            case id = "_id"
            case description
            case uid
            case v = "__v"
        }
    }
}

extension API.Planet.Detail.Response.Planet {
    struct Properties: Decodable {
        let created: String
        let edited: String
        let climate: String
        let surfaceWater: String
        let name: String
        let diameter: String
        let rotationPeriod: String
        let terrain: String
        let gravity: String
        let orbitalPeriod: String
        let population: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case created
            case edited
            case climate
            case surfaceWater = "surface_water"
            case name
            case diameter
            case rotationPeriod = "rotation_period"
            case terrain
            case gravity
            case orbitalPeriod = "orbital_period"
            case population
            case url
        }
    }
}

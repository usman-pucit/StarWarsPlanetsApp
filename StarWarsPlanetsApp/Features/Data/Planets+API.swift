//
//  Planets+API.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

extension API.Planet.List {
    struct Response: Decodable {
        let message: String
        let totalRecords: Int
        let totalPages: Int
        let previous: String?
        let next: String?
        let planets: [Planet]
        let apiVersion: String
        let timestamp: String
        let support: SupportInfo
        let social: SocialLinks
         
         enum CodingKeys: String, CodingKey {
             case message
             case totalRecords = "total_records"
             case totalPages = "total_pages"
             case previous
             case next
             case planets = "results"
             case apiVersion
             case timestamp
             case support
             case social
         }
    }
}

extension API.Planet.List.Response {
    struct Planet: Decodable {
        let uid: String
        let name: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case uid
            case name
            case url
        }
    }
    
    struct SupportInfo: Decodable {
        let contact: String
        let donate: String
        let partnerDiscounts: PartnerDiscounts
        
        enum CodingKeys: String, CodingKey {
            case contact
            case donate
            case partnerDiscounts = "partnerDiscounts"
        }
    }
    
    struct SocialLinks: Decodable {
        let discord: String
        let reddit: String
        let github: String
        
        enum CodingKeys: String, CodingKey {
            case discord
            case reddit
            case github
        }
    }
}

extension API.Planet.List.Response.SupportInfo {
    struct PartnerDiscounts: Decodable {
        let saberMasters: DiscountDetails
        let heartMath: DiscountDetails
        
        enum CodingKeys: String, CodingKey {
            case saberMasters
            case heartMath
        }
    }
}

extension API.Planet.List.Response.SupportInfo.PartnerDiscounts {
    struct DiscountDetails: Decodable {
        let link: String
        let details: String
        
        enum CodingKeys: String, CodingKey {
            case link
            case details
        }
    }
}

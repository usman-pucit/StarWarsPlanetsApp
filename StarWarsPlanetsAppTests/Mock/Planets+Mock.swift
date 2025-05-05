//
//  Planets+Mock.swift
//  StarWarsPlanetsAppTests
//
//  Created by Usman on 05.05.25.
//

import Foundation
@testable import StarWarsPlanetsApp

extension API.Planet.List.Response {
    static func mock() -> API.Planet.List.Response {
        API.Planet.List.Response(
            message: "Success",
            totalRecords: 2,
            totalPages: 1,
            previous: nil,
            next: nil,
            planets: [.mock(), .mock()],
            apiVersion: "1.0",
            timestamp: "2024-05-05T12:00:00Z",
            support: .mock(),
            social: .mock()
        )
    }
}

extension API.Planet.List.Response.Planet {
    static func mock() -> API.Planet.List.Response.Planet {
        return .init(uid: "1", name: "Tatooine", url: "https://swapi.tech/api/planets/1")
    }
}

extension API.Planet.List.Response.SupportInfo {
    static func mock() -> API.Planet.List.Response.SupportInfo {
        .init(
            contact: "contact@swapi.tech",
            donate: "donate@swapi.tech",
            partnerDiscounts: .init(
                saberMasters: .init(link: "https://sabermasters.com", details: "20% off"),
                heartMath: .init(link: "https://heartmath.com", details: "15% off")
            )
        )
    }
}

extension API.Planet.List.Response.SupportInfo.PartnerDiscounts {
    static func mock() -> API.Planet.List.Response.SupportInfo.PartnerDiscounts {
        return .init(
            saberMasters: .init(link: "https://sabermasters.com", details: "20% off"),
            heartMath: .init(link: "https://heartmath.com", details: "15% off")
        )
    }
}

extension API.Planet.List.Response.SocialLinks {
    static func mock() -> API.Planet.List.Response.SocialLinks {
        return .init(
            discord: "https://discord.gg/swapi",
            reddit: "https://reddit.com/r/swapi",
            github: "https://github.com/swapi"
        )
    }
}

// MARK: - Encodable

extension API.Planet.List.Response: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(message, forKey: .message)
        try container.encode(totalRecords, forKey: .totalRecords)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(previous, forKey: .previous)
        try container.encode(next, forKey: .next)
        try container.encode(planets, forKey: .planets)
        try container.encode(apiVersion, forKey: .apiVersion)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(support, forKey: .support)
        try container.encode(social, forKey: .social)
    }
}

extension API.Planet.List.Response.Planet: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uid, forKey: .uid)
        try container.encode(name, forKey: .name)
        try container.encode(url, forKey: .url)
    }
}

extension API.Planet.List.Response.SupportInfo: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(contact, forKey: .contact)
        try container.encode(donate, forKey: .donate)
        try container.encode(partnerDiscounts, forKey: .partnerDiscounts)
    }
}

extension API.Planet.List.Response.SupportInfo.PartnerDiscounts: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(saberMasters, forKey: .saberMasters)
        try container.encode(heartMath, forKey: .heartMath)
    }
}

extension API.Planet.List.Response.SocialLinks: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(discord, forKey: .discord)
        try container.encode(reddit, forKey: .reddit)
        try container.encode(github, forKey: .github)
    }
}

extension API.Planet.List.Response.SupportInfo.PartnerDiscounts.DiscountDetails: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(link, forKey: .link)
        try container.encode(details, forKey: .details)
    }
}

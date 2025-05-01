//
//  File.swift
//  Networking
//
//  Created by Usman on 01.05.25.
//

import Foundation

// Define a protocol for the JSON mapper
public protocol NetworkMapperType {
    func decode<T: Decodable>(from data: Data) throws -> T
}

// MARK: - JSONMapper
final public class JSONMapper {
    private let decoder: JSONDecoder
    
    public init(
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.decoder = decoder
    }
}

// Implement the NetworkMapperType protocol
extension JSONMapper: NetworkMapperType {
    public func decode<T: Decodable>(from data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}

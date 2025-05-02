//
//  Normalizable.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import Foundation

protocol Normalizable {
    associatedtype Output
    
    func normalize() -> Output
}

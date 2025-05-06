//
//  String+Extension.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 06.05.25.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

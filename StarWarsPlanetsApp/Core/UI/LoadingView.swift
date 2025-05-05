//
//  LoadingView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 05.05.25.
//

import SwiftUI

struct LoadingView: View {
    let message: String
    
    init(message: String = "Loading...") {
        self.message = message
    }
        
    var body: some View {
        ZStack(alignment: .center) {
            ProgressView(message)
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1)
        }
    }
}

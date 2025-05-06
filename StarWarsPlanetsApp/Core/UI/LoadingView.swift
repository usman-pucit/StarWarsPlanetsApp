//
//  LoadingView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 05.05.25.
//

import SwiftUI

struct LoadingView: View {
    private let message: String
    
    init(
        message: String = String(format: "%@%@", "progress_loading".localized, "...")
    ) {
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

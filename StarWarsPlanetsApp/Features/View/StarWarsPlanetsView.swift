//
//  StarWarsPlanetsView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import SwiftUI

struct StarWarsPlanetsView: View {
    private var viewModel = StarWarsPlanetsViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    StarWarsPlanetsView()
}

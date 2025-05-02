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
        NavigationView {
            List(viewModel.planets) { planet in
                PlanetListItemView(planet: planet)
            }
            .task {
                await viewModel.fetchPlanets()
            }
            .background(Color.gray.opacity(0.3))
            .navigationTitle("Planets")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct PlanetListItemView: View {
    let planet: UI.Main.Planet

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "globe") // Placeholder
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .accessibilityLabel(planet.name)

            Text(planet.name)
                .font(.headline)
                .foregroundColor(Color.gray)
                .accessibility(label: Text("Planet Name: \(planet.name)"))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
                .accessibilityHidden(true)
        }
        .padding(8)
    }
}

#Preview {
    StarWarsPlanetsView()
}

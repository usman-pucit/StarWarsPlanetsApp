//
//  PlanetsListView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import SwiftUI

struct PlanetsListView: View {
    @State private var viewModel = PlanetsListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.planets) { planet in
                NavigationLink {
                    PlanetDetailView(viewModel: PlanetDetailViewModel(planetId: planet.id))
                } label: {
                    PlanetListItemView(planet: planet)
                }
            }
            .task {
                await viewModel.fetchPlanets()
            }
            .background(Color(.systemBackground))
            .navigationTitle("Planets")
        }
    }
}

struct PlanetListItemView: View {
    let planet: UI.Planet.Item

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "globe") // Placeholder
                .font(.system(size: 22))
                .foregroundColor(.blue)
                .accessibility(label: Text("\(planet.name) icon"))
            
            Text(planet.name)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .accessibility(label: Text("Planet Name: \(planet.name)"))
        }
        .padding(8)
    }
}

#Preview {
    PlanetsListView()
}

//
//  PlanetsListView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 01.05.25.
//

import SwiftUI

struct PlanetsListView: View {
    @State private var viewModel = PlanetsListViewModel()
    @State private var reloadTrigger = UUID()
    
    var body: some View {
        NavigationStack {
            ZStack {
                contentView
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("navigation_title_planets")
        }
        .background(Color(.systemBackground))
        .task(id: reloadTrigger) {
            await viewModel.fetchPlanets()
        }
    }
    
    // MARK: - Private Views
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.viewState {
        case .idle, .loading:
            LoadingView()
        case .error(let error):
            errorView(with: error)
        case .result(let planets):
            planetsListView(with: planets)
        case .empty:
            planetListEmptyView
        }
    }
    
    private func planetsListView(with planets: [UI.Planet.Item]) -> some View {
        List(planets) { planet in
            NavigationLink {
                PlanetDetailView(viewModel: PlanetDetailViewModel(planetId: planet.id))
            } label: {
                PlanetListItemView(planet: planet)
            }
        }
    }
    
    private var planetListEmptyView: some View {
        GenericErrorView(errorMessage: "error_no_planets_available".localized) {
            reloadTrigger = UUID()
        }
    }
    
    private func errorView(with error: Error) -> some View {
        GenericErrorView(errorMessage: error.localizedDescription) {
            reloadTrigger = UUID()
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
                .accessibilityLabel("\(planet.name) icon")
            
            Text(planet.name)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .accessibilityLabel("Planet Name: \(planet.name)")
        }
        .padding(8)
    }
}

#Preview {
    PlanetsListView()
}

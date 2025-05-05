//
//  PlanetDetailView.swift
//  StarWarsPlanetsApp
//
//  Created by Usman on 03.05.25.
//

import Foundation
import SwiftUI

struct PlanetDetailView: View {
    var viewModel: PlanetDetailViewModel
    
    var body: some View {
        ZStack {
            contentView
                .padding(.bottom, 24)
        }
        .background(Color(.systemBackground))
        .task {
            await viewModel.fetchDetail()
        }
    }
    
    // ContentView
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.viewState {
        case .idle, .loading:
            LoadingView()
        case .result(let detail):
            detailView(with: detail)
        case .error(let error):
            GenericErrorView(errorMessage: error.localizedDescription)
        case .empty:
            GenericErrorView(errorMessage: "Planet detail is not available.")
        }
    }
    
    private func detailView(with detail: UI.Planet.Detail) -> some View {
        ScrollView {
            VStack(spacing: 24) {
                Text(detail.name)
                    .font(.title)
                    .foregroundColor(.primary)
                    .padding(.top, 12)
                    .accessibilityLabel("Planet Name: \(detail.name)")
                
                LazyVStack(spacing: 16) {
                    ForEach(detail.items) { item in
                        PlanetInfoView(item: item)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - PlanetInfoView
struct PlanetInfoView: View {
    let item: UI.Planet.Detail.Item
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title.uppercased())
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    
                    Text(item.value)
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                .accessibility(label: Text("Planet \(item.title): \(item.value)"))
                
                Spacer()
                
                // Icon for each property
                Image(systemName: item.icon)
                    .font(.system(size: 22))
                    .foregroundColor(.blue)
                    .accessibility(label: Text("\(item.title) icon"))
            }
            .padding()
        }
        .frame(height: 80)
    }
}

#Preview {
    PlanetDetailView(viewModel: PlanetDetailViewModel(planetId: "1"))
}


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
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                if let detail = viewModel.detail {
                    Text(detail.name)
                        .font(.title)
                        .foregroundColor(.primary)
                        .padding(.top, 12)
                    
                    LazyVStack(spacing: 16) {
                        ForEach(detail.items) { item in
                           PlanetInfoView(item: item)
                        }
                    }
                    .padding(.horizontal)
                } else {
                    Text("Loading...")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color(.systemBackground))
        .task {
            await viewModel.fetchDetail()
        }
    }
}

// MARK: - PlanetInfoView
struct PlanetInfoView: View {
    let item: UI.Planet.Detail.Item
    
    var body: some View {
        ZStack {
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

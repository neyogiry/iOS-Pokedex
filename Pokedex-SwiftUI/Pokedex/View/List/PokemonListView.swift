//
//  PokemonListView.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @State private var viewModel = PokemonListViewModel()
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.pokedex, id: \.name) { pokemon in
                        NavigationLink(
                            destination: {
                                PokemonDetailView(pokemon: pokemon)
                            },
                            label: {
                                PokemonItemView(pokemon: pokemon)
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .task {
                    do {
                        try await viewModel.fetchPokedex()
                    } catch {
                        print(error)
                    }
                    
                }
            }
            .navigationTitle("Pokedex")
            .toolbarBackground(Color(.pokedex))
            .environment(viewModel)
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

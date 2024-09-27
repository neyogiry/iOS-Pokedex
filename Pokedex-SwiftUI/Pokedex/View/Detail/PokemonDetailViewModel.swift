//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 7/09/24.
//

import Foundation

@Observable
final class PokemonDetailViewModel {
    
    private let repository: PokemonRepository = PokemonRepository.shared
    
    var pokemonDetail: PokemonDetail?
    
    func fetchPokemonDetail(from url: String) async throws {
        do {
            pokemonDetail = try await repository.detail(from: url)
        } catch {
            print(error)
        }
        
    }
    
}

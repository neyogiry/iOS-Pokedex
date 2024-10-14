//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 7/09/24.
//

import Foundation

@Observable
final class PokemonDetailViewModel {
    
    private let getPokemonDetailUseCase: GetPokemonDetailUseCase
    
    var pokemonDetail: PokemonDetail?
    
    init(getPokemonDetailUseCase: GetPokemonDetailUseCase = GetPokemonDetailUseCase(PokedexRepository.shared)) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
    
    func fetchPokemonDetail(from url: String) async throws {
        do {
            pokemonDetail = try await getPokemonDetailUseCase.execute(from: url)
        } catch {
            print(error)
        }
        
    }
    
}

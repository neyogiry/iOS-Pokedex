//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 7/09/24.
//

import Foundation

@Observable
final class PokemonDetailViewModel {
    
    private let repository: PokedexRepositoryProtocol
    
    var pokemonDetail: PokemonDetail?
    
    init(repository: PokedexRepositoryProtocol = PokedexRepository(dataSource: RemoteDataSource())) {
        self.repository = repository
    }
    
    func fetchPokemonDetail(from url: String) async throws {
        do {
            pokemonDetail = try await repository.detail(from: url)
        } catch {
            print(error)
        }
        
    }
    
}

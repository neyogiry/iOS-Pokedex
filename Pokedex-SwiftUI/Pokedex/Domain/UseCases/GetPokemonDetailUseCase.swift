//
//  GetPokemonDetailUseCase.swift
//  Pokedex
//
//  Created by neyogiry on 13/10/24.
//

struct GetPokemonDetailUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol){
        self.repository = repository
    }
    
    func execute(from url: String) async throws -> PokemonDetail {
        return try await repository.detail(from: url)
    }
}

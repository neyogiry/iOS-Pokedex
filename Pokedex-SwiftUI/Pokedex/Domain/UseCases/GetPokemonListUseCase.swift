//
//  GetPokemonListUseCase.swift
//  Pokedex
//
//  Created by neyogiry on 13/10/24.
//

struct GetPokemonListUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol){
        self.repository = repository
    }
    
    func execute() async throws -> [Pokemon] {
        return try await repository.all()
    }
}

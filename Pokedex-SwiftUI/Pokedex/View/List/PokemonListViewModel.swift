//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by neyogiry on 4/04/24.
//

import Foundation

@Observable
final class PokemonListViewModel {
    
    private let getPokemonListUseCase: GetPokemonListUseCase
    private let getImageUseCase: GetImageUseCase
    
    var pokedex: [Pokemon] = []
    
    init(getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(PokedexRepository.shared), getImageUseCase: GetImageUseCase = GetImageUseCase(PokedexRepository.shared)) {
        self.getPokemonListUseCase = getPokemonListUseCase
        self.getImageUseCase = getImageUseCase
    }
    
    func fetchPokedex() async throws {
        do {
            pokedex = try await getPokemonListUseCase.execute()
        } catch {
            print(error)
        }
    }
    
    func fetchImage(from url: String) async throws -> Data {
        return try await getImageUseCase.execute(from: url)
    }
    
}

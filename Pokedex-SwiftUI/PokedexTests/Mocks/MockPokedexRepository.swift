//
//  MockPokedexRepository.swift
//  PokedexTests
//
//  Created by neyogiry on 14/10/24.
//

import XCTest
@testable import Pokedex

final class MockPokedexRepository: PokedexRepositoryProtocol {
    var shouldThrowError = false
    private let testError = NSError(domain: "TestError", code: 1)
    private let pokemon = Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    private let pokemonDetail = PokemonDetail(id: 1, name: "Bulbasaur", height: 6.9, weight: 0.7, stats: [])
    
    func all() async throws -> [Pokemon] {
        if shouldThrowError {
            throw testError
        }
        return [pokemon]
    }
    
    func fetchImage(from url: String) async throws -> Data {
        if shouldThrowError {
            throw testError
        }
        return Data()
    }
    
    func detail(from url: String) async throws -> PokemonDetail {
        if shouldThrowError {
            throw testError
        }
        return pokemonDetail
    }
    
    
}

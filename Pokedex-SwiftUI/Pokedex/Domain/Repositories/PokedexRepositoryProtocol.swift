//
//  PokemonDataSource.swift
//  Pokedex
//
//  Created by neyogiry on 27/12/23.
//

import Foundation

protocol PokedexRepositoryProtocol {
    func all() async throws -> [Pokemon]
    func fetchImage(from url: String) async throws -> Data
    func detail(from url: String) async throws -> PokemonDetail
}

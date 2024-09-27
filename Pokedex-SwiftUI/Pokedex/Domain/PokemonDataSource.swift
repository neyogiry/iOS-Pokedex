//
//  PokemonDataSource.swift
//  Pokedex
//
//  Created by neyogiry on 27/12/23.
//

import Foundation

protocol PokemonDataSource {
    func all() async throws -> Pokedex
    func fetchImage(from url: String) async throws -> Data
}

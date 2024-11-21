//
//  DataSourceProtocol.swift
//  Pokedex
//
//  Created by neyogiry on 20/11/24.
//

import Foundation

protocol DataSourceProtocol {
    func all() async throws -> Pokedex
    func fetchImage(from url: String) async throws -> Data
    func detail(from url: String) async throws -> PokemonDetail
}

//
//  PokemonDataSource.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation

protocol PokemonDataSource {
    func all(
        success: @escaping (_ pokedex: Pokedex) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
    func detail(
        url: String,
        success: @escaping (_ pokemon: PokemonDetail) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
}

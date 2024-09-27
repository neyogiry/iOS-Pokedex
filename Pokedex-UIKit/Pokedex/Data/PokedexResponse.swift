//
//  Pokemon.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation

struct PokedexResponse: Decodable {
    let count: Int?
    let next: String?
    let results: [PokemonResponse]
}


struct PokemonResponse: Decodable {
    let name: String?
    let url: String?
}

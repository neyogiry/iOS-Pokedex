//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by neyogiry on 7/04/22.
//

import Foundation

struct PokemonDetail: Decodable {
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonType]
}

struct PokemonType: Decodable {
    let slot: Int
    let type: PokemonTypeDetail
}

struct PokemonTypeDetail: Decodable {
    let name: String
    let url: String
}

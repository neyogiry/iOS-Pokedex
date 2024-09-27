//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by neyogiry on 6/09/24.
//

struct PokemonDetail : Codable {
    let id: Int
    let name: String
    let height: Double
    let weight: Double
    let stats: [PokemonStat]
}

struct PokemonStat : Codable, Hashable {
    let base_stat: Int
    let effort: Int
    let stat: Stat
}

struct Stat : Codable, Hashable {
    let name: String
    let url: String
}

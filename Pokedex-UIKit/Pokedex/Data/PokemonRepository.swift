//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by neyogiry on 3/01/22.
//

import Foundation
import Alamofire

final class PokemonRepository: PokemonDataSource {
    
    static let shared = PokemonRepository()
    
    func all(
        success: @escaping (_ pokedex: Pokedex) -> Void,
        failure: @escaping (_ error: String) -> Void
    ) {
        
        let url = "\(Constants.baseUrl)\(Constants.all)"
        
        AF
            .request(url)
            .responseDecodable(of: PokedexResponse.self) { (response) in
                if let error = response.error {
                    failure(error.errorDescription ?? "")
                    return
                }
                if let pokedexResponse = response.value {
                    success(pokedexResponse.asDomain())
                }
            }
    
    }
    
    func detail(
        url: String,
        success: @escaping (_ pokemon: PokemonDetail) -> Void,
        failure: @escaping (_ error: String) -> Void
    ) {
        
        AF
            .request(url)
            .responseDecodable(of: PokemonDetailResponse.self) { (response) in
                if let error = response.error {
                    failure(error.errorDescription ?? "")
                    return
                }
                if let pokemonDetailResponse = response.value {
                    success(pokemonDetailResponse.asDomain())
                }
            }
        
    }
    
}

extension PokedexResponse {
    
    func asDomain() -> Pokedex {
        var pokemonList: [Pokemon] = []
        for pokemonResponse in self.results {
            pokemonList.insert(pokemonResponse.asDomain(), at: pokemonList.count)
        }
        return Pokedex(pokemon: pokemonList)
    }
    
}

extension PokemonResponse {
    
    func asDomain() -> Pokemon {
        return Pokemon(
            name: self.name ?? "",
            url: self.url ?? ""
        )
    }
    
}


extension PokemonDetailResponse {
    
    func asDomain() -> PokemonDetail {
        var types: [PokemonType] = []
        for typesResponse in self.types {
            types.insert(typesResponse.asDomain(), at: types.count)
        }
        return PokemonDetail(
            name: self.name,
            height: self.height,
            weight: self.weight,
            types: types
        )
    }
    
}

extension PokemonTypeResponse {
    
    func asDomain() -> PokemonType {
        return PokemonType(
            slot: self.slot,
            type: self.type.asDomain()
        )
    }
    
}

extension PokemonTypeDetailResponse {
    
    func asDomain() -> PokemonTypeDetail {
        return PokemonTypeDetail(
            name: self.name,
            url: self.url
        )
    }
    
}

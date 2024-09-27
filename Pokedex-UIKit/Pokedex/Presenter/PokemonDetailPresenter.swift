//
//  PokemonDetailPresenter.swift
//  Pokedex
//
//  Created by neyogiry on 21/04/22.
//

import Foundation

protocol PokemonDetailPresenterDelegate {
    func didGetPokemonDetail(pokemon: PokemonDetail)
    func didFailWithError(error: String)
}

class PokemonDetailPresenter {
    
    var delegate: PokemonDetailPresenterDelegate?
    
    func fetchPokemonDetail(url: String) {
        PokemonRepository.shared.detail(url: url) { pokemon in
            self.delegate?.didGetPokemonDetail(pokemon: pokemon)
        } failure: { error in
            self.delegate?.didFailWithError(error: error)
        }
    }
    
}

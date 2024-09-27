//
//  PokedexPresenter.swift
//  Pokedex
//
//  Created by neyogiry on 21/04/22.
//

import Foundation

protocol PokedexPresenterDelegate {
    func didGetPokedex(pokedex: Pokedex)
    func didFailWithError(error: String)
}

class PokedexPresenter {
    
    var delegate: PokedexPresenterDelegate?
    
    func fetchPokedex() {
        PokemonRepository.shared.all { pokedex in
            self.delegate?.didGetPokedex(pokedex: pokedex)
        } failure: { error in
            self.delegate?.didFailWithError(error: error)
        }
    }
    
}

//
//  PokemonTypeCollectionViewCell.swift
//  Pokedex
//
//  Created by neyogiry on 23/03/22.
//

import UIKit

class PokemonTypeCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var pokemonType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonType.text = ""
        pokemonType.textColor = .white
        layer.cornerRadius = 15
    }

}

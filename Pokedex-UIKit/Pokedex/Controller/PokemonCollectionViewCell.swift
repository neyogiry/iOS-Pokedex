//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by neyogiry on 13/12/21.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    
    static let sectionInsets = UIEdgeInsets(
        top: 24.0,
        left: 20.0,
        bottom: 24.0,
        right: 20.0
    )
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokemonImage.image = nil
        backgroundColor = .white
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10
    }

}

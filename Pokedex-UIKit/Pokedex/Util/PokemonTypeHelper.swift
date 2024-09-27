//
//  PokemonTypeHelper.swift
//  Pokedex
//
//  Created by neyogiry on 22/03/22.
//

import Foundation
import SwiftUI

class PokemonTypeHelper {
    
    static func typeColor(_ type: String) -> UIColor {
        var color: UIColor
        
        switch type {
        case "bug":
            color = UIColor(hexString: "#179A55")
        case "dark":
            color = UIColor(hexString: "#040706")
        case "dragon":
            color = UIColor(hexString: "#378A94")
        case "electric":
            color = UIColor(hexString: "#E0E64B")
        case "fairy":
            color = UIColor(hexString: "#9E1A44")
        case "fighting":
            color = UIColor(hexString: "#9F422A")
        case "fire":
            color = UIColor(hexString: "#B22328")
        case "flying":
            color = UIColor(hexString: "#90B1C5")
        case "ghost":
            color = UIColor(hexString: "#363069")
        case "grass":
            color = UIColor(hexString: "#007C42")
        case "ground":
            color = UIColor(hexString: "#AD7235")
        case "ice":
            color = UIColor(hexString: "#7ECFF2")
        case "poison":
            color = UIColor(hexString: "#642785")
        case "psychic":
            color = UIColor(hexString: "#AC296B")
        case "rock":
            color = UIColor(hexString: "#4B190E")
        case "steel":
            color = UIColor(hexString: "#5C756D")
        case "water":
            color = UIColor(hexString: "#2648DC")
        default:
            color = UIColor(hexString: "#B1A5A5")
        }
        return color
    }
    
}

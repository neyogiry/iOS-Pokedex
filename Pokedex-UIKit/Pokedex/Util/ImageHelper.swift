//
//  ImageHelper.swift
//  Pokedex
//
//  Created by neyogiry on 5/01/22.
//

import UIKit

class ImageHelper {
    
    static func pokemonImageUrl(_ url: String) -> String {
        let array = url.components(separatedBy: "/")
        let id = array[array.count-2]
        return String(format: Constants.baseImageUrl, arguments: [id])
    }
    
}

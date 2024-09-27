//
//  ImageUtil.swift
//  Pokedex
//
//  Created by neyogiry on 7/09/24.
//

final class ImageUtil {
    static func imageURL(from url: String) -> String {
        let baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%@.png"
        let array = url.components(separatedBy: "/")
        let id = array[array.count-2]
        return String(format: baseImageUrl, arguments: [id])
    }
}

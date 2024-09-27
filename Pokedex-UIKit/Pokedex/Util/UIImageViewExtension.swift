//
//  UIImageViewExtension.swift
//  Pokedex
//
//  Created by neyogiry on 5/01/22.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func load(_ url: String, image: ((_ image: UIImage?) -> Void)? = nil) {
        if let withURL = URL(string: url) {
            af.setImage(
                withURL: withURL,
                completion: { response in
                    image?(response.value)
                }
            )
        }
    }
    
}

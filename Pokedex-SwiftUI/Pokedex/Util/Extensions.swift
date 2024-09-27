//
//  DoubleExtension.swift
//  Pokedex
//
//  Created by neyogiry on 18/09/24.
//

extension Double {
    func inMetersFormat() -> String {
        return String(format: "%.1f m", self / 10)
    }
    func inKilogramsFormat() -> String {
        return String(format: "%.1f kg", self / 10)
    }
}

extension Int {
    func orderFomat() -> String {
        return String(format: "#%03d", self)
    }
}

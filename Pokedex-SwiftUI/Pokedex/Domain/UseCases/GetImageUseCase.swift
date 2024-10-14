//
//  GetImageUseCase.swift
//  Pokedex
//
//  Created by neyogiry on 13/10/24.
//

import Foundation

struct GetImageUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol){
        self.repository = repository
    }
    
    func execute(from url: String) async throws -> Data {
        return try await repository.fetchImage(from: url)
    }
}

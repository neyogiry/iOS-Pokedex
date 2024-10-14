//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by neyogiry on 28/12/23.
//

import Foundation

struct PokedexRepository: PokedexRepositoryProtocol {
    static let shared = PokedexRepository()
    
    private let dataSource: PokedexDataSource
    
    init(dataSource: PokedexDataSource = RemoteDataSource()) {
        self.dataSource = dataSource
    }
    
    func all() async throws -> [Pokemon] {
        return try await dataSource.all().results
    }
    
    func fetchImage(from url: String) async throws -> Data {
        return try await dataSource.fetchImage(from: url)
    }
    
    func detail(from url: String) async throws -> PokemonDetail {
        return try await dataSource.detail(from: url)
    }
    
}

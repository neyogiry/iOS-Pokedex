//
//  GetPokemonDetailUseCaseTests.swift
//  PokedexTests
//
//  Created by neyogiry on 13/10/24.
//

import XCTest
@testable import Pokedex

final class GetPokemonDetailUseCaseTests: XCTestCase {
    private var repository: MockPokedexRepository!
    private var getPokemonDetailUseCase: GetPokemonDetailUseCase!

    
    override func setUp() {
        super.setUp()
        self.repository = MockPokedexRepository()
        self.getPokemonDetailUseCase = GetPokemonDetailUseCase(repository)
    }
    
    override func tearDown() {
        self.repository = nil
        self.getPokemonDetailUseCase = nil
        super.tearDown()
    }
    
    func testGetPokemonDetailSuccess() async throws {
        let pokemon = try await getPokemonDetailUseCase.execute(from: "")
        
        XCTAssertEqual(pokemon.id, 1)
        XCTAssertEqual(pokemon.name, "Bulbasaur")
        XCTAssertEqual(pokemon.height, 6.9)
        XCTAssertEqual(pokemon.weight, 0.7)
        XCTAssertEqual(pokemon.stats.count, 0)
    }
    
    func testGetPokemonDetailFailure() async throws {
        repository.shouldThrowError = true
        
        do {
            _ = try await getPokemonDetailUseCase.execute(from: "")
            XCTFail("Expected to throw error but did not")
        } catch {
            XCTAssertNotNil(error)
        }
    }

}

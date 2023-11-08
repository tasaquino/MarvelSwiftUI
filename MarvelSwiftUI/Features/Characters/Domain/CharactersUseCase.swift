//
//  CharactersUseCase.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation

protocol CharactersUseCaseProtocol {
    func fetchCharacters() async throws -> [Character]?
}

struct CharactersUseCase: CharactersUseCaseProtocol {
    let repository: CharactersRepositoryProtocol
    
    init(repository: CharactersRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters() async throws -> [Character]? {
        do {
            guard let result = try await self.repository.fetchCharacters() else { return [] }
            return result.data?.results
//            return ComicsMapper.mapData(response: result)
        } catch {
            throw error
        }
    }
}

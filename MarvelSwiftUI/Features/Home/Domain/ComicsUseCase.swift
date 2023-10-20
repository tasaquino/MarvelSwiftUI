//
//  HomeUseCase.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation

protocol HomeUseCaseProtocol {
    func fetchComics() async throws -> [Comic]?
}

class ComicsUseCase: HomeUseCaseProtocol {
    let repository: MarvelRepositoryProtocol
    
    init(repository: MarvelRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchComics() async throws -> [Comic]? {
        do {
            guard let result = try await self.repository.fetchComics() else { return [] }
           
            return ComicsMapper.mapData(response: result)
        } catch {
            throw error
        }
    }
}

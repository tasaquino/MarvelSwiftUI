//
//  CharactersRepository.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func fetchCharacters() async throws -> CharactersResponse?
}

struct CharactersRepository : CharactersRepositoryProtocol {
    let networking: NetworkingManagerProtocol
    let appConfig: AppConfigProtocol
    
    init(networking: NetworkingManagerProtocol, appConfig: AppConfigProtocol) {
        self.networking = networking
        self.appConfig = appConfig
    }
    
    func fetchCharacters() async throws -> CharactersResponse?  {
        return try await self.networking.fetch(url: self.appConfig.getCharacters())
    }
}

//
//  ComicsFactory.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation

struct ComicsFactory {
    private static func makeNetworkingManager() -> NetworkingManagerProtocol {
        return NetworkingManager()
    }
    
    private static func makeComicsRepository() -> ComicsRepositoryProtocol {
        let networking = makeNetworkingManager()
        return ComicsRepository(networking: networking, appConfig: AppConfig())
    }
    
    private static func makeCharactersRepository() -> CharactersRepositoryProtocol {
        let networking = makeNetworkingManager()
        return CharactersRepository(networking: networking, appConfig: AppConfig())
    }
    
    private static func makeComicsUseCase() -> ComicsUseCaseProtocol {
        return ComicsUseCase(repository: makeComicsRepository())
    }
    
    private static func makeCharactersUseCase() -> CharactersUseCaseProtocol {
        return CharactersUseCase(repository: makeCharactersRepository())
    }
    
    static func makeComicsViewModel() -> ComicsViewModel {
        return ComicsViewModel(initialComics: [], useCase: makeComicsUseCase(), gridMode: false)
    }
    
    static func makeCharactersViewModel() -> CharactersViewModel {
        return CharactersViewModel(useCase: makeCharactersUseCase())
    }
}

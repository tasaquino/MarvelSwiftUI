//
//  MarvelRepository.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation
import Alamofire

class ComicsRepository : ComicsRepositoryProtocol {
    let networking: NetworkingManagerProtocol
    
    let appConfig: AppConfigProtocol
    
    init(networking: NetworkingManagerProtocol, appConfig: AppConfigProtocol) {
        self.networking = networking
        self.appConfig = appConfig
    }
    
    func fetchComics() async throws -> ComicsResponse?  {
        return try await self.networking.fetch(url: self.appConfig.getComicsUrl())
    }
    
    func fetchComicBy(id: String) {
        // TODO: fetchComicBy
    }
    
    func setFavoriteComic(id: String) {
        // TODO: setFavoriteComic
    }
}

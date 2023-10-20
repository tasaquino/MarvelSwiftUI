//
//  MarvelRepository.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation
import Alamofire

class MarvelRepository : MarvelRepositoryProtocol {
    let appConfig: AppConfigProtocol
    
    init(appConfig: AppConfigProtocol) {
        self.appConfig = appConfig
    }
    
    func fetch<T:Decodable>(url: String) async throws -> T {
        let response: DataResponse<T, AFError> = await AF.request(self.appConfig.getComicsUrl(), interceptor: .retryPolicy)
                               .cacheResponse(using: .cache)
                               .validate()
                               .cURLDescription { description in
                                   debugPrint(description)
                               }
                               .serializingDecodable(T.self)
                               .response
        
        do {
            let response = try response.result.get()
            debugPrint(response)
            return response
        } catch {
            throw error
        }
    }
    
    func fetchComics() async throws -> MarvelHomeResponse?  {
        return try await self.fetch(url: self.appConfig.getComicsUrl())
    }
    
    func fetchComicBy(id: String) {
        // TODO: fetchComicBy
    }
    
    func fetchCharacterBy(id: String) {
        // TODO: fetchCharacterBy
    }
    
    func setFavoriteComic(id: String) {
        // TODO: setFavoriteComic
    }
}

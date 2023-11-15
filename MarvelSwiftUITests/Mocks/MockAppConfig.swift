//
//  MockAppConfig.swift
//  MarvelSwiftUITests
//
//  Created by Thais Aquino on 15/11/2023.
//

import Foundation
@testable import MarvelSwiftUI
struct MockAppConfig: AppConfigProtocol {
    
    var apiKey: String = "boomm"
    var hash: String = "boomm"
    var baseUrl: String = "boomm"
    
    init(url: String, apiKey: String, hash: String) {
        self.baseUrl = url
        self.apiKey = apiKey
        self.hash = hash
    }
    
    func getComicsUrl() -> String {
        return "\(baseUrl)/v1/public/comics?apikey=\(apiKey)&hash=\(hash)&ts=1"
    }
    
    func getCharacters() -> String {
        return "\(baseUrl)/v1/public/characters?apikey=\(apiKey)&hash=\(hash)&ts=1"
    }
    
    func getCharacterUrlBy(characterId: String) -> String {
        return ""
    }
}

//
//  Secrets.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 20/10/2023.
//

import Foundation

protocol AppConfigProtocol {
    var apiKey: String { get }
    var hash: String { get }
    var baseUrl: String { get }
    
    func getComicsUrl() -> String
    func getCharacterUrlBy(characterId: String) -> String
}

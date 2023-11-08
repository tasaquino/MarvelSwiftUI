//
//  CharactersResponse.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation

struct CharactersResponse: Codable {
    let code: Int
    let data: CharactersData?
}

struct CharactersData: Codable {
    let count: Int
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Character]?
}

struct Character: Codable, Hashable  {
    let name: String
    let thumbnail: CharacterThumbnail
}

struct CharacterThumbnail: Codable, Hashable {
    let path: String?
    let fileExtension: String?
    
    var fullPath: String? {
        guard let path = path,
              let fileExtension = fileExtension else {
            return nil
        }
        return "\(path).\(fileExtension)"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.fileExtension = try container.decodeIfPresent(String.self, forKey: .fileExtension)
    }
    
    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case fileExtension = "extension"
    }
}

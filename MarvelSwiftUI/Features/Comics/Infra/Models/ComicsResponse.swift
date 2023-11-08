//
//  MarvelHomeContent.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation

struct ComicsResponse: Codable {
    let code: Int
    let data: Data?
}

struct Data: Codable {
    let count: Int
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Result]?
}

struct Result: Codable {
    let id: Int
    let title: String?
    let description: String?
    let thumbnail: ComicImageData?
    let images: [ComicImageData]?
}

struct ComicImageData: Codable {
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

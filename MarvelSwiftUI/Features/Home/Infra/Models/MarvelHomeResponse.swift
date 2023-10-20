//
//  MarvelHomeContent.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation

struct MarvelHomeResponse: Decodable {
    let code: Int
    let data: Data?
}

struct Data: Decodable {
    let count: Int
    let offset: Int
    let limit: Int
    let total: Int
    let results: [Result]?
}

struct Result: Decodable {
    let id: Int
    let title: String?
    let description: String?
    let thumbnail: ComicImageData?
    let images: [ComicImageData]?
}

struct ComicImageData: Decodable {
    let path: String?
    let fileExtension: String?
    
    var fullPath: String? {
        guard let path = path,
              let fileExtension = fileExtension else {
            return nil
        }
        return "\(path).\(fileExtension)"
    }
}

//
//  Comic.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 20/10/2023.
//

import Foundation

struct Comic: Decodable {
    let id: Int
    let title: String?
    let description: String?
    let thumbnail: ComicImage?
    let images: [ComicImage?]?
}

struct ComicImage: Decodable {
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

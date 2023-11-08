//
//  MarvelRepositoryProtocol.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 20/10/2023.
//

import Foundation

protocol ComicsRepositoryProtocol {
    func fetchComics() async throws -> ComicsResponse?
    func fetchComicBy(id: String)
    func setFavoriteComic(id: String)
}

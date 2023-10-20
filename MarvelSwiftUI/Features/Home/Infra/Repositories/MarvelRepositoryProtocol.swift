//
//  MarvelRepositoryProtocol.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 20/10/2023.
//

import Foundation

protocol MarvelRepositoryProtocol {
    func fetchComics() async throws -> MarvelHomeResponse?
    func fetchComicBy(id: String)
    func fetchCharacterBy(id: String)
    func setFavoriteComic(id: String)
}

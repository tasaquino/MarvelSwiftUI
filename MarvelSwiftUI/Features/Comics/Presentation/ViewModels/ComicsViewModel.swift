//
//  HomeViewModel.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import Foundation

enum ComicsState {
    case empty
    case error(error: String)
    case loading
    case loaded
}

class ComicsViewModel: ObservableObject {
    @Published var comics: [Comic]
    @Published var state: ComicsState
    @Published var gridMode: Bool
    
    var useCase: ComicsUseCaseProtocol
    
    init(initialComics: [Comic], useCase: ComicsUseCaseProtocol, gridMode: Bool) {
        self.state = .loading
        self.comics = initialComics
        self.useCase = useCase
        self.gridMode = gridMode
        fetchComics()
    }
    
    func fetchComics() {
        Task {
            do {
                if let result = try await self.useCase.fetchComics() {
                    await MainActor.run {
                        self.state = .loaded
                        self.comics = result
                        debugPrint("count \(result.count)")
                    }
                } else {
                    await MainActor.run {
                        self.state = .empty
                    }
                }
            } catch {
                await MainActor.run {
                    self.state = .error(error: "failed to load comics")
                    self.comics = []
                }
            }
        }
    }
}

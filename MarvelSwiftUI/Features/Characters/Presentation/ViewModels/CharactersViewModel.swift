//
//  CharactersViewModel.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 8/11/2023.
//

import Foundation

class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    let useCase: CharactersUseCaseProtocol
    
    init(useCase: CharactersUseCaseProtocol) {
        self.useCase = useCase
        fetchCharacters()
    }
    
    func fetchCharacters() {
        Task {
            do {
                let result = try await self.useCase.fetchCharacters()
                
                await MainActor.run {
                    self.characters = result ?? []
                }
            } catch {
                await MainActor.run {
                    self.characters = []
                }
            }
        }
    }
}

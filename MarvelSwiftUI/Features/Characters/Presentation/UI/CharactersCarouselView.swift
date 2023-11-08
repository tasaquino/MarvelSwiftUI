//
//  FavoritesCarouselView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct CharactersCarouselView: View {
    @EnvironmentObject var viewModel: CharactersViewModel
    
    var body: some View {
        VStack (alignment: .leading, content: {
            Text("Characters").font(.headline).padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.characters, id: \.self) { character in
                        AsyncImage(url: URL(string: character.thumbnail.fullPath ?? "")).frame(width: 80, height: 80).clipShape(Circle())
                    }
                }
            }.scrollIndicators(.hidden)
        }).padding(EdgeInsets(top: 10, leading: 0, bottom: 16, trailing: 0))
    }
}

#Preview {
    CharactersCarouselView()
}

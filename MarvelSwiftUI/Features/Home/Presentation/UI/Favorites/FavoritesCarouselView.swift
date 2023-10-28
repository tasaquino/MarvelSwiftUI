//
//  FavoritesCarouselView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct FavoritesCarouselView: View {
    var body: some View {
        VStack (alignment: .leading, content: {
            Text("Favorites").font(.headline).padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
            ScrollView(.horizontal) {
                LazyHStack {
                    Circle().frame(width: 100)
                    Circle().frame(width: 100)
                    Circle().frame(width: 100)
                    Circle().frame(width: 100)
                    Circle().frame(width: 100)
                }
            }
        }).padding(EdgeInsets(top: 10, leading: 0, bottom: 16, trailing: 0))
    }
}

#Preview {
    FavoritesCarouselView()
}

//
//  ComicViewListItem.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicListItemView: View {
    var comic: Comic
    var body: some View {
        HStack(alignment: .top, content: {
            if let path = comic.thumbnail?.fullPath {
                AsyncImage(url: URL(string: path)) { img in
                    img.resizable()
                } placeholder: {
                    Color.gray
                }.frame(width: 100, height: 100).cornerRadius(3.0)
                
            } else {
                Color.gray.frame(width: 100, height: 100).cornerRadius(3.0)
            }
            
            VStack(alignment: .leading, content: {
                Text(comic.title ?? "").font(Font.headline)
                Text(comic.description ?? "").font(Font.subheadline)
            })
        })
    }
}

#Preview {
    ComicListItemView(comic: Comic(id: 1, title: "title", description: "descr", thumbnail: nil, images: nil))
}

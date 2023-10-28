//
//  ComicGridItemView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicGridItemView: View {
    var comic: Comic
    var body: some View {
        VStack(alignment: .center, content: {
            if let path = comic.thumbnail?.fullPath {
                AsyncImage(url: URL(string: path)) { img in
                    img.resizable()
                } placeholder: {
                    Color.gray
                }.frame(width: 100, height: 100).cornerRadius(3.0)
                
            } else {
                Color.gray.frame(width: 100, height: 100).cornerRadius(3.0)
            }
        }).cornerRadius(3.0)
    }
}

#Preview {
    ComicGridItemView(comic: Comic(id: 1, title: "title", description: "descr", thumbnail: nil, images: nil))
}

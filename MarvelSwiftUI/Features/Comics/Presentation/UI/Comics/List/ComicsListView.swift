//
//  ComicsListView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicsListView: View {
    @Binding var comics: [Comic]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, content: {
                ForEach(comics) { comic in
                    ComicListItemView(comic: comic)
                }
            }).padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

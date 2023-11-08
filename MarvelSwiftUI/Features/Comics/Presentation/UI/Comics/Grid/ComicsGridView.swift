//
//  ComicsGridView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicsGridView: View {
    @Binding var comics: [Comic]
    
    var columnsConfig: [GridItem] {
          [
              GridItem(.adaptive(minimum: 100)),
              GridItem(.adaptive(minimum: 100)),
              GridItem(.adaptive(minimum: 100))
          ]
      }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnsConfig, content: {
                ForEach(comics) { comic in
                    ComicGridItemView(comic: comic)
                }
            })
        }
    }
}

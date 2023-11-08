//
//  HomeView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    CharactersCarouselView()
                    ComicsView()
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
}

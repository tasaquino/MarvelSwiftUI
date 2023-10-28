//
//  MarvelSwiftUIApp.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 19/10/2023.
//

import SwiftUI

@main
struct MarvelSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeScreen()
                    .tabItem { Label("Comics", systemImage: "book.circle") }
                HomeScreen().tabItem { Label("Favorites", systemImage: "star.circle") }
            }
            
        }
    }
}

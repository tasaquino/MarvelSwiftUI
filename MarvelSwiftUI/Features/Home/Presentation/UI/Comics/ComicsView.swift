//
//  ComicsView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicsView: View {
    @StateObject var viewModel: ComicsViewModel

    var body: some View {
        VStack {
            ComicsSwitchModeView(isGridMode: $viewModel.gridMode)
            if (viewModel.gridMode) {
                ComicsGridView(comics: $viewModel.comics).onAppear {
                    viewModel.fetchComics()
                }
            } else {
                ComicsListView(comics: $viewModel.comics).onAppear {
                    viewModel.fetchComics()
                }
            }
        }
    }
}

#Preview {
    ComicsView(viewModel: ComicsViewModel(initialComics: [], useCase: ComicsUseCase(repository: MarvelRepository(appConfig: AppConfig())), gridMode: false))
}

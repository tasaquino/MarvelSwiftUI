//
//  ComicsView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicsView: View {
    @EnvironmentObject var viewModel: ComicsViewModel

    var body: some View {
        VStack {
            ComicsSwitchModeView(isGridMode: $viewModel.gridMode)
            if (viewModel.gridMode) {
                ComicsGridView(comics: $viewModel.comics)
            } else {
                ComicsListView(comics: $viewModel.comics)
            }
        }
    }
}

#Preview {
    ComicsView()
}

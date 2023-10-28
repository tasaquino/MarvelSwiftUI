//
//  ComicsSwitchModeView.swift
//  MarvelSwiftUI
//
//  Created by Thais Aquino on 24/10/2023.
//

import SwiftUI

struct ComicsSwitchModeView: View {
    @Binding var isGridMode: Bool
    
    var imageName: String {
        if isGridMode {
            return "list.dash"
        } else {
            return "square.grid.2x2.fill"
        }
    }
    
    var body: some View {
        HStack(content: {
            Text("Comics").font(.headline).padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
            Spacer()
            Image(systemName: imageName).onTapGesture {
                isGridMode.toggle()
            }
           
        }).frame(alignment: .trailing).padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 16))
    }
}

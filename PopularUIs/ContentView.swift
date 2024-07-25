//
//  ContentView.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @Environment(\.router) var router
    @StateObject var viewModel: SpotifyViewModel
    
    var body: some View {
        List {
            Button("Open Spotify") {
                router.showScreen(.fullScreenCover) { _ in
                    SpotifyHomeView(viewModel: SpotifyViewModel())
                }
            }
        }
    }
}

#Preview {
    RouterView { _ in
        ContentView(viewModel: SpotifyViewModel())
    }
}

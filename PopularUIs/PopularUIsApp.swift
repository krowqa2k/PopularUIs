//
//  PopularUIsApp.swift
//  PopularUIs
//
//  Created by admin on 24/07/2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct PopularUIsApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView(viewModel: SpotifyViewModel())
            }
        }
    }
}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

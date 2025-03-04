//
//  SwiftfulSwiftUIinPracticeApp.swift
//  SwiftfulSwiftUIinPractice
//
//  Created by Anmol  Jandaur on 2/25/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftfulSwiftUIinPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                SpotifyHomeView()
            }
        }
    }
}
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

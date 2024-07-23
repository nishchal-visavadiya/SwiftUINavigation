//
//  Navigation.swift
//  Demo
//
//  Created by Nishchal Visavadiya on 22/07/24.
//

import SwiftUI
import UIKit

protocol AppRoute: Hashable, Codable {}

enum Route: AppRoute {
    case Second
}

class AppRouter: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    func push(route: any AppRoute) {
        navPath.append(route)
    }
    
    func pop() {
        navPath.removeLast()
    }
    
    func popToRoot() {
        navPath.removeLast(navPath.count)
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

    // To make it works also with ScrollView
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}

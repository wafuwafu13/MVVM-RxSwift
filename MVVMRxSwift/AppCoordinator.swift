//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by 田川　裕隆 on 2021/06/20.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = UINavigationController(rootViewController:
            viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

//
//  AppCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/10/25
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showRoot()
    }
}

private extension AppCoordinator {
    func showRoot() {
        let rootNavigationController = RootNavigationController()
        rootNavigationController.onChangeMainFlow = { [weak self] in
            self?.changeMainFlow()
        }
        window.rootViewController = rootNavigationController

        rootNavigationController.start()
    }

    func changeMainFlow() {
        let mainNavigationController = MainNavigationController()
        mainNavigationController.onChangeRootFlow = { [weak self] in
            guard let self = self else { return }
            showRoot()
        }
        window.rootViewController = mainNavigationController
        
        mainNavigationController.start()
    }
}

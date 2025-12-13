//
//  AppCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/10/25
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    private var rootCoordinator: RootCoordinator?
    private var mainCoordinator: MainCoordinator?

    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        showRoot(isSignInRoot: false)
    }
}

private extension AppCoordinator {
    func showRoot(isSignInRoot: Bool) {
        mainCoordinator = nil
        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true

        let coordinator = RootCoordinator(navigationController: navigationController)
        coordinator.onChangeMainFlow = { [weak self] in
            guard let self = self else { return }
            self.changeMainFlow()
        }
        
        self.rootCoordinator = coordinator
        addChild(coordinator)
        
        window.rootViewController = navigationController
        if isSignInRoot {
            coordinator.startWithSignIn()
        } else {
            coordinator.start()
        }
    }

    func changeMainFlow() {
        rootCoordinator = nil
        
        let mainTabBarController = MainTabBarController()
        let mainCoordinator = MainCoordinator(tabBarController: mainTabBarController)

        mainCoordinator.onLogout = { [weak self, weak mainCoordinator] in
            guard let self, let mainCoordinator else { return }
            self.removeChild(mainCoordinator)
            self.mainCoordinator = nil
            self.showRoot(isSignInRoot: true)
        }
        
        self.mainCoordinator = mainCoordinator
        addChild(mainCoordinator)

        window.rootViewController = mainTabBarController
        mainCoordinator.start()
    }
}

//
//  MainCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/12/25
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    let tabBarController: MainTabBarController
    var onLogout: (() -> Void)?

    init(tabBarController: MainTabBarController) {
        self.tabBarController = tabBarController
    }

    override func start() {
        setupTabBar()
    }
    
    func setupTabBar() {
        let homeNavigationController = HomeNavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        let myPageNavigationController = MyPageNavigationController()
        let myPageCoordinator = MyPageCoordinator(navigationController: myPageNavigationController)
        myPageCoordinator.onLogout = { [weak self, weak myPageCoordinator] in
            guard let self else { return }
            self.removeChild(homeCoordinator)
            if let myPageCoordinator {
                self.removeChild(myPageCoordinator)
            }

            self.onLogout?()
        }

        childCoordinators.append(myPageCoordinator)
        myPageCoordinator.start()

        homeNavigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: nil)
        myPageNavigationController.tabBarItem = UITabBarItem(title: "마이", image: UIImage(systemName: "person"), selectedImage: nil)
        
        self.tabBarController.setViewControllers([homeNavigationController, myPageNavigationController], animated: false)
    }
}

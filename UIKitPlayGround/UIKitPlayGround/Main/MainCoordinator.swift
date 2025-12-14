//
//  MainCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/12/25
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    weak var delegate: MainCoordinatorDelegate?
    let tabBarController: MainTabBarController

    init(tabBarController: MainTabBarController) {
        self.tabBarController = tabBarController
        print("⭕ MainCoordinator init!")
    }
    
    deinit {
        print("❎ MainCoordinator deinit!")
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
        myPageCoordinator.delegate = self

        childCoordinators.append(myPageCoordinator)
        myPageCoordinator.start()

        homeNavigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: nil)
        myPageNavigationController.tabBarItem = UITabBarItem(title: "마이", image: UIImage(systemName: "person"), selectedImage: nil)
        
        self.tabBarController.setViewControllers([homeNavigationController, myPageNavigationController], animated: false)
    }
}

protocol MainCoordinatorDelegate: AnyObject {
    func onDidLogout(_ coordinator: MainCoordinator)
}

extension MainCoordinator: MyPageCoordinatorDelegate {
    func onDidLogout(_ coordinator: MyPageCoordinator) {
        removeChild(coordinator)
        delegate?.onDidLogout(self)
    }
}

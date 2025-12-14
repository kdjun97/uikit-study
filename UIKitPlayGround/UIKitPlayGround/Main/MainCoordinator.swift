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

    override init() {
        self.tabBarController = MainTabBarController()
        print("⭕ MainCoordinator init!")
    }
    
    deinit {
        print("❎ MainCoordinator deinit!")
    }

    override func start() {
        setupTabBar()
    }
    
    func setupTabBar() {
        let homeCoordinator = HomeCoordinator()
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        let myPageCoordinator = MyPageCoordinator()
        myPageCoordinator.delegate = self

        childCoordinators.append(myPageCoordinator)
        myPageCoordinator.start()

        homeCoordinator.navigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: nil)
        myPageCoordinator.navigationController.tabBarItem = UITabBarItem(title: "마이", image: UIImage(systemName: "person"), selectedImage: nil)
        
        self.tabBarController.setViewControllers([homeCoordinator.navigationController, myPageCoordinator.navigationController], animated: false)
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

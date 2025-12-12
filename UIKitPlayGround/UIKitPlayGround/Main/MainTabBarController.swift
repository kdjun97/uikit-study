//
//  MainTabBarController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class MainTabBarController: UITabBarController {
    var onChangeRootFlow: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        tabBar.backgroundColor = .white
    }
    
    func start() {
        let homeNavigationController = HomeNavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: nil)
        homeNavigationController.start()

        let myPageNavigationController = MyPageNavigationController()
        myPageNavigationController.tabBarItem = UITabBarItem(title: "마이", image: UIImage(systemName: "person"), selectedImage: nil)
        myPageNavigationController.onLogout = { [weak self] in
            self?.onChangeRootFlow?()
        }
        myPageNavigationController.start()

        self.setViewControllers([homeNavigationController, myPageNavigationController], animated: false)
    }
}

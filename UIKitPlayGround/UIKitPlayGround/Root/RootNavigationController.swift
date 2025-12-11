//
//  RootNavigationController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class RootNavigationController: UINavigationController {
    var onChangeMainFlow: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
    }
    
    func start() {
        showSplash()
    }
}

private extension RootNavigationController {
    func showSplash() {
        let splashViewController = SplashViewController()
        splashViewController.onChangeSignIn = { [weak self] in
            guard let self = self else { return }
            self.showSignIn()
        }
        setViewControllers([splashViewController], animated: false)
    }

    func showSignIn() {
        let signInViewController = SignInViewController()
        signInViewController.onChangeMain = { [weak self] in
            guard let self = self else { return }
            self.onChangeMainFlow?()
        }
        setViewControllers([signInViewController], animated: false)
    }
}

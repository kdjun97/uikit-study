//
//  RootNavigationController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class RootNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
    }

    func showSplash() {
        let vc = SplashViewController()
        vc.onChangeSignIn = { [weak self] in
            guard let self = self else { return }
            self.showSignIn()
        }
        setViewControllers([vc], animated: false)
    }

    func showSignIn() {
        let vc = SignInViewController()
        vc.onChangeMain = { [weak self] in
            guard let self = self else { return }
            self.showMain()
        }
        setViewControllers([vc], animated: false)
    }

    func showMain() {
        let vc = MainViewController()
        setViewControllers([vc], animated: false)
    }
}

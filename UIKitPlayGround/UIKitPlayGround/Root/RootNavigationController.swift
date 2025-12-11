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
    
    func startWithSignIn() {
        showSignIn()
    }
}

private extension RootNavigationController {
    func showSplash() {
        let viewModel = SplashViewModel() // 나중에 DI
        let splashViewController = SplashViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeSignIn:
                self.showSignIn()
            }
        }
        
        setViewControllers([splashViewController], animated: false)
    }

    func showSignIn() {
        let viewModel = SignInViewModel()
        let signInViewController = SignInViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeMainFlow:
                self.onChangeMainFlow?()
            }
        }
        
        setViewControllers([signInViewController], animated: false)
    }
}

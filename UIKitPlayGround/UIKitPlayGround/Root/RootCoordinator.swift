//
//  RootCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

import UIKit

final class RootCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    var onChangeMainFlow: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        showSplash()
    }
    
    func startWithSignIn() {
        showSignIn()
    }
    
    private func showSplash() {
        let viewModel = SplashViewModel() // 나중에 DI
        let splashViewController = SplashViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeSignIn:
                self.showSignIn()
            }
        }
        
        navigationController.setViewControllers([splashViewController], animated: false)
    }
    
    private func showSignIn() {
        let viewModel = SignInViewModel()
        let signInViewController = SignInViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeMainFlow:
                self.onChangeMainFlow?()
            }
        }
        
        navigationController.setViewControllers([signInViewController], animated: false)
    }
}

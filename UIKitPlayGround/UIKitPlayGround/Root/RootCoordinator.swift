//
//  RootCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

import UIKit

final class RootCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: RootCoordinatorDelegate?
    
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
        let splashCoordinator = SplashCoordinator(navigationController: navigationController)
        splashCoordinator.delegate = self
        addChild(splashCoordinator)
        splashCoordinator.start()
    }
    
    private func showSignIn() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.delegate = self
        addChild(signInCoordinator)
        signInCoordinator.start()
    }
}

protocol RootCoordinatorDelegate: AnyObject {
    func onDidLogIn(_ coordinator: RootCoordinator)
}

extension RootCoordinator: SignInCoordinatorDelegate {
    func onDidLogIn(_ coordinator: SignInCoordinator) {
        removeChild(coordinator)
        delegate?.onDidLogIn(self)
    }
}

extension RootCoordinator: SplashCoordinatorDelegate {
    func onDidChangeSignIn(_ coordinator: SplashCoordinator) {
        removeChild(coordinator)
        showSignIn()
    }
}

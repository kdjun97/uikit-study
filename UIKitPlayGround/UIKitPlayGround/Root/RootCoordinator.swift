//
//  RootCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class RootCoordinator: BaseCoordinator {
    let navigationController: BaseNavigationController
    weak var delegate: RootCoordinatorDelegate?
    
    override init() {
        self.navigationController = BaseNavigationController()
        print("⭕ RootCoordinator init!")
    }
    
    deinit {
        print("❎ RootCoordinator deinit!")
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

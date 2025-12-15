//
//  AppCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/10/25
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    private var rootCoordinator: RootCoordinator?
    private var mainCoordinator: MainCoordinator?

    init(window: UIWindow) {
        self.window = window
        print("⭕ AppCoordinator init!")
    }
    
    override func start() {
        showRoot(isSignInRoot: false)
    }
}

private extension AppCoordinator {
    func showRoot(isSignInRoot: Bool) {
        mainCoordinator = nil

        let coordinator = RootCoordinator()
        coordinator.delegate = self
        
        self.rootCoordinator = coordinator
        addChild(coordinator)
        
        window.rootViewController = coordinator.navigationController
        if isSignInRoot {
            coordinator.startWithSignIn()
        } else {
            coordinator.start()
        }
    }

    func changeMainFlow() {
        rootCoordinator = nil
        
        let mainCoordinator = MainCoordinator()
        mainCoordinator.delegate = self

        self.mainCoordinator = mainCoordinator
        addChild(mainCoordinator)

        window.rootViewController = mainCoordinator.tabBarController
        mainCoordinator.start()
    }
}

extension AppCoordinator: RootCoordinatorDelegate {
    func onDidLogIn(_ coordinator: RootCoordinator) {
        removeChild(coordinator)
        rootCoordinator = nil
        self.changeMainFlow()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func onDidLogout(_ coordinator: MainCoordinator) {
        removeChild(coordinator)
        mainCoordinator = nil
        self.showRoot(isSignInRoot: true)
    }
}

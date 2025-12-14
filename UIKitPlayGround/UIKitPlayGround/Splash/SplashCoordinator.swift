//
//  SplashCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

import UIKit

final class SplashCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: SplashCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("⭕ SplashCoordinator init!")
    }
    
    deinit {
        print("❎ SplashCoordinator deinit!")
    }
    
    override func start() {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeSignIn:
                self.delegate?.onDidChangeSignIn(self)
            }
        }

        navigationController.setViewControllers([viewController], animated: false)
    }
}

protocol SplashCoordinatorDelegate: AnyObject {
    func onDidChangeSignIn(_ coordinator: SplashCoordinator)
}

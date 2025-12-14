//
//  SignInCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

import UIKit

final class SignInCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    weak var delegate: SignInCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("⭕ SignInCoordinator init!")
    }
    
    deinit {
        print("❎ SignInCoordinator deinit!")
    }
    
    override func start() {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController(viewModel: viewModel)
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onChangeMain:
                self.delegate?.onDidLogIn(self)
            }
        }

        navigationController.setViewControllers([viewController], animated: false)
    }
}

protocol SignInCoordinatorDelegate: AnyObject {
    func onDidLogIn(_ coordinator: SignInCoordinator)
}

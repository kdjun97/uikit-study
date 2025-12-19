//
//  SignInCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class SignInCoordinator: BaseCoordinator {
    private let navigationController: BaseNavigationController
    weak var delegate: SignInCoordinatorDelegate?
    
    init(navigationController: BaseNavigationController) {
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
            case .onPushSignInDetail:
                showSignInDetail()
            }
        }

        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func showSignInDetail() {
        let viewModel = SignInDetailViewModel()
        let detailViewController = SignInDetailViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onPop:
                navigationController.popViewController(animated: true)
            }
        }
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

protocol SignInCoordinatorDelegate: AnyObject {
    func onDidLogIn(_ coordinator: SignInCoordinator)
}

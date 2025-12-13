//
//  MyPageCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class MyPageCoordinator: BaseCoordinator {
    private let navigationController: MyPageNavigationController
    var onLogout: (() -> Void)?
    
    init(navigationController: MyPageNavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = MyPageViewModel()
        let viewController = MyPageViewController(viewModel: viewModel)
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onLogout:
                self.onLogout?()
            }
        }

        navigationController.viewControllers = [viewController]
    }
}

//
//  MyPageCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class MyPageCoordinator: BaseCoordinator {
    private let navigationController: MyPageNavigationController
    weak var delegate: MyPageCoordinatorDelegate?
    
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
                self.delegate?.onDidLogout(self)
            }
        }

        navigationController.setViewControllers([viewController], animated: false)
    }
}

protocol MyPageCoordinatorDelegate: AnyObject {
    func onDidLogout(_ coordinator: MyPageCoordinator)
}

//
//  HomeCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class HomeCoordinator: BaseCoordinator {
    private let navigationController: HomeNavigationController
    
    init(navigationController: HomeNavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onPushDetail:
                let detailViewController = DetailViewController()
    //            detailViewController.hidesBottomBarWhenPushed = true
                navigationController.pushViewController(detailViewController, animated: true)
            }
        }

        navigationController.viewControllers = [homeViewController]
    }
}

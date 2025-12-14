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
        print("⭕ HomeCoordinator init!")
    }
    
    deinit {
        print("❎ HomeCoordinator deinit!")
    }

    override func start() {
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onPushDetail:
                showDetail()
            }
        }

        navigationController.viewControllers = [homeViewController]
    }
    
    private func showDetail() {
        let viewModel = DetailViewModel()
        let detailViewController = DetailViewController(viewModel: viewModel)
        
        viewModel.onOutput = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .onPresentSheet:
                self.presentSheet()
            }
        }
//        detailViewController.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    private func presentSheet() {
        let sheetViewController = DetailSheetViewController()
        sheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = sheetViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        
        navigationController.present(sheetViewController, animated: true)
    }
}

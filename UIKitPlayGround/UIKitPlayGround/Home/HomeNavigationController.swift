//
//  HomeNavigationController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class HomeNavigationController: UINavigationController {
    var onPushDetail: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    func start() {
        let homeViewModel = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewModel.onOutput = { [weak self] output in
            switch output {
            case .onPushDetail:
                guard let self = self else { return }
                let detailViewController = DetailViewController()
    //            detailViewController.hidesBottomBarWhenPushed = true
                self.pushViewController(detailViewController, animated: true)
            }
        }
        setViewControllers([homeViewController], animated: false)
    }
}

extension HomeNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

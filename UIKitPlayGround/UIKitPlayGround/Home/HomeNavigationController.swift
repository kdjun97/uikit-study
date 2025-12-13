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
}

extension HomeNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

//
//  MainNavigationController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/10/25
//

import UIKit

class MainNavigationController: UINavigationController {
    var onChangeRootFlow: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
    }
    
    func start() {
        let mainViewController = MainViewController()
        mainViewController.onLogout = { [weak self] in
            guard let self = self else { return }
            onChangeRootFlow?()
        }
        setViewControllers([mainViewController], animated: false)
    }
}

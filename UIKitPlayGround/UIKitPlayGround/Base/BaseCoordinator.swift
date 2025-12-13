//
//  BaseCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/12/25
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    func start() {}
}

extension BaseCoordinator {
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
}

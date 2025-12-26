//
//  MyPageCoordinator.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

import ReactorKit

final class MyPageCoordinator: BaseCoordinator {
    let navigationController: BaseNavigationController
    weak var delegate: MyPageCoordinatorDelegate?
    private var disposeBag = DisposeBag()
    
    override init() {
        self.navigationController = BaseNavigationController()
        print("⭕ MyPageCoordinator init!")
    }
    
    deinit {
        print("❎ MyPageCoordinator deinit!")
    }

    override func start() {
        let reactor = MyPageReactor()
        let viewController = MyPageViewController(reactor: reactor)
        
        reactor.route.subscribe(
            onNext: { [weak self] route in
                guard let self = self else { return }
                switch route {
                case .signIn:
                    self.delegate?.onDidLogout(self)
                }
            }
        )
        .disposed(by: disposeBag)

        navigationController.setViewControllers([viewController], animated: false)
    }
}

protocol MyPageCoordinatorDelegate: AnyObject {
    func onDidLogout(_ coordinator: MyPageCoordinator)
}

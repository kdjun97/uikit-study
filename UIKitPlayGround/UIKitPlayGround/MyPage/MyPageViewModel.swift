//
//  MyPageViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class MyPageViewModel {
    var onOutput: ((MyPageOutput) -> Void)?
    
    enum MyPageAction {
        case logoutButtonTapped
    }
    
    enum MyPageOutput {
        case onLogout
    }
    
    func send(_ action: MyPageAction) {
        switch action {
        case .logoutButtonTapped:
            onOutput?(.onLogout)
        }
    }
}

//
//  HomeViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/12/25
//

final class HomeViewModel {
    var onOutput: ((HomeOutput) -> Void)?
    
    enum HomeAction {
        case buttonTapped
    }
    
    enum HomeOutput {
        case onPushDetail
    }
    
    func send(_ action: HomeAction) {
        switch action {
        case .buttonTapped:
            onOutput?(.onPushDetail)
        }
    }
}

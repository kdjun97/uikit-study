//
//  SplashViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

final class SplashViewModel {
    var onOutput: ((SplashOutput) -> Void)?
    
    enum SplashAction {
        case buttonTapped
    }
    
    enum SplashOutput {
        case onChangeSignIn
    }
    
    func send(_ action: SplashAction) {
        switch action {
        case .buttonTapped:
            onOutput?(.onChangeSignIn)
        }
    }
}

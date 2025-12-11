//
//  SignInViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

final class SignInViewModel {
    var onOutput: ((SignInOutput) -> Void)?
    
    enum SignInAction {
        case buttonTapped
    }
    
    enum SignInOutput {
        case onChangeMainFlow
    }
    
    func send(_ action: SignInAction) {
        switch action {
        case .buttonTapped:
            onOutput?(.onChangeMainFlow)
        }
    }

}

//
//  SignInViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

final class SignInViewModel {
    var onOutput: ((SignInOutput) -> Void)?
    
    deinit {
        print("❎ SignInViewModel deinit!")
    }
    
    init(onOutput: ((SignInOutput) -> Void)? = nil) {
        self.onOutput = onOutput
        print("⭕ SignInViewModel init!")
    }
    
    enum SignInAction {
        case buttonTapped
        case kakaoButtonTapped
        case appleButtonTapped
    }
    
    enum SignInOutput {
        case onChangeMain
        case onPushSignInDetail
    }
    
    func send(_ action: SignInAction) {
        switch action {
        case .buttonTapped:
            onOutput?(.onChangeMain)
        case .kakaoButtonTapped:
            onOutput?(.onPushSignInDetail)
        case .appleButtonTapped:
            onOutput?(.onPushSignInDetail)
        }
    }

}

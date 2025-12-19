//
//  SignInDetailViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/16/25
//

import Combine
import Foundation

final class SignInDetailViewModel {
    var onOutput: ((SignInDetailOutput) -> Void)?
    @Published var nickname: String = ""
    @Published private(set) var isNicknameValid: Bool = false
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String? = ""

    deinit {
        print("❎ SignInDetailViewModel deinit!")
    }
    
    init(onOutput: ((SignInDetailOutput) -> Void)? = nil) {
        self.onOutput = onOutput
        print("⭕ SignInDetailViewModel init!")
        bind()
    }
    
    enum SignInDetailAction {
        case backButtonTapped
        case nicknameChanged(String)
    }
    
    enum SignInDetailOutput {
        case onPop
    }
    
    private func bind() {
        $nickname
            .debounce(for: 1.0, scheduler: DispatchQueue.main)
            .map { nickname -> (isValid: Bool, error: String?) in
                let trimmed = nickname.trimmingCharacters(in: .whitespaces)
                
                if trimmed.isEmpty {
                    return (false, nil)
                } else if trimmed.count < 2 {
                    return (false, "닉네임은 2자 이상이어야 합니다.")
                } else if trimmed.count > 10 {
                    return (false, "닉네임은 10자 이하여야 합니다.")
                } else {
                    return (true, nil)
                }
            }
            .sink { [weak self] result in
                guard let self = self else { return }
                self.isNicknameValid = result.isValid
                self.errorMessage = result.error
            }
            .store(in: &cancellables)
    }
    
    func send(_ action: SignInDetailAction) {
        switch action {
        case .backButtonTapped:
            onOutput?(.onPop)
        case .nicknameChanged(let value):
            nickname = value
        }
    }
}

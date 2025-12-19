//
//  SignInViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class SignInViewController: UIViewController {
    private let viewModel: SignInViewModel
    
    deinit {
        print("❎ SignInViewController deinit!")
    }
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("⭕ SignInViewController init!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "SignInViewController"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let button: UIButton = CustomButton(
        title: "Go To Main",
        backgroundColor: .black,
        foregroundColor: .white
    )
    
    private let kakaoButton: UIButton = {
        let button = UIButton()
        button.setImage(.icKakao, for: .normal)
        
        return button
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton()
        button.setImage(.icApple, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue

        setupLayout()
        setBottomButtonLayout()
        setupAction()
    }
    
    private func setupLayout() {
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label).offset(40)
            $0.centerX.equalTo(label)
        }
    }
    
    func setBottomButtonLayout() {
        let container = UIView()
        view.addSubview(container)
        
        container.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        container.addSubview(kakaoButton)
        container.addSubview(appleButton)

        kakaoButton.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }

        appleButton.snp.makeConstraints {
            $0.leading.equalTo(kakaoButton.snp.trailing).offset(48)
            $0.trailing.top.bottom.equalToSuperview()
        }
    }
    
    private func setupAction() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        kakaoButton.addAction(
            UIAction { [weak self] _ in
                guard let self = self else { return }
                self.viewModel.send(.kakaoButtonTapped)
            }, for: .touchUpInside
        )
        appleButton.addTarget(self, action: #selector(appleButtonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        viewModel.send(.buttonTapped)
    }
    
    @objc private func appleButtonTapped() {
        viewModel.send(.appleButtonTapped)
    }
}

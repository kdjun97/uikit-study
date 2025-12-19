//
//  SplashViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    private let viewModel: SplashViewModel
    
    deinit {
        print("❎ SplashViewController deinit!")
    }

    init(viewModel: SplashViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("⭕ SplashViewController init!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "SplashViewController"

        return label
    }()
    
    private let button: UIButton = CustomButton(
        title: "Go To SignIn",
        backgroundColor: .orange,
        foregroundColor: .black
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
        setupAction()
    }
    
    private func setupAction() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(label)
        view.addSubview(button)

        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.centerX.equalTo(label)
        }
    }
    
    @objc private func buttonTapped() {
        viewModel.send(.buttonTapped)
    }
}

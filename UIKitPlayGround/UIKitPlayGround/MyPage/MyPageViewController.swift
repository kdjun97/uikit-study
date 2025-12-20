//
//  MyPageViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class MyPageViewController: UIViewController {
    private let viewModel: MyPageViewModel
    
    deinit {
        print("❎ MyPageViewController deinit!")
    }

    init(viewModel: MyPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("⭕ MyPageViewController init!")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let logoutButton = CustomButton(
        title: "Logout",
        backgroundColor: .red,
        foregroundColor: .white
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupLayout()
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc private func logoutButtonTapped() {
        viewModel.send(.logoutButtonTapped)
    }
}

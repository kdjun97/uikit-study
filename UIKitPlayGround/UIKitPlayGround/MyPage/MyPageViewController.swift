//
//  MyPageViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class MyPageViewController: UIViewController {
    private let viewModel: MyPageViewModel
    
    init(viewModel: MyPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "MyPageViewController"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white

        return label
    }()
    
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
        view.addSubview(label)
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func logoutButtonTapped() {
        viewModel.send(.logoutButtonTapped)
    }
}

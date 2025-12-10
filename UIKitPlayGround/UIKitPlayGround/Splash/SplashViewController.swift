//
//  SplashViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class SplashViewController: UIViewController {
    var onChangeSignIn: (() -> Void)?

    private let label: UILabel = {
        let label = UILabel()
        label.text = "SplashViewController"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let button: UIButton = CustomButton(
        title: "Go To SignIn",
        backgroundColor: .orange,
        foregroundColor: .black
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupLayout()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func buttonTapped() {
        onChangeSignIn?()
    }
}

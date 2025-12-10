//
//  SignInViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class SignInViewController: UIViewController {
    var onChangeMain: (() -> Void)?
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        setupLayout()
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
        onChangeMain?()
    }
}

//
//  MainViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class MainViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "MainViewController"
        label.translatesAutoresizingMaskIntoConstraints = false

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
}

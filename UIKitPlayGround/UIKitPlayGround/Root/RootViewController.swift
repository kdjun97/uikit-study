//
//  RootViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/9/25
//

import UIKit

class RootViewController: UIViewController {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Root Coordinator"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

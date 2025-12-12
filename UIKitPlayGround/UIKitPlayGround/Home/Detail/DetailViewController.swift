//
//  DetailViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/12/25
//

import UIKit

final class DetailViewController: UIViewController {
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Header"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let tabBarContainer = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupHeaderLabel()
    }
    
    private func setupHeaderLabel() {
        view.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

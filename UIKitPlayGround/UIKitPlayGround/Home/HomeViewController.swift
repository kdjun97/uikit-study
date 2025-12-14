//
//  HomeViewController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        print("⭕ HomeViewController init!")
    }
    
    deinit {
        print("❎ HomeViewController deinit!")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "HomeViewController"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black

        return label
    }()
    
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "바닥 텍스트입니다"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let button = CustomButton(
        title: "Go To Detail",
        backgroundColor: .red,
        foregroundColor: .white
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        setupLayout()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(bottomLabel)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            bottomLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 0),
            bottomLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    @objc private func buttonTapped() {
        viewModel.send(.buttonTapped)
    }
}

//
//  CustomTextField.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/18/25
//

import UIKit

final class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupReturnKeyDismiss()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let padding = UIEdgeInsets(
        top: 18,
        left: 20,
        bottom: 18,
        right: 20
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

private extension CustomTextField {
    func setupReturnKeyDismiss() {
        addTarget(self, action: #selector(dismissKeyboard), for: .editingDidEndOnExit)
    }
    
    @objc func dismissKeyboard() {
        resignFirstResponder()
    }
}

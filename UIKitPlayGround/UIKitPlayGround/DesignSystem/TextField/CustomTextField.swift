//
//  CustomTextField.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/18/25
//

import UIKit

final class CustomTextField: UITextField {
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

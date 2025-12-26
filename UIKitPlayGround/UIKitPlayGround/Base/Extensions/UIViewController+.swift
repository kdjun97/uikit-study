//
//  UIViewController+.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/24/25
//

import UIKit

public extension UIViewController {
    func setupKeyboardDismissEvent() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(_dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func _dismissKeyboard() {
        view.endEditing(true)
    }
}

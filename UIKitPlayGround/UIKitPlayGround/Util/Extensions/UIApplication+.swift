//
//  UIApplication+.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/20/25
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}

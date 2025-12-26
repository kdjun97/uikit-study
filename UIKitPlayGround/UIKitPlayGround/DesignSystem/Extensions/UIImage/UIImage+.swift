//
//  UIImage+.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/22/25
//

import UIKit

public extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

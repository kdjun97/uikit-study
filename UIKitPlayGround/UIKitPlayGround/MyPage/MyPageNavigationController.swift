//
//  MyPageNavigationController.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/11/25
//

import UIKit

class MyPageNavigationController: UINavigationController {
    var onLogout: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
    }
}

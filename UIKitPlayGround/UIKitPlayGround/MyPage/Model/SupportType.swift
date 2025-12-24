//
//  SupportType.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/23/25
//

enum SupportType: CaseIterable {
    case versionInfo
    case termsOfService
    case privacyPolicy
    case logout
    
    var name: String {
        switch self {
        case .versionInfo: "버전 정보"
        case .termsOfService: "서비스 이용 약관"
        case .privacyPolicy: "개인정보처리방침"
        case .logout: "로그아웃"
        }
    }
}

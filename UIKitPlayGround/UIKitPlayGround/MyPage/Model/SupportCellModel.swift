//
//  SupportCellModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/24/25
//

struct SupportCellModel: Equatable {
    let type: SupportType
    let index: Int
    let appVersion: String = "2.7.3"
    
    var hideDivider: Bool {
        return index == SupportType.allCases.count - 1
    }
    
    init(
        type: SupportType,
        index: Int
    ){
        self.type = type
        self.index = index
    }
}

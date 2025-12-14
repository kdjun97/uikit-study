//
//  DetailViewModel.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/13/25
//

final class DetailViewModel {
    var onOutput: ((DetailOutput) -> Void)?
    
    enum DetailAction {
        case sheetButtonTapped
    }
    
    init(onOutput: ((DetailOutput) -> Void)? = nil) {
        self.onOutput = onOutput
        print("⭕ DetailViewModel init!")
    }
    
    deinit {
        print("❎ DetailViewModel deinit!")
    }

    enum DetailOutput {
        case onPresentSheet
    }
    
    func send(_ action: DetailAction) {
        switch action {
        case .sheetButtonTapped:
            onOutput?(.onPresentSheet)
        }
    }
}

//
//  SignInReactor.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/20/25
//

import ReactorKit
import RxRelay

class SignInReactor: Reactor {
    struct State {
        
    }
    
    enum Mutation {
        
    }
    
    enum Action {
        case mainbuttonTapped
        case kakaoButtonTapped
        case appleButtonTapped
    }
    
    enum Route {
        case changeMain
        case pushSignInDetail
    }
    
    let initialState: State = .init()
    let route = PublishRelay<Route>()
    
    init() {
        print("⭕ SignInReactor init!")
    }
    
    deinit {
        print("❎ SignInReactor deinit!")
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .mainbuttonTapped:
            route.accept(.changeMain)
            return .empty()
        case .kakaoButtonTapped:
            route.accept(.pushSignInDetail)
            return .empty()
        case .appleButtonTapped:
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        return state
    }
}

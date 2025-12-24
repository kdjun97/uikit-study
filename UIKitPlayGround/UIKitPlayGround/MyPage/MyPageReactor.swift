//
//  MyPageReactor.swift
//  UIKitPlayGround
//
//  Created by 김동준 on 12/20/25
//

import ReactorKit
import RxRelay

class MyPageReactor: Reactor {
    init() {
        print("⭕ MyPageReactor init!")
    }
    
    deinit {
        print("❎ MyPageReactor deinit!")
    }
    
    struct State {
        var supportTypeList: [SupportType] = SupportType.allCases
        var name: String = "김시미"
        var count: Int = 0
    }
    
    enum Action {
        case logoutButtonTapped
        case changeNameButtonTapped
        case viewDidLoad
        case updateCountButtonTapped
        case supportTypeTapped(SupportType)
    }
    
    enum Mutation {
        case setName(String)
        case updateCount(Int)
    }
    
    enum Route {
        case signIn
    }
    
    var initialState: State = .init()
    var route = PublishRelay<Route>()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .logoutButtonTapped:
            route.accept(.signIn)
            return .empty()
        case .changeNameButtonTapped:
            return .just(.setName("김시미2222222222222222222"))
        case .viewDidLoad:
            return .just(.updateCount(0))
        case .updateCountButtonTapped:
            return .just(.updateCount(currentState.count + 10))
        case .supportTypeTapped(let type):
            switch type {
            case .logout:
                route.accept(.signIn)
                return .empty()
            case .privacyPolicy: break
            case .termsOfService: break
            case .versionInfo: break
            }
            return .empty()
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .setName(let name):
            newState.name = name
            return newState
        case .updateCount(let value):
            newState.count = value
            return newState
        }
    }
}

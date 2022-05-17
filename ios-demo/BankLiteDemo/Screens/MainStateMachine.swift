//
//  MainStateMachine.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 29.03.2022.
//

import Combine
import Foundation

class MainStateMachine {
    
    enum State {
        case start
        case loading
        case results
        case error
    }
    
    enum Event {
        case loading
        case success
        case failure
        case cancel
    }

    private(set) var state: State {
        didSet { stateSubject.send(self.state) }
    }
    private let stateSubject: PassthroughSubject<State, Never>
    let statePublisher: AnyPublisher<State, Never>
    
    init(state: State) {
        self.state = state
        self.stateSubject = PassthroughSubject<State, Never>()
        self.statePublisher = self.stateSubject.eraseToAnyPublisher()
    }
    
}

// MARK: - State changes
extension MainStateMachine {
    
    @discardableResult func tryEvent(_ event: Event) -> Bool {
        guard let state = nextState(for: event) else {
            return false
        }
        
        self.state = state
        return true
    }
    
    private func nextState(for event: Event) -> State? {
        switch state {
        case .start:
            switch event {
            case .loading:
                return .loading
            case .success, .failure, .cancel:
                return nil
            }
        case .loading:
            switch event {
            case .loading:
                return nil
            case .success:
                return .results
            case .failure:
                return .error
            case .cancel:
                return .start
            }
        case .results:
            switch event {
            case .cancel:
                return .start
            default:
                return nil
            }
        case .error:
            switch event {
            case .loading:
                return .loading
            case .success, .failure, .cancel:
                return nil
            }
        }
    }
}

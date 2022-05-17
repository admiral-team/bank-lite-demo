//
//  MainViewModel.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 29.03.2022.
//

import SwiftUI
import Combine

@available(iOS 15.0, *)
class MainViewModel: ObservableObject {
    
   
    @Published private(set) var state: MainStateMachine.State
    
    @Published var dataSource: [MainRowModel] = []
    @Published var removesIndex: Int?
    
    private let stateMachine: MainStateMachine
    private var asyncTask: Task<(), Never>?
    private var disposables = Set<AnyCancellable>()
    private var stateCancellable: AnyCancellable?
    
    init(
        stateMachine: MainStateMachine) {
            
            self.stateMachine = stateMachine
            self.state = stateMachine.state
            self.stateCancellable = stateMachine.statePublisher.sink { state in
                DispatchQueue.main.async {
                    self.state = state
                }
            }
            $removesIndex.dropFirst().sink { [weak self] index in
                guard let index = index else { return }
                self?.dataSource.remove(at: index)
            }.store(in: &disposables)
    }
    
    func cancel() {
        stateMachine.tryEvent(.cancel)
    }
    
    func loadItems() {
        stateMachine.tryEvent(.loading)
        dataSource = []
        if let path = Bundle.main.path(forResource: "items", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let items = jsonResult["items"] as? [[String: String]] {
                    for item in items {
                        let type = item["type"]
                        switch type {
                        case "Banner":
                            dataSource.append(BannerRowModel())
                        case "Card":
                            dataSource.append(CardRowModel())
                        case "Cards":
                            dataSource.append(CardsRowModel())
                        case "Suggestions":
                            dataSource.append(RecommendationRowModel())
                        case "AddNew":
                            dataSource.append(AddNewRowModel())
                        default:
                            break
                        }
                        
                    }
                    self.stateMachine.tryEvent(.success)
                }
            } catch {
                self.stateMachine.tryEvent(.failure)
            }
        }
        
    }
    
}

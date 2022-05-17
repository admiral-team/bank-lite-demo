//
//  MainContentViewRow.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 29.03.2022.
//

import Foundation

class MainRowModel: Hashable, Identifiable {
    let id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MainRowModel, rhs: MainRowModel) -> Bool {
        return lhs.id == rhs.id
    }
}

class BannerRowModel: MainRowModel {}
class CardRowModel: MainRowModel {}
class CardsRowModel: MainRowModel {}
class RecommendationRowModel: MainRowModel {}
class AddNewRowModel: MainRowModel {}

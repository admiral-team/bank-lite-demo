//
//  AppThemeProvider.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 04.04.2022.
//

import SwiftUI

public protocol AppThemeStorage {
    func save(theme: AppTheme)
    func removeTheme()
    func setTheme()
    func getTheme() -> AppTheme?
}

class AppThemeProvider: ObservableObject, AppThemeStorage {
    
    static let shared: AppThemeProvider = AppThemeProvider()
    @Published var theme: AppTheme = AppTheme.dark
    
    private let defaults = UserDefaults.standard
    
    public func save(theme: AppTheme) {
        do {
            try defaults.set(object: theme, forKey: "Theme")
            self.theme = theme
        }
        catch let error {
            print(error.localizedDescription)
        }

    }
    
    public func removeTheme() {
        defaults.set(nil, forKey: "Theme")
    }
    
    public func getTheme() -> AppTheme? {
        if let theme = try? defaults.object(AppTheme.self, forKey: "Theme") {
            return theme
        }
        return nil
    }
    
    public func setTheme() {
        do {
            if let theme = try defaults.object(AppTheme.self, forKey: "Theme") {
                self.theme = theme
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

private extension UserDefaults {
    
    func object<T: Codable>(_ type: T.Type, forKey key: String, usingDecoder decoder: JSONDecoder = JSONDecoder()) throws -> T? {
        guard let data = self.value(forKey: key) as? Data else { return nil }
        return try decoder.decode(type.self, from: data)
    }

    func set<T: Codable>(object: T, forKey key: String, usingEncoder encoder: JSONEncoder = JSONEncoder()) throws {
        let data = try encoder.encode(object)
        self.set(data, forKey: key)
    }
    
}

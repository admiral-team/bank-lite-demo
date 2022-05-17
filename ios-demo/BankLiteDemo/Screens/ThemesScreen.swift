//
//  ThemesScreen.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 04.04.2022.
//

import SwiftUI

struct ThemesScreen: View {
    
    @ObservedObject var themeProvider: AppThemeProvider = AppThemeProvider.shared
    @State private var isOn: Bool
    
    init() {
        if AppThemeProvider.shared.theme.identifier == "Dark" {
            isOn = .init(true)
        } else {
            isOn = .init(false)
        }
    }
    
    var body: some View {
        ZStack {
            themeProvider.theme.colors.backgroundBasic.swiftUIColor.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack(spacing: 16) {
                    Text("Темная тема")
                        .font(FontPalette.default.headline.swiftUIFont)
                        .foregroundColor(themeProvider.theme.colors.textPrimary.swiftUIColor)
                        .multilineTextAlignment(.leading)
                    
                    Toggle("", isOn: $isOn)
                        .labelsHidden()
                        .onChange(of: isOn) { newValue in
                            themeProvider.save(theme: newValue ? AppTheme.dark : AppTheme.light)
                            
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            let nc = appDelegate.window?.rootViewController as? UINavigationController
                            let navBar = nc?.navigationBar
                            navBar?.backgroundColor = themeProvider.theme.colors.backgroundBasic.uiColor
                            navBar?.tintColor = themeProvider.theme.colors.elementsAccent.uiColor
                            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeProvider.theme.colors.textPrimary.uiColor, NSAttributedString.Key.font: FontPalette.default.headline.uiFont]
                            nc?.setNeedsStatusBarAppearanceUpdate()
                        }
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle("Тема приложения")
            .padding(16)
        }
    }
}

struct ThemesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThemesScreen()
    }
}


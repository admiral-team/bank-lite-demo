//
//  TechViewScreen.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 04.04.2022.
//

import SwiftUI

struct TechViewScreen: View {
    private let theme = AppThemeProvider.shared.theme
    var body: some View {
        ZStack {
            theme.colors.backgroundBasic.swiftUIColor
                TechView()
        }
        .ignoresSafeArea()
    }
}

struct TechViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        TechViewScreen()
    }
}

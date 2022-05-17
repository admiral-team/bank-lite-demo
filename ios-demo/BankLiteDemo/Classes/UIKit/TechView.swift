//
//  TechScreenView.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 31.03.2022.
//

import SwiftUI

struct TechView: View {
    private var theme = AppThemeProvider.shared.theme
    var body: some View {
        VStack(spacing: 0) {
            Image("luck_status")
                .frame(width: 120, height: 120)
            Text("Раздел находится в разработке")
                .multilineTextAlignment(.center)
                .font(FontPalette.default.title1.swiftUIFont)
                .foregroundColor(theme.colors.textPrimary.swiftUIColor)
        }
    }
}

struct TechScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TechView()
    }
}

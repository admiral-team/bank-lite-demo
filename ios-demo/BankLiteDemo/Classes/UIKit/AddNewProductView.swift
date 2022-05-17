//
//  AddNewProduct.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import Combine
import SwiftUI

struct AddNewProductView: View {
    
    private var theme = AppThemeProvider.shared.theme
    
    var body: some View {
        Button(action: {
            
            LocalNotificationService()
                .sendNotifications()
        }) {
            ZStack {
                theme.colors.backgroundBasic.swiftUIColor
                HStack(alignment: .center, spacing: 14.0) {
                    Image("addnew")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28.0, height: 22.0)
                    Text("Открыть новый продукт")
                        .font(FontPalette.default.headline.swiftUIFont)
                        .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                }
            }
        }
        .frame(height: 74.0)
    }
    
}

struct AddNewProductView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            AddNewProductView()
        }
    }
    
}

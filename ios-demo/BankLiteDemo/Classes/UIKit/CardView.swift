//
//  CardView.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import Combine
import SwiftUI

struct CardView: View {
    private var theme = AppThemeProvider.shared.theme
    private let addAction: (() -> Void)
    private let sendAction: (() -> Void)
    
    init(addAction: @escaping (() -> Void) = {},
         sendAction: @escaping (() -> Void) = {}) {
        self.addAction = addAction
        self.sendAction = sendAction
    }
    
    var body: some View {
        ZStack {
            theme.colors.backgroundAdditional.swiftUIColor
            VStack {
                cardView()
                HStack(spacing: 0.0) {
                    Spacer()
                        .frame(width: 72.0)
                    cardButton(title: "Пополнить", image: "add", buttonAction: {
                        addAction()
                    })
                    Spacer()
                        .frame(width: 12.0)
                    cardButton(title: "Оплатить", image: "send", buttonAction: {
                        sendAction()
                    })
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(height: 120.0)
        .cornerRadius(8.0)
    }
    
    @ViewBuilder
    private func cardView() -> some View {
        HStack(alignment: .top, spacing: 0.0) {
            Image("card")
                .resizable()
                .scaledToFit()
                .frame(width: 38.0, height: 28.0)
                .padding(.top, 18.0)
            VStack(spacing: 4.0) {
                HStack(spacing: 4.0) {
                    Text("Цифровая Мультикарта")
                        .font(FontPalette.default.headline.swiftUIFont)
                        .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                        .layoutPriority(1.0)
                    Spacer()
                    Text("• 2104")
                        .font(FontPalette.default.subhead3.swiftUIFont)
                        .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.67, opacity: 1.0))
                        .multilineTextAlignment(.trailing)
                }
                HStack(spacing: 0.0) {
                    Text("2000 ₽")
                        .font(FontPalette.default.subtitle2.swiftUIFont)
                        .foregroundColor(Color(red: 0.23, green: 0.51, blue: 0.95, opacity: 1.0))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
            }
            .padding(.top, 12.0)
            .padding(.leading, 16.0)
        }
        .padding(.horizontal, 16.0)
    }
    
    private func cardButton(title: String, image: String, buttonAction: @escaping (() -> Void)) -> some View {
        Button(action: {
            buttonAction()
        }) {
            HStack(spacing: 4.0) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16.0, height: 16.0)
                Text(title)
                    .font(FontPalette.default.subhead3.swiftUIFont)
                    .foregroundColor(Color(red: 0.23, green: 0.51, blue: 0.95, opacity: 1.0))
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.horizontal, 12.0)
        .frame(height: 36.0)
        .background(theme.colors.backgroundSelected.swiftUIColor)
        .cornerRadius(8.0)
    }
    
}

struct CardView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CardView()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
    
}



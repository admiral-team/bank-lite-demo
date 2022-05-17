//
//  CardsView.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import Combine
import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var number: String
    var image: String
}

struct CardsView: View {
    
    @State private var isOpen: Bool = false
    @State private var cardOpacity = 0.0
    
    private var buttonAction: () -> Void
    
    init(buttonAction: @escaping () -> Void = {}) {
        self.buttonAction = buttonAction
    }
    var cards = [Card(
        title: "Банк",
        number: "• 3267",
        image: "cardVisa")]
    
    private var theme = AppThemeProvider.shared.theme
    
    var body: some View {
        VStack {
            headerView()
                .padding()
            if isOpen {
                VStack {
                    ForEach(cards) { card in
                        cardView(
                            title: card.title,
                            number: card.number,
                            image: card.image)
                    }
                    addCardView()
                }
            }
        }
        .background(theme.colors.backgroundAdditional.swiftUIColor)
        .cornerRadius(8.0)
        
    }
    
    @ViewBuilder
    private func headerView() -> some View {
        Button(action: {
            withAnimation(.linear(duration: 0.15)) {
                isOpen.toggle()
            }
        }) {
            HStack(spacing: 4.0) {
                Text("Привязанные карты")
                    .font(FontPalette.default.subtitle1.swiftUIFont)
                    .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                    .multilineTextAlignment(.leading)
                Image(isOpen ? "up" : "down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24.0, height: 24.0)
                Spacer()
            }
        }
        .frame(height: 22.0)
    }
    
    private func cardView(title: String, number: String, image: String) -> some View {
        return Button(action: {
            buttonAction()
        }) {
            HStack(spacing: 16.0) {
                Image(image)
                Text(title)
                    .font(FontPalette.default.headline.swiftUIFont)
                    .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                    .multilineTextAlignment(.leading)
                Spacer()
                Text(number)
                    .font(FontPalette.default.subhead3.swiftUIFont)
                    .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.67, opacity: 1.0))
                    .multilineTextAlignment(.trailing)
            }
        }
        .padding(.horizontal, 12.0)
        .frame(height: 64.0)
    }
    
    private func addCardView() -> some View {
        Button(action: {}) {
            HStack(spacing: 16.0) {
                Image(theme.identifier == "Dark" ? "addCardDark" : "addCard")
                Text("Добавить карту другого банка")
                    .font(FontPalette.default.headline.swiftUIFont)
                    .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
        .padding(.horizontal, 12.0)
        .frame(height: 64.0)
    }
    
}

struct CardsView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            CardsView()
                .previewDevice("iPhone 11 Pro Max")
        }
    }
    
}



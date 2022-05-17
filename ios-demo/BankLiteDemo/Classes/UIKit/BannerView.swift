//
//  Banner.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import Combine
import SwiftUI

struct BannerView: View {
    
    private var closeAction: () -> Void
    private var tapBanner: () -> Void
    private var theme = AppThemeProvider.shared.theme
    
    init(closeAction: @escaping () -> Void = {},
         tapBanner: @escaping () -> Void = {}) {
        self.closeAction = closeAction
        self.tapBanner = tapBanner
    }
    
    var body: some View {
        ZStack {
            theme.colors.backgroundAdditional.swiftUIColor
            HStack(spacing: 0.0) {
                Text("Используйте все возможности вашей\nМультикарты")
                    .font(FontPalette.default.headline.swiftUIFont)
                    .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                    .padding(.leading, 16.0)
                Spacer()
                Image(theme.identifier == "Dark" ? "bannerDark" : "bannerLight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 124.0, height: 97.0)
            }
            VStack{
                HStack {
                    Spacer()
                    Button(action: {
                        closeAction()
                    }) {
                        Image("close")
                            .renderingMode(.template)
                            .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                            .background(Circle()
                                            .fill(theme.colors.backgroundBasic.swiftUIColor)
                                            .frame(width: 32, height: 32))
                    }
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.trailing, 16)
        }
        .onTapGesture {
            tapBanner()
        }
        .frame(height: 97.0)
        .cornerRadius(16.0)
    }
    
}

struct BalanceView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            BannerView()
        }
    }
    
}


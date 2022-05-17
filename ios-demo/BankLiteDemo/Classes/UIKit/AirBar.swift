//
//  airBar.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 24.03.2022.
//

import SwiftUI

enum TabType: Int {
    case home = 0
    case payments
    case services
    case chat
}

struct AirBar: View {
    private let tabText: [String] = ["Главный", "Платежи", "Услуги", "Чат"]
    private let tabIconNames: [String] = ["main", "payments", "services", "chat"]
    
    @Binding var tabType: TabType
    
    var body: some View {
        HStack(spacing: 8.0) {
            ForEach (0..<tabText.count) { index in
                VStack(alignment: .center, spacing: 0) {
                    Image(tabIconNames[index])
                        .renderingMode(.template)
                        .frame(width: 40, height: 40)
                        .foregroundColor(tabType.rawValue == index ? Color(red: 0.229, green: 0.514, blue: 0.946) : Color.white)
                    Text(tabText[index])
                        .font(FontPalette.default.caption2.swiftUIFont)
                        .foregroundColor(.white)
                }
                .frame(width: 56, height: 56)
                .padding(.leading, index == 0 ? 20 : 0)
                .padding(.trailing, index == tabText.count - 1 ? 20 : 0)
                .onTapGesture {
                    tabType = TabType(rawValue: index) ?? .home
                }
            }
        }
        .frame(height: 80)
        .background(Color(red: 0.227, green: 0.29, blue: 0.38))
        .cornerRadius(20)
    }
}

struct AirBar_Previews: PreviewProvider {
    static var previews: some View {
        AirBar(tabType: .constant(.home))
    }
}

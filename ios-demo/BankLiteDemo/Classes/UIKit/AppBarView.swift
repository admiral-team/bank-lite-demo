//
//  AppBarView.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 24.03.2022.
//

import SwiftUI

struct AppBarView: View {
    
    @Binding public var count: Int
    
    private let theme = AppThemeProvider.shared.theme
    @State private var rect: CGRect = CGRect()
    
    private let onPressedLeftButton: (() -> Void)
    private let onPressedRightButton: (() -> Void)
    
    init(onPressedLeftButton: @escaping (() -> Void) = {},
         onPressedRightButton: @escaping (() -> Void) = {},
         count: Binding<Int> = .constant(0)) {
        self.onPressedLeftButton = onPressedLeftButton
        self.onPressedRightButton = onPressedRightButton
        self._count = count
    }
    
    var body: some View {
        HStack() {
            Button(action: {
                onPressedLeftButton()
            }) {
                Image("profile")
                    .padding(.leading)
            }
            Spacer()
            
            Image("rnbTitle")
                .renderingMode(.template)
                .foregroundColor(theme.colors.textPrimary.swiftUIColor)
            
            Spacer()
            Button(action: {
                onPressedRightButton()
            }) {
                ZStack {
                    Image("alertIcon")
                        .padding(.trailing)
                    if count != 0 {
                        Text(String(count))
                            .background(GeometryGetter(rect: $rect))
                            .font(FontPalette.default.caption1.swiftUIFont)
                            .foregroundColor(Color.white)
                            .frame(width: rect.width + 10, height: 18.0)
                            .background(theme.colors.elementsError.swiftUIColor)
                            .clipShape(
                                Ellipse()
                            )
                            .overlay(
                                Ellipse()
                                    .size(width: rect.width + 10, height: 19)
                                    .stroke(
                                        theme.colors.backgroundBasic.swiftUIColor,
                                        lineWidth: 2))
                            .padding(.bottom, 20)
                    }
                }
            }
        }
        .padding(.bottom, 8)
        .frame(height: 44.0)
    }
}

struct GeometryGetter: View {
    @Binding var rect: CGRect
    
    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }
    
    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }
        
        return Rectangle().fill(Color.clear)
    }
}

struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView(count: .constant(4))
    }
}

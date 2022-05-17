//
//  RecommendationView.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 25.03.2022.
//

import SwiftUI

struct Recommendation: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
}

struct MyButtonStyle: ButtonStyle {
    private let theme = AppThemeProvider.shared.theme
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ?
                        theme.colors.elementsAccent.swiftUIColor :
                            theme.colors.backgroundBasic.swiftUIColor)
            .foregroundColor(configuration.isPressed ?
                             theme.colors.textStaticWhite.swiftUIColor :
                                theme.colors.textPrimary.swiftUIColor)
            .cornerRadius(8.0)
    }
}
    
    
    @available(iOS 15.0, *)
    struct RecommendationView: View {
        
        private let theme = AppThemeProvider.shared.theme
        @State private var selectIndex: Int?
        
        private var recommendations = [
            Recommendation(title: "Пригласить друга", image: "like", color: Color.white),
            Recommendation(title: "Оплатить сотовую связь", image: "mobile", color: Color(red: 0.93, green: 0.42, blue: 0.8, opacity: 1.0)),
            Recommendation(title: "Перевести деньги", image: "pay", color: Color(red: 0.37, green: 0.81, blue: 0.44, opacity: 1.0)),
            Recommendation(title: "Оплатить услуги ЖКХ", image: "home", color: Color(red: 0.141, green: 0.655, blue: 0.624))
        ]
        
        var body: some View {
            VStack {
                headerView()
                    .padding(.leading, 16)
                    .padding(.bottom, 8)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        Spacer()
                            .frame(width: 8.0)
                        ForEach(0..<recommendations.count, id:\.self) { index in
                            Button(action: {
                                
                            }) {
                                recommendView(title: recommendations[index].title,
                                              image: recommendations[index].image,
                                              color: recommendations[index].color,
                                              isSelected: selectIndex == index)
                            }
                            .buttonStyle(MyButtonStyle())
                        }
                        
                        Spacer()
                            .frame(width: 8.0)
                    }
                    .frame(height: 120.0)
                }
            }
            .frame(height: 192.0)
            .background(theme.colors.backgroundAdditional.swiftUIColor)
            .cornerRadius(8)
            
        }
        
        @ViewBuilder
        private func headerView() -> some View {
            HStack {
                Text("Рекомендуем")
                    .font(FontPalette.default.subtitle1.swiftUIFont)
                    .foregroundColor(theme.colors.textPrimary.swiftUIColor)
                    .multilineTextAlignment(.leading)
                    .frame(height: 26.0)
                Spacer()
            }
        }
        
        @ViewBuilder
        private func recommendView(
            title: String,
            image: String,
            color: Color,
            isSelected: Bool) -> some View {
                    VStack {
                        HStack {
                            Image(image)
                                .frame(width: 40.0, height: 40.0)
                                .background((color)
                                                .cornerRadius(20.0))
                            Spacer()
                        }
                        .padding(.horizontal, 8.0)
                        .padding(.top, 8.0)
                        Spacer()
                        HStack {
                            Text(title)
                                .font(FontPalette.default.subhead3.swiftUIFont)
                                .multilineTextAlignment(.leading)
                                .frame(minHeight: 52, alignment: .bottom)
                                
                            Spacer()
                        }
                        .padding(8.0)
                    }
                    .frame(width: 104.0, height: 120.0)
                    .cornerRadius(8.0)

            }
    }

    
    @available(iOS 15.0, *)
    struct RecommendationView_Previews: PreviewProvider {

        static var previews: some View {
            Group {
                RecommendationView()
                    .previewDevice("iPhone 11 Pro Max")
            }
        }
    }
    

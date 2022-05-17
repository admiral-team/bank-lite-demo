//
//  ColorPalette.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 04.04.2022.
//

import UIKit
import SwiftUI

public enum ColorPaletteStyle: String, Codable {
    case light
    case dark
}

// MARK: - ColorPalette

public class ColorPalette: Codable {
        
    public var style: ColorPaletteStyle
    public var disabledAlpha: CGFloat
     
    public var textPrimary: AColor
    public var textSecondary: AColor
    public var textAccent: AColor
    public var textError: AColor
    public var textAttention: AColor
    public var textExtraSuccess: AColor
    public var textStaticWhite: AColor
    public var textStaticBlack: AColor
    public var elementsAccent: AColor
    public var elementsSecondary: AColor
    public var elementsSpecial: AColor
    public var elementsError: AColor
    public var elementsAttention: AColor
    public var elementsGreen: AColor
    public var elementsStaticWhite: AColor
    public var elementsExtraGrey: AColor
    public var backgroundAdditional: AColor
    public var backgroundBasic: AColor
    public var backgroundSelected: AColor
    public var backgroundAccent: AColor
    public var backgroundExtra: AColor
    public var backgroundError: AColor
    public var backgroundAttention: AColor
    public var backgroundSuccess: AColor
    public var backgroundCards: AColor
    public var airBarMain: AColor
    public var airBarMainLight: AColor
    public var airBarNewYear: AColor
    public var airBarLavanda: AColor
    public var airBarDark: AColor
    public var airBarLight: AColor
    public var widgetBackground: AColor
    public var widgetSection: AColor
    public var widgetIcon: AColor
    public var cloudIcon: AColor
    

    public init(
        style: ColorPaletteStyle,
        disabledAlpha: CGFloat,
        textPrimary: AColor,
        textSecondary: AColor,
        textAccent: AColor,
        textError: AColor,
        textAttention: AColor,
        textExtraSuccess: AColor,
        textStaticWhite: AColor,
        textStaticBlack: AColor,
        elementsAccent: AColor,
        elementsSecondary: AColor,
        elementsSpecial: AColor,
        elementsError: AColor,
        elementsAttention: AColor,
        elementsGreen: AColor,
        elementsStaticWhite: AColor,
        elementsExtraGrey: AColor,
        backgroundAdditional: AColor,
        backgroundBasic: AColor,
        backgroundSelected: AColor,
        backgroundAccent: AColor,
        backgroundExtra: AColor,
        backgroundError: AColor,
        backgroundAttention: AColor,
        backgroundSuccess: AColor,
        backgroundCards: AColor,
        airBarMain: AColor,
        airBarMainLight: AColor,
        airBarNewYear: AColor,
        airBarLavanda: AColor,
        airBarDark: AColor,
        airBarLight: AColor,
        widgetBackground: AColor,
        widgetSection: AColor,
        widgetIcon: AColor,
        cloudIcon: AColor
    ) {
        self.style = style
        self.disabledAlpha = disabledAlpha
        
        self.disabledAlpha = disabledAlpha
        self.textPrimary = textPrimary
        self.textSecondary = textSecondary
        self.textAccent = textAccent
        self.textError = textError
        self.textAttention = textAttention
        self.textExtraSuccess = textExtraSuccess
        self.textStaticWhite = textStaticWhite
        self.textStaticBlack = textStaticBlack
        self.elementsAccent = elementsAccent
        self.elementsSecondary = elementsSecondary
        self.elementsSpecial = elementsSpecial
        self.elementsError = elementsError
        self.elementsAttention = elementsAttention
        self.elementsGreen = elementsGreen
        self.elementsStaticWhite = elementsStaticWhite
        self.elementsExtraGrey = elementsExtraGrey
        self.backgroundAdditional = backgroundAdditional
        self.backgroundBasic = backgroundBasic
        self.backgroundSelected = backgroundSelected
        self.backgroundAccent = backgroundAccent
        self.backgroundExtra = backgroundExtra
        self.backgroundError = backgroundError
        self.backgroundAttention = backgroundAttention
        self.backgroundSuccess = backgroundSuccess
        self.backgroundCards = backgroundCards
        self.airBarMain = airBarMain
        self.airBarMainLight = airBarMainLight
        self.airBarNewYear = airBarNewYear
        self.airBarLavanda = airBarLavanda
        self.airBarDark = airBarDark
        self.airBarLight = airBarLight
        self.widgetBackground = widgetBackground
        self.widgetSection = widgetSection
        self.widgetIcon = widgetIcon
        self.cloudIcon = cloudIcon
        
    }
}
 
// MARK: - Light

extension ColorPalette {

    public static var light: ColorPalette {
        return ColorPalette(style: .light,
                            disabledAlpha: 0.6,
                            textPrimary: AColor(hexString: "#FF222222"),
                            textSecondary: AColor(hexString: "#FF818A97"),
                            textAccent: AColor(hexString: "#FF3A83F1"),
                            textError: AColor(hexString: "#FFF5443A"),
                            textAttention: AColor(hexString: "#FFFB9130"),
                            textExtraSuccess: AColor(hexString: "#FF45BF78"),
                            textStaticWhite: AColor(hexString: "#FFFFFFFF"),
                            textStaticBlack: AColor(hexString: "#FF222222"),
                            elementsAccent: AColor(hexString: "#FF3A83F1"),
                            elementsSecondary: AColor(hexString: "#FF99A0AB"),
                            elementsSpecial: AColor(hexString: "#FFDDDFE3"),
                            elementsError: AColor(hexString: "#FFF5443A"),
                            elementsAttention: AColor(hexString: "#FFFB9130"),
                            elementsGreen: AColor(hexString: "#FF45BF78"),
                            elementsStaticWhite: AColor(hexString: "#FFFFFFFF"),
                            elementsExtraGrey: AColor(hexString: "#FF546173"),
                            backgroundAdditional: AColor(hexString: "#FFFFFFFF"),
                            backgroundBasic: AColor(hexString: "#FFF0F2F5"),
                            backgroundSelected: AColor(hexString: "#FFEBF3FE"),
                            backgroundAccent: AColor(hexString: "#FF3A83F1"),
                            backgroundExtra: AColor(hexString: "#FF546173"),
                            backgroundError: AColor(hexString: "#FFFEECEB"),
                            backgroundAttention: AColor(hexString: "#FFFEF4EB"),
                            backgroundSuccess: AColor(hexString: "#FFEDF8F2"),
                            backgroundCards: AColor(hexString: "#FFFFFFFF"),
                            airBarMain: AColor(hexString: "FF3A4A61"),
                            airBarMainLight: AColor(hexString: "#FF7E8EA8"),
                            airBarNewYear: AColor(hexString: "#FF33837D"),
                            airBarLavanda: AColor(hexString: "#FF71698C"),
                            airBarDark: AColor(hexString: "#FF00051E"),
                            airBarLight: AColor(hexString: "#FFF4FAFF"),
                            widgetBackground: AColor(hexString: "#FFF0F2F5"),
                            widgetSection: AColor(hexString: "#FFFFFFFF"),
                            widgetIcon: AColor(hexString: "#FFF0F2F5"),
                            cloudIcon: AColor(hexString: "#FFE0F2FF"))
    }

}

// MARK: - Dark
 
extension ColorPalette {

    public static var dark: ColorPalette {
        return ColorPalette(style: .dark,
                            disabledAlpha: 0.6,
                            textPrimary: AColor(hexString: "#FFE4E8EE"),
                            textSecondary: AColor(hexString: "#FFA5ACB6"),
                            textAccent: AColor(hexString: "#FF5594F1"),
                            textError: AColor(hexString: "#FF5594F1"),
                            textAttention: AColor(hexString: "#FFF09B4C"),
                            textExtraSuccess: AColor(hexString: "#FF60C78B"),
                            textStaticWhite: AColor(hexString: "#FFFFFFFF"),
                            textStaticBlack: AColor(hexString: "#FF222222"),
                            elementsAccent: AColor(hexString: "#FF5594F1"),
                            elementsSecondary: AColor(hexString: "#FF99A0AB"),
                            elementsSpecial: AColor(hexString: "#FF4E555F"),
                            elementsError: AColor(hexString: "#FFF76A64"),
                            elementsAttention: AColor(hexString: "#FFF09B4C"),
                            elementsGreen: AColor(hexString: "#FF60C78B"),
                            elementsStaticWhite: AColor(hexString: "#FFFFFFFF"),
                            elementsExtraGrey: AColor(hexString: "#FFADB3BC"),
                            backgroundAdditional: AColor(hexString: "#292F38"),
                            backgroundBasic: AColor(hexString: "#FF1C2026"),
                            backgroundSelected: AColor(hexString: "#FF363E4A"),
                            backgroundAccent: AColor(hexString: "#FF5594F1"),
                            backgroundExtra: AColor(hexString: "#FFADB3BC"),
                            backgroundError: AColor(hexString: "#FF3F2424"),
                            backgroundAttention: AColor(hexString: "#FF3C2F20"),
                            backgroundSuccess: AColor(hexString: "#FF22392D"),
                            backgroundCards: AColor(hexString: "#FF303641"),
                            airBarMain: AColor(hexString: "FF3A4A61"),
                            airBarMainLight: AColor(hexString: "#FF7E8EA8"),
                            airBarNewYear: AColor(hexString: "#FF33837D"),
                            airBarLavanda: AColor(hexString: "#FF71698C"),
                            airBarDark: AColor(hexString: "#FF00051E"),
                            airBarLight: AColor(hexString: "#FFF4FAFF"),
                            widgetBackground: AColor(hexString: "#FF050506"),
                            widgetSection: AColor(hexString: "#FF1C2026"),
                            widgetIcon: AColor(hexString: "#FF363E49"),
                            cloudIcon: AColor(hexString: "#FF343C48"))
    }

}

// MARK: - Color

public struct AColor: Codable {
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat
    
    public var uiColor: UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    public var cgColor: CGColor {
        return uiColor.cgColor
    }
    
    public static var clear: AColor {
        return AColor(red: 0, green: 0, blue: 0, alpha: 0.0)
    }
    
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }
    
    public init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    public init(color: UIColor) {
        let colorTo = CGColorSpace(name: CGColorSpace.sRGB)!
        let cgColorInRGB = color.cgColor.converted(
            to: colorTo,
            intent: .defaultIntent,
            options: nil)!
        
        let colorRef = cgColorInRGB.components
        let red = colorRef?[0] ?? 0
        let green = colorRef?[1] ?? 0
        let blue = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : green) ?? 0
        let alpha = color.cgColor.alpha
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public func hexString(withAplha: Bool = true) -> String {
        var colorString = withAplha ? String(format: "#%02lX", lroundf(Float(alpha * 255))) : "#"

        colorString += String(
            format: "%02lX%02lX%02lX",
            lroundf(Float(red * 255)),
            lroundf(Float(green * 255)),
            lroundf(Float(blue * 255))
        )
    
        return colorString
    }
    
    public func withAlpha(_ alpha: CGFloat) -> AColor {
        return AColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

@available(iOS 13.0.0, *)
extension AColor {
    
    public var swiftUIColor: SwiftUI.Color {
        return SwiftUI.Color(.sRGB, red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
    }
    
}

extension UIColor {
    
    public var color: AColor {
        return AColor(color: self)
    }
    
}

// swiftlint:enable all

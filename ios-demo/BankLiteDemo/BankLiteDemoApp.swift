//
//  BankLiteDemoApp.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import SwiftUI

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FontPalette.registerDefaultFonts()
        setRootViewController()
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("UNUserNotificationCenter allow!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        return true
    }
    
    private func setRootViewController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let nc = NavigationControler(rootViewController: SwiftUIController())
        window.rootViewController = nc
        window.makeKeyAndVisible()
        
        let theme = AppThemeProvider.shared.getTheme() ?? AppThemeProvider.shared.theme
        AppThemeProvider.shared.setTheme()
        nc.navigationBar.backgroundColor = theme.colors.backgroundBasic.uiColor
        nc.navigationBar.tintColor = theme.colors.elementsAccent.uiColor
        nc.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.colors.textPrimary.uiColor, NSAttributedString.Key.font: FontPalette.default.headline.uiFont]
    }
    
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Notification received with identifier \(notification.request.identifier)")
        completionHandler([.banner, .sound])
    }
    
}

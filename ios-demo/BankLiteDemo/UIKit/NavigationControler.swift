//
//  NavigationControler.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 06.04.2022.
//

import UIKit

class NavigationControler: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let theme = AppThemeProvider.shared.getTheme() else { return .lightContent }
        
        switch theme {
        case .dark:
            return .lightContent
        case .light:
            return .darkContent
        default:
            return .lightContent
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
}

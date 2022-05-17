//
//  SwiftUIController.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 06.04.2022.
//

import SwiftUI

class SwiftUIController: UIHostingController<MainContentView> {
    
    init() {
        super.init(rootView: MainContentView(viewModel: MainViewModel(stateMachine: .init(state: .start))))
    }

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
        navigationController?.setNavigationBarHidden(true, animated: false)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

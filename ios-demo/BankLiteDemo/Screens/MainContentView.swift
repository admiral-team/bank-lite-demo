//
//  ContentView.swift
//  BankLiteDemo
//
//  Created by ADyatkov on 24.03.2022.
//

import SwiftUI

@available(iOS 15.0, *)
struct MainContentView: View {
    
    @ObservedObject var viewModel: MainViewModel
    @ObservedObject var themeProvider: AppThemeProvider = AppThemeProvider.shared
    
    @State private var isLoadingDone = false
    @State private var selection: Int? = nil
    @State private var tabType: TabType = .home
    @State private var colorScheme: ColorScheme = (AppThemeProvider.shared.theme.identifier == "Dark") ? .dark : .light
    var isEnablePullRefresh = false
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            themeProvider.theme.colors.backgroundBasic.swiftUIColor
                .ignoresSafeArea()
            VStack(spacing: 0) {
                NavigationLink(destination: TechViewScreen(), tag: 1, selection: $selection) {}
                NavigationLink(destination: ThemesScreen(), tag: 2, selection: $selection) {}
                AppBarView(onPressedLeftButton: {
                    self.selection = 2
                },
                           onPressedRightButton: {
                    self.selection = 1
                },
                           count: .constant(6))
                getTabViews(type: tabType)
                Spacer()
            }
            VStack {
                Spacer()
                AirBar(tabType: $tabType)
                    .offset(y: -8)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
//        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.loadItems()
        }
    }
    
    @ViewBuilder
    func getTabViews(type: TabType) -> some View {
        switch type {
        case .home:
            if isEnablePullRefresh {
                RefreshScrollView() {
                    LazyVStack {
                        createViews()
                    }
                    .padding(.horizontal, 8)
                } onUpdate: {
                    isLoadingDone.toggle()
                    if isLoadingDone {
                        viewModel.loadItems()
                    } else {
                        viewModel.dataSource.removeAll()
                    }
                }
            } else {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        createViews()
                    }
                    .padding(.bottom, 108)
                    .padding(.horizontal, 8)
                }
            }
            
        case .payments:
            TechView()
                .frame(height: UIScreen.main.bounds.size.height - 280)
        case .services:
            TechView()
                .frame(height: UIScreen.main.bounds.size.height - 280)
        case .chat:
            TechView()
                .frame(height: UIScreen.main.bounds.size.height - 280)
        }
    }
    
    //    @ViewBuilder
    func createViews() -> some View {
        ForEach(viewModel.dataSource) { item in
            if item is BannerRowModel {
                BannerView(closeAction: {
                    withAnimation(.linear(duration: 0.15)) {
                        if let index = viewModel.dataSource.firstIndex(of: item) {
                            viewModel.dataSource.remove(at: index)
                        }
                    }
                },
                           tapBanner: {
                    selection = 1
                })
            } else if item is CardRowModel {
                CardView(addAction: {
                    selection = 1
                }, sendAction: {
                    selection = 1
                })
            } else if item is CardsRowModel {
                CardsView(buttonAction: {
                    selection = 1
                })
            } else if item is RecommendationRowModel {
                RecommendationView()
            } else if item is AddNewRowModel {
                AddNewProductView()
            }
        }
        .background(themeProvider.theme.colors.backgroundBasic.swiftUIColor)
    }
}


@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView(viewModel: MainViewModel(stateMachine: .init(state: .start)))
    }
}

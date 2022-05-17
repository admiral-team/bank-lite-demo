//
//  RefreshScrollView.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 30.03.2022.
//

import SwiftUI

struct RefreshScrollView<Content: View>: View {
    
    var content: Content
    @State var refresh = Refresh(isStarted: false, isReleased: false)
    
    var onUpdate: () -> Void
    
    init(content: () -> Content, onUpdate: @escaping () -> Void) {
        self.content = content()
        self.onUpdate = onUpdate
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            GeometryReader { geometry -> AnyView in
                DispatchQueue.main.async {
                    if refresh.startOffset.isZero {
                        refresh.startOffset = geometry.frame(in: .global).minY
                    }
                    refresh.currentOffset = geometry.frame(in: .global).minY
                    if refresh.currentOffset - refresh.startOffset > 80 && !refresh.isStarted {
                        refresh.isStarted = true
                        withAnimation(.linear) {
                            refresh.isReleased = true
                            fireUpdate()
                        }
                    }
                    
                    if
                        refresh.startOffset == refresh.currentOffset,
                        refresh.isStarted,
                        refresh.isReleased,
                        refresh.isInvalid
                    {
                        refresh.isInvalid = false
                        fireUpdate()
                    }
                }
                return AnyView(Color.black.frame(width: .zero, height: .zero))
            }
            .frame(width: .zero, height: .zero)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                if refresh.isStarted && refresh.isReleased {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .offset(y: -32)
                }
                VStack {
                    content
                }
                .frame(maxHeight: .infinity)
            }
            .offset(y: refresh.isReleased ? 40 : -10)
        }
    }
    
    func fireUpdate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if refresh.startOffset == refresh.currentOffset {
                onUpdate()
                refresh.isReleased = false
                refresh.isStarted = false
            } else {
                refresh.isInvalid = true
            }
        }
    }
}

struct Refresh {
    var startOffset: CGFloat = .zero
    var currentOffset: CGFloat = .zero
    var isStarted: Bool
    var isReleased: Bool
    var isInvalid: Bool = false
}

//
//  TabA.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct TabA: View {
    typealias Destination = TabARouter.TabADestination
    
    private let navigationTitle = TabBarView.Tab.a.title
    @Environment(TabARouter.self) private var router
    
    // MARK: - Views
    var body: some View {
        @Bindable var router = router
        
        NavigationStack(path: $router.path) {
            listView
                .routerDestination(router: router,
                                   navigationBackTitle: navigationTitle,
                                   destination: navigationDestination)
                .navigationTitle(navigationTitle)
        }
    }
    
    
    @ViewBuilder private func navigationDestination(_ destination: Destination) -> some View {
        switch destination {
        case .viewOne:
            ViewOne()
        case .viewTwo:
            ViewTwo()
        }
    }
    
    private var listView: some View {
        List(Destination.allCases) { destination in
            Text(destination.title)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    router.navigate(to: destination)
                }
        }
    }
}

#Preview {
    TabA()
        .environment(TabARouter())
}

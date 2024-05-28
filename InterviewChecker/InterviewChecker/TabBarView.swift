//
//  TabBarView.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct TabBarView: View {
    enum Tab {
        case a
        case b
        case c
        case d
    }
    
    @Environment(AppRouter.self) private var appRouter
    
    var body: some View {
        @Bindable var appRouter = appRouter
        
        TabView(selection: $appRouter.selectedTab) {
            ContentView()
                .tag(Tab.a)
                .tabItem {
                    Image(systemName: "a.circle")
                }
            
            TestView()
                .tag(Tab.b)
                .tabItem {
                    Image(systemName: "b.circle")
                }
            
            ContentView()
                .tag(Tab.c)
                .tabItem {
                    Image(systemName: "c.circle")
                }
            
            TestView()
                .tag(Tab.d)
                .tabItem {
                    Image(systemName: "d.circle")
                }
        }
        .environment(\.currentTab, $appRouter.selectedTab)
    }
}

#Preview {
    TabBarView()
        .environment(AppRouter())
}

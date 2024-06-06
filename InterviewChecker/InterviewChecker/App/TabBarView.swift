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
        case jobs
        
        var title: String {
            return switch self {
            case .a:
                "Tab A"
            case .b:
                "Tab B"
            case .c:
                "Tab C"
            case .d:
                "Tab D"
            case .jobs:
                "Jobs"
            }
        }
    }
    
    
    
    @Environment(AppRouter.self) private var appRouter
    
    var body: some View {
        @Bindable var appRouter = appRouter
        
        TabView(selection: $appRouter.selectedTab) {
            JobListView()
                .tag(Tab.jobs)
                .environment(appRouter.jobListRouter)
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                }
            
            TabA()
                .tag(Tab.a)
                .environment(appRouter.tabARouter)
                .tabItem {
                    Image(systemName: "a.circle")
                }
            
            TabB()
                .tag(Tab.b)
                .environment(appRouter.tabBRouter)
                .tabItem {
                    Image(systemName: "b.circle")
                }
            
            TabC()
                .tag(Tab.c)
                .environment(appRouter.tabCRouter)
                .tabItem {
                    Image(systemName: "c.circle")
                }
            
            TabD()
                .tag(Tab.d)
                .environment(appRouter.tabDRouter)
                .tabItem {
                    Image(systemName: "d.circle")
                }
        }
        .sheet(item: $appRouter.presentedSheet) {
            appRouter.presentedSheet = nil
        } content: { presentedSheet in
            view(for: presentedSheet)
        }
        .environment(\.presentedSheet, $appRouter.presentedSheet)
        .environment(\.currentTab, $appRouter.selectedTab)
    }
    
    @ViewBuilder private func view(for presentedSheet: PresentedSheet) -> some View {
        switch presentedSheet {
        case .viewOne:
            ViewOne()
        case .transportation(let type):
            TransportationView(type: type)
        }
    }
}

#Preview {
    TabBarView()
        .environment(AppRouter())
}

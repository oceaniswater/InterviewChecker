//
//  InterviewCheckerApp.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI
import SwiftData

@main
struct InterviewCheckerApp: App {
    @Bindable private var appRouter = AppRouter()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(appRouter)
//                .onReceive(DeeplinkManager.shared.userActivityPublisher, perform: handleDeeplink)
        }
        .modelContainer(sharedModelContainer)
    }
    
    // MARK - Deeplinks
//    func handleDeeplink(_ type: DeeplinkManager.DeeplinkType) {
//        switch type {
//        case .chat:
//            appRouter.presentedSheet = nil
//            appRouter.selectedTab = .c
//            appRouter.tabCRouter.navigate(to: .inbox)
//            appRouter.tabCRouter.navigate(to: .chat)
//        case .transportation(let type):
//            appRouter.presentedSheet = .transportation(type: type)
//        }
//    }
//        .task {
//            try? await Task.sleep(for: .seconds(3))
//            DeeplinkManager.shared.userActivityPublisher.send(.chat)
//        }
}

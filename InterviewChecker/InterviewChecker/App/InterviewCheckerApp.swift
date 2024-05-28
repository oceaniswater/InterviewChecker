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
            ContentView()
                .environment(appRouter)
        }
        .modelContainer(sharedModelContainer)
    }
}

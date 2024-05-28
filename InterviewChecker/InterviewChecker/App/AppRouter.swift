//
//  AppRouter.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//
import SwiftUI

@Observable class AppRouter {
    //MARK: - App states
    var selectedTab: TabBarView.Tab = .a
}

struct CurrentTabKey: EnvironmentKey {
    static var defaultValue: Binding<TabBarView.Tab> = .constant(.a)
}

extension EnvironmentValues {
    var currentTab: Binding<TabBarView.Tab> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
}

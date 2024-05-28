//
//  EnvironmentValues+Extensions.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

struct CurrentTabKey: EnvironmentKey {
    static var defaultValue: Binding<TabBarView.Tab> = .constant(.a)
}

struct PresentedSheetKey: EnvironmentKey {
    static var defaultValue: Binding<PresentedSheet?> = .constant(nil)
}

struct InboxRouterRouterKey: EnvironmentKey {
    static let defaultValue: any InboxNavigationProtocol = TabCRouter()
}

extension EnvironmentValues {
    var currentTab: Binding<TabBarView.Tab> {
        get { self[CurrentTabKey.self] }
        set { self[CurrentTabKey.self] = newValue }
    }
    
    var inboxRouter: any InboxNavigationProtocol {
        get { self[InboxRouterRouterKey.self] }
        set { self[InboxRouterRouterKey.self] = newValue }
    }
    
    var presentedSheet: Binding<PresentedSheet?> {
        get { self[PresentedSheetKey.self] }
        set { self[PresentedSheetKey.self] = newValue }
    }
}

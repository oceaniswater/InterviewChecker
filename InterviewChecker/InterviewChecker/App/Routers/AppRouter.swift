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
    var presentedSheet: PresentedSheet?
    
    //MARK: - Routers
    var tabARouter = TabARouter()
    var tabBRouter = TabBRouter()
    var tabCRouter = TabCRouter()
    var tabDRouter = TabDRouter()
}

//
//  TabARouter.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

@Observable class TabARouter: BaseRouter {
    enum TabADestination: String, RouterDestination, CaseIterable {
        case viewOne
        case viewTwo
        
        var title: String {
            return switch self {
            case .viewOne:
                "View One"
            case .viewTwo:
                "View Two"
            }
        }
    }
    
    @ObservationIgnored override var routerDestinationTypes: [any RouterDestination.Type] {
        return [TabADestination.self]
    }
    
    //MARK: - Public
    func navigate(to destination: TabADestination) {
        path.append(destination)
    }
}

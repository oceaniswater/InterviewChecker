//
//  TabCRouter.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import SwiftUI

@Observable class TabCRouter: BaseRouter {
    enum Destination: String, RouterDestination {
        case inbox
        
        var title: String {
            rawValue.capitalized
        }
    }
    
    //Nested views
    @ObservationIgnored override var routerDestinationTypes: [any RouterDestination.Type] {
        return [Destination.self, InboxDestination.self]
    }
    
    //MARK: - Public
    func navigate(to destination: Destination) {
        path.append(destination)
    }
}

//MARK: - InboxRouterProtocol
extension TabCRouter: InboxNavigationProtocol {
    func navigate(to destination: InboxDestination) {
        path.append(destination)
    }
}

//
//  InboxNavigationProtocol.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import Foundation

protocol InboxNavigationProtocol: BaseRouter, Observable {
    func navigate(to destination: InboxDestination)
}

enum InboxDestination: String, RouterDestination {
    case chat
    
    var title: String {
        rawValue.capitalized
    }
}

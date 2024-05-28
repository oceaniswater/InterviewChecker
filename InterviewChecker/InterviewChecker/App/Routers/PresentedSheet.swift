//
//  PresentedSheet.swift
//  InterviewChecker
//
//  Created by Mark Golubev on 28/05/2024.
//

import Foundation

enum PresentedSheet: Identifiable {
    case viewOne
    case transportation(type: TransportationView.TransportationType)
    
    var id: String {
        return switch self {
        case .viewOne:
            "View one"
        case .transportation:
            "Transportation"
        }
    }
}
